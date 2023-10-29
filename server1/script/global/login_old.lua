-- ��¼�ű�
-- By: LaiLiGao(2004-06-20)
-- Update: Dan_Deng(2004-07-09) ����Զ����¼��ܹ���
Msg2Player("Call to login_lod.lua")
do return end

Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\systemconfig.lua") -- ϵͳ����

Include("\\script\\missions\\autohang\\function.lua")		-- for �һ�����
Include("\\script\\global\\skills_table.lua")				-- �Զ����¼���
Include("\\script\\task\\newtask\\newtask_head.lua")	

-- LLG_ALLINONE_TODO_20070802 ��ȷ��
Include ("\\script\\event\\newbielvlup\\event.lua")
Include("\\script\\event\\qingming\\event.lua")
Include("\\script\\event\\playerlvlup\\event_temp.lua")

Include("\\script\\shitu\\shitu.lua")
Include("\\script\\global\\titlefuncs.lua")
IL("TITLE");
Include("\\script\\lib\\log.lua")

function main_old()
	check_update()					-- ���ܸ��¡����ɼӱ�ʶ��2004-05-31��
	patchShituProcess(PlayerIndex)
-- login_enterthd()				-- �Զ�����һ���ͼ	
	login_check_dupe()
	--GetNewBulletin()
	check_townpotol()
	title_loginactive()
	if (SYSCFG_PARTNER_OPEN) then
		SyncPartnerMasterTask();  -- ͬ��ͬ������������
	end
	
	local nValue = GetTask(9)
	if nValue > 80*256 then
		if GetLastFactionNumber() ~= 9 then
			SetTask(9,0)
			DelMagic(372)
			DelMagic(375)
			DelMagic(394)
			tbLog:PlayerActionLog("fix taskid 9", "for kunlun")
		else
			SetTask(9,70*256)
			tbLog:PlayerActionLog("fix taskid 9", "for other")
		end
	end
end

------------------
-- ��һ����ʱͬ�������ݣ��ڴ����
function delaysync_1()
	GetNewBulletin();
	return 0;
end

-- �ڶ�����ʱͬ�������ݣ��ڴ����
function delaysync_2()
	SyncTaskValue(1082)		--ͬ��Bossɱ������������ͻ���
	messenger_copytaskvalue()  --ͬ����ʹ������������
	SyncPartnerMasterTask()    -- ͬ��ͬ���������
	return 0;
end

-- ��������ʱͬ�������ݣ��ڴ����
function delaysync_3()
	GetAllCitySummary();
	SyncTaskValue(1569)	--�����±�
	return 1;
end


-------------------------------------------
function check_townpotol()
	if (GetTask(1505) == 1) then
		DisabledUseTownP(0)
		SetTask(1505,0)
	end
end

function login_enterthd()
	mapList = {235, 236, 237, 238, 239, 240, 241};
	MapCount = getn(mapList);

	-- �����ڹһ���ͼ�������ٽ���
	nCurSWID = SubWorldIdx2ID();
	for i = 1, MapCount do
		if (nCurSWID == mapList[i]) then
			return 0;
		end
	end
	
	nMapID = random(1, MapCount);
	aexp_gotothd(mapList[nMapID]);
end;

-- ����Ƿ��и���װ����ǣ��������
function login_check_dupe()
	local nValue = GetTask(156);
	if (nValue > 0) then
		Say("<color=red>B�n s?d�ng v�t ph�m �� b?ph�c ch? h?th�ng ph�t hi�n v?�� x�a! N�u b�n c?ki�n nghi g?xin li�n h?v�i ng��i qu�n l? C�m �n b�n �� h�p t�c!<color>", 1, "Tho�t/dupe_warning");

		SetTask(156, nValue - 1);
	end
end

function dupe_warning()
	Msg2Player("B�n s?d�ng v�t ph�m �� b?ph�c ch? h?th�ng ph�t hi�n v?�� x�a! N�u b�n c?ki�n nghi g?xin li�n h?v�i ng��i qu�n l? C�m �n b�n �� h�p t�c!");
end

function messenger_copytaskvalue()
	
	SyncTaskValueMore(1201, 1247, 1)
	--for i = 1201, 1247 do 
	--	SyncTaskValue(i)
	--end
end

function no()
end;

-- ͬ��ͬ������������
function SyncPartnerMasterTask()

local i=0;

	SyncTaskValue(1262);
	SyncTaskValue(1256);
	
	-- ͬ��ͬ���������
	SyncTaskValue(1301);
	SyncTaskValue(1302);
	SyncTaskValue(1303);
	SyncTaskValue(1304);
	SyncTaskValue(1305);
	SyncTaskValue(1306);
	
	-- ͬ�������������õı���
	for i=2000, 2300 do
		SyncTaskValue(i);
	end;

end;

--����ɵ�Login main����
if login_add then login_add(main_old, 0) end
--����ɵķֲ�ͬ������
if login_add then login_add(delaysync_1, 1) end
if login_add then login_add(delaysync_2, 2) end
if login_add then login_add(delaysync_3, 3) end
