


function OnDeath(nNpcIndex)
	local nPlayerIndex	= NpcIdx2PIdx(nNpcIndex);
	if nPlayerIndex > 0 then
		local szDeadName	= GetName()
		local szKiller		= doFunByPlayer(nPlayerIndex, GetName)
		local nCount		= doFunByPlayer(nPlayerIndex, GetTask, tbMissionClass.TSK_Kills)
		local szMsg			= format("<color=yellow>%s<color> ��nh b�i <color=yellow>%s<color>", szKiller, szDeadName)
		doFunByPlayer(nPlayerIndex, SetTask, tbMissionClass.TSK_Kills, nCount + 1)
		doFunByPlayer(nPlayerIndex, Msg2Player, format("S� ng��i �� ��nh b�i: %d", nCount + 1))
		doFunByPlayer(nPlayerIndex, Msg2Player, szMsg)
		Msg2Player(szMsg)
	end
	Msg2Player("B�n �� b� tr�ng th��ng.")
	tbMissionClass:GotoSignUpPlace()
	
	local nPlayerCount = tbMissionClass:GetMSPlayerCount(0)
	
	if nPlayerCount == 1 then
		tbMissionClass:OnClose()
	end
end