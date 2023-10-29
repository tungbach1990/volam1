Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============�������������===============


--ȫ���������������
local WLLS_DATA = {
	
	name = "��u ba ng��i",
	
	--��ͼ��Ϣ
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10223,
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
			ladder = 10224,
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
			{1, 4000},	--��1��
			{2, 3000},	--��2��
			{3, 2500},	--��3��
			{4, 2000},	--��4��
			{8, 1500},	--��5-8��
			{16, 1000},	--��9-16��
			{32, 750},	--��17-32��
			{64, 500},	--��33-64��
			{128, 250},	--��65-128��
		}, {	--����
			{1, 8000},	--��1��
			{2, 6000},	--��2��
			{3, 5000},	--��3��
			{4, 4000},	--��4��
			{8, 3000},	--��5-8��
			{16, 2000},	--��9-16��
			{32, 1500},	--��17-32��
			{64, 1000},	--��33-64��
			{128, 500},	--��65-128��
		}
	},
	
	max_member = 3,	--ÿ��ս�ӵ��������
	
	text_main = {	--officer���Ի���ĩβ���첿�֣�
		"Thi ��u v� l�m ki�t xu�t l�n n�y l� <color=red>Tam nh�n ��u<color>",
		"Thi ��u v� l�m ki�t xu�t l�n n�y l� <color=red>Tam nh�n ��u<color>",
	},
	
	--====Functions====
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  L�n n�y"..str_des.."Trong <color=red>��u 3 ng��i<color>, b�n c� th� ch�n ��i l�p nh�m, c�ng c� th� gia nh�p chi�n ��i kh�c. Sau khi ��i tr��ng v� ng��i ch�i t� ch�c ��i xong, v� "..str_des.."��i tho�i v�i Quan vi�n, ch�n '��i thi ��u"..str_des.."ch�n h�ng chi�n ��i', gia nh�p ��i h�u v�o ��i c�a m�nh l� ���c. Th�nh vi�n chi�n ��i nhi�u nh�t l� <color=red>3 ng��i<color>.",
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
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(4, WLLS_DATA)
