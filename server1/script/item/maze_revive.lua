Include("\\script\\global\\playerlist.lua")
Include("\\script\\missions\\maze\\maze.lua")

-- ����������ʹ���ߴ��򻨳ش��͵�ս���еĽ�ڣ����
function main(nItemIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	local err = {}
	err.Msg = ""
	if (ReviveFigure:Use(player, err) == 0) then
		player:Msg2Player(err.Msg)
		return 1
	else
		return 0
	end
end
