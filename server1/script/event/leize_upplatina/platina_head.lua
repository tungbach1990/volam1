IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\lib\\log.lua")

TB_PLATINAEQ_GOLDEQ ={
--[�׽�ID] = {�ƽ�ID,װ��������ֵ��ϵ��,װ����, �Ƿ���Ҫ���綦};
--[1] = {1, 1, 4, "����֮����ɮñ",bhunduding},
}

function LoadPlatinaEquipSettingTmp()
	
	local b1 = TabFile_Load("\\settings\\task\\equipex\\platina_def_tmp.txt", "PlatinaDataTmp")
	if b1~=1 then
		print("T�i t�p tin th�ng c�p trang b� B�ch Kim th�t b�i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("PlatinaDataTmp", "EQUIPNAME")
	
	for y = 2, nRowCount do
		local platinaid = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "PLATINAID"));
		
		local goldid = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "GOLDID"));
		local taskrate = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "TASKRATE"));
		local name = TabFile_GetCell("PlatinaDataTmp", y, "EQUIPNAME");
		local bhundunding = tonumber(TabFile_GetCell("PlatinaDataTmp", y, "HUNDUNDING"));
		
		if (bhundunding ~= nil and bhundunding == 1) then
			TB_PLATINAEQ_GOLDEQ[platinaid] = {platinaid, goldid, taskrate, name, bhundunding};
		else
			TB_PLATINAEQ_GOLDEQ[platinaid] = {platinaid, goldid, taskrate, name};
		end
	end	
end;

LoadPlatinaEquipSettingTmp()

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

--����ʯ��Ƭ�ļ�ֵ��
TB_UPGRADEITEM_VALUE ={
	["6,1,1308"] = {20000000, "B� Thi�n Th�ch (ti�u)", -1},
	["6,1,1309"] = {100000000, "B� Thi�n Th�ch (trung)", -1},
	["6,1,1310"] = {1000000000, "B� Thi�n Th�ch (��i)", -1},
	["6,1,1380"] = {3333333333, "B� Thi�n Th�ch (��i)", -1},
	["6,1,2127"] = {1, "B�c ��u luy�n kim thu�t (Quy�n 1)", -1, 6},
	["6,1,2160"] = {1, "B�c ��u luy�n kim thu�t (Quy�n 2)", -1, 7},
	["6,1,2161"] = {1, "B�c ��u luy�n kim thu�t (Quy�n 3)", -1, 8},
	["6,1,2162"] = {1, "B�c ��u luy�n kim thu�t (Quy�n 4)", -1, 9},
}

TB_GOLD2PLANITA_ITEM = {
	["6,1,1473"] = {1, "L�i Tr�ch Ch�y", -1},
}
TB_GOLD2PLANITA_ITEM_SP1	= {
	["6,1,1473"] = {1, "L�i Tr�ch Ch�y", -1},
	["6,1,1740"] = {1, "H�n ��n ��nh", -1},
}

tbUpGradeProcess = {
[1] = {
				tbUpItemList = TB_GOLD2PLANITA_ITEM,
				szErrorMsg = "<dec><npc>Ngo�i tr� <color=yellow>trang b� ho�ng kim<color>, ch� c� <color=yellow>L�i Tr�ch Ch�y<color> l� th� nguy�n li�u ta c�n, xin m�i h�y l�y nh�ng th� nguy�n li�u kh�c ra!",
				nItemQuality = 1,
				szGetEquipIDFunc = "GetGlodEqIndex",
				szContinueFunc = "want_upgoldeq",
				szDoProcessFunc = "UpgradePlatinaFromGoldItem"},
[3] = {
				tbUpItemList = TB_UPGRADEITEM_VALUE,
				szErrorMsg = "<dec><npc>Ngo�i <color=yellow>trang b� B�ch Kim<color>, ta c�n c�n  <color=yellow>m�nh B� Thi�n Th�ch<color> n�a, xin h�y gi� l�i nh�ng th� kh�c.",
				nItemQuality = 4,
				szGetEquipIDFunc = "GetPlatinaEquipIndex",
				szContinueFunc = "want_upplatinaeq",
				szDoProcessFunc = "UpgradePlatinaItem"},
[4] = {
				tbUpItemList = TB_GOLD2PLANITA_ITEM_SP1,
				szErrorMsg = "<dec><npc>Ngo�i tr� <color=yellow>trang b� ho�ng kim<color>, ch� c� <color=yellow>L�i Tr�ch Ch�y v� H�n ��n ��nh<color> l� nh�ng nguy�n li�u ta c�n, xin m�i h�y b� nh�ng nguy�n li�u kh�c ra.",
				nItemQuality = 1,
				szGetEquipIDFunc = "GetGlodEqIndex",
				szContinueFunc = "want_upgoldeq",
				szDoProcessFunc = "UpgradePlatinaFromGoldItem"},
}

function writeRecoinLog(szTitle, szLog)
	WriteLog(format("  %s\t%s\tNAME:%s\tACCOUNT:%s",GetLocalDate("%Y-%m-%d %H:%M:%S"), szTitle,GetName(),GetAccount()));
	WriteLog(format("  %s\t%s", GetLocalDate("%Y-%m-%d %H:%M:%S"), szLog));
end;
