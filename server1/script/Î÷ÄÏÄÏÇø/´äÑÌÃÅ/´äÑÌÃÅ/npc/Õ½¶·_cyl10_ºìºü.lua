-- ������ ս��NPC ??? 10�����񣨴�������
-- by��Dan_Deng(2003-07-25)

function OnDeath()
	UTask_cy = GetTask(6);
	if (UTask_cy == 10*256+10) and (HaveItem(0) == 0) and (random(0,100) < 75) then			--�����У�75%���ʳ���
		AddEventItem(0) 
		Msg2Player("Nh�n ���c Th�y V� tr�m ")
		AddNote("Nh�n ���c Th�y V� tr�m ")
	end
end;
