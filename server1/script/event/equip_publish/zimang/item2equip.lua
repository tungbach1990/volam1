Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\equip_publish\\zimang\\equiptable.lua")
tbItem2Equip = tbActivityCompose:new()

function tbItem2Equip:GetSuccessRate()
	local tbAdditive = self.tbFormula.tbAdditive
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nCount = self:CalcItemCount(tbRoomItems, tbAdditive)
	
	local nSuccessRate = nCount * tbAdditive.nSuccessRate
	if nSuccessRate > tbAdditive.nMaxSuccessRate then
		nSuccessRate = tbAdditive.nMaxSuccessRate
	end
	return nSuccessRate, nCount
end

function tbItem2Equip:ConsumeAdditive(nCount)
	local tbAdditive = self.tbFormula.tbAdditive
	local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  ÿ�ζ����»�ȡ���Է�ֹ�б仯
	
	if self:ConsumeItem(tbRoomItems, nCount, tbAdditive) ~= 1 then
		return
	end
	self:ConsumeLog(nCount.." "..tbAdditive.szName, self.szLogTitle)
	return 1
end


function tbItem2Equip:Compose(nComposeCount, nProductId)
	
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	if not tbProduct then
		return 
	end
	
	nComposeCount = nComposeCount or 1
	
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	local nFreeItemCellLimit = self.tbFormula.nFreeItemCellLimit or 1
	
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	local nSuccessRate, nAdditiveCount = self:GetSuccessRate()
	
	
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>"
		Talk(1, "", szMsg)
		return 0;
	end

	if self:ConsumeMaterial(tbMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("Ch� t�o th�t b�i, m�t �i m�t s� nguy�n li�u.")
		return 0;
	end
	
	
	
	if self:ConsumeAdditive(nAdditiveCount) ~= 1 then
		Msg2Player("Ch� t�o th�t b�i, m�t �i m�t s� nguy�n li�u.")
		return 0;
	end
	
	if random(1, 100) > nSuccessRate then
		Msg2Player("Th�t ��ng ti�c ch� t�o �� th�t b�i")
		return 0
	end
	
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
		AddStatData("zimang_jx1hechengzongshu", 1)	--��������һ��
	end

	return 1;
end

function tbItem2Equip:GiveUIOk(nCount)
	if nCount < getn(self.tbFormula.tbMaterial) then
		return Talk(1, "", self.tbFormula.szFailMsg or "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>")
	end
	
	local nSuccessRate, nAdditiveCount = self:GetSuccessRate()
	local szMsg = format("Ng��i ��t v�o %d c�i %s, t� l� th�nh c�ng l� %d%%, c� mu�n ti�p t�c ch� t�o kh�ng?", nAdditiveCount, self.tbFormula.tbAdditive.szName, nSuccessRate)
	local tbOpt = 
	{
		{"Ti�p t�c ch� t�o", self.SelectEquip, {self, 1, 5}},
		{"��t v�o l�n n�a", self.ComposeGiveUI, {self}},
		{"H�y b� "},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function tbItem2Equip:SelectEquip(nId, nCount)
	
	if self:CheckMaterial(self.tbFormula.tbMaterial, 1) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>"
		Talk(1, "", szMsg)
		return 0;
	end
	local tbProduct = self.tbFormula.tbProduct
	local szMsg = format("Chon m�t c�i %s", tbProduct.szName)
	local nProductCount = getn(tbProduct)
	local nEndId = nCount + nId - 1
	if nEndId > nProductCount then
		nEndId = nProductCount
	end
	local tbOpt = {}
	for i=nId, nEndId  do 
		tinsert(tbOpt, {%tbRepresentName[i], self.Compose, {self, 1, i}})
	end
	if nId >= nCount + 1  then
		tinsert(tbOpt, {"Trang tr��c", self.SelectEquip, {self, nId-nCount, nCount}})
	end
	if nEndId < nProductCount then
		tinsert(tbOpt, {"Trang k� ", self.SelectEquip, {self, nId+nCount, nCount}})
	end
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szMsg, tbOpt)
end


tbCommonMaterial = 
{
	{szName="T� M�ng Kim B�i", tbProp={6, 1, 2765}, nCount = 1},
	{szName="Thanh C�u Th�ch", tbProp={6, 1, 2710}, nCount = 4},
	{szName="V�n L�c Th�ch", tbProp={6, 1, 2711}, nCount = 3},
	{szName="Th��ng Lang Th�ch", tbProp={6, 1, 2712}, nCount = 2},
	{szName="Huy�n Vi�n Th�ch", tbProp={6, 1, 2713}, nCount = 1},
	{szName="T� M�ng L�nh", tbProp={6, 1, 2350}, nCount = 1},
}

tbFormulaList = 
{
	[1] = 
	{
		szName = "T� M�ng Kh�i",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "�� Ph� T� M�ng Kh�i", tbProp = {6,1,2714}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[2] = 
	{
		szName = "T� M�ng Y",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "�� Ph� T� M�ng Y", tbProp = {6,1,2715}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[3] = 
	{
		szName = "T� M�ng H�i",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "�� Ph� T� M�ng H�i", tbProp = {6,1,2716}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[4] = 
	{
		szName = "T� M�ng Y�u ��i",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "�� Ph� T� M�ng Y�u ��i", tbProp = {6,1,2717}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[5] = 
	{
		szName = "T� M�ng H� Uy�n",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "�� Ph� T� M�ng H� Uy�n", tbProp = {6,1,2718}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[6] = 
	{
		szName = "T� M�ng H�ng Li�n",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "�� Ph� T� M�ng H�ng Li�n", tbProp = {6,1,2719}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[7] = 
	{
		szName = "T� M�ng B�i",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "�� Ph� T� M�ng B�i", tbProp = {6,1,2720}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[8] = 
	{
		szName = "T� M�ng Th��ng Gi�i Ch�",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "�� Ph� T� M�ng Th��ng Gi�i Ch�", tbProp = {6,1,2721}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[9] = 
	{
		szName = "T� M�ng H� Gi�i ch�",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "�� Ph� T� M�ng H� Gi�i Ch�", tbProp = {6,1,2722}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[10] = 
	{
		szName = "T� M�ng Kh� Gi�i",
		tbMaterial = tbCommonMaterial,
		tbAdditive = {szName = "�� Ph� T� M�ng Kh� Gi�i", tbProp = {6,1,2723}, nSuccessRate = 10, nMaxSuccessRate = 80},
		
		nWidth = 2,
		nHeight = 4,
		nFreeItemCellLimit = 1,
	},
}


local tbOpt = {}

for i=1, getn(tbFormulaList) do
	tbEquip_zimang[i].szName = tbFormulaList[i].szName
	tbFormulaList[i].tbProduct = tbEquip_zimang[i]
	
	local p = tbItem2Equip:new(tbFormulaList[i], "Item2Equip", INVENTORY_ROOM.room_giveitem)
	p.bAccessBindItem = 1
	local szOpt = format("Ch� t�o %s", tbFormulaList[i].tbProduct.szName)
	tinsert(tbOpt, {szOpt, p.ComposeGiveUI, {p}})
end
tinsert(tbOpt, {"H�y b� "})

local dialog = function()
	CreateNewSayEx("L�a ch�n trang b� b�n mu�n ch� t�o", %tbOpt)
end

Include("\\script\\event\\equip_publish\\dialog.lua")
MAKE_EQUIP_LIST["zimang"] = {}
MAKE_EQUIP_LIST["zimang"].nPak = curpack()
MAKE_EQUIP_LIST["zimang"].pFun = dialog
MAKE_EQUIP_LIST["zimang"].pSelf = nil
MAKE_EQUIP_LIST["zimang"].szOpt = "Ch� t�o  trang b� T� M�ng"

