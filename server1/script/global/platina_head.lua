IncludeLib("ITEM");
IncludeLib("FILESYS")

TB_PLATINAEQ_GOLDEQ ={
--[�׽�ID] = {�׽�ID, �ƽ�ID,װ��������ֵ��ϵ��,װ����};
--[1] = {1, 1, 4, "����֮����ɮñ"},
}

function LoadPlatinaEquipSetting()
	
	local b1 = TabFile_Load("\\settings\\task\\equipex\\platina_def.txt", "PlatinaData")
	if b1~=1 then
		print("T�i t�p tin th�ng c�p trang b� B�ch Kim th�t b�i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("PlatinaData", "EQUIPNAME")
	
	for y = 2, nRowCount do
		local platinaid = tonumber(TabFile_GetCell("PlatinaData", y, "PLATINAID"));
		
		local goldid = tonumber(TabFile_GetCell("PlatinaData", y, "GOLDID"));
		local taskrate = tonumber(TabFile_GetCell("PlatinaData", y, "TASKRATE"));
		local name = TabFile_GetCell("PlatinaData", y, "EQUIPNAME");
		
		TB_PLATINAEQ_GOLDEQ[platinaid] = {platinaid, goldid, taskrate, name};
	end	
end;

LoadPlatinaEquipSetting()

--�׽�װ�����ȼ������ļ�ֵ��
PLATINAEQ_UPGRADERATE_BASIC = 10000;
TB_PLATINAEQ_UPGRADERATE = {
	[0] = 2000*PLATINAEQ_UPGRADERATE_BASIC,
	[1] = 4000*PLATINAEQ_UPGRADERATE_BASIC,
	[2] = 6000*PLATINAEQ_UPGRADERATE_BASIC,
	[3] = 8000*PLATINAEQ_UPGRADERATE_BASIC,
	[4] = 10000*PLATINAEQ_UPGRADERATE_BASIC,
	[5] = 15000*PLATINAEQ_UPGRADERATE_BASIC,
	[6] = 30000*PLATINAEQ_UPGRADERATE_BASIC,
	[7] = 50000*PLATINAEQ_UPGRADERATE_BASIC,
	[8] = 80000*PLATINAEQ_UPGRADERATE_BASIC,
	[9] = 120000*PLATINAEQ_UPGRADERATE_BASIC,
};

-- �׽������ı���Ĳ���
tb_upgrade_material	=
{
	--[����ID] = {����������ֵ��������Level���������������������׽�}
	["6,1,1308"] 	= {szName = "B� Thi�n Th�ch (ti�u)", nValue = 20000000},
	["6,1,1309"] 	= {szName = "B� Thi�n Th�ch (trung)", nValue = 100000000},
	["6,1,1310"]	= {szName = "B� Thi�n Th�ch (��i)", nValue = 1000000000},
	["6,1,2127"]	= {szName = "B�c ��u luy�n kim thu�t (Quy�n 1)", nValue = 0, nCount = 1, nUpgradeLevel = 6},
	["6,1,2160"]	= {szName = "B�c ��u luy�n kim thu�t (Quy�n 2)", nValue = 0, nCount = 1, nUpgradeLevel = 7},
	["6,1,2161"]	= {szName = "B�c ��u luy�n kim thu�t (Quy�n 3)", nValue = 0, nCount = 1, nUpgradeLevel = 8},
	["6,1,2162"]	= {szName = "B�c ��u luy�n kim thu�t (Quy�n 4)", nValue = 0, nCount = 1, nUpgradeLevel = 9},
};

tb_gold2planita_material =
{
	["6,1,398"] 	= {szName = "Th�n b� kho�ng th�ch", nCount = 1},
	["6,1,147"] 	= {szName = "Huy�n Tinh Kho�ng Th�ch c�p 8", nItemLevel = 8, nCount = 1},
	["6,1,1309"]	= {szName = "B� Thi�n Th�ch (trung)", nCount = 1},
};

tbUpGradeProcess = {
[1] = {
				tbUpItemList = tb_gold2planita_material,
				szErrorMsg = "<dec><npc>Ngo�i <color=yellow>trang b� B�ch Kim<color>, ta c�n c�n <color=yellow>Th�n b� kho�ng th�ch<color>, color=yellow>Huy�n Tinh Kho�ng Th�ch c�p 8<color> v� <color=yellow>m�nh B� Thi�n Th�ch (trung)<color>, xin h�y gi� l�i nh�ng th� kh�c.",
				nItemQuality = 1,
				szGetEquipIDFunc = "GetGlodEqIndex",
				szContinueFunc = "want_upgoldeq",
				szDoProcessFunc = "UpgradePlatinaFromGoldItem"},
[3] = {
				tbUpItemList = tb_upgradematerial,
				szErrorMsg = "<dec><npc>Ngo�i <color=yellow>trang b� B�ch Kim<color>, ta c�n c�n  <color=yellow>m�nh B� Thi�n Th�ch<color> n�a, xin h�y gi� l�i nh�ng th� kh�c.",
				nItemQuality = 4,
				szGetEquipIDFunc = "GetPlatinaEquipIndex",
				szContinueFunc = "want_upplatinaeq",
				szDoProcessFunc = "UpgradePlatinaItem"},
}
