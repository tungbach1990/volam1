-- ������ ս��NPC �����ŵ��� ���������黨��
-- by��Dan_Deng(2003-07-25)

function OnDeath()
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld36 == 10) and (random(0,100) < 66) then		-- �����У���66%�Ļ���
		AddEventItem(106)
		Msg2Player("Nh�n ���c Hoa T�nh ")
		AddNote("L�y ���c Hoa T�nh trong Hoa Kh�i tr�n ")
	end
end;
