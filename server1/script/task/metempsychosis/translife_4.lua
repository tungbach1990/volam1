-- �ļ�������translife_4.lua
-- �����ߡ���wangjingjun
-- ���ݡ�����4ת��ضԻ��ͺ���
-- ����ʱ�䣺2011-08-01 14:15:10

Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\lib\\log.lua")

function calSkillPoint(nCurLevel)
	local nResult = 0
	if nCurLevel < NSTARTLEVEL_4 then
		nResult = 0
	else
		nResult = floor((nCurLevel - NSTARTLEVEL_4) / NPERPOINTNEEDLEVEL) + 1
	end
	return nResult
end

function updataSkillPoint_4()
	local ntranscount = ST_GetTransLifeCount()
	
	if ntranscount < 4 then
		return
	end
	
	-- ��ǰ�ȼ����Ի�õĵȼ�����
	
	if ntranscount == 4 then
		local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
		local nLastUpLevel = GetTask(TSK_LAST_UP_LEVEL_4)
		local nCurLevel = GetLevel()
		local nAddPoint = calSkillPoint(nCurLevel) - calSkillPoint(nLastUpLevel)
		SetTask(TSK_LAST_UP_LEVEL_4, nCurLevel)
		SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint + nAddPoint)
		
	elseif ntranscount >= 5 then
		local nTotalPoint = calSkillPoint(200) - calSkillPoint(1)
		local nUsedPoint = GetTask(TSK_USED_SKILL_POINT_4)
		SetTask(TSK_LEAVE_SKILL_POINT_4, nTotalPoint - nUsedPoint)
	end
	
end

function sureGetTranslifeTask_4()
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount ~= 3 then
		CreateTaskSay({"<dec><npc>".."Hi�n t�i ng��i kh�ng ph�i l� chuy�n sinh 3, kh�ng th� ti�p nh�n nhi�m v�!", " Bi�t r�i!/OnCancel"})
		return 
	end
	
	local nCurLevel = GetLevel()
	if nCurLevel < 200 then
		CreateTaskSay({"<dec><npc>".."��ng c�p c�a ng��i ch�a ��n c�p 200!", " Bi�t r�i!/OnCancel"})
		return 
	end
	
	SetTask(TSK_TRANSLIFE_4, 1)
	Msg2Player("Ng��i �� nh�n nhi�m v� th�nh c�ng, h�y nhanh ch�n �i thu th�p T�ch L�ch ��n �i")end

function wantGetTranslifeTask_4()
	CreateTaskSay({"<dec><npc>Ch� c� nh�ng cao th� n�o c� s� l�n chuy�n sinh l� 3 l�n, h�n n�a ��ng c�p ph�i ��t ��n c�p 200 m�i c� th� nh�n nhi�m v� n�y, ng��i x�c ��nh mu�n nh�n kh�ng?",
		" S� d�ng/sureGetTranslifeTask_4",
		"�� ta suy ngh� l�i/OnCancel"})
end

function querySkillPoint_4()
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount < 4 then
		CreateTaskSay({"<dec><npc>Ng��i v�n ch�a chuy�n sinh 4, kh�ng c� �i�m k� n�ng �� ki�m tra!", " Bi�t r�i!/OnCancel"})
		return 
	end
	updataSkillPoint_4()		-- ����ʣ����õļ��ܵ�
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	local nUsedSkillPoint = GetTask(TSK_USED_SKILL_POINT_4)
	CreateTaskSay({format("<dec><npc>Hi�n t�i ng��i c� th� s� d�ng �i�m k� n�ng chuy�n sinh 4 d� l�i l� %d, �� s� d�ng l� %d �i�m", nLeaveSkillPoint, nUsedSkillPoint),
		 " Bi�t r�i!/OnCancel"})
	return 
end

function wantClearSkillPoint_4()
	--�i�u ch�nh gi� t�y �i�m k� n�ng TS4 - Modified by DinhHQ - 20110813
	CreateTaskSay({format("<dec><npc>T�y �i�m k� n�ng tr�ng sinh 4, c�n c� %d l��ng v� 1 <color=red>[B�c ��u T�y T�y ��n]<color>, ng��i x�c ��nh l� t�y l�i hay kh�ng?",CLEAR_SKILL_4_PRICE ),
		"X�c nh�n/sureClearSkillPoint_4",
		"�� ta suy ngh� l�i/OnCancel"})
end

function sureClearSkillPoint_4()
	-- δ4ת
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount < 4 then
		CreateTaskSay({"<dec><npc>Ng��i v�n ch�a chuy�n sinh 4, kh�ng c�n t�y �i�m k� n�ng n�y!", " Bi�t r�i!/OnCancel"})
		return 
	end
	-- Ǯ����	
	--�i�u ch�nh gi� t�y �i�m k� n�ng TS4 - Modified by DinhHQ - 20110813
	if GetCash() < CLEAR_SKILL_4_PRICE or CalcItemCount(3, 6, 1, 30127, -1) <= 0 then
		CreateTaskSay({format("<dec><npc>T�y �i�m k� n�ng tr�ng sinh 4 c�n c� <color=yellow> %d <color> l��ng v� 1 <color=yellow>[B�c ��u T�y T�y ��n]<color>, h�y chu�n b� ��y �� r�i ��n g�p ta",CLEAR_SKILL_4_PRICE), "Bi�t r�i/OnCancel"})
		return 
	end
	
	updataSkillPoint_4()
	
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	local nUsedSkillPoint = GetTask(TSK_USED_SKILL_POINT_4)
	-- û��ʹ�ü��ܵ�
	if nUsedSkillPoint <= 0 then
		CreateTaskSay({"<dec><npc>Ng��i �� ph�n ph�i �i�m k� n�ng chuy�n sinh 4 l� 0, kh�ng c�n t�y �i�m!", " Bi�t r�i!/OnCancel"})
		return 
	end
	
	--�i�u ch�nh gi� t�y �i�m k� n�ng TS4 - Modified by DinhHQ - 20110813
	if ConsumeItem(3, 1, 6, 1, 30127, -1) ~= 1 then
		CreateTaskSay({"<dec><npc>Ng��i n�i c� B�c ��u T�y T�y ��n sao ta kh�ng th�y?", "�� ta �i t�m/OnCancel"})
		return 
	end
	Pay(CLEAR_SKILL_4_PRICE)
	for i=1,getn(TB_SKILL_4) do
		if HaveMagic(TB_SKILL_4[i][1]) > 0 then
		SetSkillLevel(TB_SKILL_4[i][1],0)		-- �����ܵȼ������0
		end
	end
	
	nLeaveSkillPoint = nLeaveSkillPoint + nUsedSkillPoint
	nUsedSkillPoint = 0
	SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint)
	SetTask(TSK_USED_SKILL_POINT_4, nUsedSkillPoint)
	CreateTaskSay({format("<dec><npc>Ng��i �� t�y th�nh c�ng �i�m k� n�ng chuy�n sinh 4, hi�n t�i ng��i c� th� s� d�ng �i�m k� n�ng chuy�n sinh 4 d� l�i l� %d, �� s� d�ng l� %d �i�m", nLeaveSkillPoint, nUsedSkillPoint),
		 " Bi�t r�i!/OnCancel"})
	tbLog:PlayerActionLog("clear_4_turn_skill_point")
end