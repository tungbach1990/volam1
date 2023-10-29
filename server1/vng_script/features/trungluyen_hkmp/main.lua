Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\vng_script\\features\\trungluyen_hkmp\\head.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\lib\\progressbar.lua")
IncludeLib("ITEM")

function tbVngTrungLuyenHKMP:UpgradeEquip_UI()	
	local strDesc = format("Tr�ng luy�n 1 trang b� Ho�ng kim M�n Ph�i c�n 1 vi�n �� V� C�c.<enter>")	
	g_GiveItemUI("Tr�ng luy�n", strDesc, {self.UpgradeEquip, {self}}, nil, 1)
end

function tbVngTrungLuyenHKMP:UpgradeEquip()
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nGoldEquipID, nItemIndex =  self:CheckGoldEqInRoomUI(tbRoomItems)
	if not nGoldEquipID or not nItemIndex then 
		return
	end
	if self:CheckMaterialInRoomUI(tbRoomItems) ~= 1 then
		return
	end
	local szMsg = format("<npc>C� ph�i c�c h� mu�n tr�ng luy�n trang b� <color=yellow>%s<color> ?", GetItemName(nItemIndex))	
	local tbOpt = 
	{
		{"��ng � Tr�ng luy�n", self.UpgradeEquip_ProcessBar, {self,nGoldEquipID,nItemIndex}},
		{"�� ta ��t l�i nguy�n li�u", self.UpgradeEquip_UI, {self}},
		{"H�y b� "},
	}
	CreateNewSayEx(szMsg, tbOpt)		
end
local _UpgradeEquipOK = function(nGoldEquipID,nItemIndex)		
	local szEquipName = GetItemName(nItemIndex)
	
	local szKeyLog = tbVngTrungLuyenHKMP.EVENT_LOG_TITLE
	--tru nguyen lieu
	local tbProp = tbVngTrungLuyenHKMP.tbTrungLuyenMaterial.tbProp
	if ConsumeEquiproomItem(1, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
		tbLog:PlayerActionLog("Error TrungLuyenHKMP - Loi tru khong duoc Da Vo Cuc")
		return
	end

	--x�a trang b� tr�ng luy�n
	RemoveItemByIndex(nItemIndex)

	local tbEquip_Upgrade ={ {szName=szEquipName,tbProp={0,nGoldEquipID},nCount=1,nQuality = 1,}}
	tbAwardTemplet:Give(tbEquip_Upgrade, 1, {szKeyLog.."- [TrungLuyen]: ThanhCong"})	
	Talk(1,"",format("Ch�c m�ng c�c h� �� tr�ng luy�n th�nh c�ng trang b�: <color=yellow>%s<color> .",szEquipName))
end

local _OnBreak = function()
	Msg2Player("Tr�ng luy�n b� gi�n �o�n, h�y l�m l�i.")
end

function tbVngTrungLuyenHKMP:UpgradeEquip_ProcessBar(nGoldIndex,nItemIndex)
	tbProgressBar:OpenByConfig(20, %_UpgradeEquipOK, {nGoldIndex,nItemIndex}, %_OnBreak)
end

function tbVngTrungLuyenHKMP:CheckGoldEqInRoomUI(tbRoomItems)
	local nCountGoldEq = 0
	local nCountMaterial = 0
	local nItemIndex = 0
	local nGoldEquipID = 0 
	for i=1, getn(tbRoomItems) do
		if GetGlodEqIndex(tbRoomItems[i]) > 0 then
			nCountGoldEq = nCountGoldEq + 1
			nItemIndex = tbRoomItems[i] 
			nGoldEquipID = GetGlodEqIndex(tbRoomItems[i] )
		end
	end
	if nCountGoldEq ~= 1  then
		Talk(1,"","H�y ��t duy nh�t 1 m�n trang b� Ho�ng Kim M�n Ph�i mu�n Tr�ng luy�n.")	
		return nil
	end
	if nGoldEquipID == 0 then
		Talk(1,"","Trang b� n�y kh�ng th� n�ng c�p.")	
		return nil
	end
	if self:CheckAllStateEquip(nItemIndex) ~= 1 then
		return nil
	end	
	return nGoldEquipID, nItemIndex
end
--Kiem tra nguyen lieu
function tbVngTrungLuyenHKMP:CheckMaterialInRoomUI(tbRoomItems)	
	local nCountMaterial = 0	
	local nStackCount = 0	
	for i=1, getn(tbRoomItems) do
		local nItemIndex = tbRoomItems[i]
		local nG, nD, nP = GetItemProp(nItemIndex)
		local nQuality = GetItemQuality(nItemIndex)
		local nGoldEquipID = GetGlodEqIndex(nItemIndex)
		local tbProp = self.tbTrungLuyenMaterial.tbProp
		if nG == tbProp[1] and nD ==  tbProp[2] and nP ==  tbProp[3]  then
			nCountMaterial = nCountMaterial + 1	
			nStackCount = GetItemStackCount(nItemIndex)	
		elseif (nGoldEquipID <= 0) or (nGoldEquipID > 140) or (nQuality ~= 1) then
			Talk(1,"","Ch� ���c b� Trang b� Ho�ng Kim M�n Ph�i v�  �� V� C�c v�o.")	
			return 			
		end
	end
	if nCountMaterial ~= 1 or nStackCount ~= 1  then
		Talk(1,"","M�i l�n Tr�ng luy�n h�y b� duy nh�t 1 vi�n �� V� C�c.")	
		return 
	end	
	return 1
end
--kiem tra dk cua trang bi trung luyen
function tbVngTrungLuyenHKMP:CheckAllStateEquip(nItemIndex)
	local nG, nD, nP = GetItemProp(nItemIndex)
	local nQuality = GetItemQuality(nItemIndex)
	local nGoldEquipID = GetGlodEqIndex(nItemIndex)
	
	--trang bi ton hai
	if (nG == 7) then 
		Talk(1,"","Trang b� t�n h�i kh�ng th� ph�n gi�i hay n�ng c�p")
		return 0	
	end
	if (nGoldEquipID <= 0) or (nGoldEquipID > 140) or (nQuality ~= 1) then 
		Talk(1,"","Trang b� kh�ng ph�i ho�ng kim m�n ph�i kh�ng th� tr�ng luy�n.")
		return 0	
	end
	--kiem tra dk khoa, co thoi han su dung
	if  ITEM_GetExpiredTime(nItemIndex) > 0 or GetItemBindState(nItemIndex) ~= 0 then
		Talk(1,"","Trang b� c� th�i h�n s� d�ng ho�c kh�a v�nh vi�n kh�ng th� ph�n gi�i hay n�ng c�p")
		return 0	
	end
	
	if IsMyItem(nItemIndex) ~= 1 then
		Talk(1,"","Th�t th� m�i l� ��c t�nh t�t!!!")
		return 0
	end
	return 1
end
EventSys:GetType("AddNpcOption"):Reg("B�ch ngh� nh�n","Tr�ng luy�n trang b� ho�ng kim m�n ph�i", tbVngTrungLuyenHKMP.UpgradeEquip_UI,{tbVngTrungLuyenHKMP})


