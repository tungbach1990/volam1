--T�nh n�ng tr�ng luy�n trang b� T� M�ng - Created by DinhHQ - 20110517

Include("\\script\\vng_feature\\trungluyen\\globalvar.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

tbVNG_RefineEquip = {}


function tbVNG_RefineEquip:ShowDialog()
	local strDesc = "�� tr�ng luy�n c�n 1 <color=yellow>trang b� T� M�ng<color> b�t k� v� s� l��ng <color=yellow>Ng�c Tr�ng Luy�n<color> t�y theo lo�i trang b� nh� sau:"
	strDesc = strDesc..format("\n\t\t\t\t\t%-29s%s", "Trang b�", "Ng�c c�n")
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "T� M�ng Kh�i", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "T� M�ng Y", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "T� M�ng H�i", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "T� M�ng Y�u ��i", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "T� M�ng H� Uy�n", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "T� M�ng H�ng Li�n", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "T� M�ng B�i", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "T� M�ng Gi�i Ch�", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "T� M�ng Kh� Gi�i", 3)
	Describe(strDesc, 2, "Ta mu�n tr�ng luy�n/#tbVNG_RefineEquip:main()", "��ng/OnCancel")
end

function tbVNG_RefineEquip:main()
	local nTaskVal = PlayerFunLib:GetTaskDailyCount(nTSK_DAILY_REFINE_LIMIT)
	if nTaskVal >= nDAILY_REFINE_MAX_COUNT then
		Talk(1, "", format("M�i ng�y ch� c� th� tr�ng luy�n trang b� <color=red>%d<color> l�n, mai r�i h�y quay l�i!", nDAILY_REFINE_MAX_COUNT))
		return
	end
	
	local strDesc = format("%-22s%s\n", "Trang b�", "Ng�c c�n")
	strDesc = strDesc..format("\n%-29s%d", "T� M�ng Kh�i", 1)
	strDesc = strDesc..format("\n%-29s%d", "T� M�ng Y", 2)
	strDesc = strDesc..format("\n%-29s%d", "T� M�ng H�i", 2)
	strDesc = strDesc..format("\n%-29s%d", "T� M�ng Y�u ��i", 1)
	strDesc = strDesc..format("\n%-29s%d", "T� M�ng H� Uy�n", 1)
	strDesc = strDesc..format("\n%-29s%d", "T� M�ng H�ng Li�n", 2)
	strDesc = strDesc..format("\n%-29s%d", "T� M�ng B�i", 2)
	strDesc = strDesc..format("\n%-29s%d", "T� M�ng Gi�i Ch�", 2)
	strDesc = strDesc..format("\n%-29s%d", "T� M�ng Kh� Gi�i", 3)
	GiveItemUI("Tr�ng luy�n T� M�ng", strDesc, "RefineUIConfirm", "OnCancel")
end

function RefineUIConfirm(nCount)	
	local tbGoldEquip = {}
	local tbStoneList = {}
	local nTempIdx = 0
	local nItemQuality = -1
	for i = 1, nCount do
		nTempIdx = GetGiveItemUnit(i)
		if nTempIdx < 0 then
			Talk(1, "", "V�t ph�m kh�ng h�p l�")
			return
		end
		nItemQuality = GetItemQuality(nTempIdx)
		--item ho�ng kim
		if nItemQuality == 1 then
			tinsert(tbGoldEquip, getn(tbGoldEquip) + 1 ,nTempIdx)
		else --item th��ng
			tinsert(tbStoneList, getn(tbStoneList) + 1, nTempIdx)		
		end	
	end
	
	--Ki�m tra item c� h�p l� kh�ng
	local nResult, strFailMessage = tbVNG_RefineEquip:CheckItems(tbGoldEquip, tbStoneList)
	if nResult ~= 1 and strFailMessage then
		Talk(1, "", strFailMessage)
		return
	end
	
	local nGoldEquipID = GetGlodEqIndex(tbGoldEquip[1]) 
	
	--X�a nguy�n li�u
	local nConsumeResult, strConsumeFailMessage = tbVNG_RefineEquip:ConsumeItems(tbGoldEquip, tbStoneList)
	if nConsumeResult ~= 1 and strConsumeFailMessage then
		Talk(1, "", strConsumeFailMessage)
		return
	end
	PlayerFunLib:AddTaskDaily(nTSK_DAILY_REFINE_LIMIT, 1)
	local nNextEquipIdx = AddGoldItem(0, nGoldEquipID)
	if nNextEquipIdx <= 0 then
		Msg2Player("Tr�ng luy�n trang b� th�t b�i, m�t m�t s� nguy�n li�u!")
		tbLog:PlayerActionLog("TrungLuyenTuMang","AddTrangBiThatBai", "", "", "", SubWorld)
		return
	end
	Msg2Player("<color=green>Tr�ng luy�n trang b� th�nh c�ng, xin ki�m tra l�i h�nh trang")
	tbLog:PlayerActionLog("TrungLuyenTuMang","AddTrangBiThanhCong", GetItemName(nNextEquipIdx), GetGlodEqIndex(nNextEquipIdx), 1, SubWorld)
end

function tbVNG_RefineEquip:CheckItems(tbGold, tbStone)
	--Ki�m tra  trang b� ho�ng kim b� v�o
	if getn(tbGold) > 1 or getn(tbGold) <= 0 then
		return 0, "M�i l�n ch� tr�ng luy�n 1 trang b� T� M�ng"
	end
	
	local nGoldEquipID = GetGlodEqIndex(tbGold[1])
	
	--Trang b� b� v�o kh�ng ph�i T� M�ng
	if not tbRE_Formula[nGoldEquipID] then
		return 0, "Trang b� b� v�o kh�ng h�p l�, xin ��i hi�p ki�m tra l�i."
	end
	
	--Ki�m tra tr�ng th�i kh�a
	local nBindState = GetItemBindState(tbGold[1])
	if nBindState ~= 0 then
		return 0, "Trang b� �ang trong tr�ng th�i kh�a v�nh vi�n, kh�ng th� tr�ng luy�n!."
	end
	
	--Ki�m tra �� b�n trang b�
	local nG, _, _ = GetItemProp(tbGold[1])
	if nG == 7 then
		return 0, "Trang b� �� b� h�ng, kh�ng th� tr�ng luy�n!."
	end
	
	--Ki�m tra s� l��ng ng�c
	local nStoneRequire = tbRE_Formula[nGoldEquipID].nStoneRequire
	if getn(tbStone) ~= nStoneRequire then
		return 0, "Kh�ng �� nguy�n li�u, kh�ng th� tr�ng luy�n!"
	end	
	
	--Ki�m tra t�nh h�p l� c�a s�  ng�c b� v�o
	for i = 1, getn(tbStone) do
		if self:CheckStone(tbStone[i]) ~= 1 then
			return 0, "V�t ph�m b� v�o kh�ng h�p l�, xin h�y ki�m tra l�i!"
		end
	end	
	
	return 1
end

function tbVNG_RefineEquip:CheckStone(nStoneIdx)
	local nG, nD, nP = GetItemProp(nStoneIdx)
	if nG ~= tbSTONE_GDP.nG or nD ~= tbSTONE_GDP.nD or nP ~= tbSTONE_GDP.nP then
		return 0
	end
	return 1
end

function tbVNG_RefineEquip:ConsumeItems(tbGold, tbStone)
	--consume stones
	local nStoneIdx = 0
	local nStoneRemoved = 0
	for i = 1, getn(tbStone) do
		nStoneIdx = tbStone[i]
		local nG, nD, nP = GetItemProp(nStoneIdx)
		local strItemCode = nG..", "..nD..", "..nP
		local strStoneName = GetItemName(nStoneIdx)
		if IsMyItem(nStoneIdx) ~= 1 then
			tbLog:PlayerActionLog("TrungLuyenTuMang","NgocTrungLuyenKhongConTrenNguoi", strStoneName, strItemCode, 1, SubWorld)
			return 0, "V�t ph�m kh�ng c�n tr�n ng��i, tr�ng luy�n th�t b�i, m�t m�t s� nguy�n li�u!!"
		end
		if RemoveItemByIndex(nStoneIdx) ~= 1 then
			tbLog:PlayerActionLog("TrungLuyenTuMang","XoaNguyenLieuThatBai", strStoneName, strItemCode, 1, SubWorld)
			return 0, "Tr�ng luy�n trang b� th�t b�i, m�t m�t s� nguy�n li�u!"
		else			
			tbLog:PlayerActionLog("TrungLuyenTuMang","XoaNguyenLieuThanhCong", strStoneName, strItemCode, 1, SubWorld)
			nStoneRemoved = nStoneRemoved + 1
		end
	end
	if nStoneRemoved ~= getn(tbStone) then
		tbLog:PlayerActionLog("TrungLuyenTuMang","TrungLuyenThatBai", "SoLuongNgocKhongDongBo")
		return 0, "Tr�ng luy�n trang b� th�t b�i, m�t m�t s� nguy�n li�u!"
	end
	--consume gold equip
	local nGoldEquipIdx = tbGold[1]
	local strEquipName = GetItemName(nGoldEquipIdx)
	local nEquipID = GetGlodEqIndex(nGoldEquipIdx)
	if IsMyItem(nGoldEquipIdx) ~= 1 then
		tbLog:PlayerActionLog("TrungLuyenTuMang","TrangBiKhongConTrenNguoi", strEquipName, nEquipID, 1, SubWorld)
		return 0, "V�t ph�m kh�ng c�n tr�n ng��i, tr�ng luy�n th�t b�i, m�t m�t s� nguy�n li�u!!"
	end
	
	if RemoveItemByIndex(nGoldEquipIdx) ~= 1 then
		tbLog:PlayerActionLog("TrungLuyenTuMang","XoaTrangBiThatBai", strEquipName, nEquipID, 1, SubWorld)
		return 0, "Tr�ng luy�n th�t b�i, m�t m�t s� nguy�n li�u!!"
	else	
		tbLog:PlayerActionLog("TrungLuyenTuMang","XoaTrangBiThanhCong", strEquipName, nEquipID, 1, SubWorld)
		return 1
	end	
end

function OnCancel()
end