Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\equip_publish\\chilin\\formula_def.lua")
IncludeLib("ITEM")
tbItem2Chilin = tbActivityCompose:new()

function tbItem2Chilin:GetComposeRate()
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local tbAdditivelMaterial = self.tbFormula.tbMaterial.tbAdditivelMaterial
	return self:CalcRate(tbAdditivelMaterial ,tbRoomItems) + self.nSuccessRate
end

function tbItem2Chilin:CalcRate(tbAdditive, tbRoomItems)	
	-- ��ȡ�ɹ���
	local nSuccessRate = 0
	for k, v in tbAdditive do
		local nCount = self:CalcItemCount(tbRoomItems, v)	
		local nSR = nCount * v.nSuccessRate
		nSuccessRate = nSuccessRate + nSR;				
	end
	return nSuccessRate
end

function tbItem2Chilin:ConsumeAdditive(tbAdditive, szLogTitle)
	for i=1,getn(tbAdditive) do
		local tbItem = tbAdditive[i]
		local tbRoomItems =  self:GetRoomItems(self.nRoomType)	
		local nCount = self:CalcItemCount(tbRoomItems, tbItem)
		if nCount > 0 then
			self:ConsumeItem(tbRoomItems, nCount, tbItem)
		end
		self:ConsumeLog(nCount.." "..tbItem.szName, szLogTitle)
	end
	return 1;
end

function tbItem2Chilin:CheckEquip(nItemIndex, tbEquip, nProductId)

	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	
	if not self.bAccessBindItem and GetItemBindState(nItemIndex) ~= 0 then
		return
	end
	local nItemGenre = GetItemProp(nItemIndex)
	if nItemGenre == 7 then
		return
	end
	local nExpiredTime = ITEM_GetExpiredTime(nItemIndex)
	local nLeftUsageTime = ITEM_GetLeftUsageTime(nItemIndex)
	if nExpiredTime ~= 0 or nLeftUsageTime ~= 4294967295 then
		return 
	end
	local nQuality = GetItemQuality(nItemIndex)
	local nEqIndex = -1
	if nQuality == 1 then
		nEqIndex = GetGlodEqIndex(nItemIndex)
	elseif nQuality == 4 then
		nEqIndex = GetPlatinaEquipIndex(nItemIndex)
		if GetPlatinaLevel(nItemIndex) > 0 then
			return
		end
	end	
	
	if tbEquip.tbEqIndex[nEqIndex] == nProductId then
		return 1
	end
	return 
end

function tbItem2Chilin:ConsumeEquip(nItemIndex, tbItem, nProductId)
	if self:CheckEquip(nItemIndex, tbItem, nProductId) then
		if RemoveItemByIndex(nItemIndex) == 1 then
			return 1
		end
	end
end

function tbItem2Chilin:TraversalRoom(pCallBack, tbItem, nProductId)
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	for i=1, getn(tbRoomItems) do
		local nItemIndex = tbRoomItems[i]
		if nItemIndex and nItemIndex > 0 then
			if pCallBack(self, nItemIndex, tbItem, nProductId) then
				return 1
			end
		end
	end
	return
end

function tbItem2Chilin:Compose(nProductId)
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbCommonMaterial = tbMaterial.tbCommonMaterial
	local tbAdditivelMaterial = tbMaterial.tbAdditivelMaterial
	local tbFragment = tbMaterial.tbFragment
	local tbEquip = tbMaterial.tbEquip
	if not tbProduct then
		return 
	end
	
	if not self:CheckLimit(nProductId) then
		return 
	end
	
	-- ����ɹ���
	
	local nSuccessRate = self:GetComposeRate()
	
	-- �������Ƿ����
	if self:ConsumeMaterial(tbCommonMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("Ch� t�o th�t b�i, m�t �i m�t s� nguy�n li�u.")
		return 0;
	end
	if self:ConsumeAdditive(tbAdditivelMaterial, self.szLogTitle) ~= 1 then
		Msg2Player("Ch� t�o th�t b�i, m�t �i m�t s� nguy�n li�u.")
		return 0;
	end
	
	if self:ConsumeMaterial(tbFragment, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("Ch� t�o th�t b�i, m�t �i m�t s� nguy�n li�u.")
		return 0;
	end
	
	if random(1, 100) > nSuccessRate then
		Msg2Player("Th�t ��ng ti�c ch� t�o �� th�t b�i")
		if self.tbFormula.szAction then
			tbLog:PlayerActionLog(self.szLogTitle, self.tbFormula.szAction, nSuccessRate, "fail")
		end
		return 0
	end	
	
	if self:TraversalRoom(self.ConsumeEquip, tbEquip, nProductId) ~= 1 then
		Msg2Player("Ch� t�o th�t b�i, m�t �i m�t s� nguy�n li�u.")
		return 0;
	end
	
	if type(tbProduct) == "table" then
		tbAwardTemplet:Give(tbProduct, nComposeCount, {self.szLogTitle})
	end
	return 1;
end

function tbItem2Chilin:CheckLimit(nProductId)
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbCommonMaterial = tbMaterial.tbCommonMaterial
	local tbAdditivelMaterial = tbMaterial.tbAdditivelMaterial
	local tbFragment = tbMaterial.tbFragment
	local tbEquip = tbMaterial.tbEquip
	
	-- ��鱳���ռ�
	if self.tbFormula.nWidth  and self.tbFormula.nHeight and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, 1) < 1 then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", 1, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return
	end
	if self:CheckMaterial(tbCommonMaterial, nComposeCount) ~=1 then
		local szMsg = "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>"
		Talk(1, "", szMsg)
		return
	end
	if self:CheckMaterial(tbFragment, nComposeCount) ~=1 then
		local szMsg = "<color=red>��i hi�p mang nguy�n li�u kh�ng �� r�i!<color>"
		Talk(1, "", szMsg)
		return
	end
	if self:TraversalRoom(self.CheckEquip, tbEquip, nProductId) ~= 1 then
		local szMsg = format("<color=red>C�n %d %s<color>", tbEquip.nCount, tbEquip.szName)
		Talk(1, "", szMsg)
		return
	end
	return 1
end

function tbItem2Chilin:GiveUIOk(nId, nCount)
	if not self:CheckLimit(nId) then
		return 
	end
	local nSuccessRate = self:GetComposeRate()
	local szMsg = format("��t nguy�n li�u v�o nh�n ���c t� l� th�nh c�ng l�%d%%, ��i hi�p c� mu�n ti�p t�c ch� t�o kh�ng?", nSuccessRate)
	if nSuccessRate > 100 then
		szMsg = "T� l� th�nh c�ng v��t qu� 100% s� l�ng ph� nguy�n li�u c�a ��i hi�p, ng��i c� mu�n ti�p t�c ch� kh�ng?"
	end
	
	local tbOpt = 
	{
		{"Ti�p t�c ch� t�o", self.Compose, {self, nId}},
		{"��t v�o l�n n�a", self.ComposeGiveUI, {self, nId}},
		{"H�y b� "},
	}
	CreateNewSayEx(szMsg, tbOpt)
end
function tbItem2Chilin:GettbAdditivelDesc(tbMaterial)
	local szList = ""
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.szName and tbItem.nSuccessRate then
			szList = format("%s<enter>M�i khi b� v�o  1 %s s� t�ng %d%% t� l� th�nh c�ng", szList,tbItem.szName, tbItem.nSuccessRate)
		end
	end
	return szList
end

function tbItem2Chilin:GetMaterialDesc(tbMaterial)
	local szList = ""
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		if tbItem.nJxb then
			szList = format("%s<enter>%-20s  %d",szList,"Ng�n l��ng", tbItem.nJxb * tbItem.nCount)
		elseif tbItem.szName and tbItem.nCount then
			szList = format("%s<enter>%-20s  %d",szList,tbItem.szName, tbItem.nCount or 1)
		end
	end
	return szList
end
function tbItem2Chilin:GetComposeDesc()
	local szList = format("%-20s  %s","v�t ph�m ","S� l��ng")
	local tbMaterial = self.tbFormula.tbMaterial
	local tbCommonMaterial = tbMaterial.tbCommonMaterial
	local tbAdditivelMaterial = tbMaterial.tbAdditivelMaterial
	local tbFragment = tbMaterial.tbFragment
	local tbEquip = tbMaterial.tbEquip
	szList = szList..self:GetMaterialDesc(tbCommonMaterial)
	szList = szList..self:GetMaterialDesc(tbFragment)
	szList = szList..self:GetMaterialDesc({tbEquip})
	szList = szList..("<enter>B� th�m c�c ��o c� sau ��y s� gia t�ng t� l� th�nh c�ng")
	szList = szList..self:GettbAdditivelDesc(tbAdditivelMaterial)
	return szList
end
function tbItem2Chilin:ComposeGiveUI(nId)
	g_GiveItemUI(format("Ch� t�o %s", self.tbFormula.tbProduct[nId].szName), self:GetComposeDesc(), {self.GiveUIOk, {self, nId}}, nil, self.bAccessBindItem)
end

function tbItem2Chilin:SelectEquip(nId, nCountPerPage)
	local szMsg = format("Chon m�t c�i %s", self.tbFormula.tbProduct.szName)
	local nProductCount = getn(self.tbFormula.tbProduct)
	local nEndId = nCountPerPage + nId - 1
	if nEndId > nProductCount then
		nEndId = nProductCount
	end
	local tbOpt = {}
	for i=nId, nEndId  do 
		tinsert(tbOpt, {self.tbFormula.tbProduct[i].szDesc, self.ComposeGiveUI, {self, i}})
	end
	if nId >= nCountPerPage + 1  then
		tinsert(tbOpt, {"Trang tr��c", self.SelectEquip, {self, nId-nCountPerPage, nCountPerPage}})
	end
	if nEndId < nProductCount then
		tinsert(tbOpt, {"Trang k� ", self.SelectEquip, {self, nId+nCountPerPage, nCountPerPage}})
	end
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szMsg, tbOpt)
end

local tbComposeOpt = {}
for i=1, getn(tbFormulaList) do
	local p = tbItem2Chilin:new(tbFormulaList[i], "tbItem2Chilin", INVENTORY_ROOM.room_giveitem)
	p.nSuccessRate = 80
	local szOpt = format("Ch� t�o %s", tbFormulaList[i].tbProduct.szName)
	tinsert(tbComposeOpt, {szOpt, p.SelectEquip, {p, 1, 5}})
end
tinsert(tbComposeOpt, {"�� ta suy ngh� k� l�i xem", cancel})

function tbItem2Chilin:Dialog()
	CreateNewSayEx("��i hi�p mu�n ch� t�o b� ph�n n�o c�a trang b� X�ch L�n", %tbComposeOpt)
end

Include("\\script\\event\\equip_publish\\dialog.lua")
MAKE_EQUIP_LIST["chilin"] = {}
MAKE_EQUIP_LIST["chilin"].nPak = curpack()
MAKE_EQUIP_LIST["chilin"].pFun = tbItem2Chilin.Dialog
MAKE_EQUIP_LIST["chilin"].pSelf = tbItem2Chilin
MAKE_EQUIP_LIST["chilin"].szOpt = "Ch� t�o trang b� X�ch L�n"