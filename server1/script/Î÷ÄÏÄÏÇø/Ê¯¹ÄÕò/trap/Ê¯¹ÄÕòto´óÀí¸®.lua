--�������� ʯ����to����
--Trap ID���������� 2

function main(sel)
	if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
		SetFightState(1);
		NewWorld(162, 1691, 3517);
	else
		Talk(1,"","Ph�a tr��c nguy hi�m! Xin h�y quay v� r�n luy�n th�m!")
	end
end;
