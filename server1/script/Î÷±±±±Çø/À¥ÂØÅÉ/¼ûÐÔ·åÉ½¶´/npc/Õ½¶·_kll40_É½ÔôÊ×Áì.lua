-- ���Է�ɽ���Թ� ս��NPC ɽ������ ����40������
-- by��Dan_Deng(2003-07-30)

function OnDeath()
	UTask_kl = GetTask(9);
	if (UTask_kl == 40*256+20) and (HaveItem(212) == 0) and (random(0,99) < 30) then
		AddEventItem(212)
		Msg2Player("L�y ���c 1 chi�c ch�a kh�a ")
		AddNote("B�n l�y trong ng��i t�n th� l�nh c�a s�n t�c ra 1 chi�c ch�a kh�a ")
	end
end;
