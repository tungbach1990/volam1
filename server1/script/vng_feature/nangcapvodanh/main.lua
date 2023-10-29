Include("\\script\\vng_feature\\nangcapvodanh\\ringtable.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
tbVnRingUpgrade = {}--tbActivityCompose:new()
tbVnRingDowngrade = {}
tbVnRingRefine = {}
function tbVnRingUpgrade:SelectRing(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("N�ng c�p %s", strRingName), tbVnRingUpgrade.UpgradeSelectedRing, {tbVnRingUpgrade, strRingType}},
		{format("H� c�p %s", strRingName), tbVnRingDowngrade.SelectLevel, {tbVnRingDowngrade, strRingType}},
		{format("Tr�ng luy�n %s", strRingName), tbVnRingRefine.SelectLevel, {tbVnRingRefine, strRingType}},
		{"H�y b�"},
	}
	CreateNewSayEx("C�c h� c�n g�?", tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("N�ng c�p l�n %s c�p 1", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 1}},
		{format("N�ng c�p l�n %s c�p 2", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 2}},
		{format("N�ng c�p l�n %s c�p 3", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 3}},
		{format("N�ng c�p l�n %s c�p 4", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 4}},
		{format("N�ng c�p l�n %s c�p 5", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 5}},
		{format("N�ng c�p l�n %s c�p 6", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 6}},
		{format("N�ng c�p l�n %s c�p 7", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 7}},
--		{format("N�ng c�p l�n %s c�p 8", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 8}},
--		{format("N�ng c�p l�n %s c�p 9", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 9}},
--		{format("N�ng c�p l�n %s c�p 10", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 10}},
		{"H�y b�"},
	}
	CreateNewSayEx("C�c h� c�n g�?", tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing1(strRingType, nLevel)
	if nLevel < 1 or nLevel > 3 then
		error("upgrade ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, 0, 0)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "NangCap"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingUpgrade:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"Kh�ng H�a", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,1}},
		{"Kh�ng B�ng", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,2}},
		{"Kh�ng L�i", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,3}},
		{"Kh�ng ��c", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,4}},
		{"Ph�ng Th� V�t L�", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,5}},
		{"H�y b�"},
	}
	if nLevel > 4 then
		CreateNewSayEx(format("N�ng c�p nh�n <color=yellow>%s<color> l�n  c�p <color=yellow>%d<color>  cho ph�p gi� l�i kh�ng t�nh v� hi�u �ng hi�n t�i c�a nh�n, xin c�c h� h�y ch�n kh�ng t�nh v� hi�u �ng c�a nh�n hi�n t�i �ang c�:", strRingName, nLevel), tbOpt)
	else
		CreateNewSayEx(format("N�ng c�p nh�n <color=yellow>%s<color> l�n  c�p <color=yellow>%d<color>  cho ph�p c�c h� t�y � ch�n kh�ng v� hi�u �ng cho nh�n c�a m�nh, xin h�y l�a ch�n kh�ng t�nh:", strRingName, nLevel), tbOpt)
	end
end

function tbVnRingUpgrade:SelectOption2(strRingType, nLevel, nOption1)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"Th�i Gian Tr�ng ��c", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 1}},
		{"Th�i Gian Cho�ng", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 2}},
		{"Th�i Gian L�m Ch�m", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 3}},		
		{"H�y b�"},
	}
	if nLevel > 4 then
		CreateNewSayEx(format("N�ng c�p nh�n <color=yellow>%s<color> l�n  c�p <color=yellow>%d<color>  cho ph�p gi� l�i kh�ng t�nh v� hi�u �ng hi�n t�i c�a nh�n, xin c�c h� h�y ch�n kh�ng t�nh v� hi�u �ng c�a nh�n hi�n t�i �ang c�:", strRingName, nLevel), tbOpt)
	else
		CreateNewSayEx(format("N�ng c�p nh�n <color=yellow>%s<color> l�n  c�p <color=yellow>%d<color>  cho ph�p c�c h� t�y � ch�n kh�ng v� hi�u �ng cho nh�n c�a m�nh, xin h�y l�a ch�n kh�ng t�nh:", strRingName, nLevel), tbOpt)
	end
end

function tbVnRingUpgrade:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"X�c nh�n ch� t�o", tbVnRingUpgrade.UpgradeSelectedRing2, {tbVnRingUpgrade, strRingType, nLevel, nOption1, nOption2}},	
		{"Ta mu�n ch�n l�i", tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, nLevel}},		
		{"H�y b�"},
	}
	CreateNewSayEx(format("C�c h� �� l�a ch�n n�ng c�p l�n nh�n <color=yellow>%s<color>  c�p <color=yellow>%d<color>  <color=yellow>%s - %s<color>, ng��i c� mu�n ch� t�o ngay kh�ng?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing2(strRingType, nLevel, nFirstOpt, nSecondOpt)
	if nLevel < 3 or nLevel > 7 then
		error("upgrade ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "NangCap"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingUpgrade:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local nOpt1, nOpt2
	if nLevel > 0 and nLevel <= 3 then
		nOpt1 = 0
		nOpt2 = 0
	else
		nOpt1 = nFirstOpt
		nOpt2 = nSecondOpt
	end
	if not tbUnnamedRing[strRingType] or not tbUnnamedRing[strRingType][nLevel] or not tbUnnamedRing[strRingType][nLevel][nOpt1] or not tbUnnamedRing[strRingType][nLevel][nOpt1][nOpt2] then
		error("upgrade ring - cannot get ring info")
		return
	end
	local tbRing = tbUnnamedRing[strRingType][nLevel]
	local tbRing1 = tbRing[nOpt1][nOpt2]	
	local tbMat = {}	
	for i =1, getn(tbRing.tbCommonMaterial) do
		tinsert(tbMat, tbRing.tbCommonMaterial[i])
	end
	for i = 1, getn(tbRing1.tbMaterial) do
		tinsert(tbMat, tbRing1.tbMaterial[i])
	end	
	local tbFormula = {		
		tbMaterial = tbMat,		
		tbProduct = tbRing1.tbProduct,	
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	return tbFormula
end

--H� c�p nh�n
function tbVnRingDowngrade:SelectLevel(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("Ta c� nh�n c�p %d", 4), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 4}},
		{format("Ta c� nh�n c�p %d", 5), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 5}},
		{format("Ta c� nh�n c�p %d", 6), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 6}},
--		{format("Ta c� nh�n c�p %d", 7), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 7}},
--		{format("Ta c� nh�n c�p %d", 8), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 8}},
--		{format("Ta c� nh�n c�p %d", 9), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 9}},
--		{format("Ta c� nh�n c�p %d", 10), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 10}},
		{"H�y b�"},
	}
	CreateNewSayEx("Ch�c n�ng h� c�p nh�n <color=yellow>[Tinh X�o] V� Danh<color> gi�p c�c h� hu� b� kh�ng t�nh v� hi�u �ng c�a t�t c� c�c nh�n <color=yellow>[Tinh X�o]<color> c�p 4 tr� l�n v� ��a nh�n v� c�p 3, t� ��y c�c h� c� th� d�ng ch�c n�ng n�ng c�p �� ch�n l�i kh�ng t�nh v� hi�u �ng cho nh�n c�a m�nh. �� vi�c h� c�p ���c th�nh c�ng, tr��c ti�n ta c�n bi�t thu�c t�nh c�a nh�n c�c h� nh� th� n�o?", tbOpt)
end

function tbVnRingDowngrade:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("%s", tbOpt1Name[1]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 1}},
		{format("%s", tbOpt1Name[2]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 2}},
		{format("%s", tbOpt1Name[3]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 3}},
		{format("%s", tbOpt1Name[4]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 4}},
		{format("%s", tbOpt1Name[5]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 5}},
		{"H�y b�"},
	}
	CreateNewSayEx(format("H� c�p nh�n <color=yellow>%s<color> c�p <color=yellow>%d<color>", strRingName, nLevel), tbOpt)
end

function tbVnRingDowngrade:SelectOption2(strRingType, nLevel, nOpt1)
	local strRingName = tbRingName[strRingType]
	local strOpt1Name = tbOpt1Name[nOpt1]
	tbOpt = {
		{format("%s", tbOpt2Name[1]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 1}},
		{format("%s", tbOpt2Name[2]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 2}},
		{format("%s", tbOpt2Name[3]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 3}},		
		{"Ch�n l�i kh�ng t�nh", tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, nLevel}},
		{"H�y b�"},
	}
	CreateNewSayEx(format("H� c�p nh�n <color=yellow>%s<color> c�p <color=yellow>%d %s<color>", strRingName, nLevel, tbOpt1Name[nOpt1]), tbOpt)
end

function tbVnRingDowngrade:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"X�c nh�n h� c�p", tbVnRingDowngrade.DowngradeSelectedRing, {tbVnRingDowngrade, strRingType, nLevel, nOption1, nOption2}},	
		{"Ta mu�n ch�n l�i", tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, nLevel}},		
		{"H�y b�"},
	}
	CreateNewSayEx(format("C�c h� �� l�a ch�n h� c�p nh�n <color=yellow>%s<color>  c�p <color=yellow>%d<color>  <color=yellow>%s - %s<color>, ng��i c� mu�n ta l�m ngay kh�ng?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
end

function tbVnRingDowngrade:DowngradeSelectedRing(strRingType, nLevel, nFirstOpt, nSecondOpt)
	if nLevel < 4 or nLevel > 7 then
		error("downgrade ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "HaCap"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingDowngrade:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbFormula = tbVnRingUpgrade:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)	
	local tbMat = {}
	--ring material	
	tinsert(tbMat, tbFormula.tbProduct)		
	
	--other material
	local tbRing = tbUnnamedRing[strRingType]
	for i =1, getn(tbRing.tbDowngradeMaterial) do
		tinsert(tbMat, tbRing.tbDowngradeMaterial[i])
	end
	local tbFormula2 = {		
		tbMaterial = tbMat,
		tbProduct = tbRing[3][0][0].tbProduct,
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}	
	return tbFormula2
end

--tr�ng luy�n nh�n
function tbVnRingRefine:SelectLevel(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("Ta c� nh�n c�p %d", 4), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 4}},
		{format("Ta c� nh�n c�p %d", 5), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 5}},
		{format("Ta c� nh�n c�p %d", 6), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 6}},
		{format("Ta c� nh�n c�p %d", 7), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 7}},
--		{format("Ta c� nh�n c�p %d", 8), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 8}},
--		{format("Ta c� nh�n c�p %d", 9), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 9}},
--		{format("Ta c� nh�n c�p %d", 10), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 10}},
		{"H�y b�"},
	}
	CreateNewSayEx("Ta c� th� gi�p c�c h� t�ng c��ng c�c ch� s� c�a nh�n <color=yellow>[Tinh X�o] V� Danh<color>  m� v�n gi� nguy�n kh�ng v� thu�c t�nh hi�n c� th�ng qua ch�c n�ng tr�ng luy�n . �� vi�c h� c�p ���c th�nh c�ng, tr��c ti�n ta c�n bi�t thu�c t�nh c�a nh�n c�c h� nh� th� n�o?", tbOpt)
end

function tbVnRingRefine:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("%s", tbOpt1Name[1]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 1}},
		{format("%s", tbOpt1Name[2]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 2}},
		{format("%s", tbOpt1Name[3]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 3}},
		{format("%s", tbOpt1Name[4]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 4}},
		{format("%s", tbOpt1Name[5]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 5}},
		{"H�y b�"},
	}
	CreateNewSayEx(format("Tr�ng luy�n nh�n <color=yellow>%s<color> c�p <color=yellow>%d<color>", strRingName, nLevel), tbOpt)
end

function tbVnRingRefine:SelectOption2(strRingType, nLevel, nOpt1)
	local strRingName = tbRingName[strRingType]
	local strOpt1Name = tbOpt1Name[nOpt1]
	tbOpt = {
		{format("%s", tbOpt2Name[1]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 1}},
		{format("%s", tbOpt2Name[2]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 2}},
		{format("%s", tbOpt2Name[3]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 3}},		
		{"Ch�n l�i kh�ng t�nh", tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, nLevel}},
		{"H�y b�"},
	}
	CreateNewSayEx(format("Tr�ng luy�n nh�n <color=yellow>%s<color> c�p <color=yellow>%d %s<color>", strRingName, nLevel, tbOpt1Name[nOpt1]), tbOpt)
end

function tbVnRingRefine:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"X�c nh�n tr�ng luy�n", tbVnRingRefine.RefineSelectedRing, {tbVnRingRefine, strRingType, nLevel, nOption1, nOption2}},	
		{"Ta mu�n ch�n l�i", tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, nLevel}},		
		{"H�y b�"},
	}
	CreateNewSayEx(format("C�c h� �� l�a ch�n tr�ng luy�n nh�n <color=yellow>%s<color>  c�p <color=yellow>%d<color>  <color=yellow>%s - %s<color>, ng��i c� mu�n ta l�m ngay kh�ng?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
end

function tbVnRingRefine:RefineSelectedRing(strRingType, nLevel, nFirstOpt, nSecondOpt)
	if nLevel < 4 or nLevel > 7 then
		error("refine ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "TrungLuyen"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingRefine:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbFormula = tbVnRingUpgrade:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)	
	local tbMat = {}
	--ring material	
	tinsert(tbMat, tbFormula.tbProduct)		
	
	--other material
	local tbRing = tbUnnamedRing[strRingType]
	for i =1, getn(tbRing.tbRefineMaterial) do
		tinsert(tbMat, tbRing.tbRefineMaterial[i])
	end
	local tbFormula2 = {		
		tbMaterial = tbMat,
		tbProduct = tbFormula.tbProduct,
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}	
	return tbFormula2
end

function tbVnRingUpgrade:MainDialog()
	do return end
	local tbOpt = {
		{"[Tinh X�o] V� Danh Ch� Ho�n", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "VoDanhChiHoan"}},
		{"[Tinh X�o] V� Danh Gi�i Ch�", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "VoDanhGioiChi"}},
		{"[Tinh X�o] C�n Kh�n Gi�i Ch�", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "CanKhonGioiChi"}},
		{"H�y b�"},
	}
	local msg = "Ta c� th� gi�p c�c h� n�ng c�p, h� c�p, tr�ng luy�n c�c lo�i nh�n <color=yellow>[Tinh X�o]V� Danh<color>, tr��c ti�n ng��i h�y ch�n lo�i nh�n?"
	CreateNewSayEx(msg, tbOpt)
end
--pEventType:Reg("Th� r�n th�n b�", "Li�n quan ��n nh�n V� Danh", tbVnRingUpgrade.MainDialog, {tbVnRingUpgrade});