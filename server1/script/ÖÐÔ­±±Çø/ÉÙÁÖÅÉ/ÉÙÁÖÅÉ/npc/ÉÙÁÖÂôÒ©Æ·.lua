--������ ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	if (GetFaction() == "shaolin") or (Uworld38 == 127) then
		Say("Tuy n�i v� c�ng b�n ph�i t�ng c��ng s�c kh�e, nh�ng c�ng c� l�c l�m b�nh, n�n c�ng c�n c�c lo�i thu�c men.", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Ch��ng m�n c� l�nh, thu�c c�a b�n ph�i ch� b�n cho ��ng m�n")
	end
end;

function yes()
Sale(71)
end;

function no()
end;
