--description: ����40������ ���ɽ��ͨ����3
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if ((UTask_tm == 40*256+60) and (HaveItem(45) == 0)) then					--û����ܵ�Ƥ
		AddEventItem(45) 
		Msg2Player("L�y ���c v� c�y anh t�c ")
		AddNote("L�y ���c v� c�y anh t�c ")
	end
end;
