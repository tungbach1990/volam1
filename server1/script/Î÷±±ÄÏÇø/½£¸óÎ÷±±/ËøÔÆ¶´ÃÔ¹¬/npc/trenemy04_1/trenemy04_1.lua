--description: ����������ƶ�����
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4);
	if (UTask_tr == 40*256+20) then	
		Msg2Player("B�n ch�t m�t t�n h� Li�u kh�c th� th�n ")
	end
end;
