Include("\\script\\missions\\citywar_arena\\head.lua");

function OnDeath(Launcher)
	curcamp = GetCurCamp();
	DelMSPlayer(MISSIONID,	curcamp);

	PlayerIndex1 = NpcIdx2PIdx(Launcher); -- murder����
	OrgPlayer  = PlayerIndex; --����
	DeathName = GetName();

	SetFightState(0)
	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		LaunName = GetName();

		pkcount = GetTaskTemp(MS_TOTALPK) + 1; --���㵱ǰ��pk����
		SetTask(MS_TOTALPK, GetTask(MS_TOTALPK) + 1); --ͳ���ܹ���pk����
		SetTaskTemp(MS_TOTALPK, pkcount);

		if (curcamp == 1) then
			str  = GetMissionS(2).."<#> k�t th�c"..LaunName.."<#> tr�ng th��ng r�i ["..DeathName.."<#> ], PK ���c "..pkcount;
			SetMissionV(MS_TONG2VALUE, GetMissionV(MS_TONG2VALUE) + 1);
		elseif (curcamp == 2) then
			str  = GetMissionS(1).."<#> k�t th�c"..LaunName.."<#> tr�ng th��ng r�i ["..DeathName.."<#> ], PK ���c "..pkcount;
			SetMissionV(MS_TONG1VALUE, GetMissionV(MS_TONG1VALUE) + 1);
		elseif (curcamp == 4) then 
			str = LaunName.."<#> tr�ng th��ng r�i ["..DeathName.."<#> ], PK ���c "..pkcount;
		end;
		
		--GetBonus(); --�ú������ⲿ��ӣ����ڽ������
		
		Msg2MSAll(MISSIONID, str);
		PlayerIndex = OrgPlayer;
	end;

	SetTask(MS_TOTALKO, GetTask(MS_TOTALKO) + 1); --��¼����������
	SetCurCamp(GetCamp())
	SetPunish(1)--����PK�ͷ�
	SetPKFlag(0)--�ر�PK����
	ForbidChangePK(0);
	SetLogoutRV(0)
	SetCreateTeam(1);
	SetDeathScript("");--���������ű�Ϊ��
	SetRevPos(20,10);
	SetTaskTemp(JOINSTATE, 0);
	SetFightState(0);
	NewWorld(WORLDIDXBEGIN + GetMissionV(MS_ARENAID),1633,3292)
end;
