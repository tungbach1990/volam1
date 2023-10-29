--promotion 123 pay - Created by DinhHQ - 20121203
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbPromotionAward = 
{
	nStartDate = 201304010000,
	nEndDate = 201304052400,
	tbPrizeList = {	
		[1] = {szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=10080,nUsageTime=60},
		[2] = {szName="Phong V�n B�ch M�",tbProp={0,10,19,1,0,0},nCount=1,nExpiredTime=129600},
		[3] = {szName="Gia H�n Ph�",tbProp={6,1,30225,1,0,0},nCount=2},
		[4] = {szName="Phi phong c�p 6 l� h�p",tbProp={6,1,30302,1,0,0},nCount=1,nExpiredTime=10080},
		[5] = {szName="Long ��m",tbProp={0,3499},nCount=1,nQuality = 1,nExpiredTime=129600,nBindState=-2},
	},
	tbFreeCellReq = {
		[1] = {1,1,1},
		[2] = {2,3,1},
		[3] = {1,1,1},
		[4] = {1,1,1},		
		[5] = {1,1,1},		
	},
	tbBitExpoint = {
		[1] = {nExtPointID = 3, nBit = 3},
		[2] = {nExtPointID = 3, nBit = 4},
		[3] = {nExtPointID = 3, nBit = 5},
		[4] = {nExtPointID = 3, nBit = 6},		
		[5] = {nExtPointID = 3, nBit = 7},		
	},	
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
	nId = pEventType:Reg("Chi�n T�m T�n Gi�", "Nh�n ph�n th��ng promotion 123Pay", tbPromotionAward.main,{tbPromotionAward})
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
	local strTittle = "Ta ph� tr�ch trao ph�n th��ng ch��ng tr�nh <color=yellow>promotion 123Pay<color>. Danh s�ch ph�n th��ng c�a c�c h� nh� sau:\n\n"
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
function tbPromotionAward:FreeItemCellCount(tbFreeCellReq)
	if CountFreeRoomByWH(tbFreeCellReq[1],tbFreeCellReq[2], tbFreeCellReq[3]) < tbFreeCellReq[3] then
		return 1,format("Xin h�y ch�a <color=red>%d x %d <color>� tr�ng h�nh trang r�i h�y nh�n th��ng",tbFreeCellReq[1],tbFreeCellReq[2])
	end
	return 0
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
	local nRet,szMsg = self:FreeItemCellCount(self.tbFreeCellReq[nAwardID])
	if nRet ~= 0 then
		Talk(1, "", szMsg)
		return
	end
	if tbExtPointLib:SetBitValue(tbBitExtPoint.nExtPointID, tbBitExtPoint.nBit, 0) ~= 1 then
		Talk(1, "", "Nh�n th��ng kh�ng th�nh c�ng, xin h�y li�n h� ban �i�u h�nh c�a tr� ch�i �� ���c gi�i quy�t.")
			return
	end
	local tbTmpAward = self.tbPrizeList[nAwardID]
	tbAwardTemplet:Give(tbTmpAward, 1, {"Promotion123Pay", "NhanPhanThuongGiai"..nAwardID})	
end

if tbPromotionAward:IsActive() then
	tbPromotionAward:AddDialog()
end