--�������� ������to�����
--TrapID��

function main(sel)
	if (GetLevel() >= 5) then
		SetFightState(1);
		NewWorld(336, 1119, 3192);
		AddTermini(224);
	else
		Talk(1,"","Ph�a tr��c nguy hi�m! Xin h�y quay v� r�n luy�n th�m!")
	end
end;