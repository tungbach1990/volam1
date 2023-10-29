Include("\\script\\vng_event\\LunarYear2011\\npc\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\progressbar.lua")
if not tbMaiTree then
	tbMaiTree = {}
end
tbMaiTree.TSK_CARD_HANG = 2757
tbMaiTree.nMaxDailyCount = 2
function main()
	if tbVNG_LY2011:isActive() ~= 1 then
		return
	end
	if tbMaiTree:checkCondition() == 1 then
		tbProgressBar.tbConfig[1].nTime = 5
		tbProgressBar.tbConfig[1].szTitle = "�ang treo thi�p..."
		tbProgressBar:OpenByConfig(1, tbMaiTree.hangCard, {tbMaiTree}, Msg2Player, {"Treo thi�p th�t b�i."})
		--tbMaiTree:hangCard()
	end
end

function tbMaiTree:checkCondition()
	if tbVNG_LY2011:checkCondition() ~= 1 then
		Talk(1, "", "B�n kh�ng �� �i�u ki�n s� d�ng v�t ph�m! Y�u c�u c�p �� tr�n 50 v� ��  n�p th�.")
		return 0
	end
	local nAvailableCount = self:getDailyAvailableCount(tbVNG_LY2011.nStartDay)
	if nAvailableCount <= 0 then
		Talk(1, "", "H�nh nh� h�m nay ta ��  treo thi�p nhi�u r�i, mai quay l�i v�y.")
		return 0
	end
	if nAvailableCount == 1 then
		local nCurTime = tonumber(GetLocalDate("%H%M"))
		local nTimePeriod = nCurTime - self:getTaskDailyTime()
		if nTimePeriod	<= 30 then
			local nRemainTime = 30 - nTimePeriod
			Talk(1, "", format("Th�i gian gi�a 2 l�n treo thi�p c�ch nhau <color=red>30<color> ph�t. <color=red>%d<color> ph�t n�a h�y quay l�i.", nRemainTime))
			return 0		
		end
		if CalcItemCount(-1, 6, 1, 30090, -1) < 1 then
			Talk(1, "", "H�nh nh� ta qu�n mang theo thi�p xu�n, th�t l� ��ng  tr�.")
			return 0
		end
		return 1
	else if nAvailableCount == 2 then
		if CalcItemCount(-1, 6, 1, 30090, -1) < 1 then
			Talk(1, "", "H�nh nh� ta qu�n mang theo thi�p xu�n, th�t l� ��ng tr�.")
			return 0
		end
		return 1
		end
	end
	return 0
end

function tbMaiTree:hangCard()
	local tbExp = 
		{
			{nExp=20000000,nRate=10},
			{nExp=15000000,nRate=20},
			{nExp=10000000,nRate=70},
		}
		
		if ConsumeEquiproomItem(1, 6, 1, 30090, 1) == 1 then
			self:addTaskCount(1)
			local nCurTime = tonumber(GetLocalDate("%H%M"))
			self:setTaskDailyTime(nCurTime)
			tbAwardTemplet:GiveAwardByList(tbExp, "[VNG][Lunar Year 2011][Ho�t ��ng treo thi�p xu�n]")
		end	
		
end
function tbMaiTree:getDailyAvailableCount(nStartDate)
	local nPlayerCount = self:getTaskCount()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local nTotalCount = (nCurDate - nStartDate + 1) * self.nMaxDailyCount
	if (nTotalCount - nPlayerCount) > 2 then
		local nTaskVal = (nCurDate - nStartDate) * self.nMaxDailyCount
		self:setTaskCount(nTaskVal)		
		return 2
	end
	return (nTotalCount - nPlayerCount)
end

function tbMaiTree:getTaskDailyTime()
	local nTaskVal = GetTask(self.TSK_CARD_HANG)
	local nCount = floor(nTaskVal/10000)	
	return (nTaskVal - nCount * 10000)
end

function tbMaiTree:addTaskCount(nValue)
	local nCurCount = self:getTaskCount()
	nCurCount = nCurCount + nValue
	self:setTaskCount(nCurCount)
end

function tbMaiTree:setTaskCount(nValue)
	local nTaskTime = self:getTaskDailyTime()
	local nVal = nValue * 10000 + nTaskTime
	SetTask(self.TSK_CARD_HANG, nVal)
end

function tbMaiTree:setTaskDailyTime(nTime)
	if nTime > 2400 then
		return 0
	end
	local nTotalCount = self:getTaskCount()
	SetTask(self.TSK_CARD_HANG, nTotalCount * 10000 + nTime)
	return 1
end

function tbMaiTree:getTaskCount()
	return  floor(GetTask(self.TSK_CARD_HANG)/10000)
end
