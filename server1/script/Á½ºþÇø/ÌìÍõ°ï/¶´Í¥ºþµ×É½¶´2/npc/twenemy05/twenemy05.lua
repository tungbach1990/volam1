--description: ������ ��ͥ���׵�2��ˮ�֡�����50������
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3);
	if (UTask_tw == 50*256+20) and (HaveItem(95) == 0) and (random(0,99) < 33) then
		AddEventItem(95)
		Msg2Player("��nh b�i th�y qu�i, l�y ���c �� ng� s�c t��ng tr�ng cho h�nh ph�c, b�nh an. ")
--		SetTask(3, 55)
		AddNote("T�m th�y Th�y qu�i � t�ng s�n ��ng, ��nh b�i n� l�y ���c �� Ng� S�c ")
	end
end;
