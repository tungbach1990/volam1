--���й�����
function SayCityStatus()
	nCityID = GetCityArea();
	Say(GetCitySummary(nCityID) .. "\n" .. NW_GetSealInfo(), 0);
end;

function ManageCity()
	nCityID = GetCityArea();
	OpenCityManageUI(nCityID);
end;

function main()
	nCityID = GetCityArea();
	if (nCityID >= 1 and nCityID <= 7) then
		TongName, MasterName = GetCityOwner(nCityID);
		if (MasterName == GetName()) then
			Say("L�m ch�c Th�i Th�, b�n c� mu�n thi�t ��t thu� m�i kh�ng?", 2, "Mu�n/ManageCity", "Kh�ng, ta ch� mu�n xem th�ng tin c�a th�nh th�. /SayCityStatus");
		else
			SayCityStatus();
		end;
	else
		Say("Khu v�c kh�ng c� qu�n l�. ", 0);
	end;
end;

