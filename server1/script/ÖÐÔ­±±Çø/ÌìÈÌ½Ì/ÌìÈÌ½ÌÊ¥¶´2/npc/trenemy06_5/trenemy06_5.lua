--description: ���̽�ʥ��������˶�Ы�������̳�ʦ����
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+70) and (HaveItem(102) == 0) then
		AddEventItem(102)
		Msg2Player("L�y ���c m�t chi�c ch�a kh�a. ")
		AddNote("T�i t�ng hai Th�nh ��ng, ��nh b�i ��c Y�t V��ng l�y ���c ch�a kh�a m� r��ng b�u. ")
	end
end;
