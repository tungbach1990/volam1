--������ ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("Ti�n ��n Th�nh d��c, ��o Gia ch�nh th�ng ti�n ��n ��u �� � ��y c�. ", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Ch��ng m�n c� l�nh: D��c ph�m ch� ���c b�n cho ��ng m�n.")
	end
end;

function yes()
Sale(77)
end;

function no()
end;
