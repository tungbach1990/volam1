--description: �����ɳ���Դͷ���
--author: yuanlan	
--date: 2003/3/6
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1);
	if ((UTask_em == 60*256+50) and (HaveItem(24) == 0) and (random(0,99) < 20)) then		--�����У�����û������ָ��������20%����
		AddEventItem(24) 
--		SetTask(1, 68)
		AddNote("��nh b�i ph�n �� Thanh H�a, l�y l�i Y�n Ng�c Ch� Ho�n ")
		Msg2Player("��nh b�i ph�n �� Thanh H�a, l�y l�i Y�n Ng�c Ch� Ho�n ")
	end
end;	
