-- ���ɽ��Զ� ս��NPC ������02��������40������
-- by��Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+20) and (HaveItem(196) == 0) and (random(0,100) < 40) then				-- 40%�Ļ��ʳɹ�
		AddEventItem(196)
		Msg2Player("L�y ���c ch�a kho� s�t ")
		AddNote("T�m ra ch�a kho� s�t ")
	end
end;
