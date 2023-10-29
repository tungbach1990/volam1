--H� th�ng ti�p nh�n ��ng k� v� x�p h�ng 10 ng��i level cao nh�t server - Created by DinhHQ - 20110614

Include("\\script\\vng_feature\\top10\\vngglobalvar.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function tbTop10:Init()
	self.tbSubcribers = {}
	self.nRegisterCount = 0
end

function tbTop10:CheckTime()
	local nTime = tonumber(date("%H%M"))
	if (nTime >= 0955 and nTime <=1005) or (nTime >= 0000 and nTime <=0010) then
		return 1
	end
	return 0
end

function tbTop10:CheckDay()
	local nTime = tonumber(date("%Y%m%d"))
	if nTime < 20110707 or nTime > 20110713 then
		return 0
	end
	return 1
end

function tbTop10:IsActive()
	local nTime = tonumber(date("%Y%m%d"))
	if nTime < 20110707 or nTime > 20110717 then
		return 0
	end
	return 1
end

function tbTop10:MainDialog()
	if self.CheckTime() == 1 then
		Talk(1, "", "H� th�ng �ang ti�n h�nh x�p h�ng, xin h�y quay l�i sau.")
		return
	end
	local tbOpt = {}
	local pEventType = EventSys:GetType("AddNpcOption")
	if self.CheckDay() == 1 then
		tinsert(tbOpt, {"Ta mu�n ��ng k�", tbTop10.Regist, {tbTop10}})
		tinsert(tbOpt, {"Ta mu�n c�p nh�t th�ng tin", tbTop10.UpdateInfo, {tbTop10}})
	end	
	tinsert(tbOpt, {"Xem danh s�ch Th�p ��i Cao Th�", tbTop10.ShowTopList, {tbTop10}})
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx("Ta ph� tr�ch vi�c ti�p nh�n ��ng k� th�p ��i cao th�, ng��i c� mu�n ��ng k� kh�ng?", tbOpt)
end

--=======================Subcribers===========================

function tbTop10:Regist()
	if self.CheckDay() == 0 then
		Talk(1, "", "�� h�t h�n ��ng k�.")
		return
	end
	if self.CheckTime() == 1 then
		Talk(1, "", "H� th�ng �ang ti�n h�nh x�p h�ng, xin h�y quay l�i sau.")
		return
	end
	
	if not self.tbSubcribers then
		self:Init()
	end
	local nTransLifeCount = ST_GetTransLifeCount()
	if nTransLifeCount < 3 then
		Talk(1, "", "M�c �� tu luy�n c�a ng��i ch�a ��, h�y quay v� r�n luy�n th�m �i.")
		return
	end
	local strName = GetName()
	if self.tbSubcribers[strName] then
		Talk(1, "", "Ng��i �� ��ng k� r�i, kh�ng c�n ��ng k� n�a. Xin h�y c�p nh�t th�ng tin.")
		return
	end
	self.tbSubcribers[strName] = {}
	local tbSubcriber = self.tbSubcribers[strName]
	for i = 1, nTransLifeCount do
		local nlevel, _ = zhuansheng_get_gre(i);
		tinsert(tbSubcriber, nlevel)		
	end
	--level hi�n t�i
	tinsert(tbSubcriber, GetLevel())
	--kinh nghi�m hi�n t�i
	tinsert(tbSubcriber, GetExp()/1e9)
	tinsert(tbSubcriber, GetExpPercent())
	if self:Subcribers2File() == 1 then
		Say("��ng k� th�nh c�ng, xin h�y ki�m tra l�i danh s�ch.", 1, "��ng/OnCancel")
	end
end

function tbTop10:UpdateInfo()
	if self.CheckDay() == 0 then
		Talk(1, "", "�� h�t h�n c�p nh�t th�ng tin.")
		return
	end
	if self.CheckTime() == 1 then
		Talk(1, "", "H� th�ng �ang ti�n h�nh x�p h�ng, xin h�y quay l�i sau.")
		return
	end
	
	if not self.tbSubcribers then
		self:Init()
	end
	local strName = GetName()
	if (not self.tbSubcribers[strName]) then
		Talk(1, "", "Ng��i v�n ch�a ��ng k�, kh�ng th� c�p nh�t th�ng tin.")
		return
	end
	
	--M�i ng�y ch� ���c c�p nh�t 1 l�n
	local nTaskDayCount = PlayerFunLib:GetTaskDailyCount(self.nTaskDayLimit)
	if nTaskDayCount == 1 then
		Talk(1, "", "M�i ng�y ch� ���c c�p nh�t th�ng tin 1 l�n, ng�y mai r�i h�y quay l�i.")
		return
	end
	
	local nTransLifeCount = ST_GetTransLifeCount()
	if nTransLifeCount < 3 then
		Talk(1, "", "M�c �� tu luy�n c�a ng��i ch�a ��, h�y quay v� r�n luy�n th�m �i.")
		return
	end
		
	local tbSubcriber = self.tbSubcribers[strName]

	--level hi�n t�i
	tbSubcriber[self.nCUR_LVL] = GetLevel()
	--kinh nghi�m hi�n t�i
	tbSubcriber[self.nCUR_EXP] = GetExp()/1e9
	tbSubcriber[self.nCUR_EXP_PERCENT] = GetExpPercent()
	if self:Subcribers2File() == 1 then
		PlayerFunLib:AddTaskDaily(self.nTaskDayLimit, 1)
		Say("C�p nh�t th�ng tin th�nh c�ng, xin h�y ki�m tra l�i danh s�ch.", 1, "��ng/OnCancel")
	end
end

function tbTop10:Subcribers2File()
	local tbTemp = {}
	tinsert(tbTemp, self.tbFileHeader)
	for key, val in self.tbSubcribers do
		tinsert(tbTemp, {key, val[self.nST1_LVL], val[self.nST2_LVL], val[self.nST3_LVL], val[self.nCUR_LVL], val[self.nCUR_EXP], val[self.nCUR_EXP_PERCENT]})
	end
	tbVngLib_File:Table2File(self.strFilePath, self.strFileName, "w", tbTemp)	
	return 1
end

--=======================End Subcribers===========================

function OnCancel()
end

function tbTop10:ShowList()	
	if not self.tbSubcribers then
		CreateNewSayEx("Hi�n ch�a c� danh s�ch ��ng k�",{{"��ng",OnCancel}})
		return
	end
	
	local nCounter = 0
	local strTittle = format("%-6s%-16s%-6s%-6s%-6s%s\n", "STT", "T�n", "TS1", "TS2", "TS3", "Hi�n t�i")
	for key, val in self.tbSubcribers do
		nCounter = nCounter + 1
		strTittle = strTittle..format("<color=yellow>%-6d%-16s%-6d%-6d%-6d%d<color>\n", nCounter, key, val[1], val[2], val[3], val[4])
	end
	CreateNewSayEx(strTittle,{{"��ng",OnCancel}})
end

--=======================Top list===========================

function tbTop10:ShowTopList()
	if self.CheckTime() == 1 then
		Talk(1, "", "H� th�ng �ang ti�n h�nh x�p h�ng, xin h�y quay l�i sau.")
		return
	end
	if not self.tbTopList or getn(self.tbTopList) <= 0 then
		CreateNewSayEx("Hi�n t�i ch�a c� b�ng x�p h�ng",{{"��ng",OnCancel}})
		return
	end
	local strTittle = format("%-13s%s\n%s <color=red>%s<color>\n\n", "", "Danh s�ch Th�p ��i Cao Th�", "\t\t\t\t\t\tTh�i gian t�ng k�t:", self.tbTopList[1][5])
	strTittle = strTittle..format("%-5s%-17s%-12s%-10s%-8s\n", "H�ng", "T�n", "Tr�ng Sinh", "Hi�n T�i", "Exp(T�)")
	local strTittle_TS = ""
	local strName = ""
	local strCurLVL = ""
	for nRank = 1, getn(self.tbTopList) do
		strName = self.tbTopList[nRank][1]		
		local tbPlayer = self.tbSubcribers[strName]
		strTittle_TS = format("%d/%d/%d", tbPlayer[self.nST1_LVL], tbPlayer[self.nST2_LVL], tbPlayer[self.nST3_LVL])
		strCurLVL = format("%d(%d", self.tbTopList[nRank][2], self.tbTopList[nRank][3]).."%)"
		if strName == GetName() then
			strTittle = strTittle..format("<color=cyan>%-5s%-17s%-12s%-10s%-8.04f<color>\n", nRank, strName, strTittle_TS, strCurLVL,self.tbTopList[nRank][4])
		else
			strTittle = strTittle..format("<color=yellow>%-5s%-17s%-12s%-10s%-8.04f<color>\n", nRank, strName, strTittle_TS, strCurLVL,self.tbTopList[nRank][4])
		end
	end
	CreateNewSayEx(strTittle,{{"��ng",OnCancel}})
end

--H�m s�p x�p danh s�ch ��ng k� theo exp �� t�m 10 ng��i c� exp cao nh�t
--L�u danh s�ch 10 cao th� v�o file d� ph�ng
function tbTop10:UpdateTopList()
	nLamAnMapID = SubWorldID2Idx(176)
	if nLamAnMapID < 0 then
		print("\nMap Lam An khong co tren server nay")
		return
	end
	self.tbTopList = {}
	local tbTemp = {}
	local nExp = 0
	local strTime = GetLocalDate("%Y-%m-%d_%H:%M:%S")
	--t�o table l�u t�m d� li�u cho vi�c s�p x�p
	for key, val in self.tbSubcribers do
		nExp = ((val[self.nST1_LVL] - 160) * 2 + 18.5667721) + ((val[self.nST2_LVL] - 170) * 4 + 72.3667721) + ((val[self.nST3_LVL] - 180) * 8 + 221.9667721) + (self.tbCurLvl_Exp[val[self.nCUR_LVL]]) + val[self.nCUR_EXP]
		tinsert(tbTemp, {key, val[self.nCUR_LVL], val[self.nCUR_EXP_PERCENT], nExp, strTime})
	end
	--s�p x�p table t�m theo th� t� gi�m d�n d�a v�o s� exp t�ng
	sort(tbTemp, function (a, b) return(a[4] > b[4]) end)
	--Ch�n 10 ng��i c� exp t�ng cao nh�t �� ��a v�o danh s�ch toplist d�ng cho vi�c l�u v�o file ho�c hi�n th� t�i npc
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
	local tb = tbVngLib_File:TableFromFile(tbTop10.strFilePath, tbTop10.strTopListFileName, {"*w", "*n", "*n", "*n", "*w"})
	if not tb then
		tbTop10.tbTopList = nil
		return
	end
	for i = 1, getn(tb) do
		self.tbTopList[i] = tb[i]
	end
end

--=======================Top list===========================
--Load danh s�ch ��ng k� v� top 10 v�o table
function LoadFromFile()
	--load danh s�ch ��ng k�
	if not tbTop10.tbSubcribers then
		tbTop10.tbSubcribers = {}
	end
	local tb = tbVngLib_File:TableFromFile(tbTop10.strFilePath, tbTop10.strFileName, {"*w", "*n", "*n", "*n", "*n", "*n", "*n"})
	if not tb then
		tbTop10.tbSubcribers = nil
		return
	end
	local nLength = 0
	for i = 1, getn(tb) do		
		if tb[i][1] then
			nLength = nLength + 1
			tbTop10.tbSubcribers[tb[i][1]] = {tb[i][2], tb[i][3], tb[i][4], tb[i][5], tb[i][6], tb[i][7]}			
		end
	end
	
	tbTop10.nRegisterCount = nLength
	--load top list
	tbTop10:TopListFromFile()
end
if tbTop10:IsActive() == 1 then
	local a = AutoFunctions:Add(LoadFromFile)
end