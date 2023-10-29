IncludeLib("ITEM")
Include("\\script\\lib\\log.lua")
tbVnGiaHanPhu = {}
tbVnGiaHanPhu.tbItem = {
	["3491"]=7,
	["3492"]=7,
	["3493"]=7,
	["3494"]=7,
	["3495"]=7,
	["3496"]=7,
	["3497"]=7,
	["3498"]=7,
	["3499"]=7,
	["3500"]=7,
	["3501"]=7,
	["3502"]=7,
	["3503"]=7,
	["3504"]=7,
	["3505"]=7,
	["3506"]=7,
	["3880"]=7,
	["3881"]=7,
	["3882"]=7,
	["3883"]=7,
	["3884"]=7,
	["3885"]=7,
	["3886"]=7,
	["3887"]=7,
	["3888"]=7,
	["4856"]=5,
	["4857"]=3,
	["4860"]=5,
	["4861"]=4,
	["4862"]=3,
}


function tbVnGiaHanPhuGiveUIConfirm(nCount)
	local nCheckMap = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\checkinmap.lua", "PlayerFunLib:VnCheckInCity")	
	if not nCheckMap then
		return
	end
	if nCount ~= 1 then
		Talk(1, "", "V�t ph�m b� v�o kh�ng ��ng, xin h�y ki�m tra l�i!")
		return
	end
	local nIDX = GetGiveItemUnit(1)
	local nQuality = GetItemQuality(nIDX)
	local nItemBindState = GetItemBindState(nIDX)
	if nQuality ~= 1 then
		Talk(1, "", "Trang b� ng��i ��t v�o kh�ng ph�i l� trang b� ho�ng kim")
		return
	end
	if nItemBindState == -2 then
		Talk(1, "", "Trang s�c ��t v�o �� b� kh�a b�o hi�m v�nh vi�n, kh�ng th� gia h�n.")
		return
	end
	local nGoldEquipIdx = GetGlodEqIndex(nIDX)
	if not tbVnGiaHanPhu.tbItem[tostring(nGoldEquipIdx)] then
		Talk(1, "", "Trang b� ng��i ��t v�o kh�ng ph�i l� trang s�c, xin h�y ki�m tra l�i!")
		return
	end
	local nNextExpiredTime = tbVnGiaHanPhu.tbItem[tostring(nGoldEquipIdx)] * 24 * 60 -- in minute
	local nCurItemExpiredTime = ITEM_GetExpiredTime(nIDX)
	local nCurTime = GetCurServerTime()
	if (nCurItemExpiredTime - nCurTime < 0) then
		Talk(1, "", "Trang s�c �� h�t h�n s� d�ng, kh�ng th� gia h�n.")
		return
	end
	if (nCurItemExpiredTime <= 0) or (nCurItemExpiredTime - nCurTime >nNextExpiredTime * 60) then
		Talk(1, "", format("Ch� c� th� gia h�n trang s�c c� h�n s� d�ng d��i %d ng�y.", tbVnGiaHanPhu.tbItem[tostring(nGoldEquipIdx)]))
		return
	end
	if ConsumeEquiproomItem(1, 6,1,30225,1) ~= 1 then
		Talk(1, "", "Kh�ng t�m th�y v�t ph�m Gia H�n Ph�, gia h�n th�t b�i.")
		return
	end
	local strItemName = GetItemName(nIDX)
	ITEM_SetExpiredTime(nIDX, nNextExpiredTime)	
	SyncItem(nIDX)
	Msg2Player(format("Gia h�n v�t ph�m <color=yellow>%s<color> th�nh c�ng, v�t ph�m c� h�n s� d�ng <color=yellow>%d<color> ng�y t�nh t� th�i �i�m hi�n t�i.", strItemName, tbVnGiaHanPhu.tbItem[tostring(nGoldEquipIdx)]))
	tbLog:PlayerActionLog("SuDungVatPhamGiaHanPhu", "Gia h�n v�t ph�m "..strItemName, "H�n s� d�ng c� c�n "..(nCurItemExpiredTime - nCurTime).." gi�y")
end

function main(nItemIDX)
	local nCheckMap = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\checkinmap.lua", "PlayerFunLib:VnCheckInCity")
	if not nCheckMap then
		return 1
	end
	GiveItemUI("Gia H�n Ph�", "Xin h�y b� 1 m�n trang s�c c� h�n s� d�ng v�o � b�n d��i", "tbVnGiaHanPhuGiveUIConfirm", "onCancel", 1)
	return 1
end