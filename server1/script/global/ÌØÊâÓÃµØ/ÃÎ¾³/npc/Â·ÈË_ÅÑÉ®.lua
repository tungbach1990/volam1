-- �ξ� ·��_��ɮ.lua  ϴ�㹦��NPC

Include("\\script\\missions\\clearskill\\clearhole.lua");

function main()
	-- �Ƿ�״̬
	if (CSP_CheckValid() == 0) then
		CSP_WriteLog("Ti�n nh�p v�o ��o T�y T�y m�t c�ch kh�ng b�nh th��ng. ");
		Say("GM: <color=red>B�n kh�ng th� v�o ��o T�y T�y, �� b� h� th�ng ghi nh�, xin h�y �i t�m ng��i ph�c v� �� ch�nh l� l�i! <color> ", 1, "R�i kh�i ��o T�y T�y /LeaveHere_yes")
		return -1;
	end
	
	nLevel = GetLevel();
	if (nLevel < CSP_NEEDLEVEL) then
		Talk(1, "", "C�p c�a ng��i v�n ch�a ��t "..CSP_NEEDLEVEL.."Ch�a th� r�i kh�i ��o T�y T�y. ")
		return -1;
	end

	nType = GetTask(CSP_TID_ClearType);
	if (nType == CSP_CTYPE_SKILL) then -- ֻϴ���ܵ�
		local tbOpt = 
		{
			"T�y �i�m k� n�ng /DoClearSkill",
			"T�ng �i�m ti�m n�ng/add_prop",
			"Kh�ng t�y /OnCancel",
			"V� vi�c T�y T�y /Help",
			"R�i kh�i ��o T�y T�y /LeaveHere",
		}
		Say("ng��i ch� c� th� t�y <color=blue> �i�m k� n�ng<color>. C� ��ng � t�y kh�ng? ", getn(tbOpt), tbOpt)
	elseif (nType == CSP_CTYPE_PROP) then -- ֻ��Ǳ�ܵ�
		local tbOpt = 
		{
			"T�y �i�m ti�m n�ng/DoClearProp",
			"T�ng �i�m ti�m n�ng/add_prop",
			"Kh�ng t�y /OnCancel",
			"V� vi�c T�y T�y /Help",
			"R�i kh�i ��o T�y T�y /LeaveHere",
		}
		Say("Ng��i ch� c� th� t�y <color=blue> �i�m ti�m n�ng<color>. C� ��ng � t�y kh�ng? ", getn(tbOpt), tbOpt)
	else -- if (nType == CSP_NEEDJEWEL_ALL) then -- ȫϴ(nType������0����3)
		local tbOpt = 
		{
			 "T�y �i�m k� n�ng /DoClearSkill",
			 "T�y �i�m ti�m n�ng/DoClearProp", 
			 "T�ng �i�m ti�m n�ng/add_prop", 
			 "Kh�ng t�y /OnCancel", 
			 "V� vi�c T�y T�y /Help", 
			 "R�i kh�i ��o T�y T�y /LeaveHere"
		}
		Say("Ng��i c� ��ng � t�y t�y kh�ng? ", getn(tbOpt),tbOpt)
	end;
end

function add_prop()
	Say("Th�ch Minh: Ng��i mu�n t�ng �i�m k� n�ng n�o?", 4,
			"t�ng s�c m�nh/add_prop_str",
			"t�ng Th�n Ph�p/add_prop_dex",
			"t�ng Ngo�i C�ng/add_prop_vit",
			"T�ng n�i c�ng/add_prop_eng")
end

function add_prop_str()
	AskClientForNumber("enter_str_num", 0, GetProp(), "Xin h�y nh�p �i�m s� s�c m�nh: ");
end

function add_prop_dex()
	AskClientForNumber("enter_dex_num", 0, GetProp(), "Xin h�y nh�p �i�m s� th�n ph�p: ");
end

function add_prop_vit()
	AskClientForNumber("enter_vit_num", 0, GetProp(), "Xin h�y nh�p �i�m s� ngo�i c�ng:");
end

function add_prop_eng()
	AskClientForNumber("enter_eng_num", 0, GetProp(), "Xin h�y nh�p �i�m s� n�i c�ng: ");
end

function enter_str_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddStrg(n_key);
end

function enter_dex_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddDex(n_key);
end

function enter_vit_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddVit(n_key);
end

function enter_eng_num(n_key)
	if (n_key < 0 or n_key > GetProp()) then
		return
	end
	AddEng(n_key);
end

function DoClearSkill()
	Say("Ng��i ��ng � T�y �i�m k� n�ng kh�ng? ", 2, "T�y �i�m k� n�ng /DoClearSkillCore","Kh�ng t�y /OnCancel")
end
function DoClearSkillCore()
--	if (Pay(100000) == 0) then
--		Say("�������Բ���ÿ��ϴ����10�����������ϴ���Ǯ������", 0)
--		return
--	end

	i = HaveMagic(210)		-- �Ṧ�������
	j = HaveMagic(400)		-- ���ٸ���ƶ���������
	n = RollbackSkill()		-- ������ܲ��������м��ܵ㣨�����Ṧ�����⼼�ܣ�
	x = 0
	if (i ~= -1) then x = x + i end		-- �������ж����ų���δѧ���Ṧ���˷���-1�Ӷ����µ�������������
	if (j ~= -1) then x = x + j end
	rollback_point = n - x			-- �Ѽ��ܵ㵱�����е������������ȿ۳��Ṧ��
	if (rollback_point + GetMagicPoint() < 0) then		-- ���ϴ���˸���������0��Ϊ�Ժ���ϴ�㱣����
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
	if (i ~= -1) then AddMagic(210,i) end			-- ���ѧ���Ṧ��ӻ�ԭ�еȼ�
	if (j ~= -1) then AddMagic(400,j) end			-- ���ѧ�����ٸ���ƶ��ͬ������
	Msg2Player("T�y T�y th�nh c�ng! ng��i �� c� th� ph�n ph�i �i�m "..rollback_point.."�i�m k� n�ng c� th� ph�n ph�i l�i. ")
	Talk(1,"KickOutSelf","T�y T�y th�nh c�ng! ng��i �� c� th� ph�n ph�i �i�m "..rollback_point.."�i�m k� n�ng c� th� ph�n ph�i l�i. ")
end;

function DoClearProp()
	Say("Ng��i ��ng � t�y �i�m ti�m n�ng kh�ng? ", 2, "T�y �i�m ti�m n�ng/DoClearPropCore", "Kh�ng t�y /OnCancel")
end

function DoClearPropCore()
		base_str = {35,20,25,30,20}			-- �����������������ֵ
		base_dex = {25,35,25,20,15}
		base_vit = {25,20,25,30,25}
		base_eng = {15,25,25,20,40}
		player_series = GetSeries() + 1

		Utask88 = GetTask(88)
		AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88,1))			-- ���ѷ���Ǳ�����ã�task(88)��������ֱ�ӽ��������������ȣ�
		AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88,2))
		AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88,3))
		AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88,4))
end;

function OnCancel()
end;

function Help()
	strHelp = 
	{
		"Sau khi T�y T�y, ng��i c� th� �i ra ngo�i �� ��nh v�i m�c nh�n, ho�c c� nh�m s� c�ng �i v�o s�n ��ng �� th�c nghi�m chi�n ��u, sau �� r�i kh�i ��o m�i ���c xem l� �� ho�n th�nh. ",
		"Ch� c�n ng��i kh�ng r�i kh�i ��o, ta s� gi�p ng��i t�y t�y v�a �!",
		"Ngo�i kia c� C�c g� (3000 Sinh l�c) ;  Bao c�t (10000 Sinh l�c) ; M�c nh�n 30000 Sinh l�c) �� cho ng��i th� nghi�m hi�u qu� t�y t�y!",
		"N�u mu�n thi ��u c� th� v�o trong s�n ��ng, cho d� c� th�t b�i th� c�ng kh�ng b� t�n th�t g�. ",
		"Nh�ng b�n trong s�n ��ng th� l�i r�t nh� nh�p, nhi�u nh�t c�ng ch� ch�a ���c 20 ng��i, cho n�n n�u nh� �� c� �� ng��i th� ng��i kh�ng th� �i v�o. ",
		"Nh�ng b�n trong s�n ��ng th� l�i r�t nh� nh�p, nhi�u nh�t c�ng ch� ch�a ���c 20 ng��i, cho n�n n�u nh� �� c� �� ng��i th� ng��i kh�ng th� �i v�o. ",
		"Cu�i c�ng, khi n�o ng��i c�m th�y �i�m k� n�ng �� �� h�y ��n t�m ta, ta s� ��a ng��i tr� v� ch� c� "
	}
	Talk(7, "", strHelp[1], strHelp[2], strHelp[3], strHelp[4], strHelp[5], strHelp[6], strHelp[7]);
end;

function LeaveHere()
	Say("ng��i cho r�ng �� T�y T�y xong r�i �? C� mu�n r�i kh�i kh�ng? ",2, "Mu�n r�i kh�i /LeaveHere2", "�� ta suy ngh� k� l�i xem/OnCanCel")
end

function LeaveHere2()
	Say("R�i kh�i ��o T�y T�y, n�u mu�n tr� l�i s� r�t kh�. ng��i v�n ki�n quy�t r�i kh�i ch�? ", 2, "ta th�t s� mu�n r�i kh�i n�i ma qu�i n�y /LeaveHere_yes", "ta v�n mu�n � l�i /OnCanCel")
end

function LeaveHere_yes()
	W,X,Y = GetWorldPos();
	LeaveTeam()
	CSP_LeaveClearMap(W);
end
