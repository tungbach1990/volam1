--����ս ��ת��ͼto��ս��ͼ���سǷ���
--Trap ID������ս

function main()
	if (GetCurCamp() ~= 2) then 
		Msg2Player("Kh�ng th� �i ���c, n�u �i s� ��n n�i ph�c k�ch c�a ��ch qu�n. ");
	else
		SetCurCamp(GetCamp())
		SetFightState(0)
		SetLogoutRV(0)
		NewWorld(223, 1613, 3185)
	end;
end;
