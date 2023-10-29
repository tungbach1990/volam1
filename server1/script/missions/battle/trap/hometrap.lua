Include("\\script\\missions\\battle\\rule.lua")
Include("\\script\\missions\\basemission\\dungeon.lua")
function main(nAreaId)
	
	local nMapId = GetWorldPos()
	local szName = GetName()
	local pDungeon = DungeonList[nMapId]
	if not pDungeon then
		return
	end
	if pDungeon.pBattle.nState == RUN_STATE then
		local nX, nY = pDungeon:GetRandomAPos(nAreaId, "hometocenterpos")
		SetPos(floor(nX/32), floor(nY/32))
		SetFightState(1)
	else
		local nCamp = pDungeon.pBattle:GetPlayerCamp(szName)
		if nCamp then
			local nX, nY = pDungeon:GetRandomAPos(CAMP2AREA[nCamp], "homepos")
			pDungeon.pBattle.Data:RefreshStayTime(szName)
			SetPos(floor(nX/32), floor(nY/32))
			SetFightState(0)
			Msg2Player("Ph�a tr��c s�n c�c ch�p tr�ng, ch�c ch�n c� ph�c binh! B�n kh�ng n�n t� ti�n x�ng l�n!")
		end
	end
end