--function h� tr� trao th��ng trang b� ho�ng kim - Updated by DinhHQ - 20110920
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")
Include("\\script\\dailogsys\\dailogsay.lua");
tbVNEquiptInfo =
{
	[1] = 
		{
			strType = "Thanh C�u",
			nStartIndex = 905,
		},
	[2] =
		{
			strType = "V�n L�c",
			nStartIndex = 1135,
		},
	[3] =
		{
			strType = "Th��ng Lang",
			nStartIndex = 1365,
		},
	[4] =
		{
			strType = "Huy�n Vi�n",
			nStartIndex = 1595,
		},
	[5] =
		{
			strType = "T� M�ng",
			nStartIndex = 1825,
		},
	[6] =
		{
			strType = "Kim �",
			nStartIndex = 2055,
		},
	[7] =
		{
			strType = "B�ch H�",
			nStartIndex = 2285,
		},
	[8] =
		{
			strType = "Kim � (Max Option)",
			nStartIndex = 3235,
		},
	[9] =
		{
			strType = "B�ch H� (Max Option)",
			nStartIndex = 3895,
		},
	[10] =
		{
			strType = "X�ch L�n",
			nStartIndex = 2515,
		},
	[11] =
		{
			strType = "X�ch L�n (Max Option)",
			nStartIndex = 4136,
		},
	[12] =
		{
			strType = "Minh Ph��ng",
			nStartIndex = 2745,
		},
	[13] =
		{
			strType = "Minh Ph��ng (Max Option)",
			nStartIndex = 4863,
		},
}
--ch�n nh�nh k� t�n c�ng ch� ��o
tbVNFactionBranch = 
	{
		"Thi�u L�m quy�n ph�p",
		"Thi�u L�m c�n ph�p",
		"Thi�u L�m �ao ph�p",
		"Thi�n V��ng ch�y ph�p",
		"Thi�n V��ng th��ng ph�p",
		"Thi�n V��ng �ao ph�p",
		"Nga Mi ki�m ph�p",
		"Nga Mi ch��ng ph�p",
		"Th�y Y�n �ao ph�p",
		"Th�y Y�n song �ao",
		"Ng� ��c ch��ng ph�p",
		"Ng� ��c �ao ph�p", --12
		"���ng M�n phi �ao",
		"���ng M�n n� ti�n",
		"���ng M�n phi ti�u",
		"C�i Bang ch��ng ph�p",
		"C�i Bang c�n ph�p",
		"Thi�n Nh�n m�u ph�p",
		"Thi�n Nh�n �ao ph�p",
		"V� �ang quy�n ph�p",
		"V� �ang ki�m ph�p",
		"C�n L�n �ao ph�p",
		"C�n L�n ki�m ph�p",
	}
	
tbVnItemPos = {
	AMULET = 0,
	HELM = 1,
	UPPER_RING = 2,	
	CUFF = 3,
	BELT = 4,
	ARMOUR = 5,
	WEAPON = 6,
	BOOT = 7,
	PENDANT = 8,
	LOWER_RING = 9,
	WHOLE_SET = 10,
}

tbVnItemName = {
	[1] = {"H�ng Li�n", 0},
	[2] = {"��nh M�o", 1},
	[3] = {"Th��ng Gi�i Ch�", 2},
	[4] = {"H� Uy�n", 3},
	[5] = {"Y�u ��i", 4},
	[6] = {"Y Ph�c", 5},
	[7] = {"V� Kh�", 6},
	[8] = {"H�i T�", 7},
	[9] = {"Ng�c B�i", 8},
	[10] = {"H� Gi�i Ch�", 9},	
}

tbVnItemName2 = 
{
	[0] = "H�ng Li�n",
	[1] = "��nh M�o", 
	[2] = "Th��ng Gi�i Ch�",
	[3] = "H� Uy�n",
	[4] = "Y�u ��i",
	[5] = "Y Ph�c",
	[6] = "V� Kh�",
	[7] = "H�i T�",
	[8] = "Ng�c B�i",
	[9] = "H� Gi�i Ch�",
}

tbVnFreeCellBag = {
	[0] = {nW = 2, nH = 1},
	[1] = {nW = 2, nH = 2},
	[2] = {nW = 1, nH = 1},
	[3] = {nW = 1, nH = 2},
	[4] = {nW = 2, nH = 1},
	[5] = {nW = 2, nH = 3},
	[6] = {nW = 2, nH = 4},
	[7] = {nW = 2, nH = 2},
	[8] = {nW = 1, nH = 2},
	[9] = {nW = 1, nH = 1},
}

SHAOLIN_FACT_NUMB = 0
TIANWANG_FACT_NUMB = 1
TANGMEN_FACT_NUMB = 2
WUDU_FACT_NUMB = 3
EMEI_FACT_NUMB = 4
CUIYAN_FACT_NUMB = 5
GAIBANG_FACT_NUMB = 6
TIANREN_FACT_NUMB = 7
WUDANG_FACT_NUMB = 8
KUNLUN_FACT_NUMB = 9

tbEquipGroupByFaction = {
	[SHAOLIN_FACT_NUMB] = {1, 2, 3},
	[TIANWANG_FACT_NUMB] = {4, 5, 6},
	[TANGMEN_FACT_NUMB] = {13, 14, 15},
	[WUDU_FACT_NUMB] = {11, 12},
	[EMEI_FACT_NUMB] = {7, 8},
	[CUIYAN_FACT_NUMB] = {9, 10},
	[GAIBANG_FACT_NUMB] = {16, 17},
	[TIANREN_FACT_NUMB] = {18, 19},
	[WUDANG_FACT_NUMB] = {20, 21},
	[KUNLUN_FACT_NUMB] = {22, 23},
}
	
tbVNGetGoldEquip = {}

function tbVNGetGoldEquip:ShowEquipTypeDialog(tbItemProp)
	local tbDailog = DailogClass:new()
	tbDailog.szTitleMsg = "Xin ch�n lo�i trang b�!"
	for i = 1, getn(tbVNEquiptInfo) do
		tbDailog:AddOptEntry("B� Trang B� "..tbVNEquiptInfo[i].strType, self.ShowEquipBranchDialog, {self, i, tbItemProp})
	end
	tbDailog:Show()	
end

function tbVNGetGoldEquip:ShowSpecItemDialog(nType, tbItemProp)
	local tbDailog = DailogClass:new()
	local tbExclude = tbItemProp.tbExclude or nil
	tbDailog.szTitleMsg = "Xin ch�n m�n:"
	for i = 1, getn(tbVnItemName) do
		if not tbExclude then
		tbDailog:AddOptEntry(tbVnItemName[i][1], self.SelectSpecItem, {self, nType, tbItemProp, tbVnItemName[i][2]})
		else
			local bIsExcluded = nil
			for j = 1, getn(tbExclude) do
				if tbExclude[j] == i then
					bIsExcluded = 1
					break
				end
			end
			if  not bIsExcluded then
				tbDailog:AddOptEntry(tbVnItemName[i][1], self.SelectSpecItem, {self, nType, tbItemProp, tbVnItemName[i][2]})
			end
		end
	end
	tbDailog:Show()	
end

function tbVNGetGoldEquip:SelectSpecItem(nType, tbItemProp, nItemType)
	tbItemProp.nSpecificItem = nItemType
	self:ShowEquipBranchDialog(nType, tbItemProp)
end

function tbVNGetGoldEquip:ShowEquipBranchDialog(nType, tbItemProp)		
	local tbDailog = DailogClass:new()
	tbDailog.szTitleMsg = "Xin ch�n h� t�n c�ng ch� ��o:"
	if tbItemProp.nFaction then
		local nBranch
		for i = 1, getn(tbEquipGroupByFaction[tbItemProp.nFaction]) do
			nBranch = tbEquipGroupByFaction[tbItemProp.nFaction][i]
			tbDailog:AddOptEntry(tbVNFactionBranch[nBranch], self.GetGoldEquip, {self, nType, nBranch, tbItemProp})
		end
	else
		for nBranch = 1, 12 do
			tbDailog:AddOptEntry(tbVNFactionBranch[nBranch], self.GetGoldEquip, {self, nType, nBranch, tbItemProp})
		end
		tbDailog:AddOptEntry("Trang k�", self.ShowEquipBranchDialog2, {self, nType, tbItemProp})
	end
	tbDailog:Show()	
end

function tbVNGetGoldEquip:ShowEquipBranchDialog2(nType, tbItemProp)	
	local tbDailog = DailogClass:new()
	for nBranch = 1, 11 do
		tbDailog:AddOptEntry(tbVNFactionBranch[nBranch + 12], self.GetGoldEquip, {self, nType, nBranch + 12, tbItemProp})
	end
	tbDailog:AddOptEntry("Quay l�i", self.ShowEquipBranchDialog, {self, nType, tbItemProp})
	tbDailog:Show()	
end

function tbVNGetGoldEquip:ShowEquipBranchByFaction(nType, tbItemProp, nFaction)		
	local tbDailog = DailogClass:new()
	tbDailog.szTitleMsg = "Xin ch�n h� t�n c�ng ch� ��o:"
	local nCount = getn(tbEquipGroupByFaction[nFaction])
	if not nCount then
		return
	end
	local nBranch = 0
	for i = 1, nCount do
		nBranch = tbEquipGroupByFaction[nFaction][i]
		tbDailog:AddOptEntry(tbVNFactionBranch[nBranch], self.GetGoldEquip, {self, nType, nBranch, tbItemProp})
	end
	tbDailog:Show()	
end

function OnCancel()
end

function tbVNGetGoldEquip:GetGoldEquip(nType, nBranch, tbItemProp)
	if not tbItemProp	then
		print("tbItemProp is nil")
		return
	end		

	local nStartIDx = tbVNEquiptInfo[nType].nStartIndex + ((nBranch - 1) * 10)
	local nSpecificItem = tbItemProp.nSpecificItem or tbVnItemPos.WHOLE_SET
	--Ki�m tra h�nh trang	
	if tbItemProp.nIsSkipRoomCheck and tbItemProp.nIsSkipRoomCheck == -1 then	
	else
	if nSpecificItem == tbVnItemPos.WHOLE_SET then
		if CalcFreeItemCellCount() < 59 then
			Talk(1, "", "Xin h�y d�n tr�ng h�nh trang r�i h�y nh�n th��ng.")
			return
		end		
	else
		if CountFreeRoomByWH(tbVnFreeCellBag[nSpecificItem].nW, tbVnFreeCellBag[nSpecificItem].nH, 1) < 1 then
			Talk(1, "", format("Xin h�y ch�a <color=red>%d x %d <color>� tr�ng h�nh trang r�i h�y nh�n th��ng.", tbVnFreeCellBag[nSpecificItem].nW, tbVnFreeCellBag[nSpecificItem].nH))
			return
			end
		end
	end
	
	if tbItemProp.nItem2Consume then
 		if IsMyItem(tbItemProp.nItem2Consume) ~= 1 or RemoveItemByIndex(tbItemProp.nItem2Consume) ~= 1 then
 			return
 		end
	end
	
	--1 m�n
	if nSpecificItem >= 0 and nSpecificItem < tbVnItemPos.WHOLE_SET then
		local tbAward = {}
		tbAward.tbProp={0,nStartIDx + nSpecificItem}
		tbAward.nQuality = 1
		if tbItemProp.nBindState then
			tbAward.nBindState = tbItemProp.nBindState
		end
		if tbItemProp.nExpiredTime then
			tbAward.nExpiredTime = tbItemProp.nExpiredTime
		end
		if tbItemProp.tbTransLog then
			local tbTransLog = tbItemProp.tbTransLog
			tbAward.CallBack = function(nItemIdx)
				%tbVngTransLog:Write(%tbTransLog.strFolder, %tbTransLog.nID, %tbTransLog.strAction, GetItemName(nItemIdx), 1)
			end
		end
		if tbItemProp.tbLog then
			tbAwardTemplet:Give(tbAward, 1, tbItemProp.tbLog)		
		else
			tbAwardTemplet:Give(tbAward, 1)		
		end
		return
	end
	--c� b�
	local tbExclude = tbItemProp.tbExclude or nil
	local nEndIDx = nStartIDx + 9
	for i = nStartIDx, nEndIDx do		
		local bIsExcluded = nil
		if tbExclude then
			local nCurEquipType = i - nStartIDx + 1
			for j = 1, getn(tbExclude) do
				if tbExclude[j] == nCurEquipType then
					bIsExcluded = 1
					break
				end
			end
		end
		if not bIsExcluded then
			local tbAward = {}
			tbAward.tbProp={0,i}
			tbAward.nQuality = 1
			if tbItemProp.nBindState then
				tbAward.nBindState = tbItemProp.nBindState
			end
			if tbItemProp.nExpiredTime then
				tbAward.nExpiredTime = tbItemProp.nExpiredTime
			end
			if tbItemProp.tbTransLog then
				local tbTransLog = tbItemProp.tbTransLog
				tbAward.CallBack = function(nItemIdx)
					%tbVngTransLog:Write(%tbTransLog.strFolder, %tbTransLog.nID, %tbTransLog.strAction, GetItemName(nItemIdx), 1)
				end
			end
			if tbItemProp.tbLog then
				tbAwardTemplet:Give(tbAward, 1, tbItemProp.tbLog)		
			else
				tbAwardTemplet:Give(tbAward, 1)		
			end
		end
	end
end

function tbVNGetGoldEquip:UpgradeEquip(tbParam)
	g_GiveItemUI("��i trang b�", "", {self.GiveUIOk, {self, tbParam}}, nil, tbParam.bAccessBindItem)
end

function tbVNGetGoldEquip:GiveUIOk(tbParam, nCount)
	if GetFightState() ~= 0 then
		Talk(1, "", "Thao t�c n�y ch� th�c hi�n ���c t�i khu v�c phi chi�n ��u")
		return
	end
	if nCount <= 0 or nCount > 1 then
		Talk(1, "", "M�i l�n ch� ���c ��i 1 trang b�")
		return
	end
	local nItemIdx = GetGiveItemUnit(1)
	if nItemIdx <= 0 then
		return
	end
	local nItemSettingIdx = GetGlodEqIndex(nItemIdx)
	--Ki�m tra trang b� b� v�o c� ��ng lo�i kh�ng
	if (nItemSettingIdx < tbVNEquiptInfo[tbParam.nOldType].nStartIndex) or (nItemSettingIdx > (tbVNEquiptInfo[tbParam.nOldType].nStartIndex + 229)) then
		Talk(1, "", format("Ch� ���c ph�p ��i trang b� <color=red>%s<color>", tbVNEquiptInfo[tbParam.nOldType].strType))
		return
	end
	--ki�m tra c�c item kh�ng dc ph�p ��i
	if tbParam.tbExclude then
		local nItemType = mod(nItemSettingIdx - tbVNEquiptInfo[tbParam.nOldType].nStartIndex, 10)		
		for i = 1, getn(tbParam.tbExclude) do
			if nItemType == tbParam.tbExclude[i] then
				Talk(1, "", "Kh�ng ���c ph�p ��i "..tbVnItemName2[nItemType])
				return
			end
		end
	end
	
	if tbParam.pCallBack then
		tbParam.pCallBack()
	end
	nNewIdx = nItemSettingIdx + 230 * (tbParam.nNewType - tbParam.nOldType)
	if IsMyItem(nItemIdx) ~= 1 or RemoveItemByIndex(nItemIdx) ~= 1 then
		return
	end
	local tbAward = {tbProp={0,nNewIdx},nCount=1,nQuality = 1,}
	if tbParam.nBindState then
		tbAward.nBindState = tbParam.nBindState
	end
	tbAwardTemplet:Give(tbAward, 1, tbParam.tbLog)
end