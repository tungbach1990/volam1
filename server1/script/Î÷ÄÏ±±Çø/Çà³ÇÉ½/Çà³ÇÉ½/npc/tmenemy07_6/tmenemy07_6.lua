--description: ����40������ ���ɽ��ͨ����1
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if ((UTask_tm == 40*256+60) and (HaveItem(43) == 0)) then					--û����ܵ�Ƥ
		AddEventItem(43) 
		Msg2Player("L�y ���c Da c�c ")
		AddNote("L�y ���c Da c�c ")
	end
end;
