Include("\\script\\missions\\datusha\\datusha.lua")
function OnTimer()
	
	local pDungeon = DungeonList[MAP_ID]
	if pDungeon then
		local nMapId = GetWorldPos()
		if pDungeon.nMapId == nMapId then
			SetFightState(1);
		ForbitSyncName(PIdx2NpcIdx(PlayerIndex),1)
		ForbitTalk(1)
		ForbitSyncAura(1)
		Msg2Player("��i th�nh tr�ng th�i chi�n ��u.")	
		end
	end
end