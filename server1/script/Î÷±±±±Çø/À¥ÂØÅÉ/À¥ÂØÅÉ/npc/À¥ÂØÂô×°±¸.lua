--������ ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("N�i ��n Thi�n S� ��o B�o,ch� ph�m c�a b�n ph�i t�t nhi�n l� thi�n h� �� nh�t,c� V� �ang c�ng ph�i b�t ch��c ch� t�c c�a b�n ph�i ", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Ch��ng m�n c� l�nh: trang b� ch� ���c b�n cho ��ng m�n.")
	end
end;

function yes()
Sale(76)
end;

function no()
end;
