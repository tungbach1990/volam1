Include("\\script\\missions\\championship\\head.lua")
MISSIONID = 18;
MATCH_MS_ID = 19;
FRAME2TIME = 18;	--18֡��Ϸʱ���൱��1����

UP_A_TIME = 15
RUN_A_TIME = 5 --����5����֮���Զ�����ս������

MS_STATE = 1; --�����м�¼����״̬�ı���ID
MS_TIME_1 = 2	--ÿ20���һsmalltimer������
MS_TIME_2 = 3	--totaltimer������
MS_ROUND = 4	--��¼�������µ��ִ�
MS_A_TIME = 5	--��ǰ�ִ��õ���ʱ��

function Elect_RanField()
	local cnt_1 = 0
	local cnt_2 = 0
	local fieldtab = {}
	for i =1, 100 do
		fieldtab[i] = i
	end
	for i = 1, 100 do
		cnt_1 = random(1, 100) 
		a = fieldtab[cnt_1]
		cnt_2 = random(1, 100)
		fieldtab[cnt_1] = fieldtab[cnt_2]
		fieldtab[cnt_2] = a
	end
	return fieldtab
end

HIGHMEMBER_PERCENT = 20
MIDDLEMEMBER_PERCENT = 40
LOWMEMBER_PERCENT = 100 - HIGHMEMBER_PERCENT - MIDDLEMEMBER_PERCENT

function Elect_RanEnemy(plyidx)
	local num = getn(plyidx)
	local per_num = floor(num / 3);

	plyidx = cp_randomeny(1, per_num, plyidx)
	plyidx = cp_randomeny(per_num + 1, per_num * 2, plyidx)
	plyidx = cp_randomeny(per_num * 2 + 1, num, plyidx)
	
	high_count = floor(num * HIGHMEMBER_PERCENT / 100)
	plyidx = cp_randomeny(1, high_count, plyidx)
	
	middle_count = floor(num * MIDDLEMEMBER_PERCENT / 100)
	plyidx = cp_randomeny(high_count + 1, high_count + middle_count, plyidx)
	
	plyidx = cp_randomeny(high_count + middle_count + 1, num, plyidx)
	return plyidx
end

function cp_randomeny(q, m, tabplyidx )
	local a = 0
	local cnt_1 = 0
	local cnt_2 = 0
	for i = q, m do
		cnt_1 = random(q, m) 
		a = tabplyidx[cnt_1]
		cnt_2 = random(q, m)
		tabplyidx[cnt_1] = tabplyidx[cnt_2]
		tabplyidx[cnt_2] = a
	end
	return tabplyidx
end

function Run_CPMatch()
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	tbPlayer[i] = pidx
	end
	tbPlayer = Elect_RandomPL(tbPlayer)
	return tbPlayer
end

function Elect_RandomPL(tabplayindex)
	local ncount = 0
	local tab_index = {}
	oldplayer = PlayerIndex
	if (getn(tabplayindex) > 200) then
		tabplayindex = cp_randomeny(1, getn(tabplayindex), tabplayindex )
		for i = 1, 200 do
			tab_index[i] = tabplayindex[i]
		end
		local str = "S� ng��i thi ��u v�ng n�y �� ��y, xin ��i tr�n ti�p theo!"
		for i = 201, getn(tabplayindex) do 
			PlayerIndex = tabplayindex[i]
			Msg2Player(str)
		end
	else
		tab_index = tabplayindex
	end
	PlayerIndex = oldplayer
	return tab_index	
end

function join_tryout()
	if (nt_gettask(CP_TASKID_ROUND) >= CP_MAXROUND ) then
		Say("S� l�n thi ��u d� tuy�n ��i h�i V� l�m c�a b�n �� ��!"..CP_MAXROUND.."l�n, kh�ng th� ti�p t�c tham chi�n.", 0)
		return
	end
	local subworldid = SubWorldIdx2ID (SubWorld)
	LeaveTeam()
	DisabledStall(1)	--��ֹ��̯
	SetTaskTemp(200, 1)
	AddMSPlayer(MISSIONID,1);
	nt_settask(CP_TASKID_FLAG, 0)
	SetLogoutRV(1);
	SetCurCamp(1);
	SetFightState(0)
	SetPunish(0);
	SetPKFlag(2)
	ForbidChangePK(1);
	SetCreateTeam(0);
	ForbitTrade(1)
	SetRevPos(subworldid, 1)
	nt_settask(CP_TASKID_ENEMY, 0)
	for i = 1, getn(CP_FORBID_ITEM) do
		AddSkillState(CP_FORBID_ITEM[i][3], 20, 1, 0)
	end
	NewWorld(subworldid, CP_MAPPOS_PRE[1], CP_MAPPOS_PRE[2])
	DisabledUseTownP(1)	--��������׼��ϯ�ͱ����õ���ʹ�ûسǷ�
	local mm = RUN_A_TIME - GetMissionV(MS_A_TIME)
	Msg2Player("B�n �� v�o n�i chu�n b� thi ��u. Thi ��u s� ���c ti�n h�nh v�o"..mm.."ph�t b�t ��u")
end

function join_match()
	WriteLog(date("%Y-%m-%d,%H:%M,").."h�ng th� "..GetMissionV(MS_ROUND).."th� m�y"..checkmap(1).."S� ng��i tham gia thi ��u d� tuy�n M�n ph�i l� "..GetMSPlayerCount(MISSIONID, 0))
	local fieldtab = {}
	local playertab = {}
	local org_mapindex = 0
	local org_mapid = 0
	local new_mapindex = 0
	local new_mapid = 0
	
	fieldtab = Elect_RanField()
	playertab = Run_CPMatch()
	playertab = Sort_Point(playertab)	
	playertab = Elect_RanEnemy(playertab)
	if (getn(playertab) > 200) then
		num_vs = 100
	else
		num_vs = floor (getn(playertab) / 2) 
	end
	org_mapindex = SubWorld
	org_mapid = SubWorldIdx2ID(SubWorld)
	new_mapid = org_mapid + 1
	new_mapindex = SubWorldID2Idx(new_mapid)
	orgplayeridx = PlayerIndex
	
	SubWorld = new_mapindex
	for i = 1, num_vs * 2, 2 do 
		posx = GetTabFileData(CP_MATCH_POS, fieldtab[i] + 1, 1)
		posy = GetTabFileData(CP_MATCH_POS, fieldtab[i] + 1, 2)
		org_plyidx = playertab[i]
		PlayerIndex = org_plyidx
		org_plyname = GetName()
		org_plywin = nt_gettask(CP_TASKID_WIN)
		org_plylose = nt_gettask(CP_TASKID_LOSE)
		org_plytie = nt_gettask(CP_TASKID_TIE)
		
		eny_plyidx = playertab[i + 1]
		PlayerIndex = eny_plyidx
		eny_plyname = GetName()
		eny_plywin = nt_gettask(CP_TASKID_WIN)
		eny_plylose = nt_gettask(CP_TASKID_LOSE)
		eny_plytie = nt_gettask(CP_TASKID_TIE)
		PlayerIndex = org_plyidx
		NewWorld (new_mapid, posx, posy)
		AddMSPlayer(MATCH_MS_ID, i);
		nt_settask(CP_TASKID_ENEMY, i + 100)
		nt_settask(CP_TASKID_ROUND, nt_gettask(CP_TASKID_ROUND) + 1)
		SetCurCamp(2)
		SetFightState(0)
		SetPKFlag(2)
		SetCreateTeam(0);
		DisabledStall(1)	--��ֹ��̯
		SetTaskTemp(200, 1)
		SetLogoutRV(1);
		ForbitTrade(1)
		ForbidChangePK(1);
		SetRevPos(org_mapid, 1)
		Msg2Player("B�n �� v�o tr��ng ��u, 10 gi�y sau s� ch�nh th�c b�t ��u.")
		Msg2Player("��i th� c�a b�n"..eny_plyname.."K�t qu� hi�n t�i:"..eny_plywin.."th�ng "..eny_plylose.."thua"..eny_plytie.."h�a")
		WriteLog(date("%Y-%m-%d %H%M%S,")..GetAccount().."["..GetName().."], giai �o�n tham gia chi�n ��u, chi�n t�ch c�a b�n hi�n t�i l�: th�ng"..org_plywin.."thua"..org_plylose.."h�a"..org_plytie..", �� tham gia r�i"..nt_gettask(CP_TASKID_ROUND))
		Msg2Player("Sau khi v�o khu v�c thi ��u, kh�ng th� di chuy�n v�t ph�m trong h�nh trang, nh�ng v�n c� th� s� d�ng v�t ph�m trong h�nh trang v� b�ng c�ng c�.");
		SetDeathScript("\\script\\missions\\championship\\match\\playerdeath.lua");
		
		PlayerIndex = eny_plyidx
		NewWorld (new_mapid, posx, posy)
		AddMSPlayer(MATCH_MS_ID, i + 100);
		nt_settask(CP_TASKID_ENEMY, i)
		nt_settask(CP_TASKID_ROUND, nt_gettask(CP_TASKID_ROUND) + 1)
		SetCurCamp(3)
		SetFightState(0)
		SetPKFlag(2)
		SetCreateTeam(0);
		DisabledStall(1)	--��ֹ��̯
		SetTaskTemp(200, 1)
		SetLogoutRV(1);
		ForbitTrade(1)
		ForbidChangePK(1);
		SetRevPos(org_mapid, 1)
		Msg2Player("B�n �� v�o tr��ng ��u, 10 gi�y sau s� ch�nh th�c b�t ��u.")
		Msg2Player("��i th� c�a b�n"..org_plyname.."K�t qu� hi�n t�i:"..org_plywin.."th�ng "..org_plylose.."thua"..org_plytie.."h�a")
		WriteLog(date("%Y-%m-%d %H%M%S,")..GetAccount().."["..GetName().."], giai �o�n tham gia chi�n ��u, chi�n t�ch c�a b�n hi�n t�i l�: th�ng"..eny_plywin.."thua"..eny_plylose.."h�a"..eny_plytie..", �� tham gia r�i"..nt_gettask(CP_TASKID_ROUND))
		Msg2Player("Sau khi v�o khu v�c thi ��u, kh�ng th� di chuy�n v�t ph�m trong h�nh trang, nh�ng v�n c� th� s� d�ng v�t ph�m trong h�nh trang v� b�ng c�ng c�.");
		SetDeathScript("\\script\\missions\\championship\\match\\playerdeath.lua");
	end
	SubWorld = org_mapindex
		local playeridx = {}
		idx = 0;
		for i = 1 , 500 do 
			idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
			if (idx == 0) then 
		 		break
		 	end;
		 	playeridx[i] = pidx
		end
		if (getn(playeridx) > 1) then
			str = "S� ng��i thi ��u v�ng n�y �� ��y, xin ��i tr�n ti�p theo!"
			for i = 1, getn(playeridx) do
				PlayerIndex = playeridx[i]
				Msg2Player(str)
			end
		else
			str = "S� ng��i tham gia v�ng n�y kh�ng ��, kh�ng ch�n ���c ��i th� c�a b�n, v�ng n�y b�n �� chi�n th�ng, ���c 3 �i�m th��ng."
			for i = 1, getn(playeridx) do
				PlayerIndex = playeridx[i]
				enyname = GetName()
				nt_settask(CP_TASKID_WIN, nt_gettask(CP_TASKID_WIN) + 1)
				nt_settask(CP_TASKID_ROUND, nt_gettask(CP_TASKID_ROUND) + 1)
				nt_settask(CP_TASKID_POINT, nt_gettask(CP_TASKID_POINT) + 3)
				Ladder_NewLadder(checkmap(2), GetName(), nt_gettask(CP_TASKID_POINT), 1)
				Msg2Player(str)
				WriteLog("Ng��i ch�i ["..enyname.."], do kh�ng c� ��i th�, chi�n t�ch hi�n th�i l�: th�ng"..nt_gettask(CP_TASKID_WIN)..", thua"..nt_gettask(CP_TASKID_LOSE)..", h�a"..nt_gettask(CP_TASKID_TIE)..", chung cu�c"..nt_gettask(CP_TASKID_POINT))
				AddAword(GetLevel(), 20, 2)
			end
		end
	PlayerIndex = orgplayeridx
end

function GameOver()
	local tbPlayer = {};
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	tbPlayer[i] = pidx
	end 	
 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
		camp = GetCamp();
		SetCurCamp(camp);
		SetLogoutRV(0);
		SetCreateTeam(1);
		DisabledStall(0)	--�����̯
		SetTaskTemp(200, 0)
		SetFightState(0);
		SetPunish(1);
		ForbidChangePK(0);
		SetPKFlag(0);
		ForbitTrade(0)
		nt_settask(CP_TASKID_ENEMY, 0)
		NewWorld(SubWorldIdx2ID(SubWorld), CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])
	end
	WriteLog(date("%Y-%m-%d %H%M%S,").."��a �� n�y ["..SubWorldIdx2ID(SubWorld).."] Thi ��u d� tuy�n c�a ng�y h�m nay �� k�t th�c.")
end