-- ���ɽ ս��NPC ���ˣ�������30������
-- by��Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 30*256+20) and (random(0,100) < 50) then				-- 30�������У�50%����
		SetTask(6,30*256+30)
		AddNote("�� c�u ch�u g�i c�a �o�n Hoa N�ng t� tay t�n th� ph� � �i�m H��ng s�n. ")
		Msg2Player("�� c�u ch�u g�i c�a �o�n Hoa N�ng t� tay t�n th� ph� � �i�m H��ng s�n. ")
	end
end;
