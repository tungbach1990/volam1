--�������� �����toɳĮ�Թ�
--TrapID��ɳĮ�Թ�16

function main(sel)
	i = random(0,2)
	if (GetLevel() >= 80) then
		SetFightState(1);
		AddTermini(195);
		if (i == 0) then 
			NewWorld(224,1620,3216)
		elseif (i == 1) then 
			NewWorld(224,1594,3166)
		else
			NewWorld(224,1622,3144)
		end

	else
		Say("Sa m�c th�t s� r�t nguy hi�m! Xin h�y quay v� r�n luy�n th�m!",1,"Quay l�i r�ng Kho�i Ho�t. /no")
		SetPos(1716,3144)
	end
end;

function no()
end
