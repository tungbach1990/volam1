--description: �ɶ�Ұ��Ұ�� ��������
--author: yuanlan	
--date: 2003/4/1

function OnDeath()
	Uworld11 = GetTask(11)
	if (Uworld11 < 255) and (Uworld11 >= 1) and (random(0,99) < 10) then		-- �����У�10%����
		if (Uworld11 < 10) then					-- ����ʮֻ���ټ���
			Uworld11 = Uworld11 + 1
			SetTask(11,Uworld11)
			Msg2Player("Ta �� gi�t ch�t 1 con heo r�ng chuy�n qu�y nhi�u d�n l�ng, tr��c m�t t�ng c�ng �� gi�t ch�t "..(Uworld11 - 1).."Con ")
		else
			SetTask(11,100)
			Msg2Player("Ta �� gi�t ch�t 10 con heo r�ng, c� th� tr� v� ph�c m�nh ���c r�i ")
		end
	end
end;
