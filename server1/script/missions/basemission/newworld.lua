Include("\\script\\maps\\newworldscript_default.lua")
function OnNewWorld(szParam)
	
	tbMissionClass:JoinGame(PlayerIndex, tbMissionClass:GetGroupId(), SubWorldIdx2ID(SubWorld))
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	if tbMissionClass:GetMissionState(SubWorldIdx2ID(SubWorld)) == 0 then
		tbMissionClass:LeaveGame() --���Զ����� OnLevel������û��mission��ʱ�򲻻����
	end
	OnLeaveWorldDefault(szParam)
end