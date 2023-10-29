
Include("\\script\\misc\\eventsys\\type\\npc.lua");
Include("\\script\\dailogsys\\dailogsay.lua");

EQUIP_ANHHAO = {
	[0] = {
		["Thi�u L�m Quy�n"] 					= 		{6283, 6292},
		["Thi�u L�m B�ng"] 					= 		{6293, 6302},
		["Thi�u L�m �ao"] 						=		 	{6303, 6312},
	},
	[1] = {
		["Thi�n V��ng Ch�y"] 				= 		{6313, 6322},
		["Thi�n V��ng Th��ng"] 			= 		{6323, 6332},
		["Thi�n V��ng �ao"] 					=			{6333, 6342},
	},
	[4] = {
		["Nga My Ki�m"] 						= 		{6343, 6352},
		["Nga My Ch��ng"] 					= 		{6353, 6362},
	},
	[5] = {
		["Th�y Y�n �ao"] 						= 		{6363, 6372},
		["Th�y Y�n Song �ao"] 				= 		{6373, 6382},
	},
	[3] = {
		["Ng� ��c Ch��ng"] 					= 		{6383, 6392},
		["Ng� ��c �ao"] 							= 		{6393, 6402},
	},
	[2] = {
		["���ng M�n Phi �ao"] 			= 		{6403, 6412},
		["���ng M�n T� Ti�n"] 			= 		{6413, 6422},
		["���ng M�n Phi Ti�u"] 			=			{6423, 6432},
	},
	[6] = {
		["C�i Bang Ch��ng"] 					= 		{6433, 6442},
		["C�i Bang C�n"] 						= 		{6443, 6452},
	},
	[7] = {
		["Thi�n Nh�n K�ch"] 					= 		{6453, 6462},
		["Thi�n Nh�n �ao"] 					= 		{6463, 6472},
	},
	[8] = {
		["V� �ang Quy�n"] 					= 		{6473, 6482},
		["V� �ang Ki�m"] 						= 		{6483, 6492},
	},
	[9] = {
		["C�n L�n �ao"] 							= 		{6493, 6502},
		["C�n L�n Ki�m"] 						= 		{6503, 6512},
	},
	[10] = {
		["Hoa S�n Ki�m T�ng"] 				= 		{6513, 6522},
		["Hoa S�n Kh� T�ng"] 				= 		{6523, 6532},
	},
	[11] = {
		["V� H�n Thu�n"] 				= 		{7318, 7327},
		["V� H�n �ao"] 				= 		{7328, 7337},
	},
};



TAB_EQUIP_FACTION = {
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
	[10] = "Hoa S�n",
	[11] = "V� H�n",
};

function TrangBiHoangKimCaoCap()
	local szTitle = "Ng��i mu�n nh�n trang b� lo�i n�o?";
	local tbOption = {}
		tinsert(tbOption, {"Trang b� Anh H�o", AddEquipGoldSpecical, {EQUIP_ANHHAO}})
		tinsert(tbOption, {"K�t th�c ��i tho�i."})
	CreateNewSayEx(szTitle, tbOption)
end


-- Load danh s�ch t�t c� c�c ph�i
function AddEquipGoldSpecical(nTableEquip)
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "H�nh trang kh�ng �� 20 � tr�ng �� nh�n.")
	return end
	
	local n_Faction = GetLastFactionNumber();
	if (n_Faction < 0) then
		Talk(1, "", "B�n ch�a gia nh�p m�n ph�i, kh�ng th� nh�n trang b� n�y")
	return end
	
	local szTitle = "<dec><npc>B�n mu�n nh�n trang b� c�a m�n ph�i n�o?";
	local tbOption = {};
	local tb_Equip = nTableEquip;
	local tb_Faction = TAB_EQUIP_FACTION;
	for i = 0, getn(tb_Equip) do
		tinsert(tbOption, {format("Trang b� ph�i %s", tb_Faction[i]), AddEquipGoldConfirm, {tb_Equip[i]}})
	end
		tinsert(tbOption, {"K�t th�c ��i tho�i."})
	CreateNewSayEx(szTitle, tbOption)
end

function AddEquipGoldConfirm(tb_EquipFaction)
	local tb_Equip = tb_EquipFaction;
	local tb_Faction = TAB_EQUIP_FACTION;
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
