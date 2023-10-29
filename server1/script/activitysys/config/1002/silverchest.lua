Include("\\script\\vng_feature\\getgoldequip.lua")
Include("\\script\\activitysys\\config\\1002\\variables.lua")
function main(nItemIdx)	
	local tbSay = {
		format("T� M�ng Th��ng Gi�i Ch�/#SilverChest_GetAward(%d, %d)", nItemIdx, tbVnItemPos.UPPER_RING),
		format("T� M�ng H� Gi�i Ch�/#SilverChest_GetAward(%d, %d)", nItemIdx, tbVnItemPos.LOWER_RING),
		"��ng/OnCancel",
	}
	Say("Xin h�y ch�n ph�n th��ng:", getn(tbSay), tbSay)
	return 1
end

function OnCancel()

end

function SilverChest_GetAward(nIdx, nSelectedOption)
	local tb = {nSpecificItem = nSelectedOption, nItem2Consume = nIdx}
	tb.tbLog = {"Event_NgoiSaoTuyet", "SuDungNganBaoRuong"}
	tb.tbTransLog = {strFolder = "201107_EventNgoiSaoTuyet/", nID = %nPromotionID, strAction = "SuDungNganBaoRuong"}
	tbVNGetGoldEquip:ShowEquipBranchDialog(5, tb)
end