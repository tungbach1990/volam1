-- ҩ����ҩ���� ս��NPC ���� ����20������
-- by��Dan_Deng(2003-07-30)

function OnDeath()
	UTask_kl = GetTask(9);
	if (UTask_kl == 20*256+10) and (HaveItem(7) == 0) and (random(0,99) < 60) then
		AddEventItem(7) 
		Msg2Player("L�y ���c 1 c�i x��ng ��u l�c �� ")
		AddNote("L�y ���c 1 c�i x��ng ��u l�c �� ")
	end
end;
