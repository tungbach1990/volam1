Include("\\script\\missions\\olympic\\tong\\head.lua");

function OnDeath(Launcher)
	curcamp = GetCurCamp();
	DelMSPlayer(MISSIONID,curcamp);

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

		if (curcamp == 3) then
			str  = GetMissionS(2).."<#>����"..LaunName.."<#>������["..DeathName.."<#>]��PK������Ϊ"..pkcount;
--			SetMissionV(MS_TONG2VALUE, GetMissionV(MS_TONG2VALUE) + 1);
		elseif (curcamp == 2) then
			str  = GetMissionS(1).."<#>����"..LaunName.."<#>������["..DeathName.."<#>]��PK������Ϊ"..pkcount;
--			SetMissionV(MS_TONG1VALUE, GetMissionV(MS_TONG1VALUE) + 1);
		end;
		
		Msg2MSAll(MISSIONID, str);
		PlayerIndex = OrgPlayer;
	end;

	SetCurCamp(GetCamp())
	SetPunish(1)--����PK�ͷ�
	SetPKFlag(0)--�ر�PK����
	ForbidChangePK(0);
	ForbitTrade(0);
	SetLogoutRV(0)
	SetCreateTeam(1);
	SetDeathScript("");--���������ű�Ϊ��
	SetTaskTemp(JOINSTATE, 0);
end;
