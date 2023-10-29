Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\misc\\eventsys\\type\\func.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\vng_event\\thapnienlenhbai\\mainfuc.lua")

-- ����������������Ϊ100000 �����޸Ľ��ɲݼ��ʼӵ�1���������ƽ��ʼӵ�3������ ��Եֱ�Ӷ�Ӧ����
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
--	{0.0005, 	{"��nh Qu�c � Sa Ph�t Qu�n",	0, 160}},				-- ����֮��ɰ����
	--{0.0005,		{"��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",	0, 161}},				-- ����֮�����ѥ
	--{0.0005,		{" �� ph� Ho�ng Kim - ��nh Qu�c T� ��ng H� uy�n",	0, 162}},				-- ����֮���ٻ���
	--{0.0005,		{" �� ph� Ho�ng Kim - ��nh Qu�c Ng�n T�m Y�u ��i",	0, 163}},				-- ����֮��������
	--{0.0001,	{"An Bang B�ng Tinh Th�ch H�ng Li�n",0, 164}},				-- ����֮����ʯ����
	--{0.0001,	{" �� ph� Ho�ng Kim - An Bang C�c Hoa Th�ch Ch� ho�n",0, 165}},				-- ����֮�ջ�ʯָ��
	--{0.0001,	{" �� ph� Ho�ng Kim - An Bang �i�n Ho�ng Th�ch Ng�c B�i",0, 166}},				-- ����֮���ʯ����
	--{0.0001,	{"An Bang K� Huy�t Th�ch Gi�i Ch� ",0, 167}},				-- ����֮��Ѫʯ��ָ
--	{0.00001, {"M�ng Long Kim Ti Ch�nh H�ng C� Sa",	0, 2}},				-- ����֮��˿��������
	--{0.00001, {"T� Kh�ng Gi�ng Ma Gi�i �ao",	0, 11}},				-- �Ŀ�֮��ħ�䵶
--	{0.00001,	{"Ph�c Ma T� Kim C�n",	0, 6}},				-- ��ħ֮�Ͻ��
--	{0.00001,	{"K� Nghi�p B�n L�i To�n Long th��ng",	0, 21}},				-- ��ҵ֮��������ǹ
--	{0.00001,	{"Ng� Long L��ng Ng�n B�o �ao",	0, 26}},				-- ����֮��������
--	{0.00001,	{"��a Ph�ch H�c Di�m Xung Thi�n Li�n",0, 87}},				-- ����֮���������
--	{0.00001,	{"B�ng H�n ��n Ch� Phi �ao",0, 71}},				-- ����֮��ָ�ɵ�
--	{0.00001,	{"S�m Hoang Phi Tinh �o�t H�n",0, 81}},				-- ɭ��֮���Ƕ��
	--{0.00001,	{"Thi�n Quang ��nh T�m Ng�ng Th�n Ph� ",0, 77}},				-- ���֮���������
--	{0.00001, {"Ch� Ph��c Di�t L�i C�nh Ph� ",	0, 67}},				-- �丿֮���׾���
--	{0.00001, {"Minh �o T� S�t ��c Nh�n",	0, 61}},				-- ڤ��֮аɲ����
--	{0.00001,	{"T� Ho�ng Ph�ng Nghi �ao",	0, 46}},				-- �ܻ�֮���ǵ�
--	{0.00001,	{"B�ch H�i Uy�n ��ng Li�n Ho�n �ao",	0, 51}},				-- �̺�֮ԧ��������
--	{0.00001,	{"V� Ma H�ng Truy Nhuy�n Th�p h�i",	0, 40}},				-- ����֮�����NЬ
--	{0.00001,	{"V� Ma T�y T��ng Ng�c Kh�u ",0, 39}},				-- ����֮ϴ�����
--	{0.00001,	{"C�p Phong Tam Thanh Ph� ",0, 122}},				-- ����֮�����
--	{0.00001,	{"V� �o B�c Minh ��o qu�n",0, 136}},				-- ���֮��ڤ����
--	{0.00001,	{"S��ng Tinh Thi�n Ni�n H�n Thi�t",0, 126}},				-- ˪��֮ǧ�꺮��
--	{0.00001,	{"L�i Khung Thi�n ��a H� ph� ",	0, 132}},				-- ���֮��ػ���
--	{0.00001,	{"Ma Th� s�n  H�i Phi H�ng L� ",	0, 115}},				-- ħ��֮ɽ���ɺ���
--	{0.00001,	{"Ma Ho�ng �n Xu�t H� H�ng Khuy�n",	0, 107}},				-- ħ��֮��������Ȧ
--	{0.00001,	{"��ng C�u Kh�ng Long H� Uy�n",0, 94}},				-- ͬ��֮��������
--	{0.00001,	{"��ch Kh�i L�c Ng�c Tr��ng",0, 96}},				-- ����֮������
}

-- ����ͨ�ؽ������廨�����顢��Ʒ
tbAward_Success = {
	[1] = {
		[1]=function(time) -- ����ͨ�ؽ������麯��
					local min = floor(time / 60);
					if (min >= 25) then
						return 15;
					else
						return floor(172 * (1 - min / 25)) + 10;
					end
			end,
		[2]=0,
		[3]=nil
	},-- Level 1
	[2] = {
		[1]=function(time) -- ����ͨ�ؽ������麯��
				local min = floor(time / 60);
				if (min >= 25) then
					return 30;
				else
					return floor(233 * (1 - min / 25)) + 20;
				end
			end,
		[2]=0,
		[3]=nil
	},-- Level 2
}

local tbAward_batch = 
{
	[15] = 2,
	[28] = 2,
}
local tbPro = {szName="B�o r��ng v��t �i",tbProp={6, 1, 2742, 1, 0, 0},}
function award_batch_extend(batch)
	
	local tbPlayerList = GetMatchPlayerList()
	
	for i=1,getn(tbPlayerList) do
		local nPlayerIndex = tbPlayerList[i]
		
		--�Ӱ�ṱ�׶�
		--CallPlayerFunction(nPlayerIndex, award_batch_contribution, batch)
		-- Խ�����ջʱ����ս���Ĺ�����
		--CallPlayerFunction(nPlayerIndex, SetTask, tbBirthday0905.tbTask.tsk_toll_cg_passcount, batch)
		-- ���ص��� by wangjingjun 2011.03.01
			--if %tbAward_batch[batch] and GetMissionV(VARV_BATCH_MODEL) == 1 then
				--%tbPro.nCount = %tbAward_batch[batch]
				--CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, %tbPro, "chuangguan award", 1)
			--end
			-- С��߱������
		if GetMissionV(VARV_BATCH_MODEL) == 1 and batch == GetMissionV(VARV_XIAONIESHICHEN_BATCH) then
			--%tbPro.nCount = 1
			--CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, %tbPro, "xiaonieshichen awrad", 1)
			
			--local nExpCount = 10000000
			local nExpCount = 20000

			--nExpCount = Chuangguan_checkdoubleexp(nExpCount)
			CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, {nExp_tl=1,nCount = nExpCount,}, "xiaonieshichen awrad", 1)
		end
	end
	
end

-- ����������
function award_hidden_mission()
	local tbPlayerList = GetMatchPlayerList()
	for i=1,getn(tbPlayerList) do
		local nPlayerIndex = tbPlayerList[i]
		CallPlayerFunction(nPlayerIndex, award_random_object, map_random_awards);
		-- Խ�����ջʱ����ս���Ĺ�����
		CallPlayerFunction(nPlayerIndex, SetTask, tbBirthday0905.tbTask.tsk_toll_cg_passcount, 29);
	end
	local n_level = GetMatchLevel();
	EventSys:GetType("ChuanGuan"):OnEvent("OnPass", 29, tbPlayerList, n_level)
end

-- ������Ʒ
function award_item(item)

	local name = item[1];
	if (getn(item) == 2) then
		AddEventItem(item[2]);
	elseif (getn(item) == 3) then
		AddGoldItem(item[2], item[3]);
	elseif (getn(item) == 7) then
		AddItem(item[2], item[3], item[4], item[5], item[6], item[7]);
	end
	Msg2Player("<#> B�n nh�n ���c " .. name .. "!");
	
end

-- ���������Ʒ
function award_random_object(objects)
	local base = objects[1];		-- ��������ڵ�һ��λ��
	local sum = 0;
	local num = random(1, base);
	for i = 2, getn(objects) do		-- �����Ʒ�ӵڶ���λ�ÿ�ʼ
		local odds = objects[i][1];
		local item = objects[i][2];
		sum = sum + odds * base;
		if (num <= sum) then
			award_item(item)
			break;
		end
	end
end

function award_to_player_success()
	tbAwardTemplet:GiveAwardByList(tbExtItem, "finish challengeoftime")
	tbTimerLog:weiMing(tbExtItem[1].nPrestige)
end

-- �������
function award_player(exp, objects, time)
	
	--Storm ���ӻ���
	if(GetMissionV(VARV_MISSION_RESULT) == 1) then	--���ս���
		storm_addpoint(2, LIMIT_FINISH - time)
	end

	-- ��������
	local experience = exp;
	if (type(exp) == "function") then
		experience = exp(time);
	end	
	if (experience ~= 0) then
		local point = experience * 1000;
		--����120����������
		AddExp_Skill_Extend(point);
--		if(greatnight_huang_event(3) == 1) then
--		elseif(greatnight_huang_event(3) == 2) then
--			point = point * 2;
--		elseif(greatnight_huang_event(3) == 3) then
--			point = point * 3;
--		else
--		end;
		-- �Ƿ�ӳ�
		local name = GetMissionS(VARS_TEAM_NAME);
		if (GetName() == name) then
			point = point * (1 + 0.2);	--��������
		end;
		if (GetMatchLevel() == 2) then
			point = point * 2;
		end
		
		point = BigBoss:AddChuangGuanPoint(point);
		--point = Chuangguan_checkdoubleexp(point)
		AddOwnExp(point);
		Msg2Player("<#> B�n nh�n ���c " .. point .. "�i�m kinh nghi�m.");
	end
	
	-- ���������Ʒ
	if (objects ~= nil) then
		award_random_object(objects);
	end

end

-- ������Ʒ
function drop_item(index, count)
	local x, y, world = GetNpcPos(index);
	if (count ~= 0) then
		for i = 1, count do
			-- �����廨
			DropItem(world, x, y, -1, 1, 2, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0);
		end
	end
	-- ������Ʒ��
	--if ( random(1,100) <= 5 ) then
	--	DropItem(world, x, y, -1, 6, 1, 1392, 0, 0, 0, 0, 0, 0, 0, 0, 0);
	--end
end

-- ����
function award_batch_item(item, npc_index, time)
	-- ��ÿ����Ա����ͽ���
	local tbPlayerList = GetMatchPlayerList()
	for i=1, getn(tbPlayerList) do
			CallPlayerFunction(tbPlayerList[i], award_player, item[1], item[3], time)
	end
	
	-- ������Ʒ
	drop_item(npc_index, item[2]);
end

-- ���ν���
--��������������������NPC�����󣬲�����������һ��������󣬽������á�
--��ʱ��PlayerIndex�Ǵ������һֻ���عֵ��� 
--�����Ҫ��������ҽ���ʱ������ʹ��GetNextPlayer�ķ�ʽ��һһ��á�
function award_batch(batch, npc_index)
	local tbNpcList = GetNpcList();
	award_batch_item(tbNpcList[batch][2], npc_index, 0);

	local tbAllPlayer = GetMatchPlayerList()
	local n_level = GetMatchLevel();
	local nTime = GetMissionV(VARV_BOARD_TIMER)
	
	G_ACTIVITY:OnMessage("Chuanguan", batch, tbAllPlayer, n_level);
	EventSys:GetType("ChuanGuan"):OnEvent("OnPass", batch, tbAllPlayer, n_level, nTime)
	--Th�p Ni�n L�nh B�i h� tr� t�n th� - NgaVN
--	tbThapnienLenhbai:ChuanguanAward(nBatch, tbAllPlayer)
	--��ng Phong V�n L�nh B�i t� ��i h� tr� t�n th� - Modified By NgaVN - 20140615
	--tbPVLB_PtSpprt:COTAward(batch, tbAllPlayer)
	
	-- LLG_ALLINONE_TODO_20070802
	award_batch_extend(batch)
end

--�Ӱ�ṱ�׶�
function award_batch_contribution(batch)
	tongaward_challengeoutoftime(batch)
end


function GetMissionCompleteAward()
	local nLevel = GetMatchLevel()
	if not nLevel then
		return nil
	end
	return tbAward_Success[nLevel]
end

-- ͨ�ؽ���
function award_success(npc_index, time)
	local item = GetMissionCompleteAward()
	award_batch_item(item, npc_index, time)
end
