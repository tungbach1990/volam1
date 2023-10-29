--promotion quay s� th�ng 8 - Created by DinhHQ - 20120821
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbQuocKhanh2012 = 
{
	nStartDate = 201208230000,
	nEndDate = 201209262400,
	tbPrizeList = {	
		[2] = {szName="B� trang b� B�ch H� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={11,0,0,0,0,0},},	
		[3] = {
			[1] = {szName="Phi phong Ng� Phong (D�ch chuy�n t�c th�i )",tbProp={0,3473},nCount=1,nQuality = 1,nExpiredTime=259200,},
			[2] = {szName="Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=259200,},
			[3] = {szName="Phi phong Ng� Phong (Tr�ng k�ch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=259200,},
			szName = "Phi Phong Ng� Phong",
		},
		[4] = {szName="B�ch H� Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}},
		[5] = {szName="�� Ph� B�ch H� V� Kh�",tbProp={6,1,3182,1,0,0},nCount=8,nExpiredTime=259200},
		[6] = {szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200},
		[7] = {szName="B�ch H� Th�n Th�ch",tbProp={6,1,3186,1,0,0},nCount=1},		
	},
	tbFreeCellReq = {
		[2] = 1,
		[3] = 1,
		[4] = 1,
		[5] = 8,
		[6] = 1,
		[7] = 1,
	},
	tbBitExpoint = {
		[2] = {nExtPointID = 5, nBit = 1},
		[3] = {nExtPointID = 5, nBit = 2},
		[4] = {nExtPointID = 5, nBit = 3},
		[5] = {nExtPointID = 5, nBit = 4},
		[6] = {nExtPointID = 5, nBit = 5},
		[7] = {nExtPointID = 5, nBit = 6},
	},
	nPrize8ExtID = 6,	
}

function tbQuocKhanh2012:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%M"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function tbQuocKhanh2012:CheckTime2Get8thPrize()
	local nCurHour = tonumber(date("%H"))
	if nCurHour < 5 and nCurHour >= 3 then
		return nil
	end
	return 1
end

function tbQuocKhanh2012:AddDialog()
	if not self:IsActive() then
		return
	end
	local pEventType = EventSys:GetType("AddNpcOption")
	nId = pEventType:Reg("L� Quan", "Nh�n ph�n th��ng Quay s� [B�t M�ch Ch�n Kinh - Rinh ngay qu� kh�ng]", tbQuocKhanh2012.main,{tbQuocKhanh2012})
end

function tbQuocKhanh2012:main()
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
	local strTittle = "Ta ph� tr�ch trao ph�n th��ng ch��ng tr�nh quay s� <color=yellow>[B�t M�ch Ch�n Kinh - Rinh ngay qu� kh�ng]<color>. Danh s�ch ph�n th��ng c�a c�c h� nh� sau:\n\n"
	for i = 2, 7 do
		local tbBitExtPoint = self.tbBitExpoint[i]
		if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) == 1 then
			nFlag = 1
			strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>\n", self.tbPrizeList[i].szName)
			tbMainDialog:AddOptEntry(format("Nh�n ph�n th��ng gi�i %d", i), tbQuocKhanh2012.getAward, {tbQuocKhanh2012, i})
		end
	end
	if self:CheckTime2Get8thPrize() and GetExtPoint(self.nPrize8ExtID) > 0 then
		nFlag = 1
		tbMainDialog:AddOptEntry(format("Nh�n ph�n th��ng gi�i %d", 8), tbQuocKhanh2012.get8thPrize, {tbQuocKhanh2012})
	end
	if nFlag == 0 then
		strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>", "Kh�ng c� ph�n th��ng n�o")
	end
	tbMainDialog.szTitleMsg = strTittle	
	tbMainDialog:Show()
end

function tbQuocKhanh2012:getAward(nAwardID)
	local tbBitExtPoint = self.tbBitExpoint[nAwardID]
	if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) ~= 1 then
		Talk(1, "", "C�c h� kh�ng tr�ng ph�n th��ng n�y.")
		return
	end
	if nAwardID == 3 then
		self:get3rdPrize()	
	else	
		local nFreeCell = self.tbFreeCellReq[nAwardID]
		if CalcFreeItemCellCount() < nFreeCell then
			Talk(1, "", format("�� tr�nh m�t m�t t�i s�n, xin h�y ch�a %d �  tr�ng trong h�nh trang r�i m�i nh�n th��ng.", nFreeCell))
			return
		end
		if tbExtPointLib:SetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit, 0) ~= 1 then
			Talk(1, "", "Nh�n th��ng kh�ng th�nh c�ng, xin h�y li�n h� ban �i�u h�nh c�a tr� ch�i �� ���c gi�i quy�t.")
				return
		end
		local tbTmpAward = self.tbPrizeList[nAwardID]
		tbAwardTemplet:Give(tbTmpAward, 1, {"QuaySoMungQuocKhanh", "NhanPhanThuongGiai"..nAwardID})
	end
end

function tbQuocKhanh2012:get3rdPrize()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	local tb3rdAward = self.tbPrizeList[3]
	for i = 1, getn(tb3rdAward) do
		tbMainDialog:AddOptEntry(format("Ta ch�n %s", tb3rdAward[i].szName), tbQuocKhanh2012.get3rdPrizeStep2, {tbQuocKhanh2012, i})
	end
	tbMainDialog.szTitleMsg = "Xin h�y ch�n ph�n th��ng:"	
	tbMainDialog:Show()
end

function tbQuocKhanh2012:get3rdPrizeStep2(nIndex)
	if nIndex < 1 or nIndex > 3 then
		return
	end
	local tbBitExtPoint = self.tbBitExpoint[3]
	if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) ~= 1 then
		Talk(1, "", "C�c h� kh�ng tr�ng ph�n th��ng n�y.")
		return
	end
	local nFreeCell = self.tbFreeCellReq[3]
	if CalcFreeItemCellCount() < nFreeCell then
		Talk(1, "", format("�� tr�nh m�t m�t t�i s�n, xin h�y ch�a %d �  tr�ng trong h�nh trang r�i m�i nh�n th��ng.", nFreeCell))
		return
	end
	if tbExtPointLib:SetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit, 0) ~= 1 then
		Talk(1, "", "Nh�n th��ng kh�ng th�nh c�ng, xin h�y li�n h� ban �i�u h�nh c�a tr� ch�i �� ���c gi�i quy�t.")
			return
	end
		local tbTmpAward = self.tbPrizeList[3][nIndex]
		tbAwardTemplet:Give(tbTmpAward, 1, {"QuaySoMungQuocKhanh", "NhanPhanThuongGiai3"})
end

function tbQuocKhanh2012:get8thPrize()	
	if self:CheckTime2Get8thPrize() ~= 1 then
		return
	end
	local nAwardCount = GetExtPoint(self.nPrize8ExtID)
	if nAwardCount <= 0 then
		return
	end
	if nAwardCount > 60 then
		nAwardCount = 60	
	end
	if CalcFreeItemCellCount() < nAwardCount then
		Talk(1, "", format("�� tr�nh m�t m�t t�i s�n, xin h�y ch�a %d �  tr�ng trong h�nh trang r�i m�i nh�n th��ng.", nAwardCount))
		return
	end
	if PayExtPoint(self.nPrize8ExtID, nAwardCount) ~= 1 then
		return
	end
	local tbTmpAward = {szName="T�i M�ng Qu�c Kh�nh",tbProp={6,1,30241,1,0,0},nCount=nAwardCount,nExpiredTime=43200}
	tbAwardTemplet:Give(tbTmpAward, 1, {"QuaySoMungQuocKhanh", "NhanPhanThuongGiai8"})
end

if tbQuocKhanh2012:IsActive() then
	tbQuocKhanh2012:AddDialog()
end