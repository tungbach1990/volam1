--�嶾�� ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("C�ng phu c�a b�n ph�i m�c d� l� l�y ��c l�m ch�. Nh�ng m� h�o d��c 'di�u th� h�i xu�n' c�ng kh�ng thi�u. C� mu�n xem th� kh�ng", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Gi�o ch� c� l�nh: thu�c c�a b�n ph�i kh�ng ���c b�n cho ng��i ngo�i")
	end
end;

function yes()
Sale(80)
end;

function no()
end;
