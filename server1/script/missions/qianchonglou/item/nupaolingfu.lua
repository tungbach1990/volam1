Include("\\script\\missions\\qianchonglou\\challenger.lua")
Include("\\script\\missions\\qianchonglou\\rule.lua")
MAX_LIMIT = 8
function main()
	if tbPlayerHandle:GetDailyLimit() >= MAX_LIMIT then
		Talk(1, "", format("M�i ng�y nhi�u nh�t ch� c� th� s� d�ng %d c�i", MAX_LIMIT))
		return 1
	end
	local _,_,nMapIndex = GetPos()
	
	local nMapId = SubWorldIdx2ID(nMapIndex)
	local pDungeon = DungeonList[nMapId]
	if not pDungeon or pDungeon.szDungeonType ~= "endless tower" then
		Talk(1, "","��o c� n�y ch� s� d�ng trong Thi�n Tr�ng L�u.")
		return 1
	end
	tbPlayerHandle:AddBasePoint(100)
	tbPlayerHandle:AddDailyLimit(1)
end