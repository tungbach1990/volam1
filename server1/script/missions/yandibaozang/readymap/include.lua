-- �׵۱���
-- by С�˶��
-- 2007.10.24
-- ��..
-- ���ڳ�����..
-- Ѱ���������ҵ����..

Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

IncludeLib("RELAYLADDER")
Include("\\script\\lib\\log.lua")

YDBZ_READY_MISSION			= 51		-- ׼����mission
YDBZ_READY_TIMER 				= 88		--��ʱ��
YDBZ_READY_LIMIT_SIGNUP	= 5 * 60--5���ӣ�����ʱ��
YDBZ_READY_LIMIT_BROAD	= 1 * 60--1����,����һ��ʱ��
YDBZ_READY_LIMIT_WAIT		= 1 * 30--30�룬ֹͣ��������ʼ�������׼��ʱ��
YDBZ_READY_TEAM 				= 1 		--���ж����������ڳ��Ķ�������
YDBZ_READY_TEAM_MAX			= 2			--�ѱ������������������������뿪�Ķ��飩
YDBZ_READY_STATE				= 4			-- mission״̬��1��ʾ������2��ʾ����
YDBZ_READY_SIGNUP_WORLD	= 5			--������ͼ
YDBZ_READY_SIGNUP_POSX	= 6			--������ͼԭ����x
YDBZ_READY_SIGNUP_POSY	= 7			--������ͼԭ����y
YDBZ_MISSION_KEY				= 8			--����key
YDBZ_READY_BROAD_STATE	= 9			--���浹��ʱ����
YDBZ_TEAM_COUNT_LIMIT		= 4			--ÿ���������ٵĳ�Ա�����ܲμ�
YDBZ_TEAM_COUNT_MAXLIMIT	= 6			--ÿ���������ĳ�Ա�����ܲμ�
YDBZ_TEAM_START_LIMIT 	= 2			--ÿ�ŵ�ͼ�����㹻�Ķ��������ܿ���

YDBZ_READY_POS 					= {			----��ұ����ͱ��س�׼�������ꡣ
{1590,3195},
{1590,3170},
{1601,3184}, 
}
--׼������ͼID
--׼����mission��string�����������洢������
YDBZ_READY_MAP = {
	852,
	851,
	}

function YDBZ_ready_close_match()
	local oldsubworld = SubWorld
	-- ������߳���ͼ
	YDBZ_ready_kickout(0);
	
	-- �����ͼ
	SubWorld = oldsubworld
	--world = SubWorldIdx2ID(SubWorld);
	--ClearMapNpc(world, 1);	-- Ҳ�������
	--ClearMapTrap(world); 
	--ClearMapObj(world);
end

---- ������߻ر�����
function YDBZ_ready_kickout(group)
	local index = 0;
	local player = 0;
	local players = {}
	local i = 1
	if group > 0 then 
		Msg2MSGroup(YDBZ_READY_MISSION,"Do v� ��t thi ��u tranh �o�t n�y kh�ng �� �i�u ki�n, n�n ho�t ��ng s�  ch�m d�t. H�y l�u � l�n ho�t ��ng sau.",group)
	end
	while (1) do
		index, player = GetNextPlayer(YDBZ_READY_MISSION, index, group);
		if (player > 0) then
			players[i] = player
			i = i + 1
		end
		if (index == 0) then
			break;
		end	
	end
	
	local world = GetMissionV(YDBZ_READY_SIGNUP_WORLD);
	local pos_x = GetMissionV(YDBZ_READY_SIGNUP_POSX);
	local pos_y = GetMissionV(YDBZ_READY_SIGNUP_POSY); 
	local OldPlayerIndex = PlayerIndex;
	for i = 1, getn(players) do 
		PlayerIndex = players[i];
		local nteam = GetTask(YDBZ_TEAMS_TASKID)
		DelMSPlayer(YDBZ_READY_MISSION,PlayerIndex,nteam)
		YDBZ_restore(PlayerIndex,YDBZ_READY_MISSION,nteam);
		NewWorld(world, pos_x, pos_y);
		SetLogoutRV(0);
	end
	PlayerIndex = OldPlayerIndex;
end

function YDBZ_ready_joinmap(RoleIndex)
		local OldPlayerIndex = PlayerIndex
		PlayerIndex = RoleIndex
		str = "<color=yellow>"..GetName().."<color>Ti�n v�o b�n �� c�ng v�o b�o t�ng vi�m ��"
		local nteams = GetTask(YDBZ_TEAMS_TASKID)
		LeaveTeam()
		AddMSPlayer(YDBZ_READY_MISSION, nteams)
		
		local sf_mapid = SubWorldIdx2ID(SubWorld)
		local nrp = random(1,getn(YDBZ_READY_POS))
		NewWorld(sf_mapid, YDBZ_READY_POS[nrp][1], YDBZ_READY_POS[nrp][2]);
		Msg2MSAll(YDBZ_READY_MISSION,str);
		local nkey = GetMissionV(YDBZ_MISSION_KEY)
		SetTask(YDBZ_MISSIOM_PLAYER_KEY,nkey)
		SetCurCamp(1);
		SetFightState(0);
		SetLogoutRV(1);
		SetPunish(0);
		SetCreateTeam(0);
		SetPKFlag(1)
		ForbidChangePK(1);
		DisabledUseTownP(1)	
		ForbitTrade(1)
		ForbidEnmity(1)	
		SetTaskTemp(200,1)
		PlayerIndex = OldPlayerIndex
end

function YDBZ_joinmap(RoleIndex,readymap,matchmap,camp)
		--print("--JOIN NEWWORLD PLAYER--")
		local OldPlayerIndex = PlayerIndex;
		PlayerIndex = RoleIndex
		--print("1")
		SubWorld = readymap
		--print("2")
		local world = GetMissionV(YDBZ_READY_SIGNUP_WORLD);
		local pos_x = GetMissionV(YDBZ_READY_SIGNUP_POSX);
		local pos_y = GetMissionV(YDBZ_READY_SIGNUP_POSY);
		--print("3")

		local nteam = GetTask(YDBZ_TEAMS_TASKID)
		--print(format("world:%s nteam:%s world:%s px:%s py%s",SubWorld,nteam,world,pos_x,pos_y))
		--local szTeamName = GetMissionS(nteam)
		--print("6")
		str = "<color=yellow>"..GetName().."<color>Ti�n v�o b�n �� b�o t�ng vi�m ��"
		--print(str)
		
		--print(szTeamName)
		
--		local g = YDBZ_LIMIT_DOUBEL_ITEM[1][1]									--��Ʒ
--		local d = YDBZ_LIMIT_DOUBEL_ITEM[1][2]
--		local p = YDBZ_LIMIT_DOUBEL_ITEM[1][3]
--
--		local numzimu = CalcItemCount(3,g,d,p,-1)
--		local numbeibao = CalcItemCount(23,g,d,p,-1)
		
--		if numbeibao > 0 then
--	 		ConsumeItem(23,YDBZ_LIMIT_DOUBEL_ITEM[2],g,d,p,-1)
--			YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,1,1)
--			DelMSPlayer(YDBZ_READY_MISSION,RoleIndex,nteam)
--	 		AddSkillState(461,1, 1,30*60*18,1)
--	 		Msg2Player(format("��i hi�p c� <color=yellow>%s<color>, c�n c� v�o l�nh b�i n�y c� th� tham gia 1 l�n ho�t ��ng v��t �i, ��ng th�i thu ���c kinh nghi�m nh�n ��i v� ph�n th��ng Vi�m �� �� ��ng.",YDBZ_LIMIT_DOUBEL_ITEM[3]))
--	 		SetTask(YDBZ_ITEM_YANDILING_SUM,(GetTask(YDBZ_ITEM_YANDILING_SUM)+1))
--	 	elseif numzimu > 0 then
--			ConsumeItem(3,YDBZ_LIMIT_DOUBEL_ITEM[2],g,d,p,-1)
--			YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,1,1)
--			DelMSPlayer(YDBZ_READY_MISSION,RoleIndex,nteam)
--			AddSkillState(461,1, 1,30*60*18,1)
--			Msg2Player(format("��i hi�p c� <color=yellow>%s<color>, c�n c� v�o l�nh b�i n�y c� th� tham gia 1 l�n ho�t ��ng v��t �i, ��ng th�i thu ���c kinh nghi�m nh�n ��i v� ph�n th��ng Vi�m �� �� ��ng.",YDBZ_LIMIT_DOUBEL_ITEM[3]))
--			SetTask(YDBZ_ITEM_YANDILING_SUM,(GetTask(YDBZ_ITEM_YANDILING_SUM)+1))
--		else
		-- Thay ��i v� c�ch b�o danh - Modified - by AnhHH 20110725
		if (YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) == 0) then
		 	g = YDBZ_LIMIT_ITEM[1][1]
		 	d = YDBZ_LIMIT_ITEM[1][2]
		 	p = YDBZ_LIMIT_ITEM[1][3]			
			numzimu = CalcItemCount(3,g,d,p,-1)
			numbeibao = CalcItemCount(23,g,d,p,-1)
			--Thay ��i c�ch b�o danh vi�m ��, l�n ��u ti�n c� th� d�ng anh h�ng thi�p ho�c vi�m �� l�nh - Modified By DinhHQ - 20120206
			local ndg = YDBZ_LIMIT_DOUBEL_ITEM[1][1]									--��Ʒ
			local ndd = YDBZ_LIMIT_DOUBEL_ITEM[1][2]
			local ndp = YDBZ_LIMIT_DOUBEL_ITEM[1][3]
		
			local ndnumzimu = CalcItemCount(3,ndg,ndd,ndp,-1)
			local ndnumbeibao = CalcItemCount(23,ndg,ndd,ndp,-1)	
			
			if ( (numzimu+numbeibao) < YDBZ_LIMIT_ITEM[2]) then
				if ( (ndnumzimu+ndnumbeibao) < YDBZ_LIMIT_DOUBEL_ITEM[2]) then
					Msg2Player("Tr�n h�nh trang kh�ng �� Anh H�ng Thi�p ho�c Vi�m �� L�nh, kh�ng th� tham gia tranh �o�t Vi�m ��")
					YDBZ_restore(PlayerIndex,YDBZ_READY_MISSION,nteam);
					NewWorld(world, pos_x, pos_y);
					SetLogoutRV(0);
					PlayerIndex = OldPlayerIndex;
					return
				end
			end
		 	if numbeibao > 0 then
		 		ConsumeItem(23,YDBZ_LIMIT_ITEM[2],g,d,p,-1)
		 		tbLog:PlayerActionLog("TinhNangKey","BaoDanhViemDe_SDAnhHungThiep")
		 	elseif numzimu > 0 then
				ConsumeItem(3,YDBZ_LIMIT_ITEM[2],g,d,p,-1)
				tbLog:PlayerActionLog("TinhNangKey","BaoDanhViemDe_SDAnhHungThiep")
			elseif ndnumzimu > 0 then
				ConsumeItem(3,YDBZ_LIMIT_DOUBEL_ITEM[2],ndg,ndd,ndp,-1)
				tbLog:PlayerActionLog("TinhNangKey","BaoDanhViemDe_SDViemDeLenh")
			elseif ndnumbeibao > 0 then
				ConsumeItem(23,YDBZ_LIMIT_DOUBEL_ITEM[2],ndg,ndd,ndp,-1)
				tbLog:PlayerActionLog("TinhNangKey","BaoDanhViemDe_SDViemDeLenh")
			end
		elseif (YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) >= 1 and YDBZ_sdl_getTaskByte(YDBZ_PLAY_LIMIT_COUNT,4) <= 3) then
			local g = YDBZ_LIMIT_DOUBEL_ITEM[1][1]									--��Ʒ
			local d = YDBZ_LIMIT_DOUBEL_ITEM[1][2]
			local p = YDBZ_LIMIT_DOUBEL_ITEM[1][3]
	
			local numzimu = CalcItemCount(3,g,d,p,-1)
			local numbeibao = CalcItemCount(23,g,d,p,-1)
			
			if numbeibao > 0 then
		 		ConsumeItem(23,YDBZ_LIMIT_DOUBEL_ITEM[2],g,d,p,-1)
				YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,1,1)
				DelMSPlayer(YDBZ_READY_MISSION,RoleIndex,nteam)
		 		AddSkillState(461,1, 1,30*60*18,1)
		 		SetTask(YDBZ_ITEM_YANDILING_SUM,(GetTask(YDBZ_ITEM_YANDILING_SUM)+1))
		 		tbLog:PlayerActionLog("TinhNangKey","BaoDanhViemDe_SDViemDeLenh")
		 	elseif numzimu > 0 then
				ConsumeItem(3,YDBZ_LIMIT_DOUBEL_ITEM[2],g,d,p,-1)
				YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,1,1)
				DelMSPlayer(YDBZ_READY_MISSION,RoleIndex,nteam)
				AddSkillState(461,1, 1,30*60*18,1)
				SetTask(YDBZ_ITEM_YANDILING_SUM,(GetTask(YDBZ_ITEM_YANDILING_SUM)+1))
				tbLog:PlayerActionLog("TinhNangKey","BaoDanhViemDe_SDViemDeLenh")
			else
				Msg2Player("Tr�n h�nh trang kh�ng �� Vi�m �� L�nh, kh�ng th� tham gia tranh �o�t Vi�m ��")
				YDBZ_restore(PlayerIndex,YDBZ_READY_MISSION,nteam);
				NewWorld(world, pos_x, pos_y);
				SetLogoutRV(0);
				PlayerIndex = OldPlayerIndex;
				return
			end
		end
		
		YDBZ_sdl_addTaskByte(YDBZ_PLAY_LIMIT_COUNT,2,1)
		YDBZ_sdl_addTaskByte(YDBZ_PLAY_LIMIT_COUNT,4,1)
		DelMSPlayer(YDBZ_READY_MISSION,RoleIndex,nteam)
				
		SubWorld = matchmap
		AddMSPlayer(YDBZ_MISSION_MATCH,camp)
		
		----------ÿ��μ��˶��ٴ�----------------------
		local nCountState = GetTask(2618)
		local nCurDate = tonumber(GetLocalDate("%y%m%d"))
		if floor(nCountState/256) ~= nCurDate then
			
			nCountState = nCurDate * 256
			SetTask(2618, nCountState)
		end
		SetTask(2618, nCountState + 1)
		-----------------------------------------------	
		SetTask(YDBZ_TEAMS_TASKID,0)
		SetMissionV(YDBZ_SIGNUP_WORLD,world)
		SetMissionV(YDBZ_SIGNUP_POSX,pos_x)
		SetMissionV(YDBZ_SIGNUP_POSY,pos_y)
		--if szTeamName ~= "" then
			--SetMissionS(YDBZ_TEAM_NAME[camp],szTeamName)
		--end
		
		local sf_mapid = SubWorldIdx2ID(SubWorld)
		NewWorld(sf_mapid, floor(YDBZ_BOAT_POS[camp][1]/32), floor(YDBZ_BOAT_POS[camp][2]/32));
		SetTempRevPos(sf_mapid, YDBZ_BOAT_POS[camp][1], YDBZ_BOAT_POS[camp][2]);
		Msg2MSAll(YDBZ_MISSION_MATCH,str);
		
	
		
		YDBZ_sdl_setTaskByte(YDBZ_ITEM_YANDILING,2,camp)
		--��¼������
		--��¼������end
		ForbitTrade(0)
		LeaveTeam()
		SetCurCamp(camp);
		SetFightState(1);
		SetLogoutRV(1);
		SetPunish(0);
		SetCreateTeam(0);
		SetPKFlag(1)
		ForbidChangePK(1);
		SetDeathScript(YDBZ_SCRIPT_PLAYER_DEATH);
		DisabledUseTownP(1)
		ForbidEnmity(1)	
		SetTaskTemp(200,1)
		SetDeathType(-1)
		SubWorld = readymap
		
		G_ACTIVITY:OnMessage("SignUpYDBZ", PlayerIndex)
		PlayerIndex = OldPlayerIndex		
end
-- ����Ҵ�׼������ȥս���������򿪵�ͼ��Ӧ��mission

function YDBZ_get_randomlist(item,nmax)
	local ni
	for ni = 1,nmax do
		local p = random(1,nmax)
		item[ni],item[p] = item[p],item[ni]
	end
	return item
end

function YDBZ_ready_start_missions(map,oldsubworld, mission ,readymission)
	SubWorld = oldsubworld
	local nteams = GetMissionV(YDBZ_READY_TEAM)
	local nteamsMax = GetMissionV(YDBZ_READY_TEAM_MAX)
	--oldsubworld = SubWorld
	local nstart = 1
	local curteams = 0
	local tbteamsort = {}
	local tbplaysum = {}
	local nplaysum = 0
	YDBZ_debug("nteamsMax:"..nteamsMax)
	for ni=1,nteamsMax do 
			local nteamsum = GetMSPlayerCount(readymission,ni)
			if nteamsum >= YDBZ_TEAM_COUNT_LIMIT then
				YDBZ_debug("nteams num:"..ni)		
				curteams = curteams + 1
				tbteamsort[curteams] = ni
				if nteamsum < 8 then
					nplaysum = nplaysum +1
					tbplaysum[nplaysum] ={}
					tbplaysum[nplaysum][1] = ni
					tbplaysum[nplaysum][2] = curteams
				end
			else
				YDBZ_debug("kicknpc")
				YDBZ_ready_kickout(ni)
			end	
	end 
	if YDBZ_TEAM_START_LIMIT == 2 then
		if mod(curteams,3) == 1 then
			local nkickteams = getn(tbplaysum)
			if nkickteams <= 0 then
				YDBZ_ready_kickout(tbteamsort[curteams])
				curteams = curteams - 1
			else
				local nb = tbplaysum[nkickteams][1]
				local ct = tbplaysum[nkickteams][2]
				tbteamsort[ct],tbteamsort[curteams] = tbteamsort[curteams],tbteamsort[ct]
				YDBZ_ready_kickout(tbteamsort[curteams])
				curteams = curteams - 1
			end
		end
	elseif YDBZ_TEAM_START_LIMIT == 3 then
		while(mod(curteams,3) ~= 0) do
			YDBZ_ready_kickout(tbteamsort[curteams])
			curteams = curteams - 1
		end
	end
	YDBZ_debug("team sum:"..curteams)
	tbteamsort = YDBZ_get_randomlist(tbteamsort,curteams)
	if curteams >= YDBZ_TEAM_START_LIMIT then 
		for i = 1, getn(map) do
				local curcamp = 0
				index = SubWorldID2Idx(map[i]);
				if (index >= 0) then
					SubWorld = index;
					if GetMissionV(YDBZ_VARV_STATE) == 0 then
							OpenMission(mission);
							for ni=nstart,curteams do
								SubWorld = oldsubworld
								YDBZ_debug("team num:"..ni.." tbsort:"..tbteamsort[ni])
								if GetMSPlayerCount(readymission,tbteamsort[ni]) >= YDBZ_TEAM_COUNT_LIMIT then
									local nj,pidx;
									local idx = 0
									curcamp = curcamp + 1
									if curcamp == 4 then
										curcamp = 0
										break
									end
									--YDBZ_debug("team num:"..ni.." tbsort:"..tbteamsort[ni])
									local tbplayer = {}
									local ncapter = 0
									local szteamname = GetMissionS(tonumber(tbteamsort[ni]))
									for nj = 1, 10 do
										idx , pidx = GetNextPlayer(readymission, idx, tonumber(tbteamsort[ni]));
										if (pidx > 0) then
												tbplayer[nj] = pidx
												PlayerIndex = pidx
												if GetName() == szteamname then
													ncapter = nj
												end
		--								   	YDBZ_joinmap(idx,oldsubworld,index,curcamp)
										end;
										if (idx <= 0) then
											break;
										end;
									end
									SubWorld = index
									local nteamscount = GetMissionV(YDBZ_TEAM_COUNT)
									SetMissionV(YDBZ_TEAM_COUNT,nteamscount+1)
									SetMissionV(YDBZ_TEAM_SUM,nteamscount+1)
									local nplayernum = getn(tbplayer)
									for nj = 1,nplayernum do
										--YDBZ_debug("tbsort:"..tbteamsort[ni])
										--print(nj,"YDBZ_joinmap")
										YDBZ_joinmap(tbplayer[nj],oldsubworld,index,curcamp)
		--								DelMSPlayer(readymission,tbplayer[nj],tbteamsort[ni])
									end
									if ncapter > 0 then
										tbplayer[1],tbplayer[ncapter] = tbplayer[ncapter],tbplayer[1]
									else
										
									end
									SubWorld = index
									BuildATeam(curcamp,0,tbplayer)
									PlayerIndex = tbplayer[1]
									PlayerIndex = GetTeamMember(1)
									SetMissionS(YDBZ_TEAM_NAME[curcamp],GetName())
									--print(nplayernum,map[i],curcamp)
									local szstr = format("[V��t �i b�o t�ng vi�m ��] th�i gian %s, chi�n ��i %s  th�nh vi�n %s ng��i, ���c chuy�n v�o b�n �� s� %s, tr�n doanh l� %s",GetLocalDate("%y-%m-%d %H:%M:%S"),szteamname,nplayernum,map[i],curcamp) 
									--print(szstr)
									WriteLog(szstr)
								end
								nstart = nstart + 1
							end
					 end
				end
		end
	end
	SubWorld = oldsubworld
end

-- �رյ�ͼ��Ӧ��mission
function YDBZ_close_missions(map, mission, status)
	local oldsubworld = SubWorld
	for i = 1, getn(map) do
		index = SubWorldID2Idx(map[i]);
		if (index >= 0) then
			SubWorld = index;
			--YDBZ_READY_TEAM_NAME[map[i]] = {};
			if (GetMissionV(status) ~= 0) then
				CloseMission(mission);

			end
		end
	end
	SubWorld = oldsubworld
end

function YDBZ_debug(str)
	--print(str)
end