--������ ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) then
		Say("Trang b� c�ng nhi�u d��c li�u qu� th� c�ng c� �ch", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","M�n ch� c� l�nh, D��c li�u c�a b�n m�n ch� d�nh cho t� mu�i ��ng m�n.")
	end
end;

function yes()
Sale(68)
end;

function no()
end;
