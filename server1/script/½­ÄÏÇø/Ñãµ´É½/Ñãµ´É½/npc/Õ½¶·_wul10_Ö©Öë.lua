-- �㵴ɽ�Թ� ս��NPC ֩��01���嶾10������ȭ����������
-- by��Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 10*256+10) then		-- �������У������ʴ����ȡ�����ʣ���
		AddEventItem(86)			-- ��Ʒ֩��
		if (GetItemCount(86) >= 10) then
			Msg2Player("B�n �� b�t ���c 10 con nh�n ��c ")
			AddNote("B�n �� b�t ���c 10 con nh�n ��c ")
		else
			Msg2Player("B�t ���c m�t con nh�n ��c ")
		end
	elseif (GetTask(75) == 10) and (GetTask(52) == 10) and (random(0,99) < 75) then		-- ȭ���������񣬰����ʵõ�
		AddEventItem(86)
		if (GetItemCount(86) >= 7) then
			Msg2Player("�� b�t ���c 7 con nh�n ��c, �� c� th� quay v�, ph�ng m�ng ")
		else
			Msg2Player("B�t ���c m�t con nh�n ��c ")
		end
	end
end;
