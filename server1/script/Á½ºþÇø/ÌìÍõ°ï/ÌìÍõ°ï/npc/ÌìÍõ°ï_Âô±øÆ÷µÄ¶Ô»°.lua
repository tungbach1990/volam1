--������ ������ �������İ��ڶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (GetFaction() == "tianwang") or (Uworld38 == 127) then
		Say("Xem binh kh� Thi�n V��ng bang do ch�ng ta t� ch� t�o ��y!", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Bang ch� c� l�nh: binh kh� c�a b�n bang ch� b�n cho huynh �� ��ng m�n")
	end
end;

function yes()
Sale(57);  			
end;

function no()
end;






