Include( "\\script\\missions\\leaguematch\\head.lua" )

function OnTimer()
	--ʱ���������
	local n_timer = GetGlbValue(GLB_WLLS_TIME) + 1
	SetGlbValue(GLB_WLLS_TIME, n_timer)
	
	if (n_timer >= WLLS_TIMER_FIGHT_TOTAL) then --��������
		SetGlbValue(GLB_WLLS_PHASE, 3) --�����Ъʱ��
		CloseGlbMission(WLLS_MSID_GLB)
	end

	local tb_sub = wlls_get_subworld(3)
	local n_oldsub = SubWorld
	for n_idx, nGroupIdx in tb_sub do
		SubWorld = n_idx
		if (n_timer == WLLS_TIMER_FIGHT_PREP) then --׼������
			_M("RunMission(WLLS_MSID_COMBAT)")
			RunMission(WLLS_MSID_COMBAT)
		elseif (n_timer < WLLS_TIMER_FIGHT_PREP) then
			local n_resttime = (WLLS_TIMER_FIGHT_PREP - n_timer)*WLLS_TIMER_FIGHT_FREQ
			Msg2MSAll(WLLS_MSID_COMBAT, "Giai �o�n chu�n b�: b�n c�n th�i gian chu�n b� l�: <color=yellow>"..n_resttime.."<color> gi�y.")
		else
			local n_resttime = WLLS_TIMER_FIGHT_TOTAL - n_timer
			if (n_resttime <= 0) then --��������
				CloseMission(WLLS_MSID_COMBAT)
			elseif (mod(n_timer, 2) == 0) then	--˫���α��棬����������
				--����ս��������Է�ʣ������
				for i = 1, WLLS_MAX_COUNT, 2 do
					local count_org = GetMSPlayerCount( WLLS_MSID_COMBAT, i )
					local count_emy = GetMSPlayerCount( WLLS_MSID_COMBAT, i + 1 )
					if (count_org > 0 or count_emy > 0) then --����˫����Ϊ��
						Msg2MSGroup(WLLS_MSID_COMBAT, "<color=pink>Tin t�c chi�n s�: ��i ph��ng c�n"..count_emy.." ng��i", i)
						Msg2MSGroup(WLLS_MSID_COMBAT, "<color=pink>Tin t�c chi�n s�: ��i ph��ng c�n"..count_org.." ng��i", i + 1)
					end
				end
				--�����˺���
				local tb_camp	= wlls_get_ms_troop()
				for i = 1, getn(tb_camp) do
					local n_dmg = wlls_get_ms_damage(tb_camp[i])
					Msg2MSGroup(WLLS_MSID_COMBAT, "Phe ta hi�n t�i b� ��nh tr�ng: <color=yellow>"..n_dmg.."<color>", tb_camp[i])
				end
				--����ʣ��ʱ��
				n_resttime = n_resttime * WLLS_TIMER_FIGHT_FREQ;
				local n_RestMin = floor( n_resttime / 60 );
				local n_RestSec = mod( n_resttime,60 );
				if (n_RestMin == 0) then
					Msg2MSAll( WLLS_MSID_COMBAT, "Giai �o�n chi�n ��u: Th�i gian thi ��u c�n l�i l�: <color=yellow>"..n_RestSec.."<color> gi�y." );
				elseif (n_RestSec == 0) then
					Msg2MSAll( WLLS_MSID_COMBAT, "Giai �o�n chi�n ��u: Th�i gian thi ��u c�n l�i l�: <color=yellow>"..n_RestMin.."<color> ph�t." );
				end;
			end
		end
	end
	SubWorld = n_oldsub
end
