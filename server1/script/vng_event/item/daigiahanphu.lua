IncludeLib("ITEM")
Include("\\script\\lib\\log.lua")
tbVnGiaHanPhu = {}
tbVnGiaHanPhu.tbItem = {
	["3491"]=30,
	["3492"]=30,
	["3493"]=30,
	["3494"]=30,
	["3495"]=30,
	["3496"]=30,
	["3497"]=30,
	["3498"]=30,
	["3499"]=30,
	["3500"]=30,
	["3501"]=30,
	["3502"]=30,
	["3503"]=30,
	["3504"]=30,
	["3505"]=30,
	["3506"]=30,
	["3880"]=30,
	["3881"]=30,
	["3882"]=30,
	["3883"]=30,
	["3884"]=30,
	["3885"]=30,
	["3886"]=30,
	["3887"]=30,
	["3888"]=30,
	["4856"]=21,
	["4857"]=14,
	["4860"]=23,
	["4861"]=17,
	["4862"]=13,
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
	if ConsumeEquiproomItem(1, 6,1,30408,-1) ~= 1 then
		Talk(1, "", "Kh�ng t�m th�y v�t ph�m ��i Gia H�n Ph�, gia h�n th�t b�i.")
		return
	end
	local strItemName = GetItemName(nIDX)
	ITEM_SetExpiredTime(nIDX, nNextExpiredTime)	
	SyncItem(nIDX)
	Msg2Player(format("Gia h�n v�t ph�m <color=yellow>%s<color> th�nh c�ng, v�t ph�m c� h�n s� d�ng <color=yellow>%d<color> ng�y t�nh t� th�i �i�m hi�n t�i.", strItemName, tbVnGiaHanPhu.tbItem[tostring(nGoldEquipIdx)]))
	tbLog:PlayerActionLog("SuDungVatPhamDaiGiaHanPhu", "Gia h�n v�t ph�m "..strItemName, "H�n s� d�ng c� c�n "..(nCurItemExpiredTime - nCurTime).." gi�y")
end

function main(nItemIDX)
	local nCheckMap = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_feature\\checkinmap.lua", "PlayerFunLib:VnCheckInCity")
	if not nCheckMap then
		return 1
	end
	GiveItemUI("��i Gia H�n Ph�", "Xin h�y b� 1 m�n trang s�c c� h�n s� d�ng v�o � b�n d��i", "tbVnGiaHanPhuGiveUIConfirm", "onCancel", 1)
	return 1
end