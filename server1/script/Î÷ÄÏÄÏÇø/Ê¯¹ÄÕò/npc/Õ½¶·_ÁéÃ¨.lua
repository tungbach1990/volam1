-- ʯ���� ս�� ��è �������񣺰���Ľ�ָ
-- By��Dan_Deng(2003-09-04)

function OnDeath()
	UTask_world24 = GetTask(24)
	if (UTask_world24 == 5) and (HaveItem(234) == 0) and (random(0,99) < 66) then
		AddEventItem(234)
		Msg2Player("��nh b�i linh mi�u, l�y ���c chi�c nh�n ")
		AddNote("��nh b�i linh mi�u, l�y ���c chi�c nh�n ")
	end
end;
