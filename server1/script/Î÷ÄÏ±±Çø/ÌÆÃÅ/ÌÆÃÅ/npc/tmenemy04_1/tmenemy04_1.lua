--description: ���Ź�ʯ�����1 20������
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if ((UTask_tm == 20*256+20) and ( HaveItem(37) == 0)) then		--û�й�ʯ��˿��һ
		AddEventItem(37)
		Msg2Player("C� ���c t�m kh�n l�a, tr�n ghi ch� Thi�n ")
		AddNote("C� ���c t�m kh�n l�a, tr�n ghi ch� Thi�n ")
	end
end;
