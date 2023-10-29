-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - ���ת��ͷ�ļ�
-- �ļ�������task_func.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-02-04 16:21:20

-- ======================================================

IncludeLib("LEAGUE");
IncludeLib("SETTING");
IncludeLib("FILESYS");
IncludeLib("ITEM");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\metempsychosis\\task_head.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")

-- ��¼�ڵ� n_transcount ��ת��ʱ �ĵȼ� ����ѡ����
function zhuansheng_set_gre(n_transcount, n_level, n_resist)
	local n_taskid = 0;
	local n_taskbyte = 0;
	
	local n_id = floor(n_transcount / 2) + mod(n_transcount, 2);
	n_taskid = TSK_ZHUANSHENG_GRE[n_id];
	
	if (mod(n_transcount, 2) == 0) then
		n_taskbyte = 3;
	else
		n_taskbyte = 1;
	end
	
	local n_taskvalue = GetTask(n_taskid);
	n_taskvalue = SetByte(n_taskvalue, n_taskbyte, n_level);
	n_taskvalue = SetByte(n_taskvalue, n_taskbyte+1, n_resist);
	SetTask(n_taskid, n_taskvalue);
	--WriteLog(format("zhuansheng_set_gre:%d,%d,%d,byte:%d,id:%d", n_transcount, n_level, n_resist,n_taskbyte, n_taskid))
	return 1;
end

-- ���ص�n_transcount��ת�� �ȼ�����ѡ����
function zhuansheng_get_gre(n_transcount)
	local n_taskid = 0;
	local n_taskbyte = 0;
	
	local n_id = floor(n_transcount / 2) + mod(n_transcount, 2);
	n_taskid = TSK_ZHUANSHENG_GRE[n_id];
	
	if (mod(n_transcount, 2) == 0) then
		n_taskbyte = 3;
	else
		n_taskbyte = 1;
	end
	
	local n_taskvalue = GetTask(n_taskid);
	
	return GetByte(n_taskvalue, n_taskbyte),GetByte(n_taskvalue, n_taskbyte+1)
end

-- ת��ϴ�����м��ܵ㣬������ת����õĶ��� npoint ���ܵ�
function zhuansheng_clear_skill(nlevel, npoint)
	local nskill1 = HaveMagic(210);	--�����Ṧ
	local nskill2 = HaveMagic(400);	--�������ٸ���ƶ��
	local nallskill = RollbackSkill();	-- ���Ͷ�㼼�ܣ������ؼ��ܵ�
	if (nskill1 ~= -1) then			--�����Ṧ
		nallskill = nallskill - nskill1;
		AddMagic(210, nskill1);
	end
	
	if (nskill2 ~= -1) then			--���ء��ٸ���ƶ��
		nallskill = nallskill - nskill2;
		AddMagic(400, nskill2);
	end
	--nallskill = nallskill - (nlevel -1)	--ת��ֻ�۵�����ʱ����ļ��ܵ�
	AddMagicPoint(npoint + nallskill);
end

-- ת��ϴ������Ǳ�ܵ㣬������ת����õĶ��� npoint Ǳ�ܵ�
function zhuansheng_clear_prop(nlevel, npoint, nseries)
	if (not nseries) then
		nseries = GetSeries();
	end
	
	nseries = nseries + 1;
	local Utask88 = GetTask(88)-- ���ѷ���Ǳ�����ã�task(88)��������ֱ�ӽ��������������ȣ�
	AddProp(100)			-- Ϊ����û��δ����Ǳ�ܵ�ɹ��޸��ļ����������ʱ���衱����100��

	AddStrg(TB_BASE_STRG[nseries] - GetStrg(1) + GetByte(Utask88,1));
	AddDex(TB_BASE_DEX[nseries] - GetDex(1) + GetByte(Utask88,2));
	AddVit(TB_BASE_VIT[nseries] - GetVit(1) + GetByte(Utask88,3));
	AddEng(TB_BASE_ENG[nseries] - GetEng(1) + GetByte(Utask88,4));
	local nallprop = GetProp();
	--nallprop = nallprop - (nlevel - 1) * 5;	--ת��ֻ�۵�����ʱ�����Ǳ�ܵ�
	AddProp(npoint-100);
end


-- ����Ƿ���ս�ӹ�ϵ
function check_zhuansheng_league(ntype)
	local nlg_idx = LG_GetLeagueObjByRole(ntype,GetName());
	if (nlg_idx ~= nil and nlg_idx ~= 0) then
		return 1;			--��ս�ӹ�ϵ
	else
		return 0;			--��ս�ӹ�ϵ
	end
end

-- ��鵱ǰת���κ͵ȼ��Ƿ��ܹ���ת��
function check_zhuansheng_level()
	local nlevel = GetLevel();
	local ntranscount = ST_GetTransLifeCount();
	if (ntranscount >= NTRANSLIFE_MAX) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[7], "���c r�i./OnCancel"});
		return 0;
	end
	
	
	if (not TB_LEVEL_REMAIN_PROP[nlevel] or not TB_LEVEL_LIMIT[ntranscount + 1]) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[5], "���c r�i./OnCancel"});
		return
	end
	
	if (nlevel < TB_LEVEL_LIMIT[ntranscount + 1]) then
		CreateTaskSay({"<dec><npc>"..format("T�i l�n chuy�n sinh th� (%d), ��ng c�p ch� �t c�ng ph�i %d!", (ntranscount + 1), TB_LEVEL_LIMIT[ntranscount + 1]), " K�t th�c ��i tho�i!/OnCancel"});
		return 0;
	end
	
	return 1;
end

function OnCancel()
end

function zhuansheng_check_common()

	local ntranscount = ST_GetTransLifeCount();
	if (ntranscount ~= 0) then
		local bResult = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_event\\20130107_den_bu_chinh_do\\head.lua", "tbZhengtuCompensate:CheckGetTransLife")
		if bResult == 1 and ntranscount == 4 then
		
		else
			if (GetTask(TSK_ZHUANSHENG_LASTTIME) + TB_TRANSTIME_LIMIT[ntranscount]*24*60*60 >= GetCurServerTime()) then
				CreateTaskSay({format(TB_TRANSLIFE_ERRORMSG[12], TB_TRANSTIME_LIMIT[ntranscount]), "���c r�i./OnCancel"});
				return 0;
			end
		end
	end

	local nTaskValue = GetTask(2885)
	local nTmpRes = floor(nTaskValue/100)
	if nTaskValue > 0 and mod(nTmpRes, 100) < 14 then
		Msg2Player("Ng��i �� nh�n nhi�m v� k� n�ng 150, xin h�y ho�n th�nh nhi�m v� r�i h�y ��n g�p ta")
		return  0
	end

	--type=2 ����������
	--type=3 Ӧ���Ǳ���
	if (CalcItemCount(2,0,-1,-1,-1) > 0) then
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[1], "���c r�i./OnCancel"});
		return 0
	end

--	if ntranscount < 3 and (check_zhuansheng_league(LG_WLLSLEAGUE) == 1) then	--ս�ӹ�ϵ
--		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[6], "���c r�i./OnCancel"});
--		return 0
--	end
	if (GetTask(TSK_KILLER_ID) ~= 0) then	--ɱ���������
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[8], "���c r�i./OnCancel"});
		return 0
	end
	if (GetTask(TSK_MESSENGER_FENG) ~= 0 or GetTask(TSK_MESSENGER_SHAN) ~= 0 or GetTask(TSK_MESSENGER_QIAN) ~= 0 ) then	--��ʹ�������
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[9], "���c r�i./OnCancel"});
		return 0
	end
--close check quest Da Tau
--	if (GetTask(TSK_TASKLINK_STATE) ~= 3 and GetTask(TSK_TASKLINK_STATE) ~= 0) then	--Ұ���������
--		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[10], "���c r�i./OnCancel"});
--		return 0
--	end
--	
--	if GetTask(TSK_TASKLINK_CancelTaskLevel) ~= 0 or GetTask(TSK_TASKLINK_CancelTaskExp1) ~= 0 or GetTask(TSK_TASKLINK_CancelTaskExp2) ~= 0 then
--		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[11], "���c r�i./OnCancel"});
--		return 0
--	end
	
	if (GetTask(TSK_ZHUANSHENG_FLAG) ~= 1) then							--����ƪ��ѧϰ
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[4], "���c r�i./OnCancel"});
		return 0;
	end
	
	return 1
end

--���⴦����ҵ���������������������ת����ʹ�õ��������
--TSK_ZHUANSHENG_GRE = {2577, 2578, 2579, 2579}	-- ÿ��ת����ѡ�ȼ��Ϳ���
--TSK_ZHUANSHENG_GRE = {2577, 2578, 2579, 4107}	--�޸ĺ�ÿ��ת����ѡ�ȼ��Ϳ���
tbTransLifeSpeProcess = {}
--tbTransLifeSpeProcess.SetGreInfo = zhuansheng_set_gre
--tbTransLifeSpeProcess.GetGreInfo = zhuansheng_get_gre

function tbTransLifeSpeProcess:PlayerLogin()
	local n_transcount = ST_GetTransLifeCount()
	local nlevelL6, nresistidL6 = self:GetGreInfo(6);
	local nlevelL7, nresistidL7 = self:GetGreInfo(7);
	print("PlayerLoginProcessSome:",nlevelL7, nresistidL7)
	if n_transcount == 7 and nlevelL7 == 0 and nresistidL7 == 0 then
		self:SetGreInfo(7, nlevelL6, nresistidL6)
	end   
end

function tbTransLifeSpeProcess:SetGreInfo(nTranLife, nParam1, nParam2)
	zhuansheng_set_gre(nTranLife, nParam1, nParam2)
end

function tbTransLifeSpeProcess:GetGreInfo(nTranLife)
	return zhuansheng_get_gre(nTranLife)
end

if login_add then login_add(PlayerLoginProcessSome, 0) end

EventSys:GetType("OnLogin"):Reg(1, tbTransLifeSpeProcess.PlayerLogin, tbTransLifeSpeProcess)