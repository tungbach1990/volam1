Include("\\script\\activitysys\\config\\1004\\head.lua")
Include("\\script\\activitysys\\config\\1004\\config.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\1004\\variables.lua")
Include("\\script\\activitysys\\config\\1004\\mainquest.lua")
Include("\\script\\vng_feature\\challengeoftime\\npcNhiepThiTran.lua")
function pActivity:OnServerStart()
	%tbDTT_Data:Load()
end

--V��t �i t�nh ph�
function pActivity:Add_PaidCOT_Task(nTaskID, nValue)
	local nDailyTaskCount = %tbCOT_Party:GetDailyTaskCount()
	if nDailyTaskCount > 1 then
		--%VngTaskWeekly:AddWeeklyCount(nTaskID, nValue)
		self:VngAddTaskCounter(nTaskID, nValue)
	end
end

function pActivity:VngAddTaskCounter(nTaskID, nValue)
	--%VngTaskWeekly:AddWeeklyCount(nTaskID, nValue)	
	SetTask(nTaskID, GetTask(nTaskID) + nValue)
end

function pActivity:VngSubtractTaskCounter(nTaskID, nValue, strFailMsg)	
	if (GetTask(nTaskID) - nValue) < 0 then
		if strFailMsg then
			Talk(1, "", strFailMsg)
		end
		return nil
	end
	SetTask(nTaskID, GetTask(nTaskID) - nValue)
	return 1
end

--Phong l�ng �� t�n ph�
function pActivity:IsPaidBoat()
	local nHour = tonumber(GetLocalDate("%H"));	
	local tb_sptime = {
		[10] = 1,
		[14] = 1,
		[16] = 1,
		[18] = 1,
		[20] = 1,
	};
	if (tb_sptime[nHour] and tb_sptime[nHour] == 1) then
		return 1
	else
		return nil
	end
end

function pActivity:CheckWeeklyTask()
--	local nTongKim3000 = %VngTaskWeekly:GetWeeklyCount(%nTSK_WEEKLY_SONGJIN_3000)
--	local nVuotAi = %VngTaskWeekly:GetWeeklyCount(%nTSK_WEEKLY_CHUANGUAN)
--	local nViemDe10 = %VngTaskWeekly:GetWeeklyCount(%nTSK_WEEKLY_YDBZ)
--	local nPLDTinhPhi = %VngTaskWeekly:GetWeeklyCount(%nTSK_WEEKLY_FENGLINGDU)
	local nTongKim3000 = GetTask(%nTSK_WEEKLY_SONGJIN_3000)
	local nVuotAi = GetTask(%nTSK_WEEKLY_CHUANGUAN)
	local nViemDe10 = GetTask(%nTSK_WEEKLY_YDBZ)
	local nPLDTinhPhi = GetTask(%nTSK_WEEKLY_FENGLINGDU)
	local strTittle = format("Tu�n n�y c�c h� �� ho�n th�nh:\n<color=yellow>\t\t\t%-6d<color> tr�n T�ng Kim ��t 3000 �i�m\n<color=yellow>\t\t\t%-6d<color> l�n V��t �i t�n ph�\n<color=yellow>\t\t\t%-6d<color> l�n v��t �i 6 Vi�m ��\n<color=yellow>\t\t\t%-6d<color> l�n ho�n th�nh Phong L�ng �� t�n ph�", nTongKim3000, nVuotAi, nViemDe10,nPLDTinhPhi)	
	Say(strTittle, 1, "��ng/OnCancel")
end

function pActivity:WeeklyAwardCondition()	
	if not self:HaveAnyQuest() then
		Talk(1, "", "V� ��i hi�p n�y, ng��i v�n ch�a nh�n nhi�m v� <color=red>��ng Tr�ng H� Th�o<color>, kh�ng th� nh�n ph�n th��ng n�y!")
		return nil
	end
	return 1
end

function pActivity:HaveAnyQuest(strFailMsg)
	local tbStages = %tbDTT_Data.tbStages
	if not tbStages then
		return
	end
	for stage = 1, getn(tbStages) do		
		for typepoint = 1, getn(tbStages[stage]) do			
			local tbBTask = tbStages[stage][typepoint].tbBitTask
			if not tbBTask then
				return nil
			end
			if tbVNG_BitTask_Lib:getBitTask(tbBTask[1]) == 1 and tbVNG_BitTask_Lib:getBitTask(tbBTask[2]) == 0 then
				return 1
			end
		end
	end
	if strFailMsg then
		Talk(1, "", strFailMsg)
	end
	return nil
end

function pActivity:MainQuestDialog(nStage)
	%tbMainQuest:SelectTypePoint(nStage)	
end

function pActivity:Chuanguan28Action()
	if CalcFreeItemCellCount() >= 1 then
		PlayerFunLib:GetItem({tbProp={6,1,30133,1,0,0}},3,%strEventName, "VuotAi28")
	end
end

function pActivity:YDBZguoguanAction(nLevel)
	if nLevel == 6 then
		if CalcFreeItemCellCount() >= 1 then		
			PlayerFunLib:GetItem({tbProp={6,1,30133,1,0,0},},3,%strEventName,"VuotAiViemDe6")
		end
	end
end