--description: �������һ�����
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4);
	if (UTask_tr == 30*256+20) and (HaveItem(61) == 0) then
		AddEventItem(61)
		Msg2Player("���c B�o Th�ch T� M�u L�c. ")
		AddNote("T�i T�n L�ng ��a, ��nh b�i t�n tr�m B�o Ng�c, ���c B�o Th�ch T� M�u L�c. ")
	end
end;
