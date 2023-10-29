Include( "\\script\\missions\\leaguematch\\head.lua" )

function InitMission()
	SetMissionV(WLLS_MSV_MSID, WLLS_MSID_COMBAT)
end;

function RunMission()
 	local tbPlayer = wlls_get_ms_plidx(0)
 	_M("getn(tbPlayer)="..getn(tbPlayer))
	local oldPlayerIndex = PlayerIndex 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[ i ];
 		_M("PlayerIndex="..PlayerIndex)
		SetPKFlag(2)	--��ɱģʽ
		ForbidChangePK(1);	--��ֹ����PKģʽ
		SetFightState(1);	--��ʼս��
	end
	PlayerIndex = oldPlayerIndex
	Msg2MSAll( WLLS_MSID_COMBAT, "<color=yellow>Th�i gian chu�n b� k�t th�c, thi ��u ch�nh th�c b�t ��u." );
end;

function EndMission()
	--�������camp in mission������ʤ�ܽ��
	local n_usedtime = WLLS_TIMER_FIGHT_TOTAL * WLLS_TIMER_FIGHT_FREQ * WLLS_FRAME2TIME
	for i = 1, WLLS_MAX_COUNT, 2 do
		local count1 = GetMSPlayerCount( WLLS_MSID_COMBAT, i )
		local count2 = GetMSPlayerCount( WLLS_MSID_COMBAT, i + 1 )

		if ( count1 > 0 and count2 > 0) then --˫������Ϊ��
			local _, str_league1 = wlls_camp2league(i)
			local _, str_league2 = wlls_camp2league(i + 1)
			if ( count1 > count2 ) then   --�׷����� > �ҷ�
				wlls_matchresult(str_league1, str_league2, 1, n_usedtime)
			elseif ( count1 < count2 ) then   --�ҷ����� > �׷�
				wlls_matchresult(str_league2, str_league1, 1, n_usedtime)
			else --�������
				local n_dmg1	= wlls_get_ms_damage(i)
				local n_dmg2	= wlls_get_ms_damage(i+1)
				local str1	= "<color=yellow> ��i c�a b�n b� ��nh tr�ng t�ng c�ng <color=red>"..n_dmg1.."<color> �i�m, ��i ph��ng b� ��nh tr�ng<color=red>"..n_dmg2.."<color> �i�m"
				local str2	= "<color=yellow> ��i c�a b�n b� ��nh tr�ng t�ng c�ng <color=red>"..n_dmg2.."<color> �i�m, ��i ph��ng b� ��nh tr�ng<color=red>"..n_dmg1.."<color> �i�m"
				if (n_dmg1 < n_dmg2) then
					Msg2MSGroup(WLLS_MSID_COMBAT, str1.."B�n chi�n th�ng r�i!", i)
					Msg2MSGroup(WLLS_MSID_COMBAT, str2.."B�n b� x� thua!", i + 1)
					wlls_matchresult(str_league1, str_league2, 1, n_usedtime)
				elseif (n_dmg1 > n_dmg2) then
					Msg2MSGroup(WLLS_MSID_COMBAT, str1.."B�n b� x� thua!", i)
					Msg2MSGroup(WLLS_MSID_COMBAT, str2.."B�n chi�n th�ng r�i!", i + 1)
					wlls_matchresult(str_league2, str_league1, 1, n_usedtime)
				else
					Msg2MSGroup(WLLS_MSID_COMBAT, str1.."H�a nhau", i)
					Msg2MSGroup(WLLS_MSID_COMBAT, str2.."H�a nhau", i + 1)
					wlls_matchresult(str_league1, str_league2, 0, n_usedtime)
				end
			end
		end
	end
	wlls_remove_camp(0)
	WriteLog(date("%Y-%m-%d %H%M%S, ")..wlls_get_desc(3).." k�t th�c thi ��u.")
end

function OnLeave( org_player )
	local oldindex = PlayerIndex
	PlayerIndex = org_player;
	local org_playername = GetName()
	local org_camp = GetTask(WLLS_TASKID_ORGCAMP)
	wlls_clear_pl_state()		--��ԭ���״̬
	SetPKFlag(0);	--ս��ģʽ��Ϊ����
	ForbidChangePK(0);	--����ı�ս��ģʽ
	PlayerIndex = oldindex

	--��������Ѿ���ɱ��� �� �����Ѿ�����������������Ĵ���
	if (org_camp == 0 or GetGlbValue(GLB_WLLS_PHASE) == 3) then
		return
	end
	
	local n_lid = LG_GetLeagueObjByRole(WLLS_LGTYPE, org_playername)
	local str_lgname = LG_GetLeagueInfo(n_lid)

	--�����볡��Ϣ
	_M("Msg2MSAll")
	Msg2MSAll(WLLS_MSID_COMBAT, "<color=yellow>chi�n ��i ["..str_lgname.."] c�a"..org_playername.."�� r�i kh�i ��u tr��ng!")

	--�õ��������Է�Mission��Ӫ���
	local emy_camp
	if ( mod(org_camp,2) == 0 ) then
		emy_camp = org_camp - 1
	else
		emy_camp = org_camp + 1
	end
	
	--�ж��Ƿ���ɱ�����������¼�����������ս��
	local org_count = GetMSPlayerCount( WLLS_MSID_COMBAT, org_camp )
	local emy_count = GetMSPlayerCount( WLLS_MSID_COMBAT, emy_camp )
	_M("OnLeave : "..org_camp.." VS "..emy_camp.."  "..org_count.."/"..emy_count)
	if (emy_count > 0) then --����Է������˵Ļ�
		if ( org_count > 0 ) then	--�ҷ����ж�Ա�ڱ�����
			str = "<color=pink>Tin t�c chi�n s�: ��i ph��ng c�n"..org_count.." ng��i"
			Msg2MSGroup(WLLS_MSID_COMBAT, str, emy_camp)
			
			--�����˺��������ڶ������� 
			local n_oldidx	= PlayerIndex
			PlayerIndex	= org_player;
			local n_damage	= ST_GetDamageCounter();

			local tb_pidx	= wlls_get_ms_plidx(org_camp)
			for i = 1, getn(tb_pidx) do
				if (tb_pidx[i] ~= org_player) then
			 		PlayerIndex = tb_pidx[i];
			 		ST_IncreaseDamageCounter(n_damage);
			 		break;
			 	end
			end
			PlayerIndex	= n_oldidx
		else	--�ҷ���ȫ����û
			local n_emy_dmg	= wlls_get_ms_damage(emy_camp)

			local n_oldidx = PlayerIndex
			PlayerIndex	= org_player
			local n_our_dmg	= ST_GetDamageCounter()
			Msg2Player("<color=yellow>Phe ta b� ��nh tr�ng t�ng c�ng<color=red>"..n_our_dmg.."<color> �i�m, ��i ph��ng b� ��nh tr�ng<color=red>"..n_emy_dmg.."<color> �i�m")
			PlayerIndex	= n_oldidx
			
			Msg2MSGroup(WLLS_MSID_COMBAT, "<color=yellow>Phe ta b� ��nh tr�ng t�ng c�ng<color=red>"..n_emy_dmg.."<color> �i�m, ��i ph��ng b� ��nh tr�ng<color=red>"..n_our_dmg.."<color> �i�m", emy_camp)
			
			--�ó��������
			local n_usedtime = (GetGlbValue(GLB_WLLS_TIME) + 1) * WLLS_TIMER_FIGHT_FREQ * WLLS_FRAME2TIME
			if GetGlbMSRestTime then	--��ָ����ʱ��û�м���
				n_usedtime = n_usedtime - GetGlbMSRestTime(WLLS_MSID_COMBAT, WLLS_TIMERID_COMBAT)
			end
			local _,emy_league = wlls_camp2league(emy_camp)
			wlls_matchresult(emy_league, str_lgname, 1, n_usedtime)
			wlls_remove_camp(emy_camp)
		end
	end
end;
