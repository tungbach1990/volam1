--������ �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("�� t� c�a b�n ph�i ch� tr�ng tu luy�n ��o ph�p b�a ch�, ��i v�i binh �ao, v� c�ng th� kh�ng ���c tinh th�ng l�m", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Ch��ng m�n c� l�nh: binh kh� ch� ���c b�n cho ��ng m�n.")
	end
end;

function yes()
	Sale(75)
end;

function no()
end;
