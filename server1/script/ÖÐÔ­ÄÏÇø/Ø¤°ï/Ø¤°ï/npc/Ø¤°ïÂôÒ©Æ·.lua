--ؤ�� ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("T�t c� c�c d��c ph�m � ��y ��u do huynh �� c�i bang t� b�o ch� c� ", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Bang ch� c� l�nh: D��c ph�m c�a b�n m�n kh�ng ���c b�n cho ng��i ngo�i")
	end
end;

function yes()
	Sale(74)
end;

function no()
end;
