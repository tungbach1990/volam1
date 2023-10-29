Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============ʦͽ˫�����������===============


--ȫ��ʦͽ˫�����������
local WLLS_DATA = {
	
	name = "Song ��u s� ��",
	
	--��ͼ��Ϣ
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10221,
			map = {
				{396, 560, 397, "(1)"},
				{398, 561, 399, "(2)"},
				{400, 562, 401, "(3)"},
				{402, 563, 403, "(4)"},
				{404, 564, 405, "(5)"},
				{406, 565, 407, "(6)"},
				{408, 566, 409, "(7)"},
				{410, 567, 411, "(8)"},
			},
		},
		{
			name = "",
			level = 2,
			ladder = 10222,
			map = {
				{540, 570, 541, "(1)"},
				{542, 571, 543, "(2)"},
				{544, 572, 545, "(3)"},
				{546, 573, 547, "(4)"},
				{548, 574, 549, "(5)"},
				{550, 575, 551, "(6)"},
				{552, 576, 553, "(7)"},
				{554, 577, 555, "(8)"},
			},
		},
	},
	
	award_rank = {
		{	--���н���������
			{1, 5000},	--��1��
			{2, 4000},	--��2��
			{3, 3500},	--��3��
			{4, 3000},	--��4��
			{8, 2000},	--��5-8��
			{16, 1500},	--��9-16��
			{32, 1000},	--��17-32��
			{64, 500},	--��33-64��
			{128, 250},	--��65-128��
		}, {	--����
			{1, 10000},	--��1��
			{2, 8000},	--��2��
			{3, 7000},	--��3��
			{4, 6000},	--��4��
			{8, 4000},	--��5-8��
			{16, 3000},	--��9-16��
			{32, 2000},	--��17-32��
			{64, 1000},	--��33-64��
			{128, 500},	--��65-128��
		}
	},
	
	max_member = 2,	--ÿ��ս�ӵ��������
	
	--�������֣���Ҫ�İ���������normal.lua�У�����ֻд����Ĳ��֣�
	help_msg = {
		["Gi�i thi�u thi ��u V� l�m ki�t xu�t"]	=
			{
				"    Thi ��u l�n n�y l� <color=red>S� �� song ��u<color>. Ng��i ch�i ��n g�p <color=red>S� gi� Ki�t xu�t<color> b�o danh th�nh l�p chi�n ��i, sau �� v�o H�i tr��ng li�n ��u Ki�t xu�t ti�n h�nh thi ��u. ��i tr��ng (S� ph�) ��ng c�p t� 80- 119, ��i vi�n (�� ��) t� 50- 90",
				"    Thi ��u l�n n�y l� <color=red>S� �� song ��u<color>. Ng��i ch�i ��n g�p <color=red>S� gi� Ki�t xu�t<color> b�o danh th�nh l�p chi�n ��i, sau �� v�o H�i tr��ng li�n ��u Ki�t xu�t ti�n h�nh thi ��u. ��i tr��ng (S� ph�) ��ng c�p t� 120 tr� l�n, ��i vi�n (�� ��) t� 50- 90",
			},
		["Qu� tr�nh th�nh l�p ��i thi ��u"]	= "    Ng��i ch�i c� th� t� l�p chi�n ��i ho�c gia nh�p chi�n ��i ng��i kh�c. ��i tr��ng ph�i l� �� �� ch�a xu�t s�. ��i tr��ng ��n g�p <s> �� b�o danh thi ��u",
		["R�i kh�i ��i thi ��u"]	= "    Trong <color=red>giai �o�n ngh� c�ch kho�ng<color>, ng��i ch�i c� th� t�y � tho�t ly chi�n ��i. Trong giai �o�n thi ��u, n�u chi�n ��i c�a m�nh <color=red>ch�a ��n l�c thi ��u<color>, ng��i ch�i c� th� t� � r�i kh�i chi�n ��i, n�u �� ��u r�i th� kh�ng th� r�i ��i. <color=yellow>Sau khi r�i kh�i chi�n ��i s� kh�ng ���c nh�n ph�n th��ng x�p h�ng<color>. N�u ��i tr��ng r�i kh�i ��i th� chi�n ��i s� b� gi�i t�n. <color=yellow>n�u chi�n ��i kh�ng c�n ai th� s� t� ��ng b� gi�i t�n<color>. M�i l�n li�n ��u k�t th�c, chi�n ��i n�o kh�ng ph� h�p cho l�n sau c�ng s� t� ��ng b� gi�i t�n",
	},
	
	text_main = {	--officer���Ի���ĩβ���첿�֣�
		"Thi ��u l�n n�y l� <color=red>S� �� song ��u<color>. ",
		"Thi ��u l�n n�y l� <color=red>S� �� song ��u<color>. ",
	},
	
	text_creat = "    Sau khi l�p chi�n ��i tham gia S� �� song ��u b�n c� th� <color=red>t� m�nh l� ��i tr��ng<color>. N�u c� s� ph� th� ph�i do <color=red>� ph� m�nh l� ��i tr��ng<color>.<enter>"
		.."n�u ch�a ��n l�c thi ��u<color> v� <color=red>ch�a ��u qua tr�n n�o<color>, b�n c� th� r�i kh�i chi�n ��i. N�u S� ph� r�i kh�i chi�n ��i, ��i �� l�p t�c b� gi�i t�n. Ng��i x�c ��nh l�p chi�n ��i cho m�nh ch�?",
	
	--====Functions====
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>    L�n n�y "..str_des.."Khi <color=red>song ��u s� ��<color>, b�n c� th� ch�n l�p chi�n ��i, c�ng c� th� gia nh�p chi�n ��i kh�c. ��i tr��ng gia nh�p ��i vi�n c�n ph�i l� �� �� ch�a xu�t s� c�a ��i tr��ng. Sau khi ��i tr��ng v� �� �� t� ch�c ��i xong, v� "..str_des.."��i tho�i v�i Quan vi�n, ch�n '��i thi ��u"..str_des.."c�a t�i', ch�n nh�ng ��i h�u gia nh�p trong ��i m�nh l� ���c. Th�nh vi�n ��i thi ��u nhi�u nh�t <color=red>2 ng��i<color>",
				"Ta mu�n l�p"..str_des.."nh�m/wlls_want2create",
				"Ta ch� ��n xem th�i/OnCancel")
			return
		end
	
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>Chi�n ��i c�a b�n hi�n l�:<color=yellow>"..str_lgname.."<color><enter>"
		.. "��i tr��ng ��i chi�n ��u:"..join(wlls_get_mems(n_lid), "Th�nh vi�n ��i chi�n ��u:") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>    <color=yellow><<δ����>>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n�u mu�n thi ��u m�a sau, xin h�y l�p chi�n ��i m�i.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>   B�n c� th� ch�n <color=red> gia nh�p v�o ��i kh�c<color> ho�c <color=red>r�i kh�i ��i thi ��u<color>.<enter><enter>"..
			"Qu� tr�nh th�nh vi�n l�p nh�m: Trong <color=red>th�i gian ngh� ng�i v� th�i gian thi ��u<color>, b�n c� th� c�ng v�i ng��i ch�i kh�c l�p nh�m, ch�n nh�ng ��i h�u gia nh�p v�o ��i thi ��u.<enter>"..
			"R�i kh�i ��i thi ��u: Trong <color=red>th�i gian ngh� ng�i<color>, b�n c� th� r�i kh�i ��i thi ��u; trong th�i gian thi ��u n�u ��i thi ��u c�a b�n<color=red> ch�a gia nh�p thi ��u k� tr��c<color>, b�n c� th� r�i kh�i ��i thi ��u; n�u �� c� tham gia th� kh�ng th� r�i ��i. T� c�ch ��i tr��ng s� ���c chuy�n giao l�i cho th�nh vi�n kh�c, <color=yellow>n�u kh�ng c� th�nh vi�n, chi�n ��i s� b� gi�i t�n<color>."
			tb_option[getn(tb_option)+1] = "�� ��i h�u c�a Tagia nh�p v�o ��i thi ��u n�y/wlls_want2addmember"
		else
			str = str.."<enter>       B�n c� th� ch�n r�i kh�i nh�m.<enter><enter>"..
			"R�i kh�i nh�m:   Trong <color=red>th�i gian ngh� ng�i<color>, b�n c� th� r�i kh�i ��i thi ��u; trong th�i gian thi ��u n�u ��i thi ��u m�nh <color=red>ch�a tham gia gi�i ��u tr��c<color>, b�n c�ng c� th� r�i kh�i ��i thi ��u; c�n n�u �� gia nh�p thi ��u kh�ng th� r�i kh�i ��i."
		end
		tb_option[getn(tb_option)+1] = "R�i kh�i ��i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem chi�n t�ch c�a ��i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� ti�n gh� qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--��鵱ǰ��ɫ�Ƿ���Լ���ָ����ս��
	check_addmem = function(n_capidx, n_lid, n_mtype)
		local n_oldidx = PlayerIndex
		PlayerIndex = n_capidx
		local n_lid = LG_GetLeagueObjByRole(1, GetName())	--ʦͽ��ϵս��
		local n_num = GetTask(1403)	--TKID_APPRENTICE_COUNT = 1403 --��ͽ������
		PlayerIndex = n_oldidx
		if (FALSE(n_lid) or n_num <= 0) then	
			return "Xin l�i! b�n ch�a nh�n �� ��, kh�ng th� l�p nh�m v�i b�t k� ��i vi�n kh�c."
		end
		if (n_lid ~= LG_GetLeagueObjByRole(1, GetName())) then
			return " Xin l�i! "..GetName().."Kh�ng ph�i l� �� �� c�a b�n, kh�ng th� gia nh�p ��i thi ��u c�a b�n."
		end
		if (GetLevel() > 90) then
			return " Xin l�i! "..GetName().."Qu� c�p 90, kh�ng th� l�m �� �� gia nh�p ��i thi ��u ���c."
		end
		if (GetLevel() < 50) then
			return " Xin l�i! "..GetName().."Ch�a �� c�p 50, kh�ng th� gia nh�p ��i thi ��u."
		end
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(3, WLLS_DATA)
