--description: ���ų�ʦ���� ��˿���ڶ������
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 60*256+40) and (HaveItem(100) == 0) and (random(0,99) <= 30) then 		--������20%��Ϊ30%
		AddEventItem(100) 
		Msg2Player("Nh�n �u�c ch�a kh�a th� 3. ")
--		SetTask(2, 66)
		AddNote("T�i Tr�c T� ��ng t�ng th� hai, ��nh b�i k� th�, ti�n v�o t�ng th� 3. ")
	end
end;	
