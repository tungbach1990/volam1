--description: ���̽�ʥ��һ����˶��߾������̳�ʦ����
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function OnDeath()
	UTask_tr = GetTask(4)
	Task_trtmp60 = GetTask(28)
	if (UTask_tr == 60*256+50) and (GetBit(Task_trtmp60,1) == 0) then
		SetTask(28, SetBit(Task_trtmp60,1,1))
		AddNote("L�y ���c kh�u quy�t Thi�n ��a Huy�n Ho�ng. ")
		Msg2Player("L�y ���c kh�u quy�t Thi�n ��a Huy�n Ho�ng. ")
	end
end;
