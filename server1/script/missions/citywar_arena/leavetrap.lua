Include("\\script\\missions\\citywar_arena\\head.lua");
function main()
	SetCurCamp(GetCamp());
	SetFightState(0);
	SetRevPos(99,43);
	SetLogoutRV(0);
	SetCreateTeam(1);
	SetDeathScript("");--���������ű�Ϊ��
	SetPKFlag(0)--�ر�PK����
	ForbidChangePK(0);
	SetTaskTemp(200, 0);
	NewWorld(GetLeavePos());
end;