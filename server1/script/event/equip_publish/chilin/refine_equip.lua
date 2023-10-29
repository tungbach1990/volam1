Include("\\script\\lib\\awardtemplet.lua")
Refining_Chilin = {}


DEF_REREFINING_STONE_COUNT = 
{
	{szName = "Trang B� X�ch L�n Kh�i", nCount = 2, varDetailType = 7},
	{szName = "Trang B� X�ch L�n B�i", nCount = 2, varDetailType = 9},
	{szName = "Trang B� X�ch L�n H� Uy�n", nCount = 2, varDetailType = 8},
	{szName = "Trang B� X�ch L�n Y�u ��i", nCount = 2, varDetailType = 6},
	{szName = "Trang B� X�ch L�n H�ng Li�n", nCount = 1, varDetailType = 4},
	{szName = "Trang B� X�ch L�n Y", nCount = 3, varDetailType = 2},
	{szName = "Trang B� X�ch L�n H�i", nCount = 2, varDetailType = 5},
	{szName = "Trang B� X�ch L�n Gi�i Ch�", nCount = 2, varDetailType = 3},
	{szName = "Trang B� X�ch L�n V� Kh�", nCount = 4, varDetailType = {0, 1}},
}
ITEM_REREFINING_STONE_COUNT = {}
for i = 1, getn(DEF_REREFINING_STONE_COUNT) do
	local pInfo = DEF_REREFINING_STONE_COUNT[i]
	if type(pInfo.varDetailType) == "number" then
		ITEM_REREFINING_STONE_COUNT[pInfo.varDetailType] = pInfo.nCount
	elseif type(pInfo.varDetailType) == "table" then
		for j = 1, getn(pInfo.varDetailType) do
			ITEM_REREFINING_STONE_COUNT[pInfo.varDetailType[j]] = pInfo.nCount
		end
	end
end

Chilin_Rang = {2515,2744}

ITEM_REREFINING_STONE = {szName = "X�ch L�n Tr�ng Luy�n Ng�c",  tbProp = {6,1,3397}, }

ITEM_REREFINING_STONE.szGDP = format("%d,%d,%d", unpack(ITEM_REREFINING_STONE.tbProp))

function Refining_Chilin:OpenGiveUI()
	local szTitle = format("%-10s  %s", "Trang B� X�ch L�n", "S� l��ng")
	local szList = ""
	for i = 1, getn(%DEF_REREFINING_STONE_COUNT) do
		local pInfo = %DEF_REREFINING_STONE_COUNT[i]
		szList = szList..format("%-20s  %s<enter>", pInfo.szName, pInfo.nCount)
	end
	g_GiveItemUI(szTitle, szList, {self.GiveUIOk, {self, nId}}, nil, self.bAccessBindItem)
end

function Refining_Chilin:IsChilinEquip(nItemIndex)
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	local nQuality = GetItemQuality(nItemIndex)
	local nItemGenre = GetItemProp(nItemIndex)
	if nItemGenre == 7 then
		return
	end
	local nExpiredTime = ITEM_GetExpiredTime(nItemIndex)
	local nLeftUsageTime = ITEM_GetLeftUsageTime(nItemIndex)
	if nExpiredTime ~= 0 or nLeftUsageTime ~= 4294967295 then
		return 
	end
	if nQuality == 1 then
		local nEqIndex = GetGlodEqIndex(nItemIndex)
		if %Chilin_Rang[1] <= nEqIndex and nEqIndex <= %Chilin_Rang[2] then
			return 1
		end
	end
end

function Refining_Chilin:CheckStone(nItemIndex)
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	local szGDP = format("%d,%d,%d", GetItemProp(nItemIndex))
	local nQuality = GetItemQuality(nItemIndex)
	if nQuality == 0 and %ITEM_REREFINING_STONE.szGDP == szGDP then
		return 1
	end
end

function Refining_Chilin:RemoveStoneCount(tbStone, nRemoveCount)
	for i = 1, getn(tbStone) do 
		local nItemIndex = tbStone[i]
		local nCurCount = GetItemStackCount(nItemIndex)
		if nRemoveCount < nCurCount then
			SetItemStackCount( nItemIndex, nCurCount - nRemoveCount );
			varResult = 0;
		else
			if RemoveItemByIndex(nItemIndex) == 1 then
				nRemoveCount =  nRemoveCount - nCurCount
			end
		end
		if nRemoveCount <= 0 then
			return 1
		end
	end
end



function Refining_Chilin:GetMaterial(nRevCount)
	local tbMaterial = {}
	tbMaterial.tbEquip = {}
	tbMaterial.tbStone = {}
	local tbProduct = nil
	for i=1, nRevCount do
		local nItemIndex = GetGiveItemUnit(i)
		if self:IsChilinEquip(nItemIndex) then
			tinsert(tbMaterial.tbEquip, nItemIndex)
		elseif self:CheckStone(nItemIndex) then
			tinsert(tbMaterial.tbStone, nItemIndex)
		end
	end
	return tbMaterial
end

function Refining_Chilin:GetStoneCount(tbStone)
	local nCount = 0
	for i = 1, getn(tbStone) do
		local nItemIndex = tbStone[i]
		nCount = nCount + GetItemStackCount(nItemIndex)
	end
	return nCount
end

function Refining_Chilin:MakeProduct(nItemIndex)
	
	local nQuality = GetItemQuality(nItemIndex)
	if nQuality == 1 then
		local nEqIndex = GetGlodEqIndex(nItemIndex)
		return {tbProp = {0, nEqIndex}, nQuality = nQuality}
	end
end

function Refining_Chilin:GiveUIOk(nRevCount)
	
	local tbMaterial = self:GetMaterial(nRevCount)
	local nEquipCount = getn(tbMaterial.tbEquip)
	if nEquipCount <= 0 then
		return Talk(1, "", "Kh�ng b� Trang B� X�ch L�n")
	elseif nEquipCount > 1 then
		return Talk(1, "", "M�i l�n ch� c� th� b� v�o m�t trang b� X�ch L�n")
	end
	local nItemIndex = tbMaterial.tbEquip[1]
	local tbRerefiningEquip = self:MakeProduct(nItemIndex)
	if not tbRerefiningEquip then
		return
	end
	local _, nDetailType = GetItemProp(nItemIndex)	
	
	local nNeedCount = %ITEM_REREFINING_STONE_COUNT[nDetailType]
	
	if self:GetStoneCount(tbMaterial.tbStone) < nNeedCount then
		return Talk(1, "", format("Trang b� n�y c�n %d  %s", nNeedCount, %ITEM_REREFINING_STONE.szName))
	end
	if RemoveItemByIndex(nItemIndex) == 1 and self:RemoveStoneCount(tbMaterial.tbStone, nNeedCount) == 1 then
		tbAwardTemplet:Give(tbRerefiningEquip, 1, {"rerefining", "chilin"})
	end
end

Include("\\script\\event\\equip_publish\\dialog.lua")
REFINE_EQUIP_LIST["chilin"] = {}
REFINE_EQUIP_LIST["chilin"].nPak = curpack()
REFINE_EQUIP_LIST["chilin"].szOpt = "Tr�ng luy�n trang b� X�ch L�n"
REFINE_EQUIP_LIST["chilin"].pFun = Refining_Chilin.OpenGiveUI
REFINE_EQUIP_LIST["chilin"].pSelf = Refining_Chilin
