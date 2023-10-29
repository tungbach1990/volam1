
Include("\\script\\misc\\eventsys\\type\\npc.lua");
Include("\\script\\dailogsys\\dailogsay.lua");

TRANGBIHIEM = {
	["V� Li�t"] 			= 	{5953, 5957},
	["C� S�n"] 				= 	{6705, 6716},
	["Th�n M�"] 				= 	{5933, 5938},
	["Phi Phong"] 				= 	{6733, 6735},
	["Trang S�c"] 				= 	{6262, 6282},
	["�n"] 				= 	{5930, 5932},
	["M�t N�"] 				= 	{5658, 5669},
}

TRANGBIHOANGKIM = {
	["V� Danh"] 				= 	{141, 142},
	["��ng S�t"] 			= 	{143, 146},
	["��nh Qu�c"] 			= 	{159, 163},
	["An Bang"] 				= 	{164, 167},
	["Thi�n Ho�ng"] 		= 	{168, 176},
	["Kim Phong"] 			= 	{177, 185},
	["Hi�p C�t"] 				= 	{186, 189},
	["Nh� T�nh"] 			= 	{190, 193},
	["Kim Quang"] 		= 	{194, 203},
	["H�ng �nh"] 			= 	{204, 207},
};

HOANGKIMMONPHAI = {
	[0] = {
		["Thi�u L�m (quy�n)"] 				= 		{1, 5},
		["Thi�u L�m (c�n)"] 					= 		{6, 10},
		["Thi�u L�m (�ao)"] 					= 		{11, 15},
	},
	
	[1] = {
		["Thi�n V��ng (ch�y)"] 			=	 		{16, 20},
		["Thi�n V��ng (th��ng)"]	 		=			{21, 25},
		["Thi�n V��ng (�ao)"] 				= 		{26, 30},
	},
	
	[2] = {
		["���ng M�n (phi �ao)"] 			= 		{71, 75},
		["���ng M�n (t� ti�n"] 				= 		{76, 80},
		["���ng M�n (phi ti�u)"] 			= 		{81, 85},
		["���ng M�n (b�y)"] 					= 		{86, 90},
	},
	
	[3] = {
		["Ng� ��c (ch��ng)"] 				= 		{56, 60},
		["Ng� ��c (�ao)"] 						= 		{61, 65},
		["Ng� ��c (b�a)"] 						= 		{66, 70},
	},
	
	[4] = {
		["Nga My (ki�m)"] 						= 		{31, 35},
		["Nga My (ch��ng)"]	 				= 		{36, 40},
		["Nga My (h� tr�)"] 					= 		{41, 45},
	},
	
	[5] = {
		["Th�y Y�n (�ao)"] 						= 		{46, 50},
		["Th�y Y�n (song �ao)"] 			= 		{51, 55},
	},
	
	[6] = {
		["C�i Bang (ch��ng)"] 				= 		{91, 95},
		["C�i Bang (b�ng)"] 					= 		{96, 100},
	},
	
	[7] = {
		["Thi�n Nh�n (k�ch)"] 				= 		{101, 105},
		["Thi�n Nh�n (�ao)"] 					= 		{106, 110},
		["Thi�n Nh�n (b�a)"] 					= 		{111, 115},
	},
	
	[8] = {
		["V� �ang (quy�n)"] 					= 		{116, 120},
		["V� �ang (ki�m)"] 					= 		{121, 125},
	},
	
	[9] = {
		["C�n L�n (�ao)"] 						= 		{126, 130},
		["C�n L�n (s�t)"] 						= 		{131, 135},
		["C�n L�n (b�a)"] 						= 		{136, 140},
	},
};

EQUIP_FACTION = {
	[0] = "Thi�u L�m",
	[1] = "Thi�n V��ng",
	[2] = "���ng M�n",
	[3] = "Ng� ��c",
	[4] = "Nga My",
	[5] = "Th�y Y�n",
	[6] = "C�i Bang",
	[7] = "Thi�n Nh�n",
	[8] = "V� �ang",
	[9] = "C�n L�n",
};
--------------------------------------------------
function TrangBiHiem()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "H�nh trang kh�ng �� 20 � tr�ng �� nh�n.")
	return end
	
	local tb_Equip = TRANGBIHIEM;
	local szTitle = "<dec><npc>B�n mu�n nh�n trang b� n�o?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, {format("Trang b� %s", x), AddEquipGoldOtherConfirm,{tb_Equip[x]}})
	end
		tinsert(tbOption, {"K�t th�c ��i tho�i."})
	CreateNewSayEx(szTitle, tbOption)
end
-------------------------------------------------------

function TrangBiHoangKim22()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "H�nh trang kh�ng �� 20 � tr�ng �� nh�n.")
	return end
	
	local tb_Equip = TRANGBIHOANGKIM;
	local szTitle = "<dec><npc>B�n mu�n nh�n trang b� c�a m�n ph�i n�o?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, {format("Trang b� %s", x), AddEquipGoldOtherConfirm,{tb_Equip[x]}})
	end
		tinsert(tbOption, {"Trang b� ho�ng kim m�n ph�i", AddEquipGoldBase})
		tinsert(tbOption, {"K�t th�c ��i tho�i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldOtherConfirm(tbKind)
	for nID = tbKind[1], tbKind[2] do
		AddGoldItem(0, nID)
	end
end

function AddEquipGoldBase()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "H�nh trang kh�ng �� 20 � tr�ng �� nh�n.")
	return end
	
	local n_Faction = GetLastFactionNumber();
	if (n_Faction < 0) then
		Talk(1, "", "B�n ch�a gia nh�p m�n ph�i, kh�ng th� nh�n trang b� n�y")
	return end
	
	if (n_Faction > 9) then
		Talk(1, "", "Hi�n t�i ch�a c� trang b� ho�ng kim m�n ph�i n�o n�o cho <color=red>Hoa S�n ph�i<color> c�!")
	return end
	
	local szTitle = "<dec><npc>B�n mu�n nh�n trang b� c�a m�n ph�i n�o?";
	local tbOption = {};
	local tb_Equip = HOANGKIMMONPHAI;
	local tb_Faction = EQUIP_FACTION;
	for i = 0, (getn(tb_Equip)-1) do
		tinsert(tbOption, {format("Trang b� ph�i %s", tb_Faction[i]), AddEquipGoldConfirm, {tb_Equip[i]}})
	end
		tinsert(tbOption, {"K�t th�c ��i tho�i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldConfirm(tb_EquipFaction)
	local tb_Equip = tb_EquipFaction;
	local tb_Faction = EQUIP_FACTION;
	local tbOption = {};
	local szTitle = "<dec><npc>M�i b�n ch�n ���ng t�n c�ng c� b�n?";
	for x, y in tb_Equip do
		tinsert(tbOption, {format("%s", x), AddEquipGoldSpecicalKind, {tb_Equip[x]}})
	end
		tinsert(tbOption, {"K�t th�c ��i tho�i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldSpecicalKind(tb_EquipKind)
	for nID = tb_EquipKind[1], tb_EquipKind[2] do
		AddGoldItem(0, nID)
	end
end

-- pEventType:Reg("T�nh n�ng th� nghi�m", "Trang b� ho�ng kim", TrangBiHoangKim);
-- pEventType:Reg("L�nh b�i T�n Th�", "Trang b� ho�ng kim", TrangBiHoangKim);