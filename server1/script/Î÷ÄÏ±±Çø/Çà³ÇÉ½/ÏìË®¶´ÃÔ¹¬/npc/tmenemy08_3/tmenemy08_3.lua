--description: ����50������ ���ɽ��ˮ������
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if ((UTask_tm == 50*256+80) and (HaveItem(48) == 0)) then					--û�а�����
		AddEventItem(48) 
--		SetTask(2, 59)
		AddNote("��nh b�i k� ��ch � ��ng H��ng Th�y, l�y ���c '�m kh� ph�' ")
		Msg2Player("L�y �u�c �m kh� ph� ")
	end
end;
