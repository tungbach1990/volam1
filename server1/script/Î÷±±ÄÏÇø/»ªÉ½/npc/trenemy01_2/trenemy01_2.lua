--description: ��ɽ����
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_world30 = GetByte(GetTask(30),1)
	if ((UTask_world30 == 5) and (HaveItem(50) == 0) and (random(0,99) < 50)) then
		AddEventItem(50)
		Msg2Player("L�y ���c c�y V� V��ng ki�m ")
--		SetTask(30, 8)
		AddNote("L�y ���c c�y V� V��ng ki�m ")
	end
end;
