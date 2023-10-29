-- �ļ�������event.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-01-17 14:48:26
--�ӳ����(8��) �� NPC�������˶Ի��Լ���������
Include("\\script\\event\\springfestival08\\lib\\compose.lua")
Include("\\script\\event\\springfestival08\\lib\\addaward.lua")
Include("\\script\\event\\springfestival08\\allbrother\\taskhead.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\lib\\log.lua")
allbrother_0801_tbLingPai = 
	{
		{szName="Thi�n Xu L�nh", tbProp={6, 1, 1643, 1, 0, 0}, },
		{szName="Thi�n To�n L�nh", tbProp={6, 1, 1644, 1, 0, 0}, },
		{szName="Thi�n C� L�nh", tbProp={6, 1, 1645, 1, 0, 0}, },
		{szName="Thi�n Quy�n L�nh", tbProp={6, 1, 1646, 1, 0, 0}, },
		{szName="Ng�c Ho�nh L�nh", tbProp={6, 1, 1647, 1, 0, 0}, },
		{szName="Khai D��ng L�nh", tbProp={6, 1, 1648, 1, 0, 0}, },
		{szName="Dao Quang L�nh", tbProp={6, 1, 1649, 1, 0, 0}, },
		{szName="Th�t Tinh L�nh", tbProp={6, 1, 1650, 1, 0, 0}, },
	}

function allbrother_0801_main()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	
	
	if allbrother_0801_IsAct() ~= 1 then
		Say(format("Xin l�i, <color=yellow>%s<color> ho�t ��ng �� k�t th�c, �a t� �� tham gia ho�t ��ng.",allbrother_0801_szActName), 0)
		return 0;
	end
	
	local szTitle = "Xin ch�o, t�i h� l� truy�n nh�n c�a B�c ��u M�n, ch�ng hay c�c h� c�n g�?";
	local tbOpt = 
	{
		"T�i h� v� c�c huynh �� mu�n ti�p nh�n nhi�m v�./allbrother_0801_WantTask",
		"T�i h� �� ho�n th�nh nhi�m v� c�a ti�n b�i./allbrother_0801_TaskPersonTaskAward",
		"T�i h� c�ng c�c huynh �� �� ho�n th�nh nhi�m v� c�a ti�n b�i./allbrother_0801_TeamTaskAward",
		"Th�t �y n�y, phi�n l�o n�i l�i 1 l�n n�a nhi�m v�./allbrother_0801_QueryPersonTask",
		"T�i h� kh�ng th� ho�n th�nh nhi�m v� c� nh�n l�n n�y./allbrother_0801_CancelTask",
		"T�i h� c�o t�./OnCancel"
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

--ĳ����ִ��ĳ������
function allbrother_0801_PlayerDo(nPlayerIdx,fun,...)
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIdx
	local re = call(fun, arg);
	PlayerIndex = nOldPlayer;
	return re
end

--��ѯ��������
function allbrother_0801_QueryPersonTask()
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	if allbrother_0801_CheckTaskState() == 0 then
		Say("C�c h� v�n ch�a nh�n nhi�m v�.", 0)
	else
		if nTaskState > 1073741824 then
			nTaskState = nTaskState - 1073741824
		end
		Say(format("Nhi�m v� hi�n t�i l�: %s", allbrother_0801_tbTaskList[nTaskState].szShow), 0)
	end
	
end

--�����������
function allbrother_0801_WantTask()
	local nTeamSize = GetTeamSize()
	local i
	if IsCaptain() ~= 1 then
		Say("Vi�c n�y�� Phi�n c�c h� nh� ��i tr��ng c�ng ta b�n chuy�n.", 0)
		return 0;
	end
	if nTeamSize < allbrother_0801_TeamSizeLimit then
		Say(format("S� th�nh vi�n trong t� ��i kh�ng ��, xin h�y chi�u m� th�m <color=yellow>%d<color> ng��i n�a r�i quay l�i ��y ta giao cho nhi�m v�.", allbrother_0801_TeamSizeLimit-nTeamSize), 0)
		return 0;
	end
	for i=1,nTeamSize do
		if not allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_islvl50) then
			Say("T� ��i c�a b�n c� ng��i ��ng c�p ch�a ��t 50 ho�c ch�a n�p th�, kh�ng th� ti�p nh�n nhi�m v�.", 0)
			return 
		end
	end
	
	local nCount = allbrother_0801_CheckTeamTaskState();
	local tbTeamTask = {}
	if nCount == nTeamSize then
		for i=1,nTeamSize do
			local nTaskId = random(1,getn(allbrother_0801_tbTaskList))
			while tbTeamTask[nTaskId] == 1 do
				nTaskId = random(1,getn(allbrother_0801_tbTaskList))
			end
			tbTeamTask[nTaskId] = 1
			allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_AcceptTask, nTaskId)
		end
	else
		Say("T� ��i c�a b�n c� ng��i ch�a ho�n th�nh nhi�m v� ho�c �� l�m h�t nhi�m v� r�i .", 0)
	end
	tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuBacDau")
end


--��� ������ÿ���˵�����״̬�� ����û�����������
function allbrother_0801_CheckTeamTaskState()
	local nTeamSize = GetTeamSize()
	local nCount = 0;
	for i=1,nTeamSize do
		nCount = nCount + allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CheckTaskState)
	end
	return nTeamSize-nCount;
end

--���һ���˵�����״̬ 0Ϊû�����񣬷���������������������������Ѿ���ʱ��ִ��ȡ�����񷵻�0 û�н�����
function allbrother_0801_CheckTaskState()
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskLimit	= GetTask(TSK_allbrother_0801_TaskLimit)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local nDate			= tonumber(GetLocalDate("%y%m%d"))
	
	if nTaskState == 0 then --û�н�����
		if nDate ~= floor(nTaskLimit/256) then --������ǽ��� ����������
			nTaskLimit = nDate * 256
			SetTask(TSK_allbrother_0801_TaskLimit, nTaskLimit)
		end
		if mod(nTaskLimit, 256) < TSKV_allbrother_0801_TaskLimit then --���ҽ��컹�ܽ�
			return 0
		else
			Msg2Team(format("%s H�m nay �� ti�p nh�n %d l�n nhi�m v� c� nh�n, h�m sau quay l�i nh�.", GetName(), TSKV_allbrother_0801_TaskLimit))
			return 1;
		end
	else --�������񣬿��Ƿ�ʱ
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --��ʱ
			allbrother_0801_CancelTask()
			Msg2Team(format("%s �� v��t qu� th�i gian quy ��nh, nhi�m v� b� h�y b�.", GetName()))
			Msg2Player(format("%s �� v��t qu� th�i gian quy ��nh, nhi�m v� b� h�y b�.", GetName()))
			return 0;
		else --û�г�ʱ��˵���Ѿ���������
			Msg2Team(format("%s �� ti�p nh�n nhi�m v� c�a B�c ��u L�o Nh�n.", GetName()))
			return 1;
		end
	end
end

--һ���˽�������Ĵ��� ����һ��nTaskId�����񣬲�������ʱ�䣬�����������+1
function allbrother_0801_AcceptTask(nTaskId)
	--������������ n����״̬
	SetTask(TSK_allbrother_0801_TaskState, nTaskId)
	SetTask(TSK_allbrother_0801_TaskLimit, GetTask(TSK_allbrother_0801_TaskLimit)+1)
	SetTask(TSK_allbrother_0801_TaskTime, GetCurServerTime())
	Msg2Player(format("Nh�n ���c nhi�m v�: %s", allbrother_0801_tbTaskList[nTaskId].szShow))
end



--����ȡ������ 
function allbrother_0801_TeamCancelTask()
	local nTeamSize = GetTeamSize()
	for i=1,nTeamSize do
		allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CancelTask)
	end
end
--����ȡ������,����״̬��Ϊ0
function allbrother_0801_CancelTask()
	if GetTask(TSK_allbrother_0801_TaskState) == 0 then
		Say("Hi�n t�i, b�n v�n ch�a c� nhi�m v� �? V��t qu� th�i gian quy ��nh l�m nhi�m v� xem nh� nhi�m v� b� h�y b�.", 0)
		return 0;
	end
	SetTask(TSK_allbrother_0801_TaskState, 0)
	Msg2Player("H�y b� nhi�m v�.")
end

--�Ƿ�50��
function allbrother_0801_islvl50()
	if GetLevel() >= 50 and IsCharged() == 1 then
		return 1
	else 
		Msg2Team(format("%s ��ng c�p ch�a ��t 50 ho�c ch�a n�p th�.",GetName()))
	end
end

function allbrother_0801_TaskPersonTaskAward() --
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local nTaskId		= 0;
	if nTaskState == 0 then
		Say("B�n v�n ch�a ti�p nh�n nhi�m v� n�o c�.",0)
		return	
	end
	if nTaskState < 1073741824 then
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --��ʱ
			SetTask(TSK_allbrother_0801_TaskState, 0)
			Say("Xin chia bu�n! Th�i gian tr�i qua th�t nhanh, v�n ch�a ho�n th�nh, nhi�m v� th�t b�i r�i.", 0)
			return
		end
		nTaskId = nTaskState
		if allbrother_0801_tbTaskList[nTaskId].nTaskType == 0 then 
			local tbAward = {0, allbrother_0801_TaskFindItemAward, 1}
			springfestival08_lib_material_compose({allbrother_0801_tbTaskList[nTaskId].tbList, tbAward, "Ho�n th�nh nhi�m v� ", "V�t ph�m nhi�m v� kh�ng ��ng ho�c s� l��ng kh�ng ��", "Nhi�m v� sai"}, "Giao v�t ph�m")
		else
			Say("Nhi�m v� v�n ch�a ho�n th�nh", 0)	
		end
	else
		allbrother_0801_TaskFindNpcAward();
	end
	
	
	
end

function allbrother_0801_TaskFindItemAward(nTaskId)
	if allbrother_0801_CompleteTask() == 1 then
		return allbrother_0801_TaskFindNpcAward()
	end
end

--���������콱���ж������Ƿ���ɣ��Ƿ�ʱ��Ȼ�����Ʒ������״̬����Ϊ0
function allbrother_0801_TaskFindNpcAward()
	
	local nExpAward = 0;
	local nTransCount = ST_GetTransLifeCount();
	
	if nTransCount == 0 then
		nExpAward = 5000000;
	elseif nTransCount == 1 then
		nExpAward = 9000000;
	elseif nTransCount >= 2 then
		nExpAward = 12000000;
	end
		
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local tbAward = 
	{
		{szName="Ph�c Duy�n L� (��i) ", tbProp={6, 1, 124, 1, 0, 0}},
		{nExp = nExpAward},
	}
	if (nTaskState > 1073741824) then --�൱���ж����λ�����Ƿ�Ϊ1
		SetTask(TSK_allbrother_0801_TaskState, 0)
		--�Ƿ�ʱ
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --��ʱ
			Say("Xin chia bu�n! Th�i gian tr�i qua th�t nhanh, v�n ch�a ho�n th�nh, nhi�m v� th�t b�i r�i.", 0)
			return
		end
		--������
		springfestival08_lib_AddAward(tbAward[2], allbrother_0801_szActName)
		
		local nCurRate = random(1,100)
		if nCurRate < 20 then
			springfestival08_lib_AddAward(tbAward[1], allbrother_0801_szActName)
		end
		
		nCurRate = random(1,getn(allbrother_0801_tbLingPai))
		springfestival08_lib_AddAward(allbrother_0801_tbLingPai[nCurRate], allbrother_0801_szActName)
		return 1;
	else
		Say("B�n d��ng nh� v�n ch�a ho�n th�nh nhi�m v�.", 0)
	end
end



function allbrother_0801_TeamTaskAward()
	local nTeamSize = GetTeamSize()
	if IsCaptain() ~= 1 then
		Say("Vi�c n�y�� Phi�n c�c h� nh� ��i tr��ng c�ng ta b�n chuy�n.", 0)
		return 0;
	end
	if nTeamSize < allbrother_0801_TeamSizeLimit then
		Say("Huynh �� trong t� ��i v�n ch�a ��, xin chi�u m� th�m nh�.", 0)
		return
	end
	for i=1,nTeamSize do
		if not allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_islvl50) then
			Say("T� ��i c�a b�n c� ng��i ��ng c�p ch�a ��t 50 ho�c ch�a n�p th�, kh�ng th� ti�p nh�n nhi�m v�.", 0)
			return 
		end
	end
	local tbAward = {0, allbrother_0801_TeamTaskAwardFun, 1}
	springfestival08_lib_material_compose({allbrother_0801_tbLingPai, tbAward, "Ho�n th�nh nhi�m v� ", "V�t ph�m nhi�m v� kh�ng ��ng ho�c s� l��ng kh�ng ��", "Nhi�m v� sai"}, "Giao v�t ph�m", "8 lo�i l�nh b�i B�c ��u M�n (Thi�n Xu L�nh, Thi�n To�n L�nh, Thi�n C� L�nh, Thi�n Quy�n L�nh, Ng�c Ho�nh L�nh, Khai D��ng L�nh, Dao Quang L�nh, Th�t Tinh L�nh)")
end

--function allbrother_0801_CheckAllTeamTaskLimit()
--	local nTeamSize = GetTeamSize()
--	local nCount = 0;
--	for i=1,nTeamSize do
--		nCount = nCount + allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CheckTeamTaskLimit)
--	end
--	return nCount;
--end

function allbrother_0801_CheckTeamTaskLimit()
	local nTaskTeamLimit = GetTask(TSK_allbrother_0801_TaskTeamLimit)
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate ~= floor(nTaskTeamLimit/256) then
		nTaskTeamLimit = nDate * 256
		SetTask(TSK_allbrother_0801_TaskTeamLimit, nTaskTeamLimit)
	end
	if mod(nTaskTeamLimit, 256) < TSKV_allbrother_0801_TaskTeamLimit then
		return 1;
	else
		Msg2Player(format("%s H�m nay �� ho�n th�nh %d l�n nhi�m v� t�p th�, �� ��t ��n t�i �a, kh�ng th� nh�n ph�n th��ng.", GetName(), TSKV_allbrother_0801_TaskTeamLimit))
		return 0;
	end
	return 0;
end

function allbrother_0801_TeamTaskAwardFun()
	local nTeamSize = GetTeamSize()
	for i=1,nTeamSize do
		allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_TaskAwardFun)
	end
	while GetTeamSize() > 0 do
		allbrother_0801_PlayerDo(GetTeamMember(1), LeaveTeam);
	end
	return 1;	
end

function allbrother_0801_TaskAwardFun()
	
	if allbrother_0801_CheckTeamTaskLimit() == 0 then
		return 1
	end
	
	local tbExp = {nExp = 8000000}
	local tbItem = 
	{
		{szName="Ph�c Duy�n L� (��i) ", tbProp={6, 1, 124, 1, 0, 0}, nRate = 20},
		{szName="Ti�n Th�o L� ", tbProp={6, 1, 71, 1, 0, 0}, nRate = 5},
		{szName="T� Th�y Tinh", tbProp={4, 239, 1, 0, 0, 0}, nRate = 1},
	}
	springfestival08_lib_AddAward(tbExp, allbrother_0801_szActName)
	springfestival08_lib_GiveRandomAward(tbItem, allbrother_0801_szActName)
	SetTask(TSK_allbrother_0801_TaskTeamLimit, GetTask(TSK_allbrother_0801_TaskTeamLimit)+1)
	return 1;
end


function OnCancel()
end