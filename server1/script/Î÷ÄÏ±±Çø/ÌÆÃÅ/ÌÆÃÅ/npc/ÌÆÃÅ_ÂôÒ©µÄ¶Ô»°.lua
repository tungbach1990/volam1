--���ϱ��� ���� ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetFaction() == "tangmen") or (Uworld37 == 127) then
		Say(" thu�t c�a Tuy�t Xu�n T�u b�n m�n c� th� n�i l� ��c b� thi�n h�. Tuy�t Xu�n T�u �i�u ch� nh�ng d��c ho�n n�y.", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","M�n ch� c� l�nh, d��c ph�m c�a b�n m�n kh�ng th� b�n cho ng��i ngo�i!")
	end
end;

function yes()
Sale(56)
end;

function no()
end;
