-- �嶾���嶾�� ս��NPC ����01���嶾��������
-- by��Dan_Deng(2003-08-05)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) and (HaveItem(227) == 0) and (random(0,99) < 80) then		-- �������в�����������Ʒ
		AddEventItem(227)
		Msg2Player("B�n nh�n ���c Kh�ng t��c v� th� nh�t ")
		AddNote("B�n nh�n ���c Kh�ng t��c v� th� nh�t ")
	end
end;
