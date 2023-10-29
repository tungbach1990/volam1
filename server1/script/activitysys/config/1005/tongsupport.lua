Include("\\script\\tong\\tong_header.lua");
IncludeLib("TONG")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\config\\1005\\variables.lua")
Include("\\script\\vng_lib\\tong_task.lua")

tbTongSupport = {}
tbTongSupport.tbRank = {
	[1] = 20e6,
	[2] = 30e6,
	[3] = 50e6,
	[4] = 100e6,
	[5] = 150e6,
	[6] = 200e6,
}
tbTongSupport.tbTong_TSK_Item_Count = tbTS_TONG_TASK_ITEM_COUNT
tbTongSupport.nMinTongJoinTime = nTS_MIN_TONG_JOIN_TIME
tbTongSupport.nTSK_Daily_Award_Count = nTS_TASK_DAILY_AWARD_COUNT
tbTongSupport.nTSK_Exp = nTS_TASK_EXP_AWARD
tbTongSupport.nMaxExp = nTS_MAX_EXP_AWARD

function tbTongSupport:GetRank()
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "C�c h� ch�a gia nh�p bang h�i kh�ng th� nh�n ph�n th��ng n�y!")
		return 0
	end
	local nItemCount = tbTongTSK:GetTongTask(nTongID, self.tbTong_TSK_Item_Count)
	if nItemCount < 10 then
		Talk(1, "", "S� l��ng <color=red>T�n Th� Kim B�i<color> n�p v�o kh�ng ��, h�y c� g�ng gi�p �� c�c t�n th� �� nh�n ���c ph�n th��ng l�n nh�!")
		return 0
	end
	if nItemCount >= 10 and nItemCount <= 49 then
		return 1
	end
	if nItemCount >= 50 and nItemCount <= 99 then
		return 2
	end
	if nItemCount >= 100 and nItemCount <= 199 then
		return 3
	end
	if nItemCount >= 200 and nItemCount <= 299 then
		return 4
	end
	if nItemCount >= 300 and nItemCount <= 399 then
		return 5
	end
	if nItemCount >= 400 then
		return 6
	end
end

function tbTongSupport:CheckCondition()
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "C�c h� ch�a gia nh�p bang h�i kh�ng th� nh�n ph�n th��ng n�y!")
		return nil
	end
	local nTongTime = GetJoinTongTime()
	if nTongTime < self.nMinTongJoinTime then
		Talk(1, "", "Th�i gian gia nh�p bang ch�a �� <color=red>1 ng�y<color>, kh�ng th� nh�n th��ng.")
		return 0
	end
	local nTaskDailyCount = PlayerFunLib:GetTaskDailyCount(self.nTSK_Daily_Award_Count)
	if nTaskDailyCount >= 1 then
		Talk(1, "", "M�i ng�y ch� nh�n ���c ph�n th��ng n�y <color=red>1 <color>l�n, mai r�i h�y quay l�i.")
		return 0
	end
	local nTaskExp = GetTask(self.nTSK_Exp)*1e6
	if nTaskExp >= self.nMaxExp then
		Talk(1, "", "C�c h� �� ��t gi�i h�n ph�n th��ng n�y, kh�ng th� nh�n th�m.")
		return 0
	end
	return 1
end

function tbTongSupport:main()
	local szTongName, nTongID = GetTongName();	
	local strCurrentCount = ""
	if szTongName == nil or szTongName == "" then
		strCurrentCount = "Hi�n t�i: <color=red>Ch�a gia nh�p bang h�i<color>\n"
	else
		local nItemCount = tbTongTSK:GetTongTask(nTongID, self.tbTong_TSK_Item_Count)
		strCurrentCount = format("S� l��ng <color=red>T�n Th� Kim B�i<color> hi�n t�i: <color=yellow>%d<color>\n", nItemCount)
	end
	
	local strTittle = format("Bang h�i ti�p nh�n c�ng nhi�u t�n th�, ph�n th��ng c�ng l�n. %s", strCurrentCount)
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "S� l��ng", "Kinh nghi�m")
	strTittle = strTittle..format("\t\t\t\t<color=yellow>%-16s%26s\n", "10 - 49", "10,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "50 - 99", "15,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "100 - 199", "20,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "200 - 299", "50,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "300 - 399", "100,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s<color>", "Tr�n 400", "150,000,000")
	local tbOpt = {}
	tinsert(tbOpt, {"Nh�n", tbTongSupport.GetAward, {tbTongSupport}})
	tinsert(tbOpt, {"��ng"})	
	CreateNewSayEx(strTittle, tbOpt)
end

function OnCancel()end

function tbTongSupport:GetAward()
	if self:CheckCondition() ~= 1 then
		return
	end
	local nTskExp = GetTask(self.nTSK_Exp) * 1e6
	local nRank = self:GetRank()
	if nRank <= 0 or nRank > 6 then
		return
	end
	local nExp = self.tbRank[nRank]	
	if not nExp then
		return
	end
	local nExpAward = nExp
	if (nExp + nTskExp) > self.nMaxExp then
		nExpAward = self.nMaxExp - nTskExp
	end
	PlayerFunLib:AddTaskDaily(self.nTSK_Daily_Award_Count, 1)
	SetTask(self.nTSK_Exp, floor((nExpAward + nTskExp)/1e6))
	--print(GetTask(self.nTSK_Exp))
	local tbAward = {szName = "�i�m Kinh Nghi�m", nExp=nExpAward}
	tbAwardTemplet:Give(tbAward, 1, {strLOG_HEAD, "PhanThuongBangHoiTiepNhanTanThu"})
end