Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
tbNoelOnWeb = {
	nStartDate = 201112210000,
	nEndDate = 201201312400,
	nExtPointID = 6,
	tbLog = {"PromotionNoelQuaySoTrenWeb", "NhanThuongTaiLeQuan", {strFolder = "201112_NoelQuaySo/", nPromID = 21, nResult = 1}},
	tbBitTask = {
		nTaskID = 2917,
		nStartBit = 1,
		nBitCount = 12,
		nMaxValue = 2000,
	},
	nMaxExp = 2e9,
	tbAward = {
		[1] = {szName="Ng�a Phi�n V�",tbProp={0,10,7,1,0,0},nCount=1, 
		nBitExtPoint = 1},
		[2] = {szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1, 
		nBitExtPoint = 2},
		[3] = {szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200, 
		nBitExtPoint = 3},
		[4] = {szName = "100 tri�u �i�m kinh nghi�m", nExp=100e6, 
		nBitExtPoint = 4},
		[5] = {szName = "30 tri�u �i�m kinh nghi�m", nExp=30e6, 
		nBitExtPoint = 5},
	},
}

function tbNoelOnWeb:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%S"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function tbNoelOnWeb:AddDialog()
	if not self:IsActive() then
		return
	end
	local pEventType = EventSys:GetType("AddNpcOption")
	nId = pEventType:Reg("L� Quan", "Nh�n th��ng quay s� Vui t�t c�ng V� L�m Truy�n K�", tbNoelOnWeb.Main,{tbNoelOnWeb})
end

function tbNoelOnWeb:Main()
	if not self:IsActive() then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian nh�n th��ng.")
		return
	end
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	local nFlag = 0
	local strTittle = "Ta ph� tr�ch trao ph�n th��ng ch��ng tr�nh quay s� <color=yellow>Vui t�t c�ng V� L�m Truy�n K�<color>. Danh s�ch ph�n th��ng c�a c�c h� nh� sau:\n\n"
	for i = 1, getn(self.tbAward) do
		local tb = self.tbAward[i]
		local nBit = tb.nBitExtPoint
		if tbExtPointLib:GetBitValue(self.nExtPointID, nBit) == 1 then
			nFlag = 1
			strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>\n", tb.szName)
			tbMainDialog:AddOptEntry(format("Nh�n ph�n th��ng %s", tb.szName), tbNoelOnWeb.getAward, {tbNoelOnWeb, i})
		end
	end
	if nFlag == 0 then
		strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>", "Kh�ng c� ph�n th��ng n�o")
	end
	tbMainDialog.szTitleMsg = strTittle	
	tbMainDialog:Show()
end

function tbNoelOnWeb:getAward(nAwardID)
	local tb = self.tbAward[nAwardID]
	if not tb then return end
	local nBit = tb.nBitExtPoint
	if tbExtPointLib:GetBitValue(self.nExtPointID, nBit) ~= 1 then
		Talk(1, "", "C�c h� kh�ng tr�ng ph�n th��ng n�y.")
		return
	end
	if nAwardID == 1 then
		if CountFreeRoomByWH(2, 3, 1) < 1 then
			Talk(1, "", "�� tr�nh m�t m�t t�i s�n, xin h�y ch�a 1 2x3 �  tr�ng trong h�nh trang r�i m�i nh�n th��ng.")
			return
		end
	elseif nAwardID == 2 or nAwardID == 3 then
		if CalcFreeItemCellCount() < 1 then
			Talk(1, "", "�� tr�nh m�t m�t t�i s�n, xin h�y ch�a 1 �  tr�ng trong h�nh trang r�i m�i nh�n th��ng.")
			return
		end
	end
	if tbExtPointLib:SetBitValue(self.nExtPointID, nBit, 0) ~= 1 then
		Talk(1, "", "Nh�n th��ng kh�ng th�nh c�ng, xin h�y li�n h� ban �i�u h�nh c�a tr� ch�i �� ���c gi�i quy�t.")
			return
	end
	if nAwardID == 4 or nAwardID == 5 then
		local nAddExp = tb.nExp
		local nTskExp = tbVNG_BitTask_Lib:getBitTask(self.tbBitTask)*1e6
		if nTskExp + nAddExp > self.nMaxExp then
			nAddExp = self.nMaxExp - nTskExp
			Msg2Player(format("Kinh nghi�m v��t qu� gi�i h�n ch��ng tr�nh, ch� nh�n ���c %d �i�m kinh nghi�m.", nAddExp))			
		end
		tbVNG_BitTask_Lib:addTask(self.tbBitTask, floor(nAddExp/1e6))		
		tb = {nExp = nAddExp}
	end
	tbAwardTemplet:Give(tb, 1, self.tbLog)
end

if tbNoelOnWeb:IsActive() then
	tbNoelOnWeb:AddDialog()
end