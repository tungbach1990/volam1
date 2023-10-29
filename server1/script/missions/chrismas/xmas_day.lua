-- Created by Danielsun 2006-12-07
-- ʥ���ڻ
-- xmas_entry()
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\lib\\basic.lua")

TB_SnowMan = {
	-- 1.[�ɹ�]ѩ���� 2.[�ɹ�]ѩ��ID 3.[�ɹ�]���� 4.[ʧ��]ѩ���� 5.[ʧ��]ѩ��ID 6.[ʧ��]���� 7,��Ǯ 8,��ȡ��Ʒ�� 9,��ȡ��ƷID
	{"Ng��i tuy�t cho�ng kh�n xanh (��c bi�t)",  1319,   60,   "Ng��i tuy�t cho�ng kh�n xanh (th��ng)",    1322,  40,	1000,	"B�nh b� ��", 1325},
	{"Ng��i tuy�t cho�ng kh�n �� (��c bi�t)",  1320,   60,   "Ng��i tuy�t cho�ng kh�n �� (th��ng)",    1323,  40,	3000,	"B�nh kem",	1326},
	{"Ng��i tuy�t ��c bi�t",  					1321,   80,   					 "Ng��i tuy�t th��ng",    1324,  20,	5000,			"G� l�i", 1327},
}

TB_Material = {
 --1.��Ʒ��	2.����
 [1319] ={
	["6,1,1312"] = {"Hoa Tuy�t ",			10	},
	["6,1,1313"] =	{"C� r�t",		1	},
	["6,1,1314"] =	{"C�nh th�ng",	2	},
	["6,1,1315"] =	{"N�n gi�ng sinh",		1	},
	["6,1,1316"] =	{"Kh�n cho�ng xanh",	1	},
	},
 [1320] ={
	["6,1,1312"] = {"Hoa Tuy�t ",			10	},
	["6,1,1313"] =	{"C� r�t",		1	},
	["6,1,1314"] =	{"C�nh th�ng",	2	},
	["6,1,1315"] =	{"N�n gi�ng sinh",		1	},
	["6,1,1317"] =	{"Kh�n cho�ng ��",	1	},
	},
 [1321] ={
	["6,1,1312"] = {"Hoa Tuy�t ",			10	},
	["6,1,1313"] =	{"C� r�t",		1	},
	["6,1,1314"] =	{"C�nh th�ng",	2	},
	["6,1,1315"] =	{"N�n gi�ng sinh",		1	},
	["6,1,1318"] =	{"C�y th�ng ",		1	},
	},
}

TB_Message = {
	-- ��������
	"L�m ng��i tuy�t cho�ng kh�n xanh (��c bi�t) c�n 10 b�ng tuy�t, 1 c� r�t, 2 c�nh th�ng, 1 n�n, 1 kh�n cho�ng �� v� 1000 l��ng.",
	"L�m ng��i tuy�t cho�ng kh�n �� (��c bi�t) c�n 10 b�ng tuy�t, 1 c� r�t, 2 c�nh th�ng, 1 n�n, 1 kh�n cho�ng xanh v� 3000 l��ng.",
	"L�m ng��i tuy�t (��c bi�t) c�n 10 b�ng tuy�t, 1 c� r�t, 2 c�nh th�ng, 1 n�n, 1 c�y th�ng v� 5000 l��ng.",
}

GiftMsg = {
	-- ��ȡ��������
	"��i b�nh b� �� c�n m�t ng��i tuy�t cho�ng kh�n �� (��c bi�t)",
	"��i b�nh kem c�n m�t ng��i tuy�t cho�ng kh�n xanh (��c bi�t)",
	"��i g� l�i c�n m�t ng��i tuy�t ��c bi�t",
}

TSKTMP_ITEM_NUMC = 20;

function xmas_entry()
	aryDescribe = {
		"<dec><npc>��i qu� gi�ng sinh",
		"L�m ng��i tuy�t/want_snowman",
		"��i qu�/want_gift",
		"Ta c� vi�c, khi kh�c quay l�i/cancel",
		}
	CreateTaskSay(aryDescribe)
end
	
function want_snowman()
	if (isXmasTime() == 0) then
		CreateTaskSay({"<dec><npc>Ho�t ��ng �� k�t th�c.", "Ta bi�t r�i/cancel"});
		return 
	end;
	aryDescribe = {
		"<dec><npc>C� nhi�u lo�i ng��i tuy�t, nguy�n li�u m�i lo�i s� kh�c nhau, ng��i mu�n l�m lo�i n�o?",
		"T�o ng��i tuy�t cho�ng kh�n xanh (��c bi�t)/#do_snowman(1)",
		"T�o ng��i tuy�t cho�ng kh�n �� (��c bi�t)/#do_snowman(2)",
		"T�o ng��i tuy�t ��c bi�t/#do_snowman(3)",
		"Ta c� vi�c, khi kh�c quay l�i/cancel",
	}
	CreateTaskSay(aryDescribe)
end

function do_snowman(snown)
	SetTaskTemp(TSKTMP_ITEM_NUMC, snown);
	aryDescribe = TB_Message[snown]
	GiveItemUI("L�m ng��i tuy�t",aryDescribe,"do_snow_process","cancel",1)
end

function do_snow_process(nItemCount)
	local nItemNumC = GetTaskTemp(TSKTMP_ITEM_NUMC);
	local nItemPart = TB_SnowMan[nItemNumC][2]
	
	local tb_enhanceitem_count = {};
	for szkey, tb_item in TB_Material[nItemPart] do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end
	
	--�����Ʒƥ��
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		
		local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
		
		if(GetCash() < TB_SnowMan[nItemNumC][7]) then
			aryDescribe = {
				"<dec><npc>L�m ng��i tuy�t c�n ph�i c�"..TB_SnowMan[nItemNumC][7].."ti�n , ti�n tr�n ng��i ng��i kh�ng ��",
				"Bi�t r�i/cancel"
				}
			CreateTaskSay(aryDescribe)
			return
		end
		
		if (TB_Material[nItemPart][szItemKey] == nil) then
				CreateTaskSay(	{	"<dec><npc>"..TB_Message[nItemNumC]..", c�i n�y"..GetItemName(nCurItemIdx)..", ta kh�ng c�n c�i n�y, ng��i h�y nh�n l�i �i",
												"�� ta l�m l�i!/#do_snowman("..nItemNumC..")",
												"Ta s� quay l�i sau./cancel"	}	);
				return
		end
		tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
		tb_enhanceitem_count[szItemKey][2] = nCurItemName;
		if(tb_enhanceitem_count[szItemKey][1] > TB_Material[nItemPart][szItemKey][2] ) then
				CreateTaskSay(	{	"<dec><npc>"..TB_Message[nItemNumC]..", nh�ng ta kh�ng c�n nhi�u ��n th� <color=yellow>"..nCurItemName.."<color>Vui l�ng b� nh�ng m�n kh�ng c�n thi�t ra ngo�i.",
													"�� ta l�m l�i!/#do_snowman("..nItemNumC..")",
													"Ta s� quay l�i sau./cancel"	}	);
				return
		end
	end
	
	for szkey, tb_item in TB_Material[nItemPart] do
			if (tb_enhanceitem_count[szkey][1] ~= TB_Material[nItemPart][szkey][2]) then
				CreateTaskSay( { "<dec><npc> Ng��i qu�n b� nguy�n li�u v�o r�i <color=yellow>"..tb_enhanceitem_count[szkey][2].."<color> kh�ng ��. Kh�ng �� nguy�n li�u, ta kh�ng l�m ���c.",
			"�� ta l�m l�i!/#do_snowman("..nItemNumC..")",
			"Ta s� quay l�i sau./cancel"	}	);
				return
			end
	end
		
	--ɾ����
	for i=1, nItemCount do
		local nIdx = GetGiveItemUnit(i)
		if (RemoveItemByIndex(nIdx) ~= 1) then
			WriteLog("[T�o ng��i tuy�t]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t X�a v�t ph�m th�t b�i\t"..GetItemName(GetGiveItemUnit(i)));
			return
		end
	end
	Pay(TB_SnowMan[nItemNumC][7])
	
	 --����Ʒ
	 local str = "";
	 PItem = random() * 100;
	if(PItem < TB_SnowMan[nItemNumC][3]) then
	 
		str = "Ch� t�o th�nh c�ng <color=yellow>"..TB_SnowMan[nItemNumC][1].."<color>!"
		AddItem(6,1,TB_SnowMan[nItemNumC][2],1,0,0)
	else
		str = "Ch� t�o th�nh c�ng <color=yellow>"..TB_SnowMan[nItemNumC][4].."<color>!"
		AddItem(6,1,TB_SnowMan[nItemNumC][5],1,0,0)
	end
	Msg2Player(str)
	WriteLog("[T�o ng��i tuy�t]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t"..str);
end

function want_gift()
	if (isXmasTime() == 0) then
		CreateTaskSay({"<dec><npc>Ho�t ��ng �� k�t th�c.", "Ta bi�t r�i/cancel"});
		return 
	end;
	aryDescribe = {"<dec><npc>��i c�c m�n qu� t��ng �ng sau:\n Ng��i tuy�t th�t kh�n xanh---B�nh b� ��\n Ng��i tuy�t th�t kh�n ��---B�nh kem\n Ng��i tuy�t ��c bi�t---G� l�i \n L�a ch�n ��i qu�.",
								 "B�nh b� ��/#do_gift(1)",
								 "B�nh kem/#do_gift(2)",
								 "G� l�i/#do_gift(3)",
								 "T�m th�i kh�ng ��i/cancel",
		}
		CreateTaskSay(aryDescribe)
end

function do_gift(ngift)
		local Gcount = CalcEquiproomItemCount(6,1,TB_SnowMan[ngift][2],1)
		if(Gcount == 0) then
			Talk(1,"","Tr�n ng��i ng��i kh�ng c�"..TB_SnowMan[ngift][1]..". Kh�ng th� ��i qu�"..TB_SnowMan[ngift][8]..".")
		else  
			ConsumeEquiproomItem(1,6,1,TB_SnowMan[ngift][2],1)
			AddItem(6,1,TB_SnowMan[ngift][9],1,0,0)
			Msg = "B�n �� ��i th�nh c�ng"..TB_SnowMan[ngift][8]
			Msg2Player(Msg)
			WriteLog("[T�o ng��i tuy�t]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t exchange "..GetItemName(GetGiveItemUnit(i)).." for "..TB_SnowMan[ngift][8]);
		end
end


function pack(...)
	return arg
end

function cancel()
	SetTaskTemp(TSKTMP_ITEM_NUMC, 0);
end