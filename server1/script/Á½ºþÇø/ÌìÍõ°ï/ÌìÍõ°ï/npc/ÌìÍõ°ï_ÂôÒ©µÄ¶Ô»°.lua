--������ ������ ��ҩ�İ��ڶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (GetFaction() == "tianwang") or (Uworld38 == 127) then
		Say("C�c d��c lުu n�y l� s�ng � tr�n ��o t� sinh t� l�n, c�m m�u d��ng kh� c�c k� h�u hi�u", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Bang ch� c� l�nh: D��c ph�m c�a b�n bang ch� b�n cho huynh �� ��ng m�n")
	end
end;

function yes()
Sale(59);  			
end;

function no()
end;






