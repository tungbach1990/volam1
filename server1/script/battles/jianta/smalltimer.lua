IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\jianta\\head.lua")
Include("\\script\\battles\\jianta\\mission.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--��������ͳ�Ƶ�ǰ��ʱ�������˶��ٴ���
	SetMissionV(MS_TIMER1, t)
	
	--Storm �ӽ�������
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "Khu v�c S� c�p "
	elseif (lsf_level == 2) then
		resultstr = "Khu v�c Trung c�p "
	elseif (lsf_level == 3) then
		resultstr = "Khu v�c Cao c�p "
	end
	
	if (t == RUNGAME_TIME) then --���������ʽ��սʱ�̣���ֹͣ��������ʽ����ս���׶�
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."Th�i gian b�o danh T�ng Kim h�nh th�c Th�p ti�n �� ��n, tr�n chi�n ch�nh th�c b�t ��u!", 2);
		Msg2MSAll(MISSIONID, "T�ng Kim ch�nh th�c khai chi�n! C�c chi�n s�! X�ng l�n!");
		WriteLog("jianta battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>Tr�n ��nh T�ng Kim h�nh th�c Th�p ti�n v� c�ng c�ng th�ng, tr��c m�t �ang � giai �o�n b�o danh, nh�ng ai mu�n tham chi�n xin h�y nhanh ch�ng ��n T��ng D��ng ho�c Chu Ti�n tr�n ��ng k� b�o danh; Ho�c s� d�ng T�ng Kim chi�u th� �� nhanh ch�ng ��n �i�m b�o danh, th�i gian b�o danh c�n:"..RestMin.."ph�t. �i�u ki�n tham gia: ��ng c�p t� 40, ph� b�o danh 3000 l��ng. Sau khi khai chi�n, n�u t�ng s� ng��i ch�a �� v�n c� th� ti�p t�c b�o danh!";
			str2 = "<#> Th�i gian b�o danh c�n l�i l�:"..RestMin.."ph�t"
		else
			str1 = resultstr.."<#>Tr�n ��nh T�ng Kim h�nh th�c Th�p ti�n v� c�ng c�ng th�ng, tr��c m�t �ang � giai �o�n b�o danh, nh�ng ai mu�n tham chi�n xin h�y nhanh ch�ng ��n T��ng D��ng ho�c Chu Ti�n tr�n ��ng k� b�o danh; Ho�c s� d�ng T�ng Kim chi�u th� �� nhanh ch�ng ��n �i�m b�o danh, th�i gian b�o danh c�n:"..RestMin.."ph�t"..RestSec.."gi�y. �i�u ki�n tham gia: ��ng c�p t� 40, ph� b�o danh 3000 l��ng. Sau khi khai chi�n, n�u t�ng s� ng��i ch�a �� v�n c� th� ti�p t�c b�o danh!";
			str2 = "<#> Th�i gian b�o danh c�n l�i l�:"..RestMin.."ph�t"..RestSec.." gi�y"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--֪ͨ������ҿ�սʣ��ʱ��
	end
	
	if (t >= RUNGAME_TIME) then

		--�������ĳһ��Ӫ����������С������������������˶����Ӫֱ�ӻ�ʤ
		local group1count = GetMSPlayerCount(MISSIONID, 1)
		local group2count = GetMSPlayerCount(MISSIONID, 2)
		if ( group1count < but_getminplayerlimit() or group2count < but_getminplayerlimit()) then
			if (group1count > group2count) then
				SetMissionV(MS_MOSTDEATH, 1)
				CloseMission(MISSIONID)
			elseif (group1count < group2count) then
				SetMissionV(MS_MOSTDEATH, 2)
				CloseMission(MISSIONID)
			else
				SetMissionV(MS_MOSTDEATH, 0) 
				CloseMission(MISSIONID)
			end
			return
		end

		
		local tb_jianta_count = {0, 0};	-- ������/�𷽵ļ�����
		for i = 1, 5 do
			local n_camp	= GetMissionV(MS_TOWER_1 + i - 1);
			if (1 == n_camp or 2 == n_camp) then
				tb_jianta_count[n_camp] = tb_jianta_count[n_camp] + 1;
			end
		end
		local tb_player_actor	= {};
		local idx 	= 0;
		local pidx 	= 0;
		for i = 1, 500 do
			idx, pidx	= GetNextPlayer(MISSIONID, idx, 0)
			if (pidx > 0) then
				tb_player_actor[getn(tb_player_actor) + 1]	= pidx;
			end
			if (idx <= 0) then
				break;
			end
		end
		
		local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID));	
		local oldPlayeridx	= PlayerIndex;
		
		for i = 1, 5 do
			local jiantaxy 		= GetIniFileData(mapfile, "Jianta_All", format("jianta_%d", i));
			local xj, yj		= bt_str2xydata(jiantaxy);	-- ��õ�i������������
			for j = 1, getn(tb_player_actor) do
				PlayerIndex = tb_player_actor[j];
				local mapid, xp, yp = GetWorldPos();
				if ((xp - xj) * (xp - xj) + (yp - yj) * (yp - yj) <= 20 * 20 and (GetMissionV(MS_TOWER_1 + i - 1) == GetCurCamp()) ) then
					bt_addtotalpoint(5 * tb_jianta_count[GetCurCamp()]);
				end
				BT_SortLadder();
				BT_BroadSelf();
			end
		end
		
		PlayerIndex = oldPlayeridx;
		
		mar_addmissionpoint(250 * tb_jianta_count[1], 1);
		mar_addmissionpoint(250 * tb_jianta_count[2], 2);
		--ÿһ����ͨ�浱ǰ˫�����֣���npc
		if (mod(t, 3) == 0 ) then
			msstr = "C�ng c�o: hi�n gi� t�ng t�ch l�y c�a 2 phe T�ng - Kim l� "..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
			Msg2MSAll(MISSIONID, msstr)
		end
		
		but_pop2home( 1 )
		but_pop2home( 2 )
	end

end



