-- ����ɽ�Թ� ս��NPC ɫ��01���嶾20������
-- by��Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	i = GetItemCount("��u ng��i  ")
	if (UTask_wu == 20*256+10) and (i < 7) and (random(0,99) < 80) then		-- �������У������ʴ����
		AddEventItem(85)
		if (i >= 6) then
			Msg2Player("B�n gi�t ���c La Ti�u th�t qu�, l�y �� 7 c�i ��u ")
			AddNote("B�n gi�t ���c La Ti�u th�t qu�, l�y �� 7 c�i ��u, giao cho B�ch Doanh Doanh ")
		else
			Msg2Player("Nh�n ���c m�t c�i ��u ng��i ")
		end
	end
end;
