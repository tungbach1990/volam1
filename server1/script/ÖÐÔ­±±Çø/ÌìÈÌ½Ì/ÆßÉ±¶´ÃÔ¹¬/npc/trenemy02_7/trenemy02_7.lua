--description: ��ɱ������7������10������
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if ((UTask_tr == 10*256+50) and (HaveItem(57) == 0)) then
		AddEventItem(57)
		Msg2Player("L�y ���c m�nh th� b�y c�a l�nh b�i. ")
		AddNote("L�y ���c m�nh th� b�y c�a l�nh b�i trong Th�t S�t ��ng. ")
	end
end;
