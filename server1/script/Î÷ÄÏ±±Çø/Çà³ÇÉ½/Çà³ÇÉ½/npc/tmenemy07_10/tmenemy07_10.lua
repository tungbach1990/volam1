--description: ����40������ ���ɽ��ͨ����5
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if ((UTask_tm == 40*256+60) and (HaveItem(47) == 0)) then					--û����ܵ�Ƥ
		AddEventItem(47) 
		Msg2Player("L�y ���c ��u Thi�n T�m ")
		AddNote("L�y ���c ��u Thi�n T�m ")
	end
end;
