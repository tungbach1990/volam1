Include( "\\script\\missions\\leaguematch\\head.lua" )


function OnDeath( Launcher )
	local org_player = PlayerIndex
	local org_name = GetName() --��������
	PlayerIndex = NpcIdx2PIdx( Launcher )
	Msg2Player("B�n �� ��nh b�i ��i ph��ng<color=yellow>"..org_name.."<color>")
	PlayerIndex = org_player
	
	DelMSPlayer(WLLS_MSID_COMBAT, 0)	--ǿ�Ƹ�����뿪Mission
	SetLogoutRV(0);
	NewWorld(wlls_get_mapid(1), WLLS_MAPPOS_SIGN[1], WLLS_MAPPOS_SIGN[2])	--��ʬ���ϵ�������=.=
	if (GetTask(WLLS_TASKID_ORGCAMP) > 0) then
		Msg2Player("<color=yellow>Ch� �!!!<color> ��i ng� chi�n ��u c�a b�n ch�a k�t th�c, b�n ph�i tr� l�i n�i b�o danh ��i. Trong th�i gian n�y b�n b� ��t m�ng ho�c r�i kh�i h�i tr��ng thi ��u s� kh�ng nh�n ���c ph�n th��ng.")
	end
end
