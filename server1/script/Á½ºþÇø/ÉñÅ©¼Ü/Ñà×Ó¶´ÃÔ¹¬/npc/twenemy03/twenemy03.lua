--description: ��ũ�� ���Ӷ�����
--author: yuanlan	
--date: 2003/4/25
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3);
	if (UTask_tw == 30*256+20) and (HaveItem(145) == 0) and (random(0,99) < 50) then
		AddEventItem(145)
		Msg2Player("��nh b�i b�n c��p, �o�t l�i Thi�n V��ng l�nh. ")
--		SetTask(3, 35)
		AddNote("T�i Mi�u L�nh Y�n T� ��ng ��nh b�i t�n B�o T� c�m ��u b�n c��p �o�t l�i Thi�n V��ng l�nh. ")
	end
end;
