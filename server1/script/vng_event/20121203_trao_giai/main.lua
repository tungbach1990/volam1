--promotion 123 pay - Created by DinhHQ - 20130423
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbPromotionAward = 
{
	nStartDate = 201304180000,
	nEndDate = 201305052400,
	tbPrizeList = {	
		[5] = {szName="Huy�t Long ��ng C�p 5",tbProp={6,1,30289,5,0,0},nCount=10,nBindState = -2},
		[4] = {szName="Long ��m",tbProp={0,3499},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080,},
		[3] = {szName="H�n nguy�n ch�n ��n",tbProp={6,1,30301,1,0,0},nCount=1, nBindState=-2},
		[2] = {szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=43200,nBindState=-2},
		[1] = {szName="L� Bao Phi Phong (c�p 7)",tbProp={6,1,30360,1,0,0},nCount=1,tbParam={7,1,86400,0,0,0},  nExpiredTime = 10080, nBindState=-2},
	},
	tbFreeCellReq = {
		[5] = 2,
		[4] = 1,
		[3] = 1,
		[2] = 1,
		[1] = 1,
	},
	tbBitExpoint = {
		[1] = {nExtPointID = 3, nBit = 14},
		[2] = {nExtPointID = 3, nBit = 13},
		[3] = {nExtPointID = 3, nBit = 12},
		[4] = {nExtPointID = 3, nBit = 11},
		[5] = {nExtPointID = 3, nBit = 10},
	},
	strEventName = "promotion 123 Pay",
	strLog = "promotion123pay",
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
	nId = pEventType:Reg("Chi�n T�m T�n Gi�", format("Nh�n ph�n th��ng %s", self.strEventName), tbPromotionAward.main,{tbPromotionAward})
end

function tbPromotionAward:main()
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
	local strTittle = format("Ta ph� tr�ch trao ph�n th��ng ch��ng tr�nh <color=yellow>%s<color>. Danh s�ch ph�n th��ng c�a c�c h� nh� sau:\n\n", self.strEventName)
	for i = 1, getn(self.tbBitExpoint) do
		local tbBitExtPoint = self.tbBitExpoint[i]
		if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) == 1 then
			nFlag = 1
			strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>\n", self.tbPrizeList[i].szName)
			tbMainDialog:AddOptEntry(format("Nh�n ph�n th��ng gi�i %d", i), tbPromotionAward.getAward, {tbPromotionAward, i})
		end
	end	
	if nFlag == 0 then
		strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>", "Kh�ng c� ph�n th��ng n�o")
	end
	tbMainDialog.szTitleMsg = strTittle	
	tbMainDialog:Show()
end

function tbPromotionAward:getAward(nAwardID)
	if not self:IsActive() then
		Talk(1, "", "Hi�n t�i kh�ng ph�i th�i gian nh�n th��ng.")
		return
	end
	local tbBitExtPoint = self.tbBitExpoint[nAwardID]
	if tbExtPointLib:GetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit) ~= 1 then
		Talk(1, "", "C�c h� kh�ng tr�ng ph�n th��ng n�y.")
		return
	end	
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
	tbAwardTemplet:Give(tbTmpAward, 1, {self.strLog, "NhanPhanThuongGiai"..nAwardID})	
end

if tbPromotionAward:IsActive() then
	tbPromotionAward:AddDialog()
end