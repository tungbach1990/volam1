-- 剑阁蜀道盗经人迷宫 战斗NPC ？？ 30级任务
-- by：Dan_Deng(2003-08-01)

function OnDeath()
	UTask_sl = GetTask(7)
	if (UTask_sl == 30*256+20) and (HaveItem(27) == 0) and (random(0,99) < 40) then
		AddEventItem(27)
		Msg2Player("Mang v� Thuy襫 nhc ba la m藅 產 t﹎ kinh ")
		AddNote("Mang v� Thuy襫 nhc ba la m藅 產 t﹎ kinh ")
	end
end;
