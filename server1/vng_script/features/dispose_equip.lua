Include("\\script\\lib\\log.lua")

if not DisposeEquip then DisposeEquip = {} end

DisposeEquip.LOG_TITLE = "LOG_FEATURE_CTC"

DisposeEquip.TbListEquip = {
		{szName="Kim Phong Thanh D��ng Kh�i", tbProp = {0,177},},
		{szName="Kim Phong K� L�n Huy�t",	tbProp = {0,178},},
		{szName="Kim Phong Tr�c Li�n Quang",	tbProp = {0,179},},
		{szName="Kim Phong C�ng C�n Tam Th�n",	tbProp = {0,180},},
		{szName="Kim Phong �o�t H�n Ng�c ��i",	tbProp = {0,181},},
		{szName="Kim Phong H�u Ngh� d�n cung",	tbProp = {0,182},},
		{szName="Kim Phong Lan ��nh Ng�c",	tbProp = {0,183},},
		{szName="Kim Phong Thi�n L� Th�o Th��ng Phi", tbProp = {0,184},},
		{szName="Kim Phong ��ng T��c Xu�n Th�m", tbProp = {0,185},},
}

function DisposeEquip:ShowDisposeUI()
	GiveItemUI("H�y v�t ph�m", "��i hi�p h�y c�n tr�ng trong vi�c h�y v�t ph�m!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	print("-------vao function DisposeConfirm ")
	if (nCount ~= 1) then 
		Talk(1, "", "M�i l�n ch� c� th� h�y ���c m�t v�t ph�m!!");
		return
	end
		
	local nItemIndex = GetGiveItemUnit(nCount)	
	local nBindState = GetItemBindState(nItemIndex)
	local nGoldEquipIdx = GetGlodEqIndex(nItemIndex)
	if (nBindState ~= -2) then
		Talk(1, "", "V�t ph�m c�n h�y ph�i l� v�t ph�m kh�a v�nh vi�n!");
		return
	end	
	local strItem = GetItemName(nItemIndex)
	--kiem tra trong danh sach
	local nCheck, szEquipName = DisposeEquip:CheckInList(nGoldEquipIdx)
	if (nCheck ~= 1) or (szEquipName ~=  strItem) then
		return Talk(1, "", "Tr��c m�t ta ch� h�y ���c trang b� Kim Phong kh�a, th� ng��i b� v�o kh�ng ph� h�p.");
	end
	RemoveItemByIndex(nItemIndex)
	Talk(1, "", format(" H�y trang b� <color=yellow>%s<color> th�nh c�ng.",strItem))
	Msg2Player(format("Ng��i v�a h�y trang b� %s th�nh c�ng.",strItem))
	local szactionlog = format("H�y trang b� %s th�nh c�ng.",strItem)
	tbLog:PlayerActionLog(DisposeEquip.LOG_TITLE,szactionlog)
end

function DisposeEquip:CheckInList(nGoldEquipIdx)
	local nFlag = 0
	local szEquipName = ""
	for i=1,getn(self.TbListEquip) do
		local tbItem = self.TbListEquip[i].tbProp
		if nGoldEquipIdx == tbItem[2] then
			nFlag = 1
			szEquipName = self.TbListEquip[i].szName
			break
		end
	end
	return nFlag,szEquipName
end

function OnCancel()
end


