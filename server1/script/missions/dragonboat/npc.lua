-- description	: ����NPC
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\battles\\battlehead.lua")

-- ��������<=>λ���ļ�
map_file = {
	[16] = "\\settings\\maps\\dragonboat\\lineup16.txt",	
	[20] = "\\settings\\maps\\dragonboat\\lineup20.txt",
	[24] = "\\settings\\maps\\dragonboat\\lineup24.txt",
	[32] = "\\settings\\maps\\dragonboat\\lineup32.txt",
	[40] = "\\settings\\maps\\dragonboat\\lineup40.txt",
	[56] = "\\settings\\maps\\dragonboat\\lineup56.txt"
};

-- ����
map_series = {
	[0] = "Kim",
	[1] = "M�c",
	[2] = "Th�y ",
	[3] = "H�a",
	[4] = "Th� "
};

-- ��������
map_lnpc = {
	{1, {909, "S��ng �ao", 75, -1, 0, 16, 8}},
	{1, {910, "Phi Sa ", 75, -1, 0, 16, 8}},
	{1, {911, "S��ng Li�m", 75, -1, 0, 20, 8}},
	{1, {912, "Th�a Phong", 75, -1, 0, 20, 8}},
	{2, {921, "H� H�n", 75, 1, 1, 1,  1618, 3208},
		{909, "S��ng �ao", 75, 1, 0, 16, 8}},
	{1, {913, "Th�y H�n", 75, 1, 0, 24, 7}},
	{1, {914, "Th�n T� ", 75, 3, 0, 24, 7}},
	{1, {915, "Tranh H�n", 75, 2, 0, 32, 7}},
	{1, {916, "Ph� Lang", 75, 4, 0, 32, 7}},
	{2, {922, "H� H�n", 75, 3, 1, 1,  1618, 3208},
		{910, "Phi Sa ", 75, 3, 0, 16, 8}},
	{1, {917, "�nh C�n ", 75, 0, 0, 40, 7}},
	{1, {918, "�ao T� ", 75, -1, 0, 32, 7}},
	{2, {923, "H� H�n", 75, 2, 1, 1,  1618, 3208},
		{911, "S��ng Li�m", 75, 2, 0, 16, 8}},
	{1, {919, "Lang B�ng", 75, -1, 0, 24, 7}},
	{2, {924, "H� H�n", 75, 4, 1, 1,  1618, 3208},
	    {912, "Th�a Phong", 75, 4, 0, 16, 8}},
	{1, {920, "H�c C�n", 75, -1, 0, 56, 1}},
	{2, {925, "H� H�n", 75, 0, 1, 1,  1618, 3208},
		{918, "�ao T� ", 75, 0, 0, 16, 8}},
	{1, {926, "H� H�n", 75, -1, 1, 1,  1618, 3208}}
};

-- �߼�����
map_hnpc = {
	{1, {927, "S��ng �ao", 95, -1, 0, 16, 8}},
	{1, {928, "Phi Sa ", 95, -1, 0, 16, 8}},
	{1, {929, "S��ng Li�m", 95, -1, 0, 20, 8}},
	{1, {930, "Th�a Phong", 95, -1, 0, 20, 8}},
	{2, {939, "H� H�n", 95, 1, 1, 1,  1618, 3208},
		{927, "S��ng �ao", 95, 1, 0, 16, 8}},
	{1, {931, "Th�y H�n", 95, 1, 0, 24, 7}},
	{1, {932, "Th�n T� ", 95, 3, 0, 24, 7}},
	{1, {933, "Tranh H�n", 95, 2, 0, 32, 7}},
	{1, {934, "Ph� Lang", 95, 4, 0, 32, 7}},
	{2, {940, "H� H�n", 95, 3, 1, 1,  1618, 3208},
	 	{928, "Phi Sa ", 95, 3, 0, 16, 8}},
	{1, {935, "�nh C�n ", 95, 0, 0, 40, 7}},
	{1, {936, "�ao T� ", 95, -1, 0, 32, 7}},
	{2, {941, "H� H�n", 95, 2, 1, 1,  1618, 3208},
	 	{929, "S��ng Li�m", 95, 2, 0, 16, 8}},
	{1, {937, "Lang B�ng", 95, -1, 0, 24, 7}},
	{2, {942, "H� H�n", 95, 4, 1, 1,  1618, 3208},
	 	{930, "Th�a Phong", 95, 4, 0, 16, 8}},
	{1, {938, "H�c C�n", 95, -1, 0, 56, 1}},
	{2, {943, "H� H�n", 95, 0, 1, 1,  1618, 3208},
	 	{936, "�ao T� ", 95, 0, 0, 16, 8}},
	{1, {944, "H� H�n", 95, -1, 1, 1,  1618, 3208}}
};

-- �����������ؽ�Ʒ
map_ldrop = {
	{20, 6, 1, 435, 1, 0, 0, "<#> B�nh ch�ng nh�n ��u"},	-- 0.2���ʣ���ɳ����
	{30, 6, 1, 436, 1, 0, 0, "<#> B�nh ch�ng n�m h��ng"},	-- 0.3���ʣ��㹽����
	{40, 6, 1, 437, 1, 0, 0, "<#> B�nh ch�ng tr�ng"},	-- 0.4���ʣ���������
	{10, 6, 1, 425, 1, 0, 0, "<#> Thuy�n R�ng ��u Ph�ng"},	-- 0.1���ʣ���ͷ����
};

map_laward = {
	[1] = {2, 0, nil},
	[2] = {3, 0, nil},
	[3] = {3, 0, nil},
	[4] = {4, 0, nil},
	[5] = {12, 15, nil},
	[6] = {5, 0, nil},
	[7] = {5, 0, nil},
	[8] = {6, 0, nil},
	[9] = {6, 0, nil},
	[10] = {15, 20, nil},
	[11] = {8, 0, nil},
	[12] = {10, 0, nil},
	[13] = {18, 30, nil},
	[14] = {10, 0, nil},
	[15] = {20, 0, nil},
	[16] = {15, 60, nil},
	[17] = {25, 0, nil},
	[18] = {0, 0, map_ldrop},
};

-- �߼��������ؽ�Ʒ
map_hdrop = {
	{10, 6, 1, 435, 1, 0, 0, "<#> B�nh ch�ng nh�n ��u"},	-- 0.2���ʣ���ɳ����
	{25, 6, 1, 436, 1, 0, 0, "<#> B�nh ch�ng n�m h��ng"},	-- 0.3���ʣ��㹽����
	{40, 6, 1, 437, 1, 0, 0, "<#> B�nh ch�ng tr�ng"},	-- 0.4���ʣ���������
	{25, 6, 1, 425, 1, 0, 0, "<#> Thuy�n R�ng ��u Ph�ng"},	-- 0.1���ʣ���ͷ����
};

map_haward = {
	[1] = {4, 0, nil},
	[2] = {5, 0, nil},
	[3] = {6, 0, nil},
	[4] = {8, 0, nil},
	[5] = {24, 15, nil},
	[6] = {10, 0, nil},
	[7] = {10, 0, nil},
	[8] = {12, 0, nil},
	[9] = {12, 0, nil},
	[10] = {30, 20, nil},
	[11] = {16, 0, nil},
	[12] = {20, 0, nil},
	[13] = {36, 30, nil},
	[14] = {20, 0, nil},
	[15] = {40, 0, nil},
	[16] = {30, 60, nil},
	[17] = {50, 0, nil},
	[18] = {0, 0, map_hdrop},
};

-- ��ȡNPC��ID
function get_npc_id(item)
	return item[1];
end

-- ��ȡNPC������
function get_npc_name(item)
	return item[2];
end

-- ��ȡNPC�ļ���
function get_npc_level(item)
	return item[3];
end

-- ��ȡNPC������
function get_npc_series(item)
	if (item[4] == -1) then
		return random(0, 4);
	end
	return item[4];
end

-- ��ǰ�����Ƿ�߼�����
function advanced()
	world = SubWorldIdx2ID(SubWorld);
	return map_isadvanced[world] ~= 0;
end

-- ��ȡ��������
function get_batch_count()
	if (advanced()) then
		return getn(map_hnpc);
	end
	return getn(map_lnpc);
end

-- �Ƿ�BOSS
function is_boss(item)
	return item[5];
end

-- ��ȡNPC������
function get_npc_count(item)
	return item[6];
end

-- ���ļ��ж�ȡNPCλ��
function get_file_pos(file, line, column)
	x = GetTabFileData(file, line, column);
	y = GetTabFileData(file, line, column + 1);
	return x, y;
end

-- �����趨����NPC
function add_npc(item)
	local id = get_npc_id(item);
	local name = get_npc_name(item);
	local level = get_npc_level(item);
	local count = get_npc_count(item);
	local isboss = is_boss(item);
	local series = 0;

	local x = 0;
	local y = 0;
	local index = 0;
	local result = 0;
	
	if (count == 1) then
		x = item[7];
		y = item[8];
		series = get_npc_series(item);
		index = AddNpcEx(id, level, series, SubWorld, x * 32, y * 32, 1, name, isboss);
		if (index > 0) then
			result = count;
			SetNpcDeathScript(index, SCRIPT_NPC_DEATH);
		else
			-- DEBUG
			local msg = format("DragonBoatMission: Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!",
				id, level, series, SubWorld, x, y, 1, name, isboss);
			print(msg);
		end
	elseif (count > 0) then
		local file = map_file[count];
		column = 2 * (random(1, item[7]) - 1) + 1;
		for i = 1, count do
			x, y = get_file_pos(file, i + 1, column);
			series = get_npc_series(item);
			index = AddNpcEx(
				id,			-- ID
				level,		-- �ȼ�
				series,		-- ����
				SubWorld,	-- ��ͼ
				x * 32,		-- X����
				y * 32,		-- Y����
				1,			-- ������
				name,		-- ����
				isboss);	-- �Ƿ�BOSS
			if (index > 0) then
				result = result + 1;
				SetNpcDeathScript(index, SCRIPT_NPC_DEATH);
			else
				-- DEBUG
				local msg = format("DragonBoatMission: Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!",
					id, level, series, SubWorld, x, y, 1, name, isboss);
				print(msg);
			end
		end
	else
		-- DEBUG
		local msg = "Wrong NpcCount: " .. count;
		print(msg);
	end
	return result;
end

-- �ڵ�ͼ������NPC
function create_npc(batch)
	npc = map_lnpc[batch];		-- ������
	world = SubWorldIdx2ID(SubWorld);
	if (map_isadvanced[world] ~= 0) then
		npc = map_hnpc[batch];	-- �߼���
	end
	
	local times = npc[1];
	local count = 0;
	for i = 1, times do
		count = count + add_npc(npc[i + 1]);
	end
	SetMissionV(VARV_NPC_COUNT, count);
	
	-- DEBUG
	local msg = "Xu�t hi�n" .. count .. "con qu�i!";
	Msg2MSAll(MISSION_MATCH, msg);
end
