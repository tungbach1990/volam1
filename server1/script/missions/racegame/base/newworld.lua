Include("\\script\\maps\\newworldscript_default.lua")
function OnNewWorld(szParam)
	tbMissionClass:JoinGame(PlayerIndex, 0)
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	tbMissionClass:LeaveGame() --���Զ����� OnLevel������û��mission��ʱ�򲻻����
	OnLeaveWorldDefault(szParam)
end