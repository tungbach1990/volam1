--ؤ�� �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("�� c�u B�ng c�a b�n bang �� vang danh thi�n h�. T�t c� c�c lo�i binh kh� c�n, roi, d�y� � d�y ��u c� ��y �� c� ", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Bang ch� c� l�nh: Binh kh� c�a b�n m�n kh�ng ���c b�n cho ng��i ngo�i")
	end
end;

function yes()
	Sale(72)
end;

function no()
end;
