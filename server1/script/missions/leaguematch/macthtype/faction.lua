Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============���ɵ������������===============

--ȫ�����ɵ������������
local nTmpLadderBase	= 10201
local WLLS_DATA = {
	
	name = "Danh s�ch m�n ph�i thi ��u",
	
	--��ͼ��Ϣ
	match_type = {
		{
			name = "Thi�u L�m",
			level = 1,
			ladder = nTmpLadderBase,
			map = {{396, 560, 397, ""}},
		},
		{
			name = "Thi�n V��ng",
			level = 1,
			ladder = nTmpLadderBase + 1,
			map = {{398, 561, 399, ""}},
		},
		{
			name = "���ng M�n",
			level = 1,
			ladder = nTmpLadderBase + 2,
			map = {{400, 562, 401, ""}},
		},
		{
			name = "Ng� ��c",
			level = 1,
			ladder = nTmpLadderBase + 3,
			map = {{402, 563, 403, ""}},
		},
		{
			name = "Nga Mi",
			level = 1,
			ladder = nTmpLadderBase + 4,
			map = {{404, 564, 405, ""}},
		},
		{
			name = "Th�y Y�n",
			level = 1,
			ladder = nTmpLadderBase + 5,
			map = {{406, 565, 407, ""}},
		},
		{
			name = "C�i Bang",
			level = 1,
			ladder = nTmpLadderBase + 6,
			map = {{408, 566, 409, ""}},
		},
		{
			name = "Thi�n Nh�n",
			level = 1,
			ladder = nTmpLadderBase + 7,
			map = {{410, 567, 411, ""}},
		},
		{
			name = "V� �ang",
			level = 1,
			ladder = nTmpLadderBase + 8,
			map = {{412, 568, 413, ""}},
		},
		{
			name = "C�n L�n",
			level = 1,
			ladder = nTmpLadderBase + 9,
			map = {{414, 569, 415, ""}},
		},
		{
			name = "Thi�u L�m",
			level = 2,
			ladder = nTmpLadderBase + 10,
			map = {{540, 570, 541, ""}},
		},
		{
			name = "Thi�n V��ng",
			level = 2,
			ladder = nTmpLadderBase + 11,
			map = {{542, 571, 543, ""}},
		},
		{
			name = "���ng M�n",
			level = 2,
			ladder = nTmpLadderBase + 12,
			map = {{544, 572, 545, ""}},
		},
		{
			name = "Ng� ��c",
			level = 2,
			ladder = nTmpLadderBase + 13,
			map = {{546, 573, 547, ""}},
		},
		{
			name = "Nga Mi",
			level = 2,
			ladder = nTmpLadderBase + 14,
			map = {{548, 574, 549, ""}},
		},
		{
			name = "Th�y Y�n",
			level = 2,
			ladder = nTmpLadderBase + 15,
			map = {{550, 575, 551, ""}},
		},
		{
			name = "C�i Bang",
			level = 2,
			ladder = nTmpLadderBase + 16,
			map = {{552, 576, 553, ""}},
		},
		{
			name = "Thi�n Nh�n",
			level = 2,
			ladder = nTmpLadderBase + 17,
			map = {{554, 577, 555, ""}},
		},
		{
			name = "V� �ang",
			level = 2,
			ladder = nTmpLadderBase + 18,
			map = {{556, 578, 557, ""}},
		},
		{
			name = "C�n L�n",
			level = 2,
			ladder = nTmpLadderBase + 19,
			map = {{558, 579, 559, ""}},
		},
	},
	
	award_rank = {
		{	--���н���������
			{1, 1500},	--��1��
			{2, 1000},	--��2��
			{3, 800},	--��3��
			{4, 600},	--��4��
			{8, 400},	--��5-8��
			{16, 300},	--��9-16��
			{32, 250},	--��17-32��
			{64, 200},	--��33-64��
			{128, 150},	--��65-128��
		}, {	--����
			{1, 3000},	--��1��
			{2, 2000},	--��2��
			{3, 1600},	--��3��
			{4, 1200},	--��4��
			{8, 800},	--��5-8��
			{16, 600},	--��9-16��
			{32, 500},	--��17-32��
			{64, 400},	--��33-64��
			{128, 300},	--��65-128��
		}
	},
	
	max_member = 1,	--ÿ��ս�ӵ��������
	
	text_main = {	--officer���Ի���ĩβ���첿�֣�
		"V� l�m li�n ��u ki�t xu�t l�n n�y l� M�n ph�i ��n ��u, ch�n ra  ng��i xu�t s�c nh�t trong m�i m�n ph�i",
		"V� l�m li�n ��u ki�t xu�t l�n n�y l� M�n ph�i ��n ��u, ch�n ra  ng��i xu�t s�c nh�t trong m�i m�n ph�i",
	},
	
	--====Functions====
	--���ص�ǰ��ɫ���Բμӵı������ͣ�nilΪ���ܲ���
	player_type = function()
		local n_level = wlls_player_level()
		if (n_level <= 0) then
			return nil
		end
		local n_fact = GetLastFactionNumber() + 1
		if (n_fact <= 0) then
			wlls_descript("<enter>  ��y l� cu�c thi gi�a c�c m�n ph�i, ng��i kh�ng m�n kh�ng ph�i kh�ng ���c tham gia.")
			return nil
		end
		return (n_level - 1) * 10 + n_fact
	end,
	
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  L�n n�y"..str_des.."v� <color=red>��n ��u m�n ph�i<color>, n�u b�n l�n ��u tham gia thi ��u, h� th�ng s� l�p cho b�n m�t chi�n ��i.")
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
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(2, WLLS_DATA)
