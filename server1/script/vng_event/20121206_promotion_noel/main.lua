--promotion Noel - Created by DinhHQ - 20121206
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbPromotionAward = 
{
	nStartDate = 201212170000,
	nEndDate = 201301162400,
	strPromotionName = "V�n Kh� ��ng Phong - Th�n Long Ban Ph�c",
	strLogTittle = "QuaySoNoel",
	tbPrizeList = {	
		[1] = 
		{
			strSubProm = "Quay s� tr�ng th��ng",
			tbAward = 
			{
				[1] = nil,
				[2] = {szName="Huy�t Long ��ng c�p 5",tbProp={6,1,30289,5,0,0},nCount=5,},
				[3] = {szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200},
				[4] = {szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=10000},
				[5] = {szName="B�ch H� Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}},
				[6] = {szName="B� trang b� B�ch H� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={11,0,0,0,0,0}},
				[7] = 
				{
					szName = "Phi Phong C�p 6 (ch�n 1 trong 3 lo�i)",
					bSelectiveAward = 1,
					[1] = {szName="Phi phong Ng� Phong (D�ch chuy�n t�c th�i )",tbProp={0,3473},nCount=1,nQuality = 1,nExpiredTime=259200,},
					[2] = {szName="Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=259200,},
					[3] = {szName="Phi phong Ng� Phong (Tr�ng k�ch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=259200,},
				},
				[8] = 
				{
					szName = "Phi Phong C�p 7 (ch�n 1 trong 3 lo�i)",
					bSelectiveAward = 1,
					[1] = {szName="Phi phong Ph� Quang (D�ch chuy�n t�c th�i )",tbProp={0,3476},nCount=1,nQuality = 1,nExpiredTime=259200,},
					[2] = {szName="Phi phong Ph� Quang (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3477},nCount=1,nQuality = 1,nExpiredTime=259200,},
					[3] = {szName="Phi phong Ph� Quang (Tr�ng k�ch)",tbProp={0,3478},nCount=1,nQuality = 1,nExpiredTime=259200,},
				},
			},
		},
		[2] =
		{
			strSubProm = "T�ch l�y ��i qu�",
			tbAward = 
			{
				[1] = {szName="Gia H�n Ph�",tbProp={6,1,30225,1,0,0},nCount=1},
				[2] = {szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200},
				[3] = {szName="H�n nguy�n ch�n ��n",tbProp={6,1,30301,1,0,0},nCount=1},
				[4] = {szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=129600},
				[5] = {szName="B�ch H� Kh� Gi�i (Max Option) - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={29,0,0,0,0,0}},
				[6] = 
				{
					szName = "Phi Phong C�p 7 (ch�n 1 trong 3 lo�i)",
					bSelectiveAward = 1,
					[1] = {szName="Phi phong Ph� Quang (D�ch chuy�n t�c th�i )",tbProp={0,3476},nCount=1,nQuality = 1,nExpiredTime=129600,},
					[2] = {szName="Phi phong Ph� Quang (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3477},nCount=1,nQuality = 1,nExpiredTime=129600,},
					[3] = {szName="Phi phong Ph� Quang (Tr�ng k�ch)",tbProp={0,3478},nCount=1,nQuality = 1,nExpiredTime=129600,},
				},
			},
		},
		[3] =
		{
			strSubProm = "Mua qu� gi� r�",
			tbAward = 
			{
				[1] = {szName="Qu� Ho�ng Kim (100)",tbProp={6,1,30095,1,0,0},nCount=1},
				[2] = {szName="B� trang b� B�ch H� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={11,0,0,0,0,0}},
				[3] = 
				{
					szName = "Phi Phong C�p 6 (ch�n 1 trong 3 lo�i)",
					bSelectiveAward = 1,
					[1] = {szName="Phi phong Ng� Phong (D�ch chuy�n t�c th�i )",tbProp={0,3473},nCount=1,nQuality = 1,nExpiredTime=259200,},
					[2] = {szName="Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=259200,},
					[3] = {szName="Phi phong Ng� Phong (Tr�ng k�ch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=259200,},
				},
				[4] ={szName="X�ch Long C�u",tbProp={0,10,9,1,0,0},nCount=1},
				[5] = 
				{
					szName = "Phi Phong C�p 7 (ch�n 1 trong 3 lo�i)",
					bSelectiveAward = 1,
					[1] = {szName="Phi phong Ph� Quang (D�ch chuy�n t�c th�i )",tbProp={0,3476},nCount=1,nQuality = 1,nExpiredTime=129600,},
					[2] = {szName="Phi phong Ph� Quang (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3477},nCount=1,nQuality = 1,nExpiredTime=129600,},
					[3] = {szName="Phi phong Ph� Quang (Tr�ng k�ch)",tbProp={0,3478},nCount=1,nQuality = 1,nExpiredTime=129600,},
				},
			},
		},		
	},
	tbFreeCellReq = {
		[1] =
		{
			[2] = 1,
			[3] = 1,
			[4] = 20,
			[5] = 1,
			[6] = 1,
			[7] = 1,
			[8] = 1,
		},
		[2] ={
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 1,
			[5] = 1,
			[6] = 1,
		},
		[3] ={
			[1] = 1,
			[2] = 1,
			[3] = 1,
			[4] = 60,
			[5] = 1,
		},	
	},
	tbBitExpoint = {
		[1] =
		{
			[2] = {nExtPointID = 4, nBit = 2},
			[3] = {nExtPointID = 4, nBit = 3},
			[4] = {nExtPointID = 4, nBit = 4},
			[5] = {nExtPointID = 4, nBit = 5},
			[6] = {nExtPointID = 4, nBit = 6},
			[7] = {nExtPointID = 4, nBit = 7},
			[8] = {nExtPointID = 4, nBit = 8},
		},
		[2] ={
			[1] = {nExtPointID = 4, nBit = 9},
			[2] = {nExtPointID = 4, nBit = 12},
			[3] = {nExtPointID = 4, nBit = 14},
			[4] = {nExtPointID = 5, nBit = 4},
			[5] = {nExtPointID = 5, nBit = 5},
			[6] = {nExtPointID = 5, nBit = 6},
		},
		[3] ={
			[1] = {nExtPointID = 5, nBit = 7},
			[2] = {nExtPointID = 5, nBit = 11},
			[3] = {nExtPointID = 5, nBit = 12},
			[4] = {nExtPointID = 5, nBit = 14},
			[5] = {nExtPointID = 5, nBit = 15},
		},			
	},
	nExtPoint_Xmas_Box_Count = 6
}

function tbPromotionAward:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%M"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function tbPromotionAward:AddDialog()
	if not self:IsActive() then
		return
	end
	local pEventType = EventSys:GetType("AddNpcOption")
	nId = pEventType:Reg("Chi�n T�m T�n Gi�", "V�n Kh� ��ng Phong - Th�n Long Ban Ph�c", tbPromotionAward.main,{tbPromotionAward})
end

function tbPromotionAward:main()
	if not self:IsActive() then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian di�n ra ch��ng tr�nh.")
		return
	end
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)	
	tbMainDialog:AddOptEntry(format("Nh�n ph�n th��ng %s", self.tbPrizeList[1].strSubProm), tbPromotionAward.SelectAward, {tbPromotionAward, 1})
	tbMainDialog:AddOptEntry(format("Nh�n ph�n th��ng %s", self.tbPrizeList[2].strSubProm), tbPromotionAward.SelectAward, {tbPromotionAward, 2})
	tbMainDialog:AddOptEntry(format("Nh�n ph�n th��ng %s", self.tbPrizeList[3].strSubProm), tbPromotionAward.SelectAward, {tbPromotionAward, 3})
	tbMainDialog.szTitleMsg = format("Ta ph� tr�ch trao ph�n th��ng ch��ng tr�nh <color=yellow>%s<color>, xin h�i v� ��i hi�p ��y c�n g�?", self.strPromotionName)
	tbMainDialog:Show()
end

function tbPromotionAward:SelectAward(nSubProm)
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	local nFlag = 0
	local strTittle = "Danh s�ch ph�n th��ng c�a c�c h� nh� sau:\n\n"	
	for i = 1, getn(self.tbBitExpoint[nSubProm]) do
		if self.tbBitExpoint[nSubProm][i] then
			local tbBitExtPoint = self.tbBitExpoint[nSubProm][i]
			if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) == 1 then
				nFlag = 1
				strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>\n", self.tbPrizeList[nSubProm].tbAward[i].szName)
				tbMainDialog:AddOptEntry(format("Nh�n ph�n th��ng %s", self.tbPrizeList[nSubProm].tbAward[i].szName), tbPromotionAward.getAward, {tbPromotionAward, nSubProm, i})
			end
		end
	end	
	if nSubProm == 1 and self:CheckTimeGetXmasBox() == 1 and GetExtPoint(self.nExtPoint_Xmas_Box_Count) > 0 then
		nFlag = 1
		tbMainDialog:AddOptEntry(format("Nh�n ph�n th��ng %s", "H�p Qu� Gi�ng Sinh"), tbPromotionAward.GetXmasBoxDialog, {tbPromotionAward})
	end
	if nFlag == 0 then
		strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>", "Kh�ng c� ph�n th��ng n�o")
	end
	tbMainDialog.szTitleMsg = strTittle	
	tbMainDialog:Show()
end

function tbPromotionAward:getAward(nSubProm, nAwardID)
	if nSubProm == 1 and nAwardID == 1 then		
		return
	end
	if not self:IsActive() then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian nh�n th��ng.")
		return
	end
	local tbTmpAward = self.tbPrizeList[nSubProm].tbAward[nAwardID]
	if tbTmpAward.bSelectiveAward and tbTmpAward.bSelectiveAward == 1 then
		self:PickAward(nSubProm, nAwardID)
		return
	end
	
	local tbBitExtPoint = self.tbBitExpoint[nSubProm][nAwardID]
	if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) ~= 1 then
		Talk(1, "", "C�c h� kh�ng tr�ng ph�n th��ng n�y.")
		return
	end	
	local nFreeCell = self.tbFreeCellReq[nSubProm][nAwardID]
	if CalcFreeItemCellCount() < nFreeCell then
		Talk(1, "", format("�� tr�nh m�t m�t t�i s�n, xin h�y ch�a %d �  tr�ng trong h�nh trang r�i m�i nh�n th��ng.", nFreeCell))
		return
	end
	if tbExtPointLib:SetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit, 0) ~= 1 then
		Talk(1, "", "Nh�n th��ng kh�ng th�nh c�ng, xin h�y li�n h� ban �i�u h�nh c�a tr� ch�i �� ���c gi�i quy�t.")
			return
	end	
	tbAwardTemplet:Give(tbTmpAward, 1, {strLogTittle, "NhanPhanThuongGiai["..nSubProm.."]["..nAwardID.."]"})	
end

function tbPromotionAward:CheckTimeGetXmasBox()
	local nCurHour = tonumber(date("%H"))
	if nCurHour < 5 and nCurHour >= 3 then
		return nil
	end
	return 1
end

function tbPromotionAward:GetXmasBoxDialog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	tbMainDialog.szTitleMsg = format("Hi�n t�i c�c h� c� <color=yellow>%d<color> H�p Qu� Gi�ng Sinh c� th� nh�n, c� mu�n nh�n ngay kh�ng?", GetExtPoint(self.nExtPoint_Xmas_Box_Count))
	tbMainDialog:AddOptEntry("Ta mu�n nh�n", tbPromotionAward.GetXmasBox, {tbPromotionAward})
	tbMainDialog:Show()
end

function tbPromotionAward:GetXmasBox()
	if self:CheckTimeGetXmasBox() ~= 1 then
		return
	end
	local nAwardCount = GetExtPoint(self.nExtPoint_Xmas_Box_Count)
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
	if PayExtPoint(self.nExtPoint_Xmas_Box_Count, nAwardCount) ~= 1 then
		return
	end
	local tbTmpAward = {szName="H�p Qu� Gi�ng Sinh",tbProp={6,1,30332,1,0,0},nCount=nAwardCount,nExpiredTime=43200}
	tbAwardTemplet:Give(tbTmpAward, 1, {self.strLogTittle, "NhanPhanThuongHopQuaGiangSinh"})
end

function tbPromotionAward:PickAward(nSubProm, nAwardID)
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	tbMainDialog.szTitleMsg = "Xin h�y ch�n ph�n th��ng"
	local tbTmpAward = self.tbPrizeList[nSubProm].tbAward[nAwardID]
	for i = 1, getn(tbTmpAward) do
		tbMainDialog:AddOptEntry(tbTmpAward[i].szName, tbPromotionAward.DoPickAward, {tbPromotionAward, nSubProm, nAwardID, i})		
	end
	tbMainDialog:Show()
end

function tbPromotionAward:DoPickAward(nSubProm, nAwardID, nAwardID2)
	if not self:IsActive() then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian nh�n th��ng.")
		return
	end
	local tbBitExtPoint = self.tbBitExpoint[nSubProm][nAwardID]
	if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) ~= 1 then
		Talk(1, "", "C�c h� kh�ng tr�ng ph�n th��ng n�y.")
		return
	end	
	local nFreeCell = self.tbFreeCellReq[nSubProm][nAwardID]
	if CalcFreeItemCellCount() < nFreeCell then
		Talk(1, "", format("�� tr�nh m�t m�t t�i s�n, xin h�y ch�a %d �  tr�ng trong h�nh trang r�i m�i nh�n th��ng.", nFreeCell))
		return
	end
	if tbExtPointLib:SetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit, 0) ~= 1 then
		Talk(1, "", "Nh�n th��ng kh�ng th�nh c�ng, xin h�y li�n h� ban �i�u h�nh c�a tr� ch�i �� ���c gi�i quy�t.")
			return
	end	
	local tbTmpAward = self.tbPrizeList[nSubProm].tbAward[nAwardID][nAwardID2]
	tbAwardTemplet:Give(tbTmpAward, 1, {strLogTittle, "NhanPhanThuongGiai["..nSubProm.."]["..nAwardID.."]"})	
end

if tbPromotionAward:IsActive() then
	tbPromotionAward:AddDialog()
end