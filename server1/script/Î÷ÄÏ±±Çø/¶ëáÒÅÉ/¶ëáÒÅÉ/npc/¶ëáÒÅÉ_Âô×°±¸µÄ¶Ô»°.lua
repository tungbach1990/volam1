--���ϱ��� ������ ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say("Qu�n �o gi�y n�n n�y l� do c�c t� mu�i c�a b�n m�n l�m ra. R�t th�ch h�p cho t� mu�i Nga Mi ph�i", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Ch��ng m�n c� l�nh: trang b� m�n ph�i ch� b�n cho t� mu�i ��ng m�n!")
	end
end;

function yes()
Sale(52)
end;

function no()
end;
