--������ ��Ȫ��to�㵴ɽ
--Trap ID�������� 7

function main(sel)
	if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
		SetFightState(1);
		NewWorld(195, 682, 2863);
		AddTermini(156);
	else
		Talk(1,"","Ph�a tr��c nguy hi�m! Xin h�y quay v� r�n luy�n th�m!")
	end
end;
