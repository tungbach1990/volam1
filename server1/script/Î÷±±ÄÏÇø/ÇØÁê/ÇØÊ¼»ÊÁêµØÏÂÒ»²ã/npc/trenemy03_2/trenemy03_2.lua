--description: �������һ�����
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	if (UTask_tr == 30*256+20) and (HaveItem(60) == 0) then
		AddEventItem(60)
		Msg2Player("���c Lam Th�y Tinh. ")
		AddNote("T�i T�n L�ng ��a, ��nh b�i t�n tr�m B�o Ng�c, ���c B�o Th�ch C�p Huy�t H�ng. ")
	end
end;	
