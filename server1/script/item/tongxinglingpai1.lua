Include("\\script\\missions\\tianchimijing\\floor1\\gamefloor1.lua")
function main()
	local nMapId, nX,nY = GetWorldPos()
	if  GameFloor1.tbMapList[nMapId] ~= 1 then
		Msg2Player("Ch� c� th� s� d�ng t�i Thi�n Tr� M�t C�nh t�ng 1")
		return 1
	end
	SetFightState(0)
end