-- ����ǳ�ʥ��ǧѰ�� ս��NPC ����02��������50������
-- by��Dan_Deng(2003-07-27)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy >= 50*256+32) and (UTask_cy < 50*256+50) and (HaveItem(5) == 0) then		--50�����������޵���
		UTask_cy = SetBit(UTask_cy,2,1)
		if (UTask_cy == 50*256+32+7) then		--�����(bin(100 + 010 + 001))
			SetTask(6,50*256+32)
			AddEventItem(5)
			Msg2Player("��nh b�i b�n c��p �o�t v� V� ��ng Quan �m c�a b�n c��p ")
			AddNote("��nh b�i b�n c��p �o�t v� V� ��ng Quan �m c�a b�n c��p ")
		else
			SetTask(6,UTask_cy)
			Msg2Player("��nh b�i b�n c��p, nh�ng kh�ng t�m th�y V� ��ng Quan �m ")		--Ҫ��Ҫ��ʾ��ң�
		end
	end
end;
