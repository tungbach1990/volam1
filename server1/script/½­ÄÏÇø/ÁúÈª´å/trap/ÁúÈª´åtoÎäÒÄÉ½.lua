--������ ��Ȫ��to����ɽ
--Trap ID�������� 9

function main(sel)
	if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
		SetFightState(1);
		NewWorld(193, 1937, 2851);
		AddTermini(154);
	else
		Talk(1,"","Ph�a tr��c nguy hi�m! Xin h�y quay v� r�n luy�n th�m!")
	end
end;
