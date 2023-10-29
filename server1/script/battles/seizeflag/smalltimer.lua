IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")

function OnTimer()
	t = GetMissionV(MS_TIMER1_TIME) + 1;--��������ͳ�Ƶ�ǰ��ʱ�������˶��ٴ���
	SetMissionV(MS_TIMER1_TIME, t)
	
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
		AddGlobalCountNews(resultstr.."T�ng Kim- ph��ng th�c �o�t c�- �� k�t th�c b�o danh! Ch�nh th�c khai chi�n!", 2);
		Msg2MSAll(MISSIONID, "T�ng Kim ch�nh th�c khai chi�n! C�c chi�n s�! X�ng l�n!");
		WriteLog("battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
		-- �ճ�����ˢ�¶Ի�NPC
		%tbTalkDailyTask:AddTalkNpc(BT_GetGameData(GAME_MAPID), BT_GetGameData(GAME_MAPID));
	end
	local gamemode = GetMissionV(MS_FLAGMODE)

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."<#>Chi�n d�ch T�ng Kim �o�t k�, hi�n tai �ang trong giai �o�n b�o danh, nh�ng ng��i mu�n tham gia h�y nhanh ch�ng ��n T��ng D��ng ho�c Chu Ti�n Tr�n �� ��n Chi�n tr��ng, ho�c s� d�ng T�ng Kim Chi�u Th� �� ��n �i�m b�o danh. Th�i gian khai chi�n c�n l�i:"..RestMin.."ph�t. �i�u ki�n tham gia: ��ng c�p t� 40, ph� b�o danh 3000 l��ng. Sau khi khai chi�n, n�u t�ng s� ng��i ch�a �� v�n c� th� ti�p t�c b�o danh!";
			str2 ="<#>C�ch th�i gian khai chi�n ch� c�n:"..RestMin.."ph�t"
		else
			str1 = resultstr.."<#>Chi�n d�ch T�ng Kim �o�t k�, hi�n tai �ang trong giai �o�n b�o danh, nh�ng ng��i mu�n tham gia h�y nhanh ch�ng ��n T��ng D��ng ho�c Chu Ti�n Tr�n �� ��n Chi�n tr��ng, ho�c s� d�ng T�ng Kim Chi�u Th� �� ��n �i�m b�o danh. Th�i gian khai chi�n c�n l�i:"..RestMin.."ph�t"..RestSec.."gi�y. �i�u ki�n tham gia: ��ng c�p t� 40, ph� b�o danh 3000 l��ng. Sau khi khai chi�n, n�u t�ng s� ng��i ch�a �� v�n c� th� ti�p t�c b�o danh!";
			str2 = "<#>C�ch th�i gian khai chi�n ch� c�n:"..RestMin.."ph�t"..RestSec.." gi�y"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--֪ͨ������ҿ�սʣ��ʱ��
	end
	
	if (t >= RUNGAME_TIME) then
		if (t == RUNGAME_TIME) then --��ʽ��ս�ĵ�һ�δ���ʱ������ս��Npc�����ɹ�������
			sf_buildfightnpcdata()
		else
			--ÿһ���Ӳ���һ��Npc������ͨ�浱ǰ���������
			if (t <= VANISHGAME_TIME and mod(t, 3) == 0 ) then
				sf_callnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- ����ս��Npc				
			end
			
			bt_pop2signmap()	--���ں�Ӫ��fight=0��������ͻر�����
			
			if (mod(t, 3 ) == 0) then
				msstr = "C�ng c�o: t� l� �o�t c� hi�n gi� l� <color=yellow>"..BT_GetGameData(GAME_CAMP1)..":"..BT_GetGameData(GAME_CAMP2);
				Msg2MSAll(MISSIONID, msstr);
			end
		end

		if (gamemode == 1 and mod(t, 6) == 0) then
			sf_showflagpos()
		end
	end;


	--�������ģʽ�Ĳ�������� ����������ʽս��״̬���ܷ���
	if (gamemode == 2) then
		if (GetMissionV(MS_STATE) ~= 2) then
			return
		end;	
		if (mod(t - RUNGAME_TIME, 6) == 0)  then
			sf_createrandomflag()
		end
	end
end;

function sf_showflagpos()
	l_flagx1 , l_flagy1=  sf_getflagposinfo(1)
	l_flagx2,  l_flagy2 = sf_getflagposinfo(2)
	if (l_flagx1 ~= 0 or l_flagy1 ~= 0) then
		flagstr = "<color=0x00FFFF>Th�ng b�o chi�n d�ch: hi�n t�i so�i k� b�n T�ng t�i<color=yellow>"..l_flagx1..","..l_flagy1.."<color>Ph� c�n"
		Msg2MSAll(MISSIONID, flagstr)
	end
	if (l_flagx2 ~= 0 or l_flagy2 ~= 0) then
		flagstr = "<color=0x9BFF9B>Th�ng b�o chi�n d�ch: hi�n t�i soias k� b�n Kim t�i<color=yellow>"..l_flagx2..","..l_flagy2.."<color>Ph� c�n"
		Msg2MSAll(MISSIONID, flagstr)
	end			
end
