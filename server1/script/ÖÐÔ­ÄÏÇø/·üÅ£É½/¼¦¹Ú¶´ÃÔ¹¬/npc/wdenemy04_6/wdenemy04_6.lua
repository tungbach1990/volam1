--description: �䵱��40������ ��ţɽ���ڶ���ͨ����
--author: yuanlan	
--date: 2003/5/15
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5);
	if (UTask_wd == 40*256+60) and (HaveItem(164) == 0) and (random(0, 99) < 33) then
		AddEventItem(164)
		Msg2Player("Nh�n th� h�i �m c�a Nhu�n N��ng ")
--		SetTask(5, 48)
		AddNote("Thu ph�c ���c n�m con  B�ch Ng�c H� c�a Nhu�n N��ng, nh�n ���c th� h�i �m ")
	end
end;
