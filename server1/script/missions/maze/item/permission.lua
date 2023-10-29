Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\missions\\maze\\addstatdata.lua")

function main(nItemIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (not player) then
		return 1
	end
	if (player:GetLevel() < 120) then
		player:Say("C�p 120 tr� l�n m�i c� th� s� d�ng Ng�c Long L�nh B�i.")
	elseif (MazePermission:CheckPermission(player) == 1) then
		player:Say("M�i ng��i ch�i ch� ���c s� d�ng Ng�c Long L�nh B�i m�t l�n")
	else
		MazePermission:Permit(player, nil)
		AddStatDataCanEnterMazeCount(1)
		return 0
	end
	return 1
end
