Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============��ϵ������������===============


--ȫ����ϵ������������
local WLLS_DATA = {
	
	name = "<<δ����>>",
	
	--��ͼ��Ϣ
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10235,
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
			ladder = 10236,
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
			{8, 1750},	--��5-8��
			{16, 1500},	--��9-16��
			{32, 1250},	--��17-32��
			{64, 1000},	--��33-64��
			{128, 750},	--��65-128��
			{256, 500},	--��129-256��
			{512, 250},	--��257-512��
		}, {	--����
			{1, 8000},	--��1��
			{2, 6000},	--��2��
			{3, 5000},	--��3��
			{4, 4000},	--��4��
			{8, 3500},	--��5-8��
			{16, 3000},	--��9-16��
			{32, 2500},	--��17-32��
			{64, 2000},	--��33-64��
			{128, 1500},--��65-128��
			{256, 1000},--��129-256��
			{512, 500},	--��257-512��
		}
	},
	
	max_member = 1,	--ÿ��ս�ӵ��������
	
	text_main = {	--officer���Ի���ĩβ���첿�֣�
		"L�n n�y l� ��n ��u t� do, c�c hi�p kh�ch h�y c� g�ng luy�n t�p, ch� ngay vinh quy",
		"L�n n�y l� ��n ��u t� do, c�c hi�p kh�ch h�y c� g�ng luy�n t�p, ch� ngay vinh quy",
	},
	
	--====Functions====
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  L�n n�y"..str_des.."l� <color=red>��n ��u t� do<color>, kh�ng c�n ph�i l�p chi�n ��i. H� th�ng s� ghi nh� l�n thi ��u ��u ti�n c�a b�n")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>Chi�n ��i c�a b�n hi�n l�:<color=yellow>"..str_lgname.."<color><enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>    <color=yellow><<δ����>>"..WLLS_TAB[n_next].name.."<color><color=yellow>, n�u mu�n thi ��u m�a sau, xin h�y l�p chi�n ��i m�i.<color><enter>"
		end
		local tb_option = {}
		str = str.."<enter>   Trong th�i gian <color=red>t�m ngh�<color> ho�c <color=red>ch�a tham gia thi ��u m�a tr��c<color>, b�n c� th� r�i chi�n ��i, chi�n ��i s� t� ��ng gi�i t�n<color>."
		tb_option[getn(tb_option)+1] = "R�i kh�i ��i/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem chi�n t�ch c�a ��i/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta ch� ti�n gh� qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--��鵱ǰ��ɫ�Ƿ���Լ���ָ����ս��
	check_addmem = function(n_capidx, n_lid, n_mtype)
		return "Kh�ng th� gia nh�p ��i ��n ��u!"
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(5, WLLS_DATA)
