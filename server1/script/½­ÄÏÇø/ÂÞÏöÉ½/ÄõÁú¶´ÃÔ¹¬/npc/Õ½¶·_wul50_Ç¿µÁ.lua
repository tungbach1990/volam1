-- ����ɽ������ ս��NPC ǿ�����嶾50������
-- by��Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 50*256+20) and (random(0,99) < 33) then		-- �������У������ʴ����
		AddEventItem(88)
		AddNote("L�y l�i Ng�c San H� ")
		Msg2Player("L�y l�i Ng�c San H� ")
	end
end;
