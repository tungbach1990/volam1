--description: ��ɽ����
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_world30 = GetByte(GetTask(30),1)
	if ((UTask_world30 == 5) and (HaveItem(50) == 0) and (random(0,99) < 50)) then
		Talk(1,"","B�n l�y ���c m�t c�y V� V��ng Ki�m! Nh�ng m�i v�a vung l�n th� n� �� g�y l�m 3 �o�n! T� ra l� ki�m gi�!")
		Msg2Player("Ph�t hi�n c�y V� V��ng ki�m gi� ")
	end
end;
