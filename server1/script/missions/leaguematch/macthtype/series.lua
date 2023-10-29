Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============ͬϵ˫�����������===============

-- LLG_ALLINONE_TODO_20070802

--ȫ��ͬϵ˫�����������
local nTmpLadderBase	= 10238
local WLLS_DATA = {
	
	name = "Song ��u (C�ng h�)",
	
	--��ͼ��Ϣ
	match_type = {
		{
			name = "h� Kim",
			level = 1,
			ladder = nTmpLadderBase,
			map = {{396, 560, 397, ""}},
		},
		{
			name = "h� M�c",
			level = 1,
			ladder = nTmpLadderBase + 1,
			map = {{398, 561, 399, ""}},
		},
		{
			name = "h� Th�y",
			level = 1,
			ladder = nTmpLadderBase + 2,
			map = {{400, 562, 401, ""}},
		},
		{
			name = "h� H�a",
			level = 1,
			ladder = nTmpLadderBase + 3,
			map = {{402, 563, 403, ""}},
		},
		{
			name = "h� Th� ",
			level = 1,
			ladder = nTmpLadderBase + 4,
			map = {{404, 564, 405, ""}},
		},
		{
			name = "h� Kim",
			level = 2,
			ladder = nTmpLadderBase + 5,
			map = {{540, 570, 541, ""}},
		},
		{
			name = "h� M�c",
			level = 2,
			ladder = nTmpLadderBase + 6,
			map = {{542, 571, 543, ""}},
		},
		{
			name = "h� Th�y",
			level = 2,
			ladder = nTmpLadderBase + 7,
			map = {{544, 572, 545, ""}},
		},
		{
			name = "h� H�a",
			level = 2,
			ladder = nTmpLadderBase + 8,
			map = {{546, 573, 547, ""}},
		},
		{
			name = "h� Th� ",
			level = 2,
			ladder = nTmpLadderBase + 9,
			map = {{548, 574, 549, ""}},
		},
	},
	
	award_rank = {
		{	--���н���������
			{1, 4000},	--��1��
			{2, 3000},	--��2��
			{3, 2500},	--��3��
			{4, 2000},	--��4��
			{8, 1500},	--��5-8��
			{16, 1250},	--��9-16��
			{32, 1000},	--��17-32��
			{64, 750},	--��33-64��
			{128, 500},	--��65-128��
			{256, 250},	--��129-256��
		}, {	--����
			{1, 8000},	--��1��
			{2, 6000},	--��2��
			{3, 5000},	--��3��
			{4, 4000},	--��4��
			{8, 3000},	--��5-8��
			{16, 2500},	--��9-16��
			{32, 2000},	--��17-32��
			{64, 1500},	--��33-64��
			{128, 1000},	--��65-128��
			{256, 500},	--��129-256��
		}
	},
	
	max_member = 2,	--ÿ��ս�ӵ��������
	
	text_main = {	--officer���Ի���ĩβ���첿�֣�
		"Thi ��u l�n n�y l� ��ng h� song ��u",
		"Thi ��u l�n n�y l� ��ng h� song ��u",
	},
	
	addmem_ex	= ", v� ph�i l� ng��i ch�i <color=red>c�ng h�<color> v�i nhau",	--�齨ս�Ӷ���Ҫ�󣨿�ѡ��

	--====Functions====
	--���ص�ǰ��ɫ���Բμӵı������ͣ�nilΪ���ܲ���
	player_type = function()
		local nLevel = wlls_player_level()
		if (nLevel <= 0) then
			return nil
		end
		local nSeries = GetSeries() + 1
		if (nSeries <= 0) then
			wlls_error_log("GetSeries() = "..(nSeries - 1))
			return nil
		end
		return (nLevel - 1) * 5 + nSeries
	end,
	
	--�ҵ�ս��
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  L�n n�y"..str_des.." l� <color=red>��ng h� song ��u<color>. B�n c� th� t� l�p chi�n ��i c�a m�nh ho�c gia nh�p chi�n ��i c�a ng��i kh�c. Sau �� do ��i tr��ng ��n g�p "..str_des.."��i tho�i v�i Quan vi�n, ch�n '��i thi ��u"..str_des.."Th�nh vi�n m�i chi�n ��i l� <color=red>2 ng��i<color> v� ph�i l� ng��i c�ng h� v�i nhau",
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
			"C�c b��c th�nh l�p chi�n ��i: trong <color=red>th�i gian ngh� v� th�i gian thi ��u<color>, Ng��i ��u c� th� t� ��i v�i ng��i ch�i kh�c <color=red>c�ng h�<color>, l�a ch�n ��ng � cho ��ng ��i gia nh�p chi�n ��i c�a m�nh. <enter>"..
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
	check_addmem = function(nCapIdx, nLGID, nMType)
		if (nMType ~= wlls_player_type()) then
		 	return wlls_npcname().."Xin l�i! ��i vi�n trong nh�m:"..GetName().."<color=red>��ng c�p<color> ho�c <color=red>ng� h�nh<color> c�a hai ��i kh�ng h�p l�, kh�ng th� th�nh l�p chi�n ��i!"
		end
	end,
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(6, WLLS_DATA)
