--description: ����40������ ���ɽ��ͨ����2
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if ((UTask_tm == 40*256+60) and (HaveItem(44) == 0)) then					--û����ܵ�Ƥ
		AddEventItem(44) 
		Msg2Player("L�y ���c gan r�n ")
		AddNote("L�y ���c gan r�n ")
	end
end;
