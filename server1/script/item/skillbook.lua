-- ����
IncludeLib("SETTING");
Include("\\script\\global\\login_head.lua")
-- ItemParticular={MagicID,IniLevel, NeedFaction, BookName, SkillName}
local faction_skill_list = {
	[0] = {[90] = {318, 319, 321}, [120] = {709}, [150] = {1055, 1056, 1057},},
	[1] = {[90] = {322, 325, 323}, [120] = {708}, [150] = {1058, 1059, 1060},},
	[2] = {[90] = {339, 302, 342, 351,}, [120] = {710}, [150] = {1069, 1070, 1071, 1110},},
	[3] = {[90] = {353, 355, 390}, [120] = {711}, [150] = {1066, 1067},},
	[4] = {[90] = {380, 328, 332}, [120] = {712}, [150] = {1061, 1062, 1114},},
	[5] = {[90] = {336, 337}, [120] = {713}, [150] = {1063, 1065},},
	[6] = {[90] = {357, 359}, [120] = {714}, [150] = {1073, 1074}},
	[7] = {[90] = {361, 362, 391}, [120] = {715}, [150] = {1075, 1076},},
	[8] = {[90] = {365, 368}, [120] = {716}, [150] = {1078, 1079},},
	[9] = {[90] = {372, 375, 394}, [120] = {717}, [150] = {1080, 1081},},
}

sbook_list =
{	-- ��ʽ��{����ID, ���ܵȼ�, ����ID, ���輶��, ����������, ��������}
	[27] = {302, 1, 2, 80, "'T� Ti�n thu�t. B�o V� L� Hoa' ",	"B�o V� L� Hoa"},
	[28] = {351, 0, 2, 80, "'H�m T�nh thu�t. Lo�n Ho�n K�ch' ",	"Lo�n Ho�n K�ch"},
	[33] = {365, 1, 8, 80, "Th�i C�c Quy�n Ph�- Quy�n 3 ",	"Thi�n ��a V� C�c "},
	[34] = {368, 1, 8, 80, "'Th�i C�c Ki�m Ph�. Quy�n 2' ",	"Nh�n Ki�m H�p Nh�t  "},
	[35] = {361, 1, 7, 80, "'V�n Long K�ch. M�u ph�p' ",		"V�n Long K�ch"},
	[36] = {362, 1, 7, 80, "'L�u Tinh. �ao ph�p' ",		"Thi�n Ngo�i L�u Tinh"},
	[37] = {325, 1, 1, 80, "'Thi�n V��ng Ch�y Ph�p. Quy�n 1' ",	"Truy Phong Quy�t "},
	[38] = {323, 1, 1, 80, "Thi�n V��ng Th��ng ph�p- Quy�n 2 ", 	"Truy Tinh Tr�c Nguy�t "},
	[39] = {322, 1, 1, 80, "Thi�n V��ng �ao ph�p - Quy�n 3 ",	"Ph� Thi�n Tr�m "},
	[40] = {336, 1, 5, 80, "'Th�y Y�n �ao ph�p' ",			"B�ng Tung V� �nh "},
	[41] = {337, 1, 5, 80, "'Th�y Y�n Song �ao' ",			"B�ng T�m Ti�n T�  "},
	[42] = {328, 1, 4, 80, "'Di�t Ki�m M�t T�ch' ",			"Tam Nga T� Tuy�t "},
	[43] = {380, 1, 4, 80, "'Nga Mi Ph�t Quang Ch��ng M�t T�ch' ",	"Phong S��ng To�i �nh "},
	[45] = {339, 1, 2, 80, "'Phi �ao thu�t. Nhi�p H�n Nguy�t �nh' ",	"Nhi�p H�n Nguy�t �nh"},
	[46] = {342, 1, 2, 80, "'Phi Ti�u thu�t. C�u Cung Phi Tinh' ",	"C�u Cung Phi Tinh"},
	[47] = {353, 1, 3, 80, "'Ng� ��c Ch��ng Ph�p. Quy�n 1' ",	"�m Phong Th�c C�t "},
	[48] = {355, 1, 3, 80, "'Ng� ��c �ao ph�p. Quy�n 2' ",	"Huy�n �m Tr�m "},
	[49] = {390, 0, 3, 80, "'Ng� ��c Nhi�p T�m thu�t. Quy�n 3' ",	"�o�n C�n H� C�t "},
	[50] = {372, 1, 9, 80, "'Ng� Phong thu�t' ",			"Ng�o Tuy�t Ti�u Phong "},
	[51] = {375, 1, 9, 80, "'Ng� L�i thu�t' ",			"L�i ��ng C�u Thi�n "},
	[52] = {394, 0, 9, 80, "'Ng� T�m thu�t' ",			"T�y Ti�n T� C�t"},
	[53] = {391, 0, 7, 80, "Nhi�p H�n - Tr��c Ch� ",		"Nhi�p H�n Lo�n T�m "},
	[54] = {357, 1, 6, 80, "'C�i Bang Ch��ng Ph�p' ",			"Phi Long T�i Thi�n "},
	[55] = {359, 1, 6, 80, "C�i Bang C�n Ph�p ",			"Thi�n H� V� C�u "},
	[56] = {318, 1, 0, 80, "'Thi�u L�m Quy�n Ph�p. Quy�n 1' ",	"��t Ma �� Giang"},
	[57] = {319, 1, 0, 80, "'Thi�u L�m C�n ph�p. Quy�n 2' ",	"Ho�nh T�o Thi�n Qu�n"},
	[58] = {321, 1, 0, 80, "'Thi�u L�m �ao ph�p. Quy�n 3' ",	"V� T��ng Tr�m "},
	[59] = {332, 0, 4, 80, "'Ph� �� M�t T�ch' ",			"Ph� �� Ch�ng Sinh "},
}

function CheckIsCanGet150SkillTask()
		--M� nhi�m v� nh�n k� n�ng 150 - Modified By NgaVN - 20121207
	local nValue = GetTask(2885)
	if nValue > 0 then
		return
	end
	--Ch�nh s�a nh�n nv k� n�ng 150 ph�i tr�ng sinh 2 tr� l�n - Modified By NgaVN - 20121207
	local nTransLife = ST_GetTransLifeCount()
	local nHaveTSFlag = 0;
	if(nTransLife > 1 ) then
		nHaveTSFlag = 1
	end
	
	local nFact = GetLastFactionNumber()
	if nFact == nil or nFact < 0 or  nFact > 9 then
		return
	end
	local tb90Skill = %faction_skill_list[nFact][90]
	local nHave90SkillFlag = 0
	for i = 1, getn(tb90Skill) do
		if HaveMagic(tb90Skill[i]) >= 0 then
			nHave90SkillFlag = 1 
			break
		end
	end
	local tb120Skill = %faction_skill_list[nFact][120]
	local nHave120SkillFlag = 0
	for i = 1, getn(tb120Skill) do
		if HaveMagic(tb120Skill[i]) >= 0 then
			nHave120SkillFlag = 1 
			break
		end
	end
	local tb150Skill = %faction_skill_list[nFact][150]
	local nHave150SkillFlag = 0
	for i = 1, getn(tb150Skill) do
		if HaveMagic(tb150Skill[i]) >= 0 then
			nHave150SkillFlag = 1 
			break
		end
	end 
	if nHave150SkillFlag == 0 then
		if nHaveTSFlag ==1 and nHave90SkillFlag == 1 and nHave120SkillFlag == 1 and GetLevel() >= 150 then
			Msg2Player("<color=yellow>B�y gi� ng��i c� th� nh�n nhi�m v� k� n�ng c�p 150 <enter>")
		else
			local szMsg = "Ng��i mu�n nh�n nhi�m v� k� n�ng 150 c�n ph�i"
			local nFlag = 0
			
			if nHave90SkillFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s h�c ���c k� n�ng c�p 90", szMsg) 
				nFlag = 1
			end
			if nHave120SkillFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s h�c ���c k� n�ng c�p 120", szMsg) 
				nFlag = 1
			end
			
			---Ch�nh s�a nh�n nv k� n�ng 150 ph�i tr�ng sinh 2 tr� l�n - Modified By NgaVN - 20121207
			if nHaveTSFlag == 0 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s Tr�ng sinh 2 tr� l�n", szMsg) 
				nFlag = 1
			end
			
			if GetLevel() < 150 then
				if nFlag == 1 then
					szMsg = format("%s,", szMsg) 
				end
				szMsg = format("%s ��t ��n c�p 150", szMsg) 
				nFlag = 1
			end
			szMsg = format("<color=yellow>%s<color>", szMsg)
			Msg2Player(szMsg)
		end
	end
end

function LearnSkillByBook(index, list)

	if(GetLastFactionNumber() ~= list[index][3]) then							-- ����ָ������
		Msg2Player("B�n c�m l�y "..list[index][5].."Nghi�n c�u c� n�a ng�y, k�t qu� c�ng kh�ng l�nh ng� ���c g� ")
		return 1
	end
	if(GetLevel() < list[index][4]) then							-- ��δ��ָ������
		Msg2Player("B�n c�m l�y "..list[index][5].."Nghi�n c�u c� n�a ng�y, k�t qu� l�nh ng� r�t �t. ")
		return 1
	end
	if(HaveMagic(list[index][1]) ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� c�m "..list[index][5].."Nghi�n t�i ng�m lui, nh�ng c�ng kh�ng h�c ���c g� trong �� ")
		return 1
	end

	AddMagic(list[index][1], list[index][2])										-- ѧ�Ἴ��
	
	CheckIsCanGet150SkillTask()

	WriteLog(date("%H%M%S")..": T�i kho�n:"..GetAccount()..", nh�n v�t:"..GetName()..", S� d�ng: "..list[index][5].."�� h�c ���c: "..list[index][6]);
	Msg2Player("�� h�c ���c k� n�ng "..list[index][6].."'. ")
	return 0

end

function main(sel)
	Genre, DetailType, Particular=GetItemProp(sel)
	return LearnSkillByBook(Particular, sbook_list);
end

--M� nhi�m v� nh�n k� n�ng 150 - Modified By NgaVN - 20121207
--if login_add then login_add(CheckIsCanGet150SkillTask, 2) end