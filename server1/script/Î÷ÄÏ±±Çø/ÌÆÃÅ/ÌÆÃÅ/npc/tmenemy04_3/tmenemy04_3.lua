--description: ���Ź�ʯ�����3 20������
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if ((UTask_tm == 20*256+20) and (HaveItem(39) == 0)) then		--û�й�ʯ��˿����
		AddEventItem(39)
		Msg2Player("C� ���c t�m kh�n l�a, tr�n ghi ch� Gi� ")
		AddNote("C� ���c t�m kh�n l�a, tr�n ghi ch� Gi� ")
	end
end;
