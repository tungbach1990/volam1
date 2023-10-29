IncludeLib("SETTING");
Include("\\script\\missions\\olympic\\head.lua");

function OnDeath(Launcher)
	DeathName = GetName();

	pn = TableSDD_Search("olympictab",DeathName);
	pname,px,py = TableSDD_GetValue("olympictab",pn);
	
	DelMSPlayer(MISSIONID, py);
	SetLogoutRV(1);

	PlayerIndex1 = NpcIdx2PIdx(Launcher); -- murder����
	OrgPlayer  = PlayerIndex; --����

	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		LaunName = GetName();

		str = "ս�����棺"..LaunName.."<#> �ڱ����л����� "..DeathName.."<#>��";
		Msg2MSAll(MISSIONID, str);

		PlayerIndex = OrgPlayer;
	end;
	
	SetCurCamp(GetCamp())
	SetPunish(1)--����PK�ͷ�
	SetPKFlag(0)--�ر�PK����
	ForbidChangePK(0);
	ForbitTrade(0);
	SetFightState(0);
	SetLogoutRV(0);--����������
	SetCreateTeam(1);
	SetDeathScript("");--���������ű�Ϊ��
	SetTaskTemp(JOINSTATE, 0);
end;
