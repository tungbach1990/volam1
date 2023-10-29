--Restore broken equip -by thanhld 032015
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")

function main(nItemIdx)	
	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local szTitle = "Ho�ng Kim C�ng C� �� x� l� trang b� �� b� h� h�i ho�n to�n."
	local tbOpt = {}
	tinsert(tbOpt,"S�a Trang B� H� H�i/#Rrestore_brokenequip()")
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "Tho�t/no")
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1	
end

function Rrestore_brokenequip()
	GiveItemUI( "Giao di�n ph�c h�i <Trang b� t�n h�i>", "Xin m�i b� <Trang b� �� h� h�i> v�o � b�n d��i.  Ch� �: tr��c khi ti�n h�nh s�a trang b�, h�y ki�m tra h�nh trang c�n �� � tr�ng.", "On_restore_be", "no", 1);	
end


function On_restore_be(nCount)
	local nItemIdx = check_brokenequip(nCount, "Rrestore_brokenequip")
	if (nItemIdx <= 0) then
		return
	end
	if (CountFreeRoomByWH(2,5,1) < 1) then
		Talk(1, "", "H�nh trang ��i hi�p kh�ng �� 2x5 � tr�ng.");
		return
	end
	local szItemName = GetItemName(nItemIdx)
	local nQuality = GetItemQuality(nItemIdx)	
	
	if (CalcEquiproomItemCount(6,1,30594,1) < 1) then
		return
	end
	
	if (ITEM_BrokenEquip2Normal(nItemIdx) == 1) then
		ConsumeEquiproomItem(1,6,1,30594,1)
		SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx)) 
		Msg2Player("Ph�c h�i th�nh c�ng, xin ki�m tra h�nh trang")
		tbLog:PlayerActionLog("RestoreBrokenEquip","[Succeed - ]"..szItemName)		
		KickOutSelf()
	else
		Msg2Player("<trang b� t�n h�i>"..szItemName.." ph�c h�i th�t b�i, xin li�n h� ng��i c� tr�ch nhi�m");
		Say("<trang b� t�n h�i>"..szItemName.." ph�c h�i th�t b�i, xin li�n h� b�n trang.", 1, "���c!/no")		
		tbLog:PlayerActionLog("RestoreBrokenEquip","[Fail - ]"..szItemName)		
	end	
end

--check_brokenequip
function check_brokenequip(nCount, szDealFunc)
	if (nCount <= 0) then
		return 0
	end

	if (nCount > 1) then
		Say("M�i l�n ch� s�a ���c m�t <color=red><trang b� t�n h�i><color> th�i!", 2, "�! Th� ra ��t nh�m �� ta th� l�i./"..szDealFunc, "�� ta ki�m tra xem sao/no")
		return 0
	end
	
	local nItemIdx = GetGiveItemUnit(1);
	itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
	local nGoldeEquip = GetGlodEqIndex(nItemIdx)
	local nBindState = GetItemBindState(nItemIdx)
	--check bind equip
	if (nBindState ~= 0) then 
		Say("Trang b� kh�a c� th�i h�n ho�c v�nh vi�n kh�ng s�a ���c.", 2, "�! ra v�y, �� ta th� l�i./"..szDealFunc, "�� ta ki�m tra xem sao/no")
		return	0
	end
	--check goldequip
	if (nGoldeEquip ~= 0) then 
		Say("Hi�n t�i trang b� Ho�ng Kim t�m th�i ch�a s�a ���c .", 2, "�! Th� ra ��t nh�m �� ta th� l�i./"..szDealFunc, "�� ta ki�m tra xem sao/no")
		return	0
	end
	
	if (itemgenre ~= 7) then 
		Say("Nh�ng th� b�n ��t v�o kh�ng ph�i <color=red><trang b� t�n h�i><color>, xin ki�m tra k� l�i.", 2, "�! Th� ra ��t nh�m �� ta th� l�i./"..szDealFunc, "�� ta ki�m tra xem sao/no")
		return	0
	end
	
	return nItemIdx
end

function no()
end
