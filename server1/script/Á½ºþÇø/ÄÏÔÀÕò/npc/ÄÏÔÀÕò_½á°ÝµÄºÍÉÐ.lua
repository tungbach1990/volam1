-- ��ݵĺ���
-- By: Dan_Deng(2003-08-22)

function main(sel)
	if (GetTeamSize() > 1) and (IsCaptain() == 1) then			-- ֻ�жӳ������������
		Talk(1,"Wswear_select", 11374)
	else
		Talk(1,"", 11375)
	end
end;

function Wswear_select()
	if (GetSex() == 0) then
		P_sex = "Thi�u hi�p"
	else
		P_sex = "N� hi�p"
	end
	Say("T�nh ��c Thi�n S�: N�i hay l�m! Ch� c�n"..P_sex.."��ng 3000 l��ng �� s�a t��ng Ph�t, m�i chuy�n ��u d� n�i.",2,"Quy�n 3000 l��ng. /Wswear_yes","Kh�ng c�n!/Wswear_no")
end;

function Wswear_yes()
	if (GetCash() >= 3000) then
		if(SwearBrother(GetTeam()) == 1)then
			Pay(3000)
			Msg2Team("Ch�c m�ng hai v� �� k�t ngh�a Kim Lan. ")
		else
			Msg2Team("Trong nh�m c� t�n t�i quan h� phu th�, vi�c k�t b�i th�t b�i. ")
		end
	else
		Talk(1,"", 11376)
	end
end;

function Wswear_no()
end;
