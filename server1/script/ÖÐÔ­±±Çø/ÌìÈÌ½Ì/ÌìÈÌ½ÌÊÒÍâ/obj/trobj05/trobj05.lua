--description: ���̽�20������ С�ƹ�
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	if (UTask_tr == 20*256+50) and ( HaveItem(125) == 0) then				--ȡ����������Ʒ���޵��жϣ��Ա���������
		SetPropState()
		AddEventItem(125)
		Msg2Player("T�m ���c Ti�u Ho�ng c�u �i l�c. ")
		AddNote("T�m ���c Ti�u Ho�ng c�u. ")
	end
end;
