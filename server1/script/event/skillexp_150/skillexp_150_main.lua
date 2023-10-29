-- �ļ�������skillexp_150_main.lua
-- �����ߡ���wangjingjun
-- ���ݡ�����150���������ȶԻ�npc
-- ����ʱ�䣺2011-07-27 14:27:15

Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\vng_event\\tochieukynang150\\head.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

--TSK_DAILY_CHANGE = 2902  -- ÿ����������Ĵ���
--TSK_CHANGE_DAY = 2903	-- ��¼���һ������������
--DC 60 lan doi exp, By: ThanhLD 20130611
DAILY_CHANGE_MAX_VALUE = 60		-- ÿ��һ����� 
MAP_ID = 967		-- ��ͼid
--By: ThanhLD
NDEL_PLAYEXP_PER = 6000000	-- ÿ�ζһ���Ҫ���ĵ���Ҿ���
NADD_SKILLEXP_PER = 50		-- ÿ�ζһ����Ի�õ�������

szScriptPath = "\\script\\event\\skillexp_150\\skillexp_150_main.lua"
szPosition_chefu = "\\settings\\maps\\skillexp_150\\wagoner.txt"
szPosition_shibei = "\\settings\\maps\\skillexp_150\\shibei.txt"

local tbChefu = {
	{nNpcId = 108, szName = "�n s�", nLevel = 1, szScriptPath = "\\script\\event\\skillexp_150\\npc_trans.lua"},
		}

-- 24����ص�npc
local tbShibeiNpc = {
	{nNpcId = 1623, szName = "��i L�c Kim Cang Ch��ng Bia", tbNpcParam = {1055},},
	{nNpcId = 1623, szName = "Vi �� hi�n X� Bia", tbNpcParam = {1056},},
	{nNpcId = 1623, szName = "Tam Gi�i Quy Thi�n Bia", tbNpcParam = {1057},},
	{nNpcId = 1623, szName = "Tung Ho�nh B�t Hoang Bia", tbNpcParam = {1059},},
	{nNpcId = 1623, szName = "B� V��ng T�m Kim Bia", tbNpcParam = {1060},},
	{nNpcId = 1623, szName = "H�o H�ng Tr�m Bia", tbNpcParam = {1058},},
	{nNpcId = 1623, szName = "H�nh Ti�u C�t L�p Bia", tbNpcParam = {1066},},
	{nNpcId = 1623, szName = "U H�n Ph� �nh Bia", tbNpcParam = {1067},},
	{nNpcId = 1623, szName = "V� �nh Xuy�n Bia", tbNpcParam = {1069},},
	{nNpcId = 1623, szName = "Thi�t Li�n T� S�t Bia", tbNpcParam = {1070},},	-- 10
	{nNpcId = 1623, szName = "C�n Kh�n Nh�t Tr�ch Bia", tbNpcParam = {1071},},
	{nNpcId = 1623, szName = "Ki�m Hoa V�n Tinh Bia", tbNpcParam = {1061},},
	{nNpcId = 1623, szName = "B�ng V� L�c Tinh Bia", tbNpcParam = {1062},},
	{nNpcId = 1623, szName = "Ng�c Tuy�n T�m Kinh Bia", tbNpcParam = {1114},},
	{nNpcId = 1623, szName = "B�ng T��c Ho�t K�", tbNpcParam = {1063},},
	{nNpcId = 1623, szName = "Th�y Anh Man T� Bia", tbNpcParam = {1065},},
	{nNpcId = 1623, szName = "Giang H�i N� Lan Bia", tbNpcParam = {1075},},
	{nNpcId = 1623, szName = "T�t H�a Li�u Nguy�n Bia", tbNpcParam = {1076},},
	{nNpcId = 1623, szName = "B�ng Hu�nh L��c ��a Bia", tbNpcParam = {1074},},
	{nNpcId = 1623, szName = "Th�i Th�ng L�c Long Bia", tbNpcParam = {1073},},	-- 20
	{nNpcId = 1623, szName = "Ki�m Th�y Tinh H� Bia", tbNpcParam = {1079},},
	{nNpcId = 1623, szName = "T�o H�a Th�i Thanh Bia", tbNpcParam = {1078},},
	{nNpcId = 1623, szName = "C�u Thi�n C��ng Phong Bia", tbNpcParam = {1080},},
	{nNpcId = 1623, szName = "Thi�n L�i Ch�n Nh�c Bia", tbNpcParam = {1081},},
	}	

function addnpc(szfile, tbNpc)
	local nX = 0
	local nY = 0
	if (TabFile_Load(szfile, szfile) == 0) then
		print(format("can not open file %s", szPosition_chefu))
		return
	end
	local nCount = TabFile_GetRowCount(szfile)
	if (nCount < 2) then
		return
	end
	for i=2,nCount do
		nX = tonumber(TabFile_GetCell(szfile, i, "TRAPX"))
		nY = tonumber(TabFile_GetCell(szfile, i, "TRAPY"))
		local nNpcIndex = basemission_CallNpc(tbNpc[i-1], MAP_ID, nX, nY)
	end
end

function initialization()
	addnpc(szPosition_chefu, %tbChefu)
	
	for i=1,getn(%tbShibeiNpc) do
		%tbShibeiNpc[i].szScriptPath = szScriptPath
	end
	addnpc(szPosition_shibei, %tbShibeiNpc)
end

function checkDailyTask(nSkillId)
--	local nDay = GetTask(TSK_CHANGE_DAY)
--	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
--	if nDay ~= nCurDate then
--		SetTask(TSK_CHANGE_DAY, nCurDate)
--		SetTask(TSK_DAILY_CHANGE, 0)
--	end
	tbTrainSkill150:ResetDailyTask()
	
	local nDayTime;

	if GetCurrentMagicLevel(nSkillId, 0) < 18 then
		 nDayTime = tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Free_Use)  + tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Fee_Use);
	else
		nDayTime = tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Fee_Use)
	end
	local nMaxValue =  tbTrainSkill150:GetMaxTask(nSkillId)
	if nDayTime < nMaxValue then
		return 1
	end
	return 0
end

function addDailyTask_Free(nValue)
--	local nDay = GetTask(TSK_CHANGE_DAY)
--	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
--	if nDay ~= nCurDate then
--		SetTask(TSK_CHANGE_DAY, nCurDate)
--		SetTask(TSK_DAILY_CHANGE, 0)
--	end
-- DC s� l�n ��i l�n 60 l�n/ng�y, by ThanhLD 20130611
	tbTrainSkill150:ResetDailyTask();
	local nDayTime = tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Free_Use)
	if nDayTime > 60 then
		tbTrainSkill150:addDailyTask_Fee(1)
	else
		tbVNG_BitTask_Lib:addTask(tbTrainSkill150.tbBIT_Free_Use, nValue)
	end
end

-- npc �����������
function main()
	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	local nSkillId = GetNpcParam(nNpcIdx, 1)
	local nPlayerLevel = GetLevel()
	if checkDailyTask(nSkillId) ~= 1 then
		Msg2Player("S� l�n h�m nay c�a ng��i �� h�t, ng�y mai h�y l�i ��y nh�")
		return
	end
	preMsg2Player(nSkillId)
	if nPlayerLevel >= 200 then
		return
	end
	--����������
	tbProgressBar:OpenByConfig(10, playerexp2skillexp, {nNpcIdx, dwNpcId, nSkillId},onbreak)
end

function playerexp2skillexp(nNpcIndex, dwNpcId, nSkillId)
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return 0
	end
	
	local szSkillName = GetSkillName(nSkillId)
	local nSkillLevel = HaveMagic(nSkillId)
--	print("nSkillId = " .. nSkillId)
	if nSkillLevel == -1 then
		Msg2Player("��i v�i lo�i v� c�ng n�y h�o v� ��u t�, hay l� �i l�nh ng� c�i kh�c �i")
		return
	end
	
	if GetCurrentMagicLevel(nSkillId, 0) >= GetSkillMaxLevel(nSkillId) then
		Msg2Player("K� n�ng hi�n t�i �� ��t gi�i h�n cao nh�t, kh�ng c�n ph�i t�ng th�m n�a")
		return
	end
	
	if nSkillLevel == 20 then
		Msg2Player("K� n�ng c�p 21 n�y kh�ng th� th�ng qua c�ch n�y �� ti�n h�nh tu luy�n. ")
		return
	end
	
	local nCurPlayerExp = GetExp()
	local nNeedPlayerExp = getNeedPlayerExp(nSkillId)
	local nPlayerLevel = GetLevel()
	
	--Ki�m tra tr�ng sinh �� gi�i h�n luy�n c�p
	local nlevelskill150 = tbTrainSkill150:CheckTS();
	if (GetCurrentMagicLevel(nSkillId, 0) >= nlevelskill150 and nlevelskill150 > 0) then
		if tbTrainSkill150:Check_UseItem(nSkillId) == 0 then
			Msg2Player("K� n�ng hi�n t�i �� ��t gi�i h�n cao nh�t, ��i hi�p h�y tr�ng sinh l�n �� t�ng th�m c�p")
			return
		end
	end
	
	if nNeedPlayerExp > nCurPlayerExp then
		Msg2Player(format("L�nh ng� c�n ph�i c� %d kinh nghi�m, kinh nghi�m hi�n t�i c�a ng��i kh�ng ��", nNeedPlayerExp))
		return 
	end
	
--	print("nSkillId = " .. nSkillId)
	local nNextExp = GetSkillNextExp(nSkillId)	- GetSkillExp(nSkillId)
--	print("nNextExp = " .. nNextExp)
	local nExp = NADD_SKILLEXP_PER					-- ����������	
	local nTotalExp = NADD_SKILLEXP_PER	
	if not nNextExp then
		return
	end
	ReduceOwnExp(nNeedPlayerExp)	
	if GetCurrentMagicLevel(nSkillId, 0) < 18 then
		
		if tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Free_Use) < tbTrainSkill150:GetValueMaxTask(nSkillId)then
			addDailyTask_Free(1)		-- ���Ӷһ��ļ���
		else
			tbTrainSkill150:addDailyTask_Fee(1)
		end
	else
		tbTrainSkill150:addDailyTask_Fee(1)
	end
	while nExp > nNextExp do
		if nNextExp <= 0 then
--			print("150�����������ȣ���һ���ȼ�����Ҫ�ļ���Ϊ0��������%%%%%%%%%")
			break
		end 
		-- �ﵽ
		local ncurlevel = GetCurrentMagicLevel(nSkillId, 0)
--		print("ncurlevel = " .. ncurlevel)
		if GetCurrentMagicLevel(nSkillId, 0) >= GetSkillMaxLevel(nSkillId) then
			postMsg2Player(nSkillId)
			return 
		end
		nNeedAddExp = nNextExp
		nExp = nExp - nNeedAddExp
--		print("nExp = " .. nExp)
		AddSkillExp(nSkillId, nNeedAddExp, 1)		
		nNextExp = GetSkillNextExp(nSkillId)
--		print("nNextExp = " .. nNextExp)
	end
--	print("while end")
--	print("nExp = " .. nExp)
	AddSkillExp(nSkillId, nExp, 1)
	
	postMsg2Player(nSkillId)
end

function onbreak()
	Msg2Player("L�nh ng� c�a ng��i b� ��t �o�n.")
end

function OnTimer(nNpcIndex)
end

function getNeedPlayerExp(nSkillId, nNumber)
	local nNeedPlayerExp = NDEL_PLAYEXP_PER
	local nPlayerLevel = GetLevel()
	--By: ThanhLD 60 lan doi dau tien thi Exp = 600000, sau 50 lan sau Exp = 8000000
	local nDayTime = tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Free_Use) + tbVNG_BitTask_Lib:getBitTask(tbTrainSkill150.tbBIT_Fee_Use)
	if nDayTime > DAILY_CHANGE_MAX_VALUE then
		nNeedPlayerExp = 8000000
	end
	if(nNumber == 1 and nDayTime + 1 > DAILY_CHANGE_MAX_VALUE) then
		nNeedPlayerExp = 8000000
	end

	local _, nRet = tbTrainSkill150:GetMaxTask(nSkillId)
	if 	nRet == 1 then
		nNeedPlayerExp = 8000000
	end
	-- 200�����⴦��
	if nPlayerLevel >= 200 then		
		nNeedPlayerExp = 0
	end
	return nNeedPlayerExp
end

function preMsg2Player(nSkillId)
	local nNeedPlayerExp = getNeedPlayerExp(nSkillId, 1)
	local nPlayerLevel = GetLevel()
	local szSkillName = GetSkillName(nSkillId)
	if nPlayerLevel >= 200 then
		Msg2Player(format("Nh�n v�t c�p 200 kh�ng th� n�ng cao <color=yellow> %s <color> �� tu luy�n", szSkillName))
	else
		Msg2Player(format("Ti�u hao <color=yellow> %d <color> kinh nghi�m n�ng cao ��i v�i <color=yellow> %s <color> �� tu luy�n.",nNeedPlayerExp,szSkillName))
	end
end

function postMsg2Player(nSkillId)
	local nPlayerLevel = GetLevel()
	local nNeedPlayerExp = getNeedPlayerExp(nSkillId)
	local szSkillName = GetSkillName(nSkillId)
	local nTotalExp = NADD_SKILLEXP_PER
	
	if nPlayerLevel == 200 then
		Msg2Player(format("K� n�ng c�a ng��i <color=yellow> %s <color> �� tu luy�n ���c n�ng cao %d",szSkillName, nTotalExp))
	else
		Msg2Player(format("�� ti�u hao <color=yellow> %d <color> kinh nghi�m �� k� n�ng <color=yellow> %s <color> �� tu luy�n ���c n�ng cao <color=yellow> %d <color>",nNeedPlayerExp, szSkillName,nTotalExp))
	end
end

AutoFunctions:Add(initialization)