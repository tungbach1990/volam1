Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\config\\1005\\variables.lua")
tbExchangeWrongEquip = {}
tbExchangeWrongEquip.nStartIdx = 1425
tbExchangeWrongEquip.nEndIdx = 1514
tbExchangeWrongEquip.tbBitTask = tbBITTASK_EXCHANGE_WRONG_EQUIP
function tbExchangeWrongEquip:GetGoldEquipListInRoom()
	local tbRoomItems = GetRoomItems(0)
	local tb = {}
	if getn(tbRoomItems) <= 0 then
		Talk(1, "", "R��ng h�nh trang tr�ng, xin h�y ki�m tra l�i")
		return
	end
	local nItemIdx
	for i=1, getn(tbRoomItems) do
		nItemIdx = tbRoomItems[i]
		if nItemIdx > 0 and GetItemQuality(nItemIdx) == 1 then
			nItemEqIdx = GetGlodEqIndex(nItemIdx)
			if GetItemBindState(nItemIdx) == -2 and nItemEqIdx >= self.nStartIdx and nItemEqIdx <= self.nEndIdx then
				if not tb[nItemEqIdx] then
					tb[nItemEqIdx] = nItemIdx
				end
			end
		end
	end
	
	self:CheckItems(tb)
end

function tbExchangeWrongEquip:CheckItems(tb)
	local nFoundIDX = 0
	for i = 0, 8 do
		local nTempIDX = self.nStartIdx + i * 10
		if tb[nTempIDX] then
			nFoundIDX = nTempIDX
			break;
		end
	end
	if nFoundIDX == 0 then
		Talk(1, "", "Kh�ng c� trang b� th�ch h�p �� ��i")
		return
	end
	local tbEq2Consume = {}
	for i = 0, 9 do
		if tb[nFoundIDX+i] then
			tinsert(tbEq2Consume, tb[nFoundIDX+i])
		else
			Talk(1, "", "Xin h�y ��t c� b� trang b� c�n ��i v�o r��ng h�nh trang r�i th� l�i")
			return
		end
	end
	if getn(tbEq2Consume) < 10 then
		return
	end
	local tbOpt = {}
	local strTittle = "C�c trang b� sau s� b� thu h�i, xin h�y ki�m tra k� l�i:\n"
	for i = 1, getn(tbEq2Consume) do
		strTittle = strTittle.."<color=red>"..GetItemName(tbEq2Consume[i]).."<color>\n"
	end
	tinsert(tbOpt, {"Ch�p nh�n ��i", tbExchangeWrongEquip.Exchange, {tbExchangeWrongEquip, tbEq2Consume}})
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(strTittle, tbOpt)
end

function tbExchangeWrongEquip:Exchange(tbItem)
	for i = 1, getn(tbItem) do
		local strItemName = GetItemName(tbItem[i])
		if IsMyItem(tbItem[i]) ~= 1 or RemoveItemByIndex(tbItem[i]) ~= 1 then
			Talk(1, "", "Trang b� c�a b�n �� b� di d�i, ��i th�t b�i m�t 1 s� trang b�")
			return
		else
			tbLog:PlayerActionLog("PhongVanLenhBai", "DoiTrangBiThuongLangNhanSai", "XoaItem: "..strItemName)
		end
	end
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTask, 1)
	local tbItem = {szName = "Th��ng Lang Chi B�o", tbProp={6,1,30146,1,0,0}, nCount = 1, nBindState = -2,nExpiredTime=10080}
	tbAwardTemplet:Give(tbItem, 1, {"PhongVanLenhBai", "DoiTrangBiThuongLangNhanSai" })
end