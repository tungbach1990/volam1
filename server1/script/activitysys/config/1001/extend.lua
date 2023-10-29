Include("\\script\\activitysys\\config\\1001\\head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\vng_feature\\challengeoftime\\npcNhiepThiTran.lua")
function pActivity:VngAddWeeklyTask(nTaskID, nValue)
	%VngTaskWeekly:AddWeeklyCount(nTaskID, nValue)	
end
--V��t �i t�nh ph�
function pActivity:Add_PaidCOT_Task(nTaskID, nValue)
	local nDailyTaskCount = %tbCOT_Party:GetDailyTaskCount()
	if nDailyTaskCount > 1 then
		%VngTaskWeekly:AddWeeklyCount(nTaskID, nValue)
	end
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