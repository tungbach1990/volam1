Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")

EventThangLong = {}

EventThangLong.FILE_PATH = "settings//event_1000_thanglong.txt"

EventThangLong.EndDate = 20101023
--EventThangLong.TaskCountGiveItem = 2739
EventThangLong.TaskDailyGiveItem =2739
EventThangLong.TaskGetAwardInTime =2740

EventThangLong.tbAwardServer = 
{
	[1] = {1,10,{szName = "�i�m kinh nghi�m", nExp = 5000000}},	
	[2] = {11,20,{szName = "�i�m kinh nghi�m", nExp = 8000000}},	
	[3] = {21,30,{szName = "�i�m kinh nghi�m", nExp = 10000000}},	
	[4] = {31,40,{szName = "�i�m kinh nghi�m", nExp = 15000000}},	
	[5] = {41,50,{szName = "�i�m kinh nghi�m", nExp = 20000000}},	
	[6] = {51,60,{szName = "�i�m kinh nghi�m", nExp = 30000000}},	
	[7] = {61,10e5,{szName = "�i�m kinh nghi�m", nExp = 50000000}},	
}

function EventThangLong:IsActive()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if (nCurDate <= self.EndDate) then
		return 1
	else
		return 0
	end
end

function EventThangLong:ShowDialog()
	local nHour = tonumber(GetLocalDate("%H%M"))
	local tbOpt = {}
	local str = "Ch�c m�ng ��i l� 1000 n�m Th�ng Long - H� N�i"
	if (nHour >= 1200 and nHour <= 1400) then
		tinsert(tbOpt, "Ta mu�n nh�n ph�n th��ng 1000 n�m Th�ng Long/#EventThangLong:GetAward(1)")
	end
	
	if (nHour >= 2000 and nHour <= 2200) then
		tinsert(tbOpt, "Ta mu�n nh�n ph�n th��ng 1000 n�m Th�ng Long/#EventThangLong:GetAward(2)")
	end
	tinsert(tbOpt, "Ta mu�n giao n�p 10 C�ng Tr�ng L�nh/#EventThangLong:GiveItem()")
	tinsert(tbOpt, "Ta mu�n xem s� l��ng C�ng Tr�ng L�nh �� giao n�p/#EventThangLong:ViewTotalDragonItem()")
	tinsert(tbOpt, "<#>Tho�t/OnCancel")
	if ( getn( tbOpt ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpt ), tbOpt )	
end

function EventThangLong:GiveItem()
	PlayerFunLib:AddTaskDaily(self.TaskDailyGiveItem,1)
	if (CalcEquiproomItemCount(6,1,30048,-1) < 10) then
		Say("��i hi�p mang theo kh�ng �� <color=yellow>C�ng Tr�ng L�nh<color>!",0)
		return 
	end
	
	if (ConsumeEquiproomItem(10, 6, 1, 30048, -1)) then
		--SetTask(self.TaskCountGiveItem, GetTask(self.TaskCountGiveItem)+1)
		self:AddTotalDragonItem()
		tbAwardTemplet:GiveAwardByList({szName ="�i�m kinh nghi�m", nExp = 500000}, "Award exp give Cong Trang Lenh")
		Msg2Player(self:GetNotify())
		
		local  nTotalScore = loadsavevalue(self.FILE_PATH)
		if (nTotalScore > 0 and mod(nTotalScore, 1000) == 0)  then
			tbAwardTemplet:GiveAwardByList({szName ="�i�m kinh nghi�m", nExp = 10000000}, "Award special exp give Cong Trang Lenh")
			Say( "B�n l� ng��i ho�n th�nh nhi�m v� th� ".. floor(nTotalScore/1000) ..", nh�n ���c ph�n th��ng ��c bi�t" , 0 )	
		end
	end
end

function EventThangLong:AddTotalDragonItem()
	local nTotalScore = loadsavevalue( self.FILE_PATH )
	nTotalScore = nTotalScore + 1
	savevalue(self.FILE_PATH, nTotalScore)
end

function EventThangLong:ViewTotalDragonItem()
	local nTotalScore = loadsavevalue(self.FILE_PATH)
	--local nPlayerScore =GetTask(self.TaskCountGiveItem)
	local szServerScore = self:GetNotify()
	--local szShowResult = "\tT�ng s� l��ng C�ng Tr�ng L�nh m� ��i hi�p �� giao n�p l�: <color=yellow>" .. nPlayerScore .. "<color>." .. "/n/t" .. szServerScore
	Say( szServerScore , 0 )	
end

function EventThangLong:GetNotify()
	local nTotalScore = loadsavevalue(self.FILE_PATH)
	local nCountFinishQuest = floor(nTotalScore/1000)
	local nCurCountQuest = mod(nTotalScore,1000)
	local szMsg = "To�n server ��<color=yellow> " .. nCountFinishQuest .. "<color> l�n ho�n th�nh nhi�m v� ch�o m�ng 1.000 n�m Th�ng Long - H� N�i, hi�n t�i �� ho�n th�nh th�m <color=yellow>" .. nCurCountQuest ..  "<color> nhi�m v�."
	return szMsg
end

function EventThangLong:GetAward(nTime)
	if (PlayerFunLib:GetTaskDailyCount(self.TaskDailyGiveItem) < 1) then
		Say( "H�m nay ��i hi�p ch�a giao n�p C�ng Tr�ng L�nh" , 0 )
		return	
	end
	
	
	if (GetTask(2735) < 3) then
		Say( "H�m nay ��i hi�p ch�a ho�n th�nh 3 nhi�m v� m� b�o r��ng!" , 0 )
		return	
	end
	
	
	local tbScoreIndex = self:GetPlayerAwardTable()
	if (tbScoreIndex == nil) then
		Say( "��i hi�p kh�ng �� s� l�n giao n�p C�ng Tr�ng L�nh" , 0 )	
		return
	end
	
	if (nTime == 1) then
		if (PlayerFunLib:GetTaskDailyCount(self.TaskGetAwardInTime) >= 1) then
			Say( "��i hi�p �� nh�n ph�n th��ng ��t n�y!" , 0 )	
			return
		end
		PlayerFunLib:AddTaskDaily(self.TaskGetAwardInTime,1)
		tbAwardTemplet:GiveAwardByList(tbScoreIndex, "Award Server give dragon")
	else
		if (PlayerFunLib:GetTaskDailyCount(self.TaskGetAwardInTime) >= 2) then
			Say( "��i hi�p �� nh�n ph�n th��ng ��t n�y!" , 0 )	
			return
		end
		PlayerFunLib:AddTaskDaily(self.TaskGetAwardInTime,2)
		tbAwardTemplet:GiveAwardByList(tbScoreIndex, "Award Server give dragon")
	end
	
end

function EventThangLong:GetPlayerAwardTable()
	--local nScore = GetTask(self.TaskCountGiveItem)
	local nScore =  loadsavevalue(self.FILE_PATH)
	nScore = floor(nScore/1000)
	if (nScore > 60) then
		return self.tbAwardServer[7][3]
	else
		for i = 1, getn(self.tbAwardServer) do
			local nTemp = self.tbAwardServer[i]
			if (nScore >= nTemp[1] and nScore <= nTemp[2]) then
				return nTemp[3]
			end
		end
	end
	
	return nil
end
