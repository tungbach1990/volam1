--description: �䵱ɽ ���Ƕ��Թ�����
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5);
	if (UTask_wd == 20*256+50) and (HaveItem(67) == 0) then
		Talk(2,"","Hu hu hu! V� ch�u c�m chi�c Thi�n T�m n�y m�i b� S�i �� l�i ��n ��y, qu�ng �i l� xong th�i!","��ng v�t �i! H�y ��a cho ta!")
		AddEventItem(67)
		Msg2Player("C�u ���c con trai �ng �ng ch� ti�m t�p h�a T��ng D��ng, n� t�ng cho b�n 1 c�i Thi�n T�m. ")
--		SetTask(5, 26)
		AddNote("��nh b�i s�i hoang trong H�a Lang ��ng, c�u ���c con trai �ng �ng ch� ti�m t�p h�a T��ng D��ng, c� 1 c�i Thi�n T�m. ")
	end
end;
