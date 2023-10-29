--�ƽ�֮���ͷ�ļ������е���ں�������������

Include("\\script\\missions\\basemission\\lib.lua")

Include("\\script\\misc\\eventsys\\type\\map.lua")

--Include("\\script\\lib\\gb_taskfuncs.lua");	 				-- By ��־ɽ�Ի�֮��;
--Include("\\script\\lib\\gb_modulefuncs.lua"); 				-- By ��־ɽ�Ի�֮��;

--�������ݷŵ��������
tbFruitData = {
	N_FRUIT_START_DATE = 2011042800,--���ʼ����
    N_FRUIT_END_DATE = 2011052900,--���������(��)
    SZ_FRUIT_MAP_NAME = "Chi�n Long ��ng",
    N_FRUIT_MAP_ID = 959,
    --�����ƽ�֮����λ��
    TB_FRUIT_POS = 
    {
--    	{959,1437,3057},
--    	{959,1477,3084},
--    	{959,1458,3066},
    },
    --�����ƽ�֮����ʱ��
    TB_FRUIT_TIME = {1315, 1335, 1050, 1100, 1900, 1920},
    --server start��ʱ�򣬸���TB_FRUIT_TIME����
    TB_FRUIT_TIME_MAP = {},--{[1315]=1, [1335]=1, [1900]=1, [1920]=1}
    
    gnSeedTimerId = 0,--���ɻƽ�֮�˵�TimerId
    gnFruitTimerId = 0,--�ƽ�֮�˱�ƽ�֮����TimerId
    
    TB_ENTER_POS = 
    {
    	{959,1690,3154},
    	{959,1427,2995},
    	{959,1552,2988},
    },
    
    --���ļ���ַ
    SZ_THIS_FILE = "\\script\\event\\great_night\\great_night_head.lua",
    
    SZ_PLAYER_SCRIPT = "\\script\\event\\great_night\\player_map_script.lua",
    
    --��¼���������,������ڲ��ȣ�������������ʱ���
    nTodayDate = 0
    
    --����player_map_script.lua��ұ�
    --pPlayer=nil,
}

t = tbFruitData--�����ݱ�ȡ�����õı���

--�ƽ�֮�������������Ļص�
function OnGreatNightServerStart()

	--��������ʱ���
	_GenFrutTimeMap();

	local worldidx = SubWorldID2Idx(t.N_FRUIT_MAP_ID)
	if (worldidx < 0) then	--�����ͼ���ڸ���������ϣ����ù���
		return
	end;
	
	--ɾ����������ˮ����ͼ�е�NPC��Trap
	ClearMapNpc(t.N_FRUIT_MAP_ID)
	ClearMapTrap(t.N_FRUIT_MAP_ID)
	
	_AddOutNpc()--���س���NPC
	
	_RegPlayerMapScript()--ע��˫������ͼ��ҽű�
	
	--������ʱ��
--	if t.gnSeedTimerId and t.gnSeedTimerId ~= 0 then
--		DelTimer(t.gnSeedTimerId)
--	end
--	t.gnSeedTimerId = DynamicExecute(t.SZ_THIS_FILE, "AddTimer", 18, "OnTimer", 0)
end

--��ʱ�ص�
function OnTimer()
	return 0--�ƽ�֮����GC���Ʋ���
--	local nCurDateTime = tonumber(GetLocalDate("%m%d%H%M%S"))
--	--print(format("OnTimer(%d)", nCurDateTime))
--	local nCurTime = mod(nCurDateTime, 100^3)-- tonumber(GetLocalDate("%H%M%S"))
--	if CheckFruitDate() == 1 then
--		local nDate = floor(nCurTime / 100^3)--tonumber(GetLocalDate("%Y%m%d"))
--    	if nDate ~= t.nTodayDate then
--    		t.nTodayDate = nDate
--    		_GenFrutTimeMap()--���ڶ����� ��������ʱ���
--    	end
--    	local nCurHM = floor(nCurTime / 100)
--    	if t.TB_FRUIT_TIME_MAP[nCurHM] and t.TB_FRUIT_TIME_MAP[nCurHM] > 0 then
--    		t.TB_FRUIT_TIME_MAP[nCurHM] = 0
--    		_GenFruit(1)--�����ƽ�֮��
--    	end
--	end
--	return _GetNextTimerTime(nCurTime)
end

--��������ʱ���
function _GenFrutTimeMap()
	t.TB_FRUIT_TIME_MAP = {}
	for i=1,getn(t.TB_FRUIT_TIME) do
		t.TB_FRUIT_TIME_MAP[t.TB_FRUIT_TIME[i]] = 1
	end
end

--���ݵ�ǰʱ��ȷ����һ�ζ�ʱ���ĳ���
function _GetNextTimerTime(nCurTime)
	local nCurHM = floor(nCurTime/100)
	local nCurSec = mod(nCurTime, 100)
	local nNextHM = nCurHM + 1
	if mod(nNextHM, 100) >= 60 then
		nNextHM = (floor(nCurHM/100) + 1) * 100
	end
	local nRet = 0
	local nDateFlag = CheckFruitDate()
	if nDateFlag ~= 1 then
    	if nDateFlag == 0 then
    		--������Ч�ھͲ��ü�����ôƵ���ˣ�����һ�������ټ��һ��
    		local nCurMin = mod(nCurHM, 100)
    		nRet = 60 * 60 - (nCurMin * 60 + nCurSec)
    	else
    		nRet = 0--��Ч���Ѿ����ˣ�ɾ����ʱ���������ټ�ʱ��
    	end
	elseif t.TB_FRUIT_TIME_MAP[nNextHM] then--��һ������������Ƶ��һ��
		local nFastSec = 55
		if nCurSec < nFastSec then
			nRet = (nFastSec - nCurSec)
		else
			nRet = 1
		end
	else
		nRet = (60 - nCurSec)--����һ���ӿ�ʼ��ʱ��
	end
	return nRet*18--����ת����֡
end

--����һ��ƽ�֮��
function _GenFruit(nStep)
	_ShowSeed(t.N_FRUIT_MAP_ID,t.N_FRUIT_MAP_ID, 4, 3, t.TB_FRUIT_POS, t.SZ_FRUIT_MAP_NAME, nStep)
	
	if 1== nStep then
		--5����֮���ƽ�֮��
		t.gnFruitTimerId = DynamicExecute(t.SZ_THIS_FILE, "AddTimer", 5*60*18, "_GenFruit", nStep+1)
	else
		t.gnFruitTimerId = 0
	end
	return 0--���ͨ����ʱ�����ã�֪ͨ��ʱ��ɾ��
end

function _ShowSeed(worldidx, mapid, seedlevel, count, tbPos ,szMapName, nBatch)
	--
	local nCurDate = tonumber(GetLocalDate("%m%d"))
	--���Ӷ԰�
	local szScriptFile = "\\script\\activitysys\\config\\31\\npc_great_seed.lua"
	--��ͨ��ʵ�԰�
	local szGrowScriptFile = "\\script\\activitysys\\config\\31\\npc_great_fruit.lua"
	--�ƽ����Ӷ԰�
	local szGoldFruitScriptFile = "\\script\\activitysys\\config\\31\\golden_fruit.lua";
	
	local szGoldSeedName = "H�t Ho�ng Kim"
	local szGrowSeedName = "h�t Huy Ho�ng"
	local szGoldFruitName = "Qu� Ho�ng Kim"
	local szGrowFruitName = "Qu� Huy Ho�ng"
	
	--local nBeginNumber = gb_GetTask("�Ի�֮��",12)
	local nNpcTmpl = 1110
	local szNpcScriptFile = szScriptFile
	local szNpcName = "h�t Huy Ho�ng"
	if mod(nBatch	,2 ) == 0 then
		--���Ϊ��ʵ���Σ����������NPC
		ClearMapNpcWithName(mapid, "h�t Huy Ho�ng")
		ClearMapNpcWithName(mapid, szGoldSeedName);
		if seedlevel == 4  then
			nNpcTmpl = 1118
			szNpcScriptFile = szGoldFruitScriptFile
			szNpcName = szGoldFruitName
		else
			nNpcTmpl = 1111
			szNpcScriptFile = szGrowScriptFile
			szNpcName = "Qu� Huy Ho�ng"
		end
	elseif seedlevel ==  4 then
			nNpcTmpl = 1117
			szNpcName = szGoldSeedName
	end
	--
	local nLineCount = getn(tbPos);
	--�������������������������ȥ����Ĳ���
	count = (nLineCount < count ) and nLineCount or  count 
	for i = 1, count do
			local nMap = tbPos[i][1]
			local nPosX = tbPos[i][2]
			local nPosY = tbPos[i][3]
			if (nil ~= nPosX and nil ~= nPosY) then
				local tbNpc = {
            		szName = szNpcName, 
            		szTitle = nil,
            		nLevel = 95,
            		nNpcId = nNpcTmpl,
            		nIsboss = 0,
            		szScriptPath = szNpcScriptFile,
            	}

            	local nNpcIndex = %basemission_CallNpc(tbNpc, nMap, nPosX*32, nPosY*32)
            	if nNpcIndex and nNpcIndex > 0 then
            		--nBeginNumber = nBeginNumber + 1
					--gb_SetTask("�Ի�֮��",12,nBeginNumber)
					SetNpcParam(nNpcIndex, 1, seedlevel);
					--SetNpcParam(nNpcIndex, 2, nBeginNumber*10000 +  nCurDate ); --  nCurDate --���ϵ�ǰ����
					if szNpcName == szGoldFruitName or szNpcName == szGoldSeedName then
						Msg2SubWorld("<color=yellow>"..szNpcName.."<color>".." xu�t hi�n t�i "..szMapName.."("..floor(nPosX / 8)..","..floor(nPosY / 16)..").")
					end
            	end
			end;
	end;
end;

function CheckFruitDate()
	return 1--��ʱ������
--	local nDate = tonumber(GetLocalDate("%Y%m%d%H"))
--	if nDate < t.N_FRUIT_START_DATE then--ע������û��=
--		return 0
--	elseif nDate >= t.N_FRUIT_END_DATE then--ע��������=
--		return 2
--	else
--		return 1
--	end
--	if (nDate >= t.N_FRUIT_START_DATE and nDate <= t.N_FRUIT_END_DATE) then
--		return 1
--	end
end

--���͵�����ˮ����ͼ���ɼ��ƽ�֮����
function OnGoToNewLiangShuiDong()
	if CheckFruitDate() == 1 then
		local nCount = getn(t.TB_ENTER_POS)
		local nRand = random(1,nCount)
		if nRand >= 1 and nRand <= nCount then
			NewWorld(unpack(t.TB_ENTER_POS[nRand]))
		end
	else
		Talk(1, "", "Xin l��ng th�, hi�n t�i kh�ng ph�I th�i gian ho�t ��ng, th� l�i cho ta kh�ng th� ��a ng��I �I ���c")
	end
end

--NPC�Ựѡ��
function OnNpcTalk()
	local szMapName = t.SZ_FRUIT_MAP_NAME
	local szDesc = format("<color=yellow>%s<color>Hi�n t�i trong v� l�m m�a h�a gi� thu�n. �� t� l�ng c�m t� ��i v�i c�c v� giang h� ��i hi�p, V� L�m Minh Ch� ��c C� Ki�m ��c � v�o<color=yellow>00:00-28-04-2011~00:00-29-05-2011<color>m� ra m�t ho�t ��ng<color=yellow> �H�t Ho�ng Kim�<color>v�i quy m� l�n.<enter>", "V� L�m Minh Ch� Truy�n Nh�n")
	szDesc = format("%strong th�i gian ho�t ��ng m�i ng�y <color=yellow>13:15, 13:35, 19:00, 19:20<color>t�i<color=yellow>%s<color>b�n �� s� xu�t hi�n 3 H�t Ho�ng Kim , m�t th�i gian sau �� c�c v� ��i hi�p c� th� thu th�p ���c Qu� c�a n�, khi s� d�ng s� l�m t�ng c�ng l�c c�a Qu� Ho�ng Kim.<enter>", szDesc, szMapName)
	szDesc = format("%s ch� c� th� th�ng qua ta ��y m�i c� th� ��a ng��i ��n<color=yellow>%s<color>", szDesc, szMapName)
	Describe(szDesc, 2,
		"Xin h�y ��a ta ��n Chi�n Long ��ng/OnGoToNewLiangShuiDong",
		"Hi�u r�i/no"
	)
end

function no()
end

--���˫��������NPC
function _AddOutNpc()
	local nOffset = 3
	local tbNpcPos = t.TB_ENTER_POS
	local tbNpc = {
		szName = "Ng��i truy�n t�ng Chi�n Long ��ng", 
		szTitle = "<npc>Ta c� th� ��a ng��i v� th�nh",
		nLevel = 95,
		nNpcId = 238,
		nIsboss = 0,
		szScriptPath = "\\script\\event\\great_night\\fruit_chukou_npc.lua",
	}
	for _, tbTmpPos in tbNpcPos do
		local nMapId, nPosX, nPosY = unpack(tbTmpPos)
		nPosX = nPosX + nOffset
		nPosY = nPosY + nOffset
		%basemission_CallNpc(tbNpc, nMapId, nPosX*32, nPosY*32)	
	end
end

--ע�������˫������ͼ����Ϊ
function _RegPlayerMapScript()
	local pPlayer = DynamicExecute(t.SZ_PLAYER_SCRIPT, "getglobal", "tbPlayer")
	t.pPlayer = pPlayer
	
	t.nRegIdLeave = EventSys:GetType("LeaveMap"):Reg(t.N_FRUIT_MAP_ID, pPlayer.OnLeaveMap, pPlayer)
	t.nRegIdEnter = EventSys:GetType("EnterMap"):Reg(t.N_FRUIT_MAP_ID, pPlayer.OnEnterMap, pPlayer)
end

