--description: �꾩������һ�����
--author: yuanlan
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	UTask_trsub01 = GetBit(GetTask(21),1)
	if (UTask_tr == 50*256+20) and (UTask_trsub01 == 0) and (HaveItem(160) == 0) then
		AddEventItem(160)
		Msg2Player("Nh�n ���c chi�c ch�a kh�a th� nh�t ")
		AddNote("T�i t�ng th� nh�t � Thi�t th�p, ��nh b�i v� binh T�ng, l�y ���c chi�c ch�a kh�a �� m� c� quan th� nh�t ")
	end
end;
