--����ս ��ת��ͼto��ս��ͼ���سǷ���
--Trap ID������ս

function main()
	if (GetCurCamp() ~= 1) then 
		Msg2Player("Kh�ng th� �i ���c, n�u �i s� ��n n�i ph�c k�ch c�a ��ch qu�n. ");
	else
		SetCurCamp(GetCamp())
		SetFightState(0)
		SetLogoutRV(0)
		NewWorld(222, 1613, 3185)
	end;
end;
