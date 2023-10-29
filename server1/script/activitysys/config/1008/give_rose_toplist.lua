Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\global\\autoexec_head.lua")
tbTop10 = {}
tbTop10.tbSubcribers = {}
tbTop10.tbTopList = {}
tbTop10.tbAwardCheck = {0,0,0}
tbTop10.nIDX_Account = 1
tbTop10.nIDX_TotalCount = 2
tbTop10.nIDX_LastUpdate = 3
tbTop10.tbFileHeader = {"Name", "Account", "S� l��ng", "L�n n�p cu�i"}
tbTop10.tbTopListFileHeader = {"Name", "Account", "S� l��ng", "L�n n�p cu�i"}
tbTop10.tbSubcribersPattern = {"*w", "*w", "*n", "*w"}
tbTop10.tbToplistPattern = {"*w", "*w", "*n", "*w"}
tbTop10.strFilePath = "vng_data/event_thang2_top10/"
tbTop10.strFileName = "subcribers.txt"
tbTop10.strTopListFileName = "toplist.txt"
tbTop10.nRegisterCount = 0
tbTop10.nSort_Time = 0005
tbTop10.tbPhase = {
	[1] = {201202020000, 201202282400}, --n�p hoa
	[2] = {201202290900, 201202292400}, --nh�n th��ng
}
tbTop10.nStartDate = 201202020000
tbTop10.nEndDate = 201202292400

function tbTop10:Init()
	self.tbSubcribers = {}
	self.nRegisterCount = 0
end

function tbTop10:CheckTime()
	local nTime = tonumber(date("%H%M"))
	if (nTime >= 0000 and nTime <= 0020) then
		return 1
	end
	return 0
end

function tbTop10:GetPhase()
	local nTime = tonumber(date("%Y%m%d%H%M"))
	for i = 1, getn(self.tbPhase) do
		if nTime >= self.tbPhase[i][1] and nTime <= self.tbPhase[i][2] then
			return i
		end
	end
	return 0
end

function tbTop10:IsActive()
	local nTime = tonumber(date("%Y%m%d%H%M"))
	if nTime < self.nStartDate or nTime > self.nEndDate then
		return 0
	end
	return 1
end

function tbTop10:GiveRose(strName, strAccount, nCount)
	local nPhase = self:GetPhase()
	if nPhase ~= 1 then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian n�p v�t ph�m.")
		return
	end
	if self:CheckTime() == 1 then
		Talk(1, "", "H� th�ng �ang ti�n h�nh x�p h�ng, xin h�y quay l�i sau.")
		return
	end
	
	if not self.tbSubcribers then
		self:Init()
	end
	local strTime = GetLocalDate("%Y-%m-%d_%H:%M:%S")
	self.tbSubcribers[strName] = {strAccount, nCount,strTime}
		
	if self:Subcribers2File() == 1 then
		Say("N�p th�nh c�ng Hoa H�ng", 1, "��ng/OnCancel")
	end
end

function tbTop10:Subcribers2File()
	local tbTemp = {}
	tinsert(tbTemp, self.tbFileHeader)
	for key, val in self.tbSubcribers do
		tinsert(tbTemp, {key, val[self.nIDX_Account], val[self.nIDX_TotalCount], val[self.nIDX_LastUpdate]})
	end
	tbVngLib_File:Table2File(self.strFilePath, self.strFileName, "w", tbTemp)	
	return 1
end

--Load danh s�ch ��ng k� v� top 10 v�o table
function LoadFromFile()
	--load danh s�ch ��ng k�
	if not tbTop10.tbSubcribers then
		tbTop10.tbSubcribers = {}
	end
	local tb = tbVngLib_File:TableFromFile(tbTop10.strFilePath, tbTop10.strFileName, tbTop10.tbSubcribersPattern)
	if not tb then
		tbTop10.tbSubcribers = nil
		return
	end
	local nLength = 0
	for i = 1, getn(tb) do		
		if tb[i][1] then
			nLength = nLength + 1
			tbTop10.tbSubcribers[tb[i][1]] = {tb[i][2], tb[i][3], tb[i][4]}			
		end
	end
	
	tbTop10.nRegisterCount = nLength
	--load top list
	tbTop10:TopListFromFile()
	
	--danh s�ch ��nh d�u ph�n th��ng �� ���c nh�n	
	local tb = tbVngLib_File:TableFromFile(tbTop10.strFilePath, "rankawarded.txt", {"*n", "*n", "*n"})	
	if not tb then
		tbTop10.tbAwardCheck = {0,0,0}
	else
		tbTop10.tbAwardCheck = tb[1]
	end	
end

function test()
	for key,val in tbTop10.tbSubcribers do
		print(key.."   "..val[1].."   "..val[2])
	end
end
----=========top list==============-----
function tbTop10:UpdateTopList()
	nLamAnMapID = SubWorldID2Idx(176)
	if nLamAnMapID < 0 then		
		return
	end
	self.tbTopList = {}
	local tbTemp = {}	
	--t�o table l�u t�m d� li�u cho vi�c s�p x�p	
	for key, val in self.tbSubcribers do		
		tinsert(tbTemp, {key, val[self.nIDX_Account], val[self.nIDX_TotalCount], val[self.nIDX_LastUpdate]})
	end
	--s�p x�p table t�m theo th� t� gi�m d�n d�a v�o s� l��ng v�t ph�m �� n�p
	sort(tbTemp, function (a, b) return(a[3] > b[3]) end)
	--Ch�n 10 ng��i c� s� l��ng cao nh�t �� ��a v�o danh s�ch toplist d�ng cho vi�c l�u v�o file ho�c hi�n th� t�i npc
	local nCount = 0
 	if getn(tbTemp) > 10 then
 		nCount = 10
 	else
 		nCount = getn(tbTemp)
 	end
	for i = 1, nCount do
		self.tbTopList[i] = tbTemp[i]
	end
	--save top list v�o file
	self:TopList2File()
end
function tbTop10:TopList2File()
	local tbTemp = {}
	--insert header c�a file
	tinsert(tbTemp, self.tbTopListFileHeader)
	for key, val in self.tbTopList do
		tinsert(tbTemp, val)
	end
	tbVngLib_File:Table2File(self.strFilePath, self.strTopListFileName, "w", tbTemp)	
	return 1
end

function tbTop10:TopListFromFile()
	if not self.tbTopList then
		self.tbTopList = {}
	end
	local tb = tbVngLib_File:TableFromFile(tbTop10.strFilePath, tbTop10.strTopListFileName, self.tbToplistPattern)
	if not tb then
		tbTop10.tbTopList = nil
		return
	end
	for i = 1, getn(tb) do
		self.tbTopList[i] = tb[i]
	end
end

function tbTop10:ShowTopList()
	if self:CheckTime() == 1 then
		Talk(1, "", "H� th�ng �ang ti�n h�nh x�p h�ng, xin h�y quay l�i sau.")
		return
	end
	if not self.tbTopList or getn(self.tbTopList) <= 0 then
		CreateNewSayEx("Hi�n t�i ch�a c� b�ng x�p h�ng",{{"��ng",OnCancel}})
		return
	end
	--local strTittle = format("%-13s%s\n%s <color=red>%s<color>\n\n", "", "Danh s�ch 10 ng��i c� s� l��ng n�p nhi�u nh�t", "\t\t\t\t\t\tTh�i gian t�ng k�t:", self.tbTopList[1][4])
	local strTittle = "Danh s�ch 10 ng��i c� s� l��ng n�p nhi�u nh�t\n"
	strTittle = strTittle..format("%-5s%-17s%-12s\n", "T�n", "S� l��ng n�p", "L�n n�p g�n nh�t")	
	for nRank = 1, getn(self.tbTopList) do
		strName = self.tbTopList[nRank][1]			
		local strTotalCount  = self.tbTopList[nRank][3]	
		local strLastUpdate = self.tbTopList[nRank][4]	
		if strName == GetName() then
			strTittle = strTittle..format("<color=cyan>%-5s%-17s%-12s<color>\n", nRank, strName, strTotalCount, strLastUpdate)
		else
			strTittle = strTittle..format("<color=yellow>%-5s%-17s%-12s<color>\n", nRank, strName, strTotalCount, strLastUpdate)
		end
	end
	CreateNewSayEx(strTittle,{{"��ng",OnCancel}})
end
--end top list
function tbTop10:GetCurRank(strName, strAccount)
	local j = 3
	if getn(self.tbTopList) < 3 then
		j = getn(self.tbTopList)
	end
	for i =1, j do
		local name = self.tbTopList[i][1]
		local acc = self.tbTopList[i][2]
		if strName == name and strAccount == acc then
			return i
		end
	end
	return -1
end

function tbTop10:GiveAward(nRank)
	if not self.tbAwardCheck then
		self.tbAwardCheck = {0,0,0}
	end
	self.tbAwardCheck[nRank] = 1
	local tbTemp = {}
	--insert header c�a file
	tinsert(tbTemp, {"Ph�n th��ng h�ng 1","Ph�n th��ng h�ng 2","Ph�n th��ng h�ng 3"})
	tinsert(tbTemp, self.tbAwardCheck)		
	tbVngLib_File:Table2File(self.strFilePath, "rankawarded.txt", "w", tbTemp)	
end

function tbTop10:CheckCanGetAward(nRank)
	if not self.tbAwardCheck or not self.tbAwardCheck[nRank] or self.tbAwardCheck[nRank] == 1 then
		return 1
	end
	return 0
end

if tbTop10:IsActive() == 1 then
	local a = AutoFunctions:Add(LoadFromFile)
end