Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

function OnDeath()	
	local szInfo = ""
	szInfo = format("Ng��i ch�i :%s[��ng c�p:%d]t� vong", GetName(), GetLevel())
	Game:WritePlayerLog(1, szInfo)
	--Transfer player to city immediatly when player die - Modified By DinhHQ - 20120409
	NewWorld(78,1483,3168)
end