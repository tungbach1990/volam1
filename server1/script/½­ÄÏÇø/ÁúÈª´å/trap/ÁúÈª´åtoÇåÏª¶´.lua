--������ ��Ȫ��to��Ϫ��
--Trap ID�������� 106

function main(sel)
	if (GetLevel() >= 5) then	
		SetFightState(1);
		NewWorld(198, 1522, 2955);
		AddTermini(211)
	else
		Talk(1,"","Ph�a tr��c nguy hi�m! Xin h�y quay v� r�n luy�n th�m!")
	end
end;
