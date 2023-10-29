Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")
IL("ITEM")

function main()
	local player = PlayerList:GetPlayer(PlayerIndex)
	if (player) then
		if (player:CalcEquiproomItemCount(6, 1, 2634, 1, 0, 0) < 10) then
			player:Say("C�n ph�i <color=red>10<color> H�t Tuy�t Linh Ch�u m�i c� th� h�p th�nh m�t c�i Tuy�t Linh Ch�u H�n.")
		elseif (player:ConsumeEquiproomItem(10, 6, 1, 2634, 1) ~= 1) then
			player:Msg2Player("H�p th�nh Tuy�t Linh Ch�u H�n th�t b�i.")
		else
			local nItemIndex = player:AddItem(6, 1, 2635, 1, 0, 0)
			if (nItemIndex <= 0) then
				player:Msg2Player("H�p th�nh Tuy�t Linh Ch�u H�n th�t b�i.")
			else
				ITEM_SetExpiredTime(nItemIndex, 30)
				player:SyncItem(nItemIndex)
				player:Msg2Player("Th�nh c�ng h�p th�nh m�t c�i Tuy�t Linh Ch�u H�n.")
			end
		end
	end
	return 1
end
