function main()
	Say("B�n mu�n t�m th�i theo phe n�o?", 4, "Phe ch�nh ngh�a /ChangeCamp", "Phe t� �c /ChangeCamp", "Phe s�t th� /ChangeCamp", "T�m th�i kh�ng ��i /OnCancel");
end;

function ChangeCamp(nSel)
	SetFightState(1)
	if (nSel == 0) then 
		SetCurCamp(1)
	elseif (nSel == 1) then 
		SetCurCamp(2)
	else
		SetCurCamp(4)
	end;
end;

function OnCancel()
end;