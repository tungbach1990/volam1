--description: �䵱ɽ ���Ƕ��Թ�����
--author: yuanlan	
--date: 2003/5/14
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5);
	if (UTask_wd == 20*256+20) and (HaveItem(66) == 0) then
		AddEventItem(66)
		Msg2Player("T�m ���c Thi�n T�m ��o b�o b� r�ch. ")
--	SetTask(5, 23)	
		AddNote("V�o H�a Lang ��ng, ��nh b�i s�i l�a l�y ���c Thi�n T�m ��o b�o b� c�n r�ch. ")
	end
end;
