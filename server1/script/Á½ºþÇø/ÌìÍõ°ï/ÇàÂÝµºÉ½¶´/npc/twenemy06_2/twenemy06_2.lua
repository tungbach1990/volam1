--description: ���ݵ�ɽ������
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3);
	if (UTask_tw == 60*256+40) and (HaveItem(96) == 0) and (random(0,99) < 25) then
		AddEventItem(96)
		Msg2Player("�o�t l�i Thi�n V��ng Di Th� t� tay b�n s�t th� Kim qu�c. ")
--		SetTask(3, 66)
		AddNote("Trong s�n ��ng Thanh Loa ��o, ��nh b�i t�n c�m ��u b�n s�t th� �� Nh�n, �o�t l�i Thi�n V��ng Di Th�. ")
	end
end;	
