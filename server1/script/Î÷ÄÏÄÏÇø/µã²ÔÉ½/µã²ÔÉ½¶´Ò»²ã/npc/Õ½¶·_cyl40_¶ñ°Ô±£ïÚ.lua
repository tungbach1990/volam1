-- ���ɽ��Զ� ս��NPC ������01��������40������
-- by��Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+20) and (HaveItem(197) == 0) and (random(0,100) < 50) then			-- 50%�Ļ��ʳɹ�
		AddEventItem(197)
		Msg2Player("L�y ���c ch�a kho� ��ng ")
		AddNote("T�m ���c ch�a kho� ��ng ")
	end
end;
