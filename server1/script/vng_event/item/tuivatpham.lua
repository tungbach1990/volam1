Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local tbItemList = {
	[1] = {szName="Ho�ng Ch�n ��n",tbProp={6,1,2264,6,0,0},},
	[2] = {szName="H�n nguy�n ch�n ��n",tbProp={6,1,30301,1,0,0},},
	[3] = {szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1},
}

local PARAM_ITEM_TYPE = 1
local PARAM_MAX_COUNT = 2
local PARAM_LAST_PICK = 3
local PARAM_ITEM_EXPIRED_TIME = 4

local _AskForNumber = function(nItemIndex, nCount)
	
	local pData = {}
	local tbParam = {}
	tinsert(tbParam, nItemIndex)
	tinsert(pData, ItemBag_GetItem)
	tinsert(pData, tbParam)
	g_AskClientNumberEx(0, nCount, "Xin m�i nh�p s� c�n r�t", pData)
	
end

function main(nItemIndex)	
	local nItemType = GetItemParam(nItemIndex, %PARAM_ITEM_TYPE);
	if not %tbItemList[nItemType] then
		return
	end
	local nCount = GetItemParam(nItemIndex, %PARAM_LAST_PICK);
	local nMaxCount = GetItemParam(nItemIndex, %PARAM_MAX_COUNT);
	if nCount >= nMaxCount then
		Say("�� r�t h�t to�n b� v�t ph�m trong t�i r�i, c� th� v�t �i.", 0)
		return 0
	end
	%_AskForNumber(nItemIndex, nMaxCount - nCount)
	return 1
end

function ItemBag_GetItem(nItemIndex, nPickCount)
	local nFreeItemCellCount = CalcFreeItemCellCount()
	if nPickCount <= 0 then
		return
	end
	if nFreeItemCellCount < nPickCount then
		nPickCount = nFreeItemCellCount
	end
	
	if IsMyItem(nItemIndex) == 1 then
		local Gid, Did, Pid = GetItemProp(nItemIndex);
		if Gid ~= 6 or Did ~= 1 or Pid ~= 30447 then
			return
		end
		
		local nItemType = GetItemParam(nItemIndex, %PARAM_ITEM_TYPE);
		local nMaxCount = GetItemParam(nItemIndex, %PARAM_MAX_COUNT);
		local nDidGetCount = GetItemParam(nItemIndex, %PARAM_LAST_PICK);
		local nItemExpiredTime = GetItemParam(nItemIndex, %PARAM_ITEM_EXPIRED_TIME);
		
		if nPickCount + nDidGetCount > nMaxCount then
			nPickCount = nMaxCount - nDidGetCount
		end
				
		local tbItem = %tbItemList[nItemType]
		tbItem.nCount = nPickCount
		if nItemExpiredTime > 0 then
			tbItem.nExpiredTime = nItemExpiredTime
		end
		if not tbItem then return end
		if tbAwardTemplet:Give(tbItem, 1, {"TuiVatPham", "RutVatPham", tbItem.szName, "S� l��ng r�t: "..nPickCount, "C�n l�i: "..nMaxCount  - nPickCount}) == 1 then
			nDidGetCount = nDidGetCount + nPickCount
			if nDidGetCount >= nMaxCount then
				RemoveItemByIndex(nItemIndex)
			else
				SetSpecItemParam(nItemIndex, %PARAM_LAST_PICK, nDidGetCount)
				SyncItem(nItemIndex) --ͬ���ͻ���
			end
		end
	else
		print("V�t ph�m kh�ng � tr�n ng��i")
	end
end

function GetDesc(nItemIndex)
	local nItemType = GetItemParam(nItemIndex, 1);
	local nMaxCount = GetItemParam(nItemIndex, 2);
	local nDidGetCount = GetItemParam(nItemIndex, 3);	
	local tbItem = %tbItemList[nItemType]
	strDesc = format("<color=yellow>%d c�i %s<color>",(nMaxCount - nDidGetCount), tbItem.szName)	
	return strDesc
end