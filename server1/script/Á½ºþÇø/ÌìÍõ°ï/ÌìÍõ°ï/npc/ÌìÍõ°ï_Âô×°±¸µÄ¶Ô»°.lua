--������ ������ ��װ���İ��ڶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (GetFaction() == "tianwang") or (Uworld38 == 127) then
		Say("C�c huynh �� b�n bang c� ng�y ch�y ��ng ch�y t�y kh�ng th� kh�ng c� m�t b� trang b� t�t", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Bang ch� c� l�nh: trang b� c�a b�n bang ch� b�n cho huynh �� ��ng m�n")
	end
end;

function yes()
Sale(58);  			
end;

function no()
end;






