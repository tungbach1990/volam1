-- �嶾���嶾�� ս��NPC ��Ы01���嶾��������
-- by��Dan_Deng(2003-08-05)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) and (HaveItem(223) == 0) and (random(0,99) < 80) then		-- �������в�����������Ʒ
		AddEventItem(223)
		Msg2Player("B�n nh�n ���c Kh�ng t��c v� th� hai ")
		AddNote("B�n nh�n ���c Kh�ng t��c v� th� hai ")
	end
end;
