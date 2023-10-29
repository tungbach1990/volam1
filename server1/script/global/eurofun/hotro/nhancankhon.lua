Include("\\script\\misc\\eventsys\\type\\npc.lua");
Include("\\script\\dailogsys\\dailogsay.lua");

NHANCANKHONTD = {
	["Kh�ng H�a - Th�i Gian Tr�ng ��c"] 		= 	{6578},
	["Kh�ng B�ng - Th�i Gian Tr�ng ��c"] 		= 	{6579},
	["Kh�ng L�i - Th�i Gian Tr�ng ��c"] 		= 	{6580},
	["Kh�ng ��c - Th�i Gian Tr�ng ��c"] 		= 	{6581},
	["PTVL - Th�i Gian Tr�ng ��c"] 				= 	{6582},
}

NHANCANKHONLC = {
	["Kh�ng H�a - Th�i Gian L�m Cho�ng"] 		= 	{6583},
	["Kh�ng B�ng - Th�i Gian L�m Cho�ng"] 		= 	{6584},
	["Kh�ng L�i - Th�i Gian L�m Cho�ng"] 		= 	{6585},
	["Kh�ng ��c - Th�i Gian L�m Cho�ng"] 		= 	{6586},
	["PTVL - Th�i Gian L�m Cho�ng"] 			= 	{6587},
}

NHANCANKHONLCH = {
	["Kh�ng H�a - Th�i Gian L�m Ch�m"] 			= 	{6588},
	["Kh�ng B�ng - Th�i Gian L�m Ch�m"] 		= 	{6589},
	["Kh�ng L�i - Th�i Gian L�m Ch�m"] 			= 	{6590},
	["Kh�ng ��c - Th�i Gian L�m Ch�m"] 			= 	{6591},
	["PTVL - Th�i Gian L�m Ch�m"] 				= 	{6592},
}
--------------------------------------------------------------------------------
function NhanCanKhon1()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "H�nh trang kh�ng �� 20 � tr�ng �� nh�n.")
	return end
	
	local tb_Equip = NHANCANKHONTD;
	local szTitle = "<dec><npc>B�n mu�n nh�n trang b� n�o?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, {format("Trang b� %s", x), AddEquipGoldOtherConfirm2,{tb_Equip[x]}})
	end
	tinsert(tbOption, {"K�t th�c ��i tho�i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldOtherConfirm2(tbKind)
		AddGoldItem(0, tbKind[1])
end
--------------------------------------------------------------------------------
function NhanCanKhon2()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "H�nh trang kh�ng �� 20 � tr�ng �� nh�n.")
	return end
	
	local tb_Equip = NHANCANKHONLC;
	local szTitle = "<dec><npc>B�n mu�n nh�n trang b� n�o?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, {format("Trang b� %s", x), AddEquipGoldOtherConfirm3,{tb_Equip[x]}})
	end
	tinsert(tbOption, {"K�t th�c ��i tho�i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldOtherConfirm3(tbKind)
		AddGoldItem(0, tbKind[1])
end
--------------------------------------------------------------------------------
function NhanCanKhon3()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "H�nh trang kh�ng �� 20 � tr�ng �� nh�n.")
	return end
	
	local tb_Equip = NHANCANKHONLCH;
	local szTitle = "<dec><npc>B�n mu�n nh�n trang b� n�o?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, {format("Trang b� %s", x), AddEquipGoldOtherConfirm4,{tb_Equip[x]}})
	end
	tinsert(tbOption, {"K�t th�c ��i tho�i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldOtherConfirm4(tbKind)
		AddGoldItem(0, tbKind[1])
end
--------------------------------------------------------------------------------