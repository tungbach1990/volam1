--description: ������������ 20������
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 20*256+40) and (HaveItem(41) == 0) then			-- ������50%��Ϊ100%
		AddEventItem(41) 
		Msg2Player("C� ���c d�y chuy�n v�ng ")
		AddNote("T�i h� Ph� Th�y k� b�n ���ng Gia B�o, ��nh b�i X�ch Di�m Ng�c, l�y ���c d�y chuy�n v�ng ")
	end
end;
