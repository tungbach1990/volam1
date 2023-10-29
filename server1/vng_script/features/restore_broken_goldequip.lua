--Restore broken Gold equip -by thanhld 20150729

IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")

if not tbRestoreGoldEq then
	tbRestoreGoldEq = {}
end
tbRestoreGoldEq.KeyLog = "LOGEVENT_FEATURE_CTC_SUADOHKMP"
tbRestoreGoldEq.tbItemTool =  {szName="��i ��i Ho�ng kim c�ng c�",tbProp={6,1,30556,1,0,0}}

function main(nItemIdx)	
	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local szTitle = format("<color=yellow>��i Ho�ng kim c�ng c�<color> �� x� l� trang b� Ho�ng kim �� b� h� h�i ho�n to�n.")
	local tbOpt = {}	
	tinsert(tbOpt, {format("S�a Trang B� Ho�ng Kim H� H�i"), tbRestoreGoldEq.Restore_brokenequip, {tbRestoreGoldEq}})
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szTitle, tbOpt)
	return 1	
end

function tbRestoreGoldEq:Restore_brokenequip()	
	local strDesc = "Xin m�i b� <Trang b� �� h� h�i> v�o � b�n d��i.  Ch� �: tr��c khi ti�n h�nh s�a trang b�, h�y ki�m tra h�nh trang c�n �� � tr�ng."	
	g_GiveItemUI("Ph�c h�i <Trang b� t�n h�i>", strDesc, {self.On_restore_be, {self}}, nil, 1)
end


function tbRestoreGoldEq:On_restore_be(nCount)
	local nItemIdx = self:check_brokenequip(nCount, "self:Restore_brokenequip")
	if (nItemIdx <= 0) then
		return
	end
	if (CountFreeRoomByWH(2,5,1) < 1) then
		Talk(1, "", "H�nh trang ��i hi�p kh�ng �� 2x5 � tr�ng.");
		return
	end
	local szItemName = GetItemName(nItemIdx)
	local nQuality = GetItemQuality(nItemIdx)	
	
	local tbProp = self.tbItemTool.tbProp	
	if (CalcEquiproomItemCount(tbProp[1],tbProp[2],tbProp[3],1) < 1) then
		return
	end
	
	if (ITEM_BrokenEquip2Normal(nItemIdx) == 1) then
		local tbProp = self.tbItemTool.tbProp
		ConsumeEquiproomItem(1,tbProp[1],tbProp[2],tbProp[3],1)
		SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx)) 
		Msg2Player("Ph�c h�i th�nh c�ng, xin ki�m tra h�nh trang")
		tbLog:PlayerActionLog(self.KeyLog,"[Succeed - ]"..szItemName)		
		KickOutSelf()
	else
		Msg2Player("<trang b� t�n h�i>"..szItemName.." ph�c h�i th�t b�i, xin li�n h� ng��i ban �i�u h�nh �� ���c h� tr�");
		Say("<trang b� t�n h�i>"..szItemName.." ph�c h�i th�t b�i, xin li�n h� b�n trang.", 1, "���c!/no")		
		tbLog:PlayerActionLog(self.KeyLog,"[Fail - ]"..szItemName)		
	end	
end

--check_brokenequip
function tbRestoreGoldEq:check_brokenequip(nCount, szDealFunc)
	if (nCount <= 0) then
		return 0
	end

	if (nCount > 1) then
		Say("M�i l�n ch� s�a ���c m�t <color=red><trang b� t�n h�i><color> th�i!", 2, "�! Th� ra ��t nh�m �� ta th� l�i./"..szDealFunc, "�� ta ki�m tra xem sao/no")
		return 0
	end
	
	local nItemIdx = GetGiveItemUnit(1);
	local itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
	local nQuality = GetItemQuality(nItemIndex)
	local nGoldeEquip = GetGlodEqIndex(nItemIdx)
	local nBindState = GetItemBindState(nItemIdx)
	
	print("check_brokenequip nQuality: "..nQuality)
	print("check_brokenequip nGoldeEquip: "..nGoldeEquip)
	--check bind equip
	if (nBindState ~= 0) then 
		Say("Trang b� kh�a c� th�i h�n ho�c v�nh vi�n kh�ng s�a ���c.", 1,"�� ta ki�m tra xem sao/no")
		return	0
	end
	--check goldequip
	if (nGoldeEquip <= 0) or (nQuality ~= 0) then 
		Say("Trang b� th��ng th� d�ng Ho�ng Kim C�ng C� �� s�a.", 1,"�� ta ki�m tra xem sao/no")
		return	0
	end
	
	if (itemgenre ~= 7) then 
		Say("Nh�ng th� b�n ��t v�o kh�ng ph�i <color=red><trang b� t�n h�i><color>, xin ki�m tra k� l�i.", 1,"�� ta ki�m tra xem sao/no")
		return	0
	end
	if IsMyItem(nItemIdx) ~= 1 then
		Talk(1,"","Th�t th� m�i l� ��c t�nh t�t!!!")
		tbLog:PlayerActionLog(KeyLog, "Nghi van hack -  item bo vao khong o trong hanh trang")
		return 0
	end
	return nItemIdx
end

function no()
end
