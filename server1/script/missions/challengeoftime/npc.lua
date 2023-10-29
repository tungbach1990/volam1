-- description	: ����NPC
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\battles\\battlehead.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")

-- ��������<=>λ���ļ�
map_posfiles = {
	[8] = {"\\settings\\maps\\challengeoftime\\lineup8.txt", 1},	
	[16] = {"\\settings\\maps\\challengeoftime\\lineup16.txt", 1},	
	[20] = {"\\settings\\maps\\challengeoftime\\lineup20.txt", 1},
	[24] = {"\\settings\\maps\\challengeoftime\\lineup24.txt", 1},
	[32] = {"\\settings\\maps\\challengeoftime\\lineup32.txt", 1},
	[40] = {"\\settings\\maps\\challengeoftime\\lineup40.txt", 1},
	[56] = {"\\settings\\maps\\challengeoftime\\lineup56.txt", 1}
};

-- NPC��ID����Ϊ�������ͣ����֡���񡢺���
-- NPC�������еĺ��壺<NPC��������>, <����>, <��������ID�����֡��ȼ������С��Ƿ�BOSS(0,1)��������λ��>
-- ��������

tbFightNpc = {
	[1] = {
		tbNormalNpc = {
			-- 1
			{1, {1.5, 0, nil},
				{nil, 975, "S��ng �ao ", 75, -1, 0, 16, func_npc_getpos}},
			-- 2
			{1, {1.5, 0, nil},
				{nil, 976, "Phi Sa", 75, -1, 0, 16, func_npc_getpos}},
			-- 3
			{1, {3, 0, nil},
				{nil, 977, "S��ng Li�m", 75, -1, 0, 20, func_npc_getpos}},
			-- 4
			{2,	{9, 0, nil},
				{nil, 975, "S��ng �ao ", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 5
			{1, {3, 0, nil},
				{nil, 978, "Th�a Phong", 75, -1, 0, 20, func_npc_getpos}},
			-- 6
			{1, {4.5, 0, nil},
				{nil, 979, "Th�y H�n", 75, 1, 0, 24, func_npc_getpos}},
			-- 7
			{1, {4.5, 0, nil},
				{nil, 980, "Th�n T� ", 75, 3, 0, 24, func_npc_getpos}},
			-- 8
			{2,	{6, 10, nil},
				{nil, 976, "Phi Sa", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 9
			{1, {5, 0, nil},
				{nil, 981, "Tranh H�n", 75, 2, 0, 32, func_npc_getpos}},
			-- 10
			{1, {5, 0, nil},
				{nil, 982, "Ph� Lang", 75, 4, 0, 32, func_npc_getpos}},
			-- 11
			{2,	{9, 0, nil},
				{nil, 977, "S��ng Li�m", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 12
			{1, {6, 0, nil},
				{nil, 983, "�nh C�n", 75, 0, 0, 40, func_npc_getpos}},
			-- 13
			{2,	{6, 10, nil},
				{nil, 978, "Th�a Phong", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 14
			{1,	{4.5, 0, nil},
				{nil, 987, "Giang Tr�m Y�n", 75, -1, 0, 20, func_npc_getpos}},
			-- 15
			{1,	{6, 0, nil},
				{nil, 984, "�ao T� ", 75, -1, 0, 32, func_npc_getpos}},
			-- 16
			{2,	{9, 0, nil},
				{nil, 979, "Th�y H�n", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 17
			{1,	{4.5, 0, nil},
				{nil, 988, "C� D�  T�u", 75, -1, 0, 20, func_npc_getpos}},
			-- 18
			{2,	{6, 10, nil},
				{nil, 980, "Th�n T� ", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 19
			{1,	{4.5, 0, nil},
				{nil, 989, "Ch��ng B�t Ph��ng", 75, -1, 0, 20, func_npc_getpos}},
			-- 20
			{1,	{6, 0, nil},
				{nil, 985, "Lang b�ng", 75, -1, 0, 24, func_npc_getpos}},
			-- 21
			{2,	{10.5, 0, nil},
				{nil, 981, "Tranh H�n", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 22
			{1,	{4.5, 0, nil},
				{nil, 990, "Ti�n Than Th� ", 75, -1, 0, 20, func_npc_getpos}},
			-- 23
			{1,	{4.5, 0, nil},
				{nil, 991, "Nh�m T�ng Ho�nh", 75, -1, 0, 20, func_npc_getpos}},
			-- 24
			{1,	{7.5, 30, nil},
				{nil, 992, "�� T�n Sinh", 75, -1, 0, 20, func_npc_getpos}},
			-- 25
			{2,	{9, 0, nil},
				{nil, 984, "�ao T� ", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 26
			{1, {7.5, 0, nil},
				{nil, 986, "H�c C�n", 75, -1, 0, 56, func_npc_getpos}},
			-- 27
			{2, {24, 15, nil},
				{nil, 1006, "Nhi�p Th� Tr�n", 75, -1, 0, 1, {1568, 3227}},
				{nil, 985, "Lang b�ng", 75, -1, 0, 16, func_npc_getpos}},
			-- 28
			{1, {0, 0, nil},
				{nil, 993, func_npc_get_eachname, 75, -1, 1, 8, func_npc_getpos}},
		}, --tbNormalNpc
		
		tbHidenNpc = {
			-- ��ս�ͽ�ʮ���������а����
			{1,	{0, 0, nil}, {nil, {994, 1001}, {func_ladder_getname, 10119}, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- ��ս����ʱ�����ս���а����
			{1,	{0, 0, nil}, {nil, {994, 1001}, {func_ladder_getname, 10179}, 75, func_npc_getseries, 1, 1, {1568, 3227}}}
		},--tbHidenNpc
		
	}, -- [1]
	[2] = {
		tbNormalNpc = {
			-- 1
			{1, {2, 0, nil},
				{nil, 1007, "S��ng �ao ", 95, -1, 0, 16, func_npc_getpos}},
			-- 2
			{1, {2, 0, nil},
				{nil, 1008, "Phi Sa", 95, -1, 0, 16, func_npc_getpos}},
			-- 3
			{1, {3, 0, nil},
				{nil, 1009, "S��ng Li�m", 95, -1, 0, 20, func_npc_getpos}},
			-- 4
			{2, {9, 0, nil},
				{nil, 1007, "S��ng �ao ", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 5
			{1, {3, 0, nil},
				{nil, 1010, "Th�a Phong", 95, -1, 0, 20, func_npc_getpos}},
			-- 6
			{1, {5, 0, nil},
				{nil, 1011, "Th�y H�n", 95, 1, 0, 24, func_npc_getpos}},
			-- 7
			{1, {5, 0, nil},
				{nil, 1012, "Th�n T� ", 95, 3, 0, 24, func_npc_getpos}},
			-- 8
			{2, {9, 15, nil},
				{nil, 1008, "Phi Sa", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 9
			{1, {6, 0, nil},
				{nil, 1013, "Tranh H�n", 95, 2, 0, 32, func_npc_getpos}},
			-- 10
			{1, {6, 0, nil},
				{nil, 1014, "Ph� Lang", 95, 4, 0, 32, func_npc_getpos}},
			-- 11
			{2, {12, 0, nil},
				{nil, 1009, "S��ng Li�m", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 12
			{1, {9, 0, nil},
				{nil, 1015, "�nh C�n", 95, 0, 0, 40, func_npc_getpos}},
			-- 13
			{2, {9, 15, nil},
				{nil, 1010, "Th�a Phong", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 14
			{1, {6, 0, nil},
				{nil, 1019, "Giang Tr�m Y�n", 95, -1, 0, 20, func_npc_getpos}},
			-- 15
			{1, {9, 0, nil},
				{nil, 1016, "�ao T� ", 95, -1, 0, 32, func_npc_getpos}},
			-- 16
			{2, {14, 0, nil},
				{nil, 1011, "Th�y H�n", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 17
			{1, {6, 0, nil},
				{nil, 1020, "C� D�  T�u", 95, -1, 0, 20, func_npc_getpos}},
			-- 18
			{2, {12, 20, nil},
				{nil, 1012, "Th�n T� ", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 19
			{1, {6, 0, nil},
				{nil, 1021, "Ch��ng B�t Ph��ng", 95, -1, 0, 20, func_npc_getpos}},
			-- 20
			{1, {8, 0, nil},
				{nil, 1017, "Lang b�ng", 95, -1, 0, 24, func_npc_getpos}},
			-- 21
			{2, {14, 0, nil},
				{nil, 1013, "Tranh H�n", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 22
			{1, {6, 0, nil},
				{nil, 1022, "Ti�n Than Th� ", 95, -1, 0, 20, func_npc_getpos}},
			-- 23
			{1, {6, 0, nil},
				{nil, 1023, "Nh�m T�ng Ho�nh", 95, -1, 0, 20, func_npc_getpos}},
			-- 24
			{1, {10, 20, nil},
				{nil, 1024, "�� T�n Sinh", 95, -1, 0, 20, func_npc_getpos}},
			-- 25
			{2, {15, 0, nil},
				{nil, 1016, "�ao T� ", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 26
			{1, {9, 0, nil},
				{nil, 1018, "H�c C�n", 95, -1, 0, 56, func_npc_getpos}},
			-- 27
			{2, {32, 32, nil},
				{nil, 1038, "Nhi�p Th� Tr�n", 95, -1, 1, 1, {1568, 3227}},
				{nil, 1017, "Lang b�ng", 95, -1, 0, 16, func_npc_getpos}},
			-- 28
			{1, {0, 0, nil},
				{nil, 1025, func_npc_get_eachname, 75, -1, 1, 8, func_npc_getpos}},
		}, -- tbFightNpc

		tbHidenNpc = {
			-- ��ս�ͽ�ʮ���������а����
			{1,	{0, 0, nil}, {nil, {1026, 1033}, {func_ladder_getname, 10119}, 75, -1, 1, 1, {1568, 3227}}},
			-- ��ս�߼�ʱ�����ս���а����
			{1,	{0, 0, nil}, {nil, {1026, 1033}, {func_ladder_getname, 10180}, 75, -1, 1, 1, {1568, 3227}}}
		} ,--tbHidenNpc
	}, --[2]
}

-- С��߱�� �� ��boss
map_new_Ncp = {
	[1] = {nil, 1673, "Ti�u Nhi�p Th� Tr�n", 95, -1, 1, 1, {1568, 3227}},
	[2] = { nNpcId = 1674, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_C� B�ch",	nIsboss = 1,},
	[3] = { nNpcId = 1675, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_Huy�n Gi�c ��i S�",	nIsboss = 1,},
	[4] = { nNpcId = 1676, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_���ng B�t Nhi�m",	nIsboss = 1,},
	[5] = { nNpcId = 1677, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_Lam Y Y",	nIsboss = 1,},
	[6] = { nNpcId = 1678, nLevel = 95,	bNoRevive = 1, szName = "V��t �i _Thanh Hi�u S� Th�i",	nIsboss = 1,},
	[7] = { nNpcId = 1679, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_Chung Linh T�",	nIsboss = 1,},
	[8] = { nNpcId = 1680, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_H� Nh�n Ng�",	nIsboss = 1,},
	[9] = { nNpcId = 1681, nLevel = 95,	bNoRevive = 1, szName = "V��t �i _�oan M�c Du�",	nIsboss = 1,},
	[10] = { nNpcId = 1682, nLevel = 95,	bNoRevive = 1, szName = "V��t �i_��o Thanh Ch�n Nh�n",	nIsboss = 1,},
	[11] = { nNpcId = 1683, nLevel = 95,	bNoRevive = 1, szName = "V��t �i _To�n C� T�",	nIsboss = 1,},
};

-- �µ�ͼ����npc
map_transfer_npc = {
	[1] = { nNpcId = 1684,	bNoRevive = 1, szName = "V��t �i_Ng��i ti�p d�n M�t Ph�ng", szScriptPath = "\\script\\missions\\challengeoftime\\npc\\transfer.lua"},
}

-- ����������������Ϊ100000
map_random_awards = {
	100000,													-- �������Ϊ100000
	{0.005, 		{"Tinh H�ng B�o Th�ch",		353}},					-- �ɺ챦ʯ
	{0.005, 		{"Lam Th�y Tinh", 			238}},					-- ��ˮ��
	{0.005, 		{"T� Th�y Tinh", 			239}},					-- ��ˮ��
	{0.005, 		{"L�c Th�y Tinh", 			240}},					-- ��ˮ��
	{0.0005, 	{"V� L�m M�t T�ch", 		6, 1, 26, 1, 0, 0}},	-- �����ؼ�
	{0.0005, 	{"T�y T�y Kinh",			6, 1, 22, 1, 0, 0}},	-- ϴ�辭
	{0.2, 		{"Ph�c Duy�n L� (��i) ",	6, 1, 124, 1, 0, 0}},	-- ��Ե¶����
	{0.19587, 		{"Ph�c Duy�n L� (Trung) ", 	6, 1, 123, 1, 0, 0}},	-- ��Ե¶���У�
	{0.18, 		{"Ph�c Duy�n L� (Ti�u) ",	6, 1, 122, 1, 0, 0}},	-- ��Ե¶��С��
	{0.15, 	{"Ti�n Th�o L�",			6, 1, 71, 1, 0, 0}},	-- �ɲ�¶
	{0.1, 		{"Thi�n s�n  B�o L� ",		6, 1, 72, 1, 0, 0}},	-- ��ɽ��¶
	{0.1, 		{"B�ch Qu� L�",			6, 1, 73, 1, 0, 0}},	-- �ٹ�¶
--	{0.00, 		{"��׾���",		6, 1, 130, 1, 0, 0}},	-- ��׾���
	{0.05, 		{"L�nh b�i Phong L�ng ��",		489}},					-- ���������
	--{0.0005, 	{" �� ph� Ho�ng Kim - ��nh Qu�c Thanh Sa Tr��ng Sam",	0, 159}},				-- ����֮��ɴ����
	--{0.0005, 	{"��nh Qu�c � Sa Ph�t Qu�n",	0, 160}},				-- ����֮��ɰ����
	--{0.0005,		{"��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",	0, 161}},				-- ����֮�����ѥ
	--{0.0005,		{" �� ph� Ho�ng Kim - ��nh Qu�c T� ��ng H� uy�n",	0, 162}},				-- ����֮���ٻ���
	--{0.0005,		{" �� ph� Ho�ng Kim - ��nh Qu�c Ng�n T�m Y�u ��i",	0, 163}},				-- ����֮��������
	--{0.0001,	{"An Bang B�ng Tinh Th�ch H�ng Li�n",0, 164}},				-- ����֮����ʯ����
	--{0.0001,	{" �� ph� Ho�ng Kim - An Bang C�c Hoa Th�ch Ch� ho�n",0, 165}},				-- ����֮�ջ�ʯָ��
	--{0.0001,	{" �� ph� Ho�ng Kim - An Bang �i�n Ho�ng Th�ch Ng�c B�i",0, 166}},				-- ����֮���ʯ����
	--{0.0001,	{" �� ph� Ho�ng Kim - An Bang K� Huy�t Th�ch Gi�i Ch� ",0, 167}},				-- ����֮��Ѫʯ��ָ
	--{0.00001, {"M�ng Long Kim Ti Ch�nh H�ng C� Sa",	0, 2}},				-- ����֮��˿��������
	--{0.00001, {"T� Kh�ng Gi�ng Ma Gi�i �ao",	0, 11}},				-- �Ŀ�֮��ħ�䵶
	--{0.00001,	{"Ph�c Ma T� Kim C�n",	0, 6}},				-- ��ħ֮�Ͻ��
	--{0.00001,	{"K� Nghi�p B�n L�i To�n Long th��ng",	0, 21}},				-- ��ҵ֮��������ǹ
	--{0.00001,	{"Ng� Long L��ng Ng�n B�o �ao",	0, 26}},				-- ����֮��������
	--{0.00001,	{"��a Ph�ch H�c Di�m Xung Thi�n Li�n",0, 87}},				-- ����֮���������
	--{0.00001,	{"B�ng H�n ��n Ch� Phi �ao",0, 71}},				-- ����֮��ָ�ɵ�
	--{0.00001,	{"S�m Hoang Phi Tinh �o�t H�n",0, 81}},				-- ɭ��֮���Ƕ��
	--{0.00001,	{"Thi�n Quang ��nh T�m Ng�ng Th�n Ph� ",0, 77}},				-- ���֮���������
	--{0.00001, {"Ch� Ph��c Di�t L�i C�nh Ph� ",	0, 67}},				-- �丿֮���׾���
	--{0.00001, {"Minh �o T� S�t ��c Nh�n",	0, 61}},				-- ڤ��֮аɲ����
	--{0.00001,	{"T� Ho�ng Ph�ng Nghi �ao",	0, 46}},				-- �ܻ�֮���ǵ�
	--{0.00001,	{"B�ch H�i Uy�n ��ng Li�n Ho�n �ao",	0, 51}},				-- �̺�֮ԧ��������
	--{0.00001,	{"V� Ma H�ng Truy Nhuy�n Th�p h�i",	0, 40}},				-- ����֮�����NЬ
	--{0.00001,	{"V� Ma T�y T��ng Ng�c Kh�u ",0, 39}},				-- ����֮ϴ�����
	--{0.00001,	{"C�p Phong Tam Thanh Ph� ",0, 122}},				-- ����֮�����
	--{0.00001,	{"V� �o B�c Minh ��o qu�n",0, 136}},				-- ���֮��ڤ����
	--{0.00001,	{"S��ng Tinh Thi�n Ni�n H�n Thi�t",0, 126}},				-- ˪��֮ǧ�꺮��
	--{0.00001,	{"L�i Khung Thi�n ��a H� ph� ",	0, 132}},				-- ���֮��ػ���
	--{0.00001,	{"Ma Th� s�n  H�i Phi H�ng L� ",	0, 115}},				-- ħ��֮ɽ���ɺ���
	--{0.00001,	{"Ma Ho�ng �n Xu�t H� H�ng Khuy�n",	0, 107}},				-- ħ��֮��������Ȧ
	--{0.00001,	{"��ng C�u Kh�ng Long H� Uy�n",0, 94}},				-- ͬ��֮��������
	--{0.00001,	{"��ch Kh�i L�c Ng�c Tr��ng",0, 96}},				-- ����֮������
};

-- ��ȡNPC��ID
function get_npc_id(item, index)
	local id = item[NPC_ATTRIDX_ID];
	local id_type = type(id);
	if (id_type == "function") then
		return id(item, index);
	elseif (id_type == "number") then
		return id;
	elseif (id_type == "table") then
		local pos = random(1, getn(id));
		return id[pos];
	end
end

-- ��ȡNPC������
function get_npc_name(item, index)
	local name = item[NPC_ATTRIDX_NAME];
	local name_type = type(name);

	if (name_type == "string") then
		return name;
	elseif (name_type == "function") then
		return name(item, index);
	elseif (name_type == "table") then
		local func = name[1];
		return func(item, index);
	else
		return nil;
	end
end

-- ��ȡNPC�ļ���
function get_npc_level(item, index)
	return item[NPC_ATTRIDX_LEVEL];
end

-- ��ȡNPC������
function get_npc_series(item, index)
	local series = item[NPC_ATTRIDX_SERIES];
	local series_type = type(series);
	if (series_type == "function") then
		return series(item, index);
	elseif (series_type == "number") then
		if (series < 0) then
			local pos = random(1, getn(map_series));
			return map_series[pos];
		else
			return series;
		end
	else
		return nil;
	end
end

-- NPC�ĺ��������ۼӵ�ǰʹ�õ����������
function npc_proceed(item)
	local proceed = item[NPC_ATTRIDX_PROCEED];
	local proceed_type = type(proceed);
	if (proceed_type == "function") then
		proceed(item);
	end
end

-- ��ȡNPC������
function get_npc_count(item)
	return item[NPC_ATTRIDX_COUNT];
end

-- ��ȡNPC��λ��
function get_npc_pos(item, index)
	local pos = item[NPC_ATTRIDX_POSITION];
	local pos_type = type(pos);
	if (pos_type == "table") then
		return pos[1], pos[2];
	elseif (pos_type == "function") then
		return pos(item, index);
	else
		return nil;
	end
end

-- �Ƿ�BOSS
function get_npc_isboss(item)
	return item[NPC_ATTRIDX_ISBOSS];
end

-- ��ǰNPC���ñ�
function GetNpcList()
	local nLevel = GetMatchLevel()
	if nLevel > getn(tbFightNpc) then
		return {}
	end
	return tbFightNpc[nLevel].tbNormalNpc
end

-- ��ǰ����NPC���ñ�
function GetHidenNpcList()
	local nLevel = GetMatchLevel()
	if nLevel > getn(tbFightNpc) then
		return {}
	end
	return tbFightNpc[nLevel].tbHidenNpc
end

-- ��ȡ��������
function get_batch_count()
	return getn(GetNpcList())
end

-- �����趨����NPC�����ش�����NPC������
function add_npc(item)
	local npc_count = get_npc_count(item);			-- NPC����
	local res_count = 0;							-- ������NPC����
	
	for index = 1, npc_count do
		local id = get_npc_id(item, index);			-- NPC��ID
		local level = get_npc_level(item, index);	-- NPC�ȼ�
		local isboss = get_npc_isboss(item, index);	-- �Ƿ�boss
		local series = get_npc_series(item, index);
		local name = get_npc_name(item, index);
		local px, py = get_npc_pos(item, index);
		npc_proceed(item);

		local npc_index = AddNpcEx(
			id,			-- ID
			level,		-- �ȼ�
			series,		-- ����
			SubWorld,	-- ��ͼ
			px * 32,	-- X����
			py * 32,	-- Y����
			1,			-- ������
			name,		-- ����
			isboss);	-- �Ƿ�BOSS
		if (npc_index ~= nil and npc_index > 0) then
			res_count = res_count + 1;
			-- ���������ű�
			SetNpcDeathScript(npc_index, SCRIPT_NPC_DEATH);
		else
			-- DEBUG
			local msg = format("Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!!!",
				id, level, series, SubWorld, px, py, 1, name, isboss);
			print(msg);
		end
	end
	
	return res_count;
end

function create_all_npc(npcs)
	local times = npcs[1];
	local count = 0;
	for i = 1, times do
		count = count + add_npc(npcs[i + 2]);
	end
	
	SetMissionV(VARV_NPC_COUNT, count);
	return count;
end

-- �ڵ�ͼ������NPC
function create_batch_npc(batch)
	local tbNpcList = GetNpcList()
	local npc = tbNpcList[batch]	-- ������

	local npc_count = create_all_npc(npc)
	

	
	-- ���ص��� by wangjingjun 2011.03.01
	if batch == GetMissionV(VARV_XIAONIESHICHEN_BATCH) and GetMissionV(VARV_BATCH_MODEL) == 1 then

		--add_npc(map_new_Ncp[1])
	--	basemission_CallNpc(map_new_Ncp[1], SubWorldIdx2ID(SubWorld),nX, nY)
		--SetMissionV(VARV_NPC_COUNT, npc_count + 1);
		--WriteLog("Ti�u Nhi�p Th� Tr�n �� tham gia chi�n cu�c!")
		--Msg2MSAll(MISSION_MATCH, "Ti�u Nhi�p Th� Tr�n �� tham gia chi�n cu�c!");
	end

	local msg = "Xu�t hi�n" .. npc_count .. "con qu�i!"
	Msg2MSAll(MISSION_MATCH, msg)
	
	-- ��11��ˢ���ճ�����Ի�NPC
	--if (batch == 11) then
		-- �ճ�����ˢ�¶Ի�NPC
	--	%tbTalkDailyTask:AddTalkNpc(SubWorldIdx2ID(SubWorld), SubWorldIdx2ID(SubWorld));
	--end
end


-- ���Ӵ��ش���npc
function add_transfer_npc()
	local nX,nY, nMapIndex = GetPos()
	--basemission_CallNpc(map_transfer_npc[1], SubWorldIdx2ID(nMapIndex),1568*32, 3227*32)
end
