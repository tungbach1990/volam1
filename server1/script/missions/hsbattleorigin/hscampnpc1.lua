Include("\\script\\missions\\hsbattleorigin\\hshead.lua");
Include("\\script\\missions\\csbattlelib\\cscampnpc1.lua");

function CheckCondition()
	if ( GetLevel() >= 60 ) then
		if (Pay(MS_SIGN_MONEY) == 1) then
			return 1;
		end;
 	end;
 	Say("B�n ch�a �� ��ng c�p ho�c kh�ng mang �� ti�n, kh�ng th� l�n Hoa S�n tuy�t ��nh", 0);
 	return 0;
end;