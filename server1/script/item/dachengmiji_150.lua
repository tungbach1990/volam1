-- ====================== ��i Th�nh b� k�p 150 ======================
--Create by: ThanLD
--date: 20130611
-- ======================================================


Include("\\script\\task\\system\\task_string.lua")

function main(nItemIdx)
	local n_fac = GetLastFactionNumber();
	if (n_fac < 0) then
		Talk(1, "", "H�nh nh� quy�n s�ch n�y mi�u t� v� c�ng cao c�p c�a c�c ��i m�n ph�i, ng��i kh�ng th� hi�u s� huy�n c� c�a n�.");
		return 1;
	end
	
	local tb_150skill = {
			[0] = {1055, 1056, 1057}, --Thieu Lan
			[1] = {1058, 1059, 1060}, --Thien Vuong
			[2] = {1069, 1070, 1071, 1110}, --Duong Mon
			[3] = {1066, 1067}, --Ngu Doc
			[4] = {1061, 1062, 1114}, -- Nga Mi
			[5] = {1063, 1065}, --Thuy Yen
			[6] = {1073, 1074}, -- Cai Bang
			[7] = {1075, 1076},-- Thien Nhan
			[8] = {1078, 1079}, --Vo Dang
			[9] = {1080, 1081}, -- ConLon
			[10] = {1384, 1369}, -- Hoa Son
			[11] = {1983, 1985}, -- Vu hon
	};
	
	local tb_Desc = {};
	for i = 1, getn(tb_150skill[n_fac]) do
		local skill = HaveMagic(tb_150skill[n_fac][i]);
		if (skill >=0 and skill  <18) then
			tinsert(tb_Desc, format("N�ng c�p ".."%s/#upgrade_skilllevel(%d)", GetSkillName(tb_150skill[n_fac][i]), tb_150skill[n_fac][i]));
		end
	end
	
	if (getn(tb_Desc) == 0) then
		Talk(1, "", "Ch� t�ng nh�ng K� n�ng d��i c�p 18, ho�c b�ng h�u v�n ch�a h�c k� n�ng 150.");
		return 1;
	end
	
	tinsert(tb_Desc, 1, "Ch�n k� n�ng c�n n�ng c�p:");
	tinsert(tb_Desc, "K�t th�c ��i tho�i/OnCancel");
	CreateTaskSay(tb_Desc);
	return 1;
end

function upgrade_skilllevel(n_skillid)
	local nCurSkill = HaveMagic(n_skillid)
	if (nCurSkill == -1 or nCurSkill >= 18) then
		Talk(1, "", "Ch� t�ng nh�ng K� n�ng d��i c�p 18 ")
		return	
	end
	if (ConsumeItem(3, 1, 6, 1, 30446, -1) == 1) then
		AddMagic(n_skillid, 20);
		WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\tUpGrade Skill:%d", 
				"��i Th�nh B� K�p 150", 
				GetLocalDate("%Y-%m-%d %X"),
				GetAccount(),
				GetName(),
				n_skillid	));
	end
end


function OnCancel()
end
