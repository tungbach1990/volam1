function OnDeath()
	Uworld76 = GetTask(76)
	if (Uworld76 == 40) and (HaveItem(371) == 0) and (random(0,99) < 50) then
		AddEventItem(371)
		Msg2Player("L�y ���c n��c c�a ��n Tr�ch ")
		AddNote("L�y ���c n��c c�a ��n Tr�ch ")
	end
end
