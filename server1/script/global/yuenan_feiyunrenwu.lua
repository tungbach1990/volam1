--Խ�Ϸ�������:���ʼ��������ﵽ�涨�ĵȼ���60����90����100��������ɵ�NPC����ȡ��Ӧ�Ľ���
--			a.	��Ҵﵽ60���󣬿��Ե��ٰ�������(����166/191) �Ի�����ȡ����������Ϊ��������
--				�������ԣ��������������ɫװ��һ��(��ָ�����/����������/����)��
--			b.	��Ҵﵽ90���󣬿��Ե�����������(����195/205) �Ի�����ȡ����,����Ϊ������������
--				���ԣ��������������ɫ����һ��(����������������ɶ���)��
--			c.	��Ҵﵽ100���󣬿��Ե��������̹Ŵ�(����201/199) �Ի�����ȡ����������Ϊ��������һƥ��


--Date:		November fifteenth 2006
--Author:	liaozhishan
--Right:	Kingsoft all rights reserved@
--file:		yuenan_feiyunrenwu.lua

if (not __H_V_FEIYUNACTION__) then	--__H_V_FEIYUNACTION__
	__H_V_FEIYUNACTION__ = 1;

Include([[\script\lib\gb_taskfuncs.lua]]);
Include([[\script\event\feiyunrenwu\vn_feiyun_lvl60.lua]]);
Include([[\script\event\feiyunrenwu\vn_feiyun_lvl90.lua]]);

--	Date define field: following lines lies date defination;
V_FY_SZ_ACTIONNAME = "v_feiyun06_permanent";	-- Խ�������Ի
V_FY_TK_GETSIGN = 1781;

tab_Reference = {
	[60] = {60, 150, 160},
	[90] = {90, 150, 190},
	[100] = {100, 160, 190},
};

--	common interface following
function v_fy_is_active()	-- Active check up
	do return 0 end		-- ��ѽ��������ùر� by �ӷ��~
	if (gb_GetTask(V_FY_SZ_ACTIONNAME, 1) ~= 0) then
		return 0;
	end;
	return 1;
end;

function v_fy_is_newrole()	--make sure Role is of new type 
	local nPoint = GetExtPoint(6);
	local nBit = GetBit(nPoint, 7);
	if (nBit == 1) then
		return 1;
	end;
	return 0;
end;

--	check if he has gotten the level prize;
--	return value: has gotten return 1; in opposition return 0
function v_fy_is_got(nLevel)
	if (not tab_Reference[nLevel]) then
		return 0;
	end;
	
	local UWorld1781 = GetTask(V_FY_TK_GETSIGN);
	if (UWorld1781 >= 250) then
		return 0
	end;
	local table = tab_Reference[nLevel];
	for i = 1, getn(table) do
		if (UWorld1781 == table[i]) then
			return 0;
		end;
	end;
	return 1;
end;

--	check get prize
--	return value: yes return 1; no return 0;
function v_fy_awardcheck(nLevel)
	if (GetLevel() < nLevel) then
		Say("B�n ch�a ��t ��ng c�p y�u c�u!", 0);
		return 0;
	end;
	
	if (v_fy_is_got(nLevel) == 0) then
		Say("B�n �� nh�n ph�n th��ng, kh�ng th� nh�n th�m n�a!", 0);
		return 0;
	end;
	
	if (v_fy_is_newrole() == 0) then
		Say("B�n kh�ng ph�i ch�i t� t�i kho�n m�i, kh�ng th� nh�n th��ng.", 0);
		return 0;
	end;
	return 1;
end;

--	add a number into task
function v_fy_tkvalueadd(nTaskID, nAddend)
	SetTask(nTaskID, ( GetTask(nTaskID) + nAddend ) );
	SyncTaskValue( nTaskID );
end;

--	common interface above

--	field level 60:	Prize when a role level up at 60:
function v_fy_60_entrance()
	Say("Kim binh th� m�nh nh� th�c l�, T��ng D��ng s�p th�t th�!, Ho�ng Th��ng �� t� h�p anh h�ng ngh�a s� kh�p n�i b�n b�c t�nh k�, ��ng th�i ban t�ng 1 m�n trang b� tri �n c�c anh h�ng h�o ki�t ��t ��n c�p 60.", 2, 
	"Nh�n ph�n th��ng c�p 60/v_fy_60_next",
	"Nh�n ti�n gh� xem th�i!/no");
end;

function v_fy_60_next()
	local tab_Content = {
		"Ta mu�n nh�n Gi�i ch�/v_fy_60_ring",
		"Ta mu�n nh�n ng�c b�i (h��ng nang)/v_fy_60_yu",
		" H� th�n ph� (H�ng li�n)/v_fy_60_necklace",
		"R�i kh�i/no"
	};
	Say("Ng��i mu�n nh�n ph�n th��ng g�?", getn(tab_Content), tab_Content);
end;

function v_fy_60_ring()	--��ȡ60���Ľ�ָ
	if (v_fy_awardcheck(60) == 0) then
		return
	end;
	
	local nSeries = GetSeries() + 1;
	local Index1 = random(1, getn(tab_vn_fy_ring[nSeries]));
	local Index2 = random(1, getn(tab_vn_fy_ring[nSeries][Index1]));
	local str = "B�n nh�n ���c 1 <color=yellow>T� M�u L�c Gi�i Ch�<color>";
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 60);
	AddItemEx(4,tab_vn_fy_ring[nSeries][Index1][Index2],0, 0,3,0, 6,0,200, 6,6,6,6,0,0)
	Say(str, 0);
	Msg2Player(str);
end;

function v_fy_60_necklace()	--��ȡ60���Ļ����(����)
	if (v_fy_awardcheck(60) == 0) then
		return
	end;
	
	local tab_award = tab_vn_fy_hushenhu;
	if (nSex == 1) then	-- ����Ǹ�Ů��ɫ
		tab_award = tab_vn_fy_xianglian;
	end;
	local nSeries = GetSeries() + 1;
	local Index1 = random(1, getn(tab_award[nSeries]));
	local Index2 = random(1, getn(tab_award[nSeries][Index1]));
	local nSex = GetSex();
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 60);
	local szItemName;
	if (nSex == 0) then
		szItemName = "H� Ph�ch H� Th�n ph� ";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,4,1, 6,0,200, 6,6,6,6,0,0);
	elseif (nSex == 1) then	-- ����Ǹ�Ů��ɫ
		szItemName = "L�c T�ng Th�ch H�ng Li�n";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,4,0, 6,0,200, 6,6,6,6,0,0);
	end;
	local str = "B�n nh�n ���c <color=yellow>"..szItemName.."<color>";
	Say(str, 0);
	Msg2Player(str);
end;

function v_fy_60_yu()	--��ȡ60��������
	if (v_fy_awardcheck(60) == 0) then
		return
	end;
	
	
	local tab_award = tab_vn_fy_yupei;
	if (nSex == 1) then	-- ����Ǹ��н�ɫ
		tab_award = tab_vn_fy_xiangrang;
	end;
	local nSeries = GetSeries() + 1;
	local Index1 = random(1, getn(tab_award[nSeries]));
	local Index2 = random(1, getn(tab_award[nSeries][Index1]));
	local nSex = GetSex();
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 60);
	local szItemName;
	if (nSex == 0) then
		szItemName = "Thanh Ng�c Ng�c B�i ";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,9,1, 6,2,200, 6,6,6,6,0,0)
	elseif (nSex == 1) then	-- ����Ǹ��н�ɫ
		szItemName = "T� T� H��ng Nang";
		AddItemEx(4,tab_award[nSeries][Index1][Index2],0, 0,9,0, 6,0,200, 6,6,6,6,0,0)
	end;
	local str = "B�n nh�n ���c <color=yellow>"..szItemName.."<color>";
	Say(str, 0);
	Msg2Player(str);
end;

--	field level 60:	Prize when a role level up at 90:
function v_fy_90_entrance()
	Say("Kim binh th� m�nh nh� th�c l�, T��ng D��ng s�p th�t th�! Ho�ng Th��ng k�u g�i c�c anh h�ng ngh�a s� hi�p s�c c�u qu�c, ��ng th�i ban t�ng 1 m�n l� v�t cho c�c anh h�ng h�o ki�t ��t ��n c�p 90.", 2, 
	"Nh�n ph�n th��ng c�p 90/v_fy_90_next",
	"Nh�n ti�n gh� xem th�i!/no");
end;

v_fy_90_tab_weapon = {
	["cuiyan"] = {"��i Phong �ao", "Th�n Nh�t Tr�m"},
	["emei"] = {"Huy�n Thi�t Ki�m (Nga Mi ki�m)", "Huy�n Thi�t Ki�m (Nga Mi kh�)"},
	["tangmen"] = 	 {"B� V��ngTi�u", "To�i Nguy�t �ao", "Kh�ng T��c Linh"},
	["wudu"] = {"��i Phong �ao (Ng� ��c ch��ng)", "��i Phong �ao (Ng� ��c �ao)"},
	["tianwang"] = {"Ph� Thi�n K�ch", "Ph� Thi�n ch�y", "��i Phong �ao"},
	["shaolin"] = {"��i Phong �ao", "Kim C� B�ng"},
	["wudang"] = {"Huy�n Thi�t Ki�m (V� �ang ki�m)", "Huy�n Thi�t Ki�m (V� �ang kh�)"},
	["kunlun"] = {"��i Phong �ao", "Huy�n Thi�t Ki�m"},
	["gaibang"] = 	 {"Kim C� B�ng (C�i bang ch��ng)", "Kim C� b�ng (C�i Bang c�n)"},
	["tianren"] = {"Ph� Thi�n K�ch (Thi�n Nh�n k�ch)", "Ph� Thi�n K�ch (Thi�n Nh�n ch��ng)"}
};

function v_fy_90_next()
	local player_Faction = GetFaction();	-- Get Faction Name
--	player_Faction = "tianren";
	if (not player_Faction or not v_fy_90_tab_weapon[player_Faction]) then		-- skip if role not in Faction
		Say("Ng��i h�y gia nh�p m�n ph�i tr��c r�i ��n t�m ta.", 0);
		return
	end;

	local tab_Content = {}
	for i = 1, getn(v_fy_90_tab_weapon[player_Faction]) do
		tinsert(tab_Content, "Ta mu�n nh�n l�nh"..v_fy_90_tab_weapon[player_Faction][i].."/#v_fy_90_weapon([["..player_Faction.."]],"..i..")");
	end;
	tinsert(tab_Content, "R�i kh�i/no");

	Say("Ng��i mu�n nh�n ph�n th��ng g�?", getn(tab_Content), tab_Content);
end;

-- Get tanle
function v_fy_90_gettable(player_Faction)
	if (player_Faction == "cuiyan") then
		return tab_vn_fy_cym, tab_vn_fy_cym_add
	elseif(player_Faction == "emei") then
		return tab_vn_fy_emp, tab_vn_fy_emp_add
	elseif(player_Faction == "tangmen") then
		return tab_vn_fy_tm, tab_vn_fy_tm_add
	elseif(player_Faction == "wudu") then
		return tab_vn_fy_wdj, tab_vn_fy_wdj_add
	elseif(player_Faction == "tianwang") then
		return tab_vn_fy_twb, tab_vn_fy_twb_add
	elseif(player_Faction == "shaolin") then
		return tab_vn_fy_slp, tab_vn_fy_slp_add
	elseif(player_Faction == "wudang") then
		return tab_vn_fy_wdp, tab_vn_fy_wdp_add
	elseif(player_Faction == "kunlun") then
		return tab_vn_fy_klp, tab_vn_fy_klp_add
	elseif(player_Faction == "gaibang") then
		return tab_vn_fy_gb, tab_vn_fy_gb_add
	elseif(player_Faction == "tianren") then
		return tab_vn_fy_trj, tab_vn_fy_trj_add
	end;
	return nil;
end;

-- Get the prize of level up to 90
function v_fy_90_weapon(player_Faction, i)
	if (v_fy_awardcheck(90) == 0) then
		return
	end;
	
	local table = {};
	local _t = {};
	table, _t = v_fy_90_gettable(player_Faction);
	if (not table or not _t) then
		return
	end;
	local nIndex = random(1, getn(table[i]));
	local str = "B�n nh�n ���c <color=yellow>"..v_fy_90_tab_weapon[player_Faction][i].."<color>.";
	if (player_Faction == "emei" or player_Faction == "wudang")  then
		str = "B�n nh�n ���c <color=yellow>Huy�n Thi�t Ki�m<color>.";
	elseif (player_Faction == "gaibang") then
		str = "B�n nh�n ���c <color=yellow>Kim C� B�ng<color>.";
	elseif (player_Faction == "wudu") then
		str = "B�n nh�n ���c <color=yellow>��i Phong �ao<color>.";
	elseif (player_Faction == "tianren") then
		str = "B�n nh�n ���c <color=yellow>Ph� Thi�n K�ch<color>.";
	end;
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 90);
	AddItemEx(_t[i][1],table[i][nIndex],_t[i][3], _t[i][4],_t[i][5],_t[i][6], _t[i][7],_t[i][8],_t[i][9], _t[i][10],_t[i][11],_t[i][12],_t[i][13],_t[i][14],_t[i][15]);
	Say(str, 0);
	Msg2Player(str);
end;

--	field level 60:	Prize when a role level up at 100:
function v_fy_100_entrance()
	Say("Kim binh th� m�nh nh� th�c l�, T��ng D��ng s�p th�t th�!, Ho�ng Th��ng �� t� h�p anh h�ng ngh�a s� kh�p n�i b�n b�c t�nh k�, ��ng th�i ban t�ng Phi V�n Th�n M� �� tri �n c�c v� anh h�ng.", 2, 
	"Nh�n ph�n th��ng c�p 100/v_fy_100_next",
	"Nh�n ti�n gh� xem th�i!/no");
end;

function v_fy_100_next()
	if (v_fy_awardcheck(100) == 0) then
		return
	end;
	
	-- ��һƥ����
	v_fy_tkvalueadd(V_FY_TK_GETSIGN, 100);
	AddItem(0, 10, 8, 1, 0, 0, 0);
	Msg2Player("B�n nh�n ���c <color=yellow>Phi V�n Th�n M�<color>");
end;


function no()
end;


end;	--__H_V_FEIYUNACTION__
