-- ������
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\vng_feature\\double_mission_award.lua")

tbDrumNpc = {};
tbDrumNpcList = {};

function OnTime(NpcIndex)
	local tbDrumNpc = tbDrumNpcList[NpcIndex];
	if (tbDrumNpc) then
		return tbDrumNpc:OnTime()
	else
		return 0, 0
	end
end

function tbDrumNpc:New(szTongName, nTongId)
	
	local tb = clone(tbDrumNpc)
	local w,x,y = GetWorldPos();
	tb.Pos = {SubWorldID2Idx(w), x*32, y*32};
	tb.NpcIndex = AddNpc(tbTriumphDrum.nNPCID, 1, tb.Pos[1], tb.Pos[2], tb.Pos[3], 0, format("Tr�ng kh�i ho�n <%s>",szTongName));
	tb.nTongId = nTongId;
	tb.TimerCount = tbTriumphDrum.nTimerCount;
	
	if (tb.NpcIndex <= 0) then
		return nil;
	end

	tbDrumNpcList[tb.NpcIndex] = tb;
	AddTimer(tbTriumphDrum.nTimerOut, "OnTime", tb.NpcIndex);
	return tb;
end

function tbDrumNpc:OnTime()
	
	self.TimerCount = self.TimerCount - 1;
	
	if self.TimerCount < 0 then
		if (self.TimerCount * -1) > tbTriumphDrum.nTimerShow then
			DelNpc(self.NpcIndex);
			tbDrumNpcList[self.NpcIndex] = nil;
			return 0, 0;
		else
			return tbTriumphDrum.nTimerOut, self.NpcIndex;
		end 
	end
	
	local nOldPlayer = PlayerIndex;
	local tbAllPlayer, nPlayerCount = GetNpcAroundPlayerList(self.NpcIndex, tbTriumphDrum.nSercherRange);
	local tbGoodPlayer = {};
	
	for i = 1, nPlayerCount do
		PlayerIndex = tbAllPlayer[i];
		local szTongName, nTongId = GetTongName();
		if nTongId == self.nTongId and GetLevel() >= tbTriumphDrum.nLimit_Level then
			tbGoodPlayer[getn(tbGoodPlayer)+ 1] = PlayerIndex;
		end 
	end
		
	local nGoodPlayerCount = getn(tbGoodPlayer);
	local nGoodPlayerExp = tbTriumphDrum:GetExp(nGoodPlayerCount);	
	local szMsg = format("Hi�n t�i c� %d th�nh vi�n ��ng c�nh tr�ng kh�i ho�n. C� th� nh�n ���c %d kinh nghi�m.", nGoodPlayerCount, nGoodPlayerExp);
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"));
	Msg2Tong(self.nTongId, szMsg);
	nGoodPlayerExp = tbVnX2Award:X2Drum(nGoodPlayerExp)
	if tbVnX2Award:IsActive("DRUM") then
		Msg2Tong(self.nTongId, format("Tu�n l� v�ng: B�n ���c nh�n ��i �i�m kinh nghi�m, nh�n ���c <color=yellow>%d<color> �i�m kinh nghi�m.", nGoodPlayerExp));
	end
	local tbAwardItem = {nExp = nGoodPlayerExp};
	
	for i = 1, nGoodPlayerCount do
		PlayerIndex = tbGoodPlayer[i];
		--Fix tr�ng kh�i ho�n ch� nh�n kinh nghi�m 1 l�n - Modified By DinhHQ - 20111202
		--local nTaskLastAward  = tbTriumphDrum.tbTaskGroup:GetTask(tbTriumphDrum.nTaskID_LastAward);
		--local nTaskAwardCount = tbTriumphDrum.tbTaskGroup:GetTask(tbTriumphDrum.nTaskID_AwardCount);
			
--		if nTaskLastAward ~= nCurDay then
--			nTaskLastAward = nCurDay;
--			nTaskAwardCount = 0;
--			tbTriumphDrum.tbTaskGroup:SetTask(tbTriumphDrum.nTaskID_LastAward, nCurDay);
--			tbTriumphDrum.tbTaskGroup:SetTask(tbTriumphDrum.nTaskID_AwardCount, 0);
--		end
		local nDailyAwardCount = PlayerFunLib:GetTaskDailyCount(tbTriumphDrum.nTaskID_DailyAwardLimit)
		
		if nDailyAwardCount < tbTriumphDrum.nLimit_DayAward then
			--tbTriumphDrum.tbTaskGroup:AddTask(tbTriumphDrum.nTaskID_AwardCount, 1);
			PlayerFunLib:AddTaskDaily(tbTriumphDrum.nTaskID_DailyAwardLimit, 1)
			tbAwardTemplet:GiveAwardByList(tbAwardItem, "Ph�n th��ng tr�ng kh�i ho�n");
		else
			Msg2Player("H�m nay c�c h� �� nh�n th��ng v��t qu� s� l�n cho ph�p!");
		end
	end
	
	PlayerIndex = nOldPlayer;
	return tbTriumphDrum.nTimerOut, self.NpcIndex;
end