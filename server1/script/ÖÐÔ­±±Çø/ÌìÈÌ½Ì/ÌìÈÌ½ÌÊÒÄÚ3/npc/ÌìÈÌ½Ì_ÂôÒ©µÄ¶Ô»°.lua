--��ԭ���� ���̽� ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("Y thu�t c�a ��i Kim ch�ng ta kh�ng thua k�m g� nh� T�ng, danh y, h�o d��c ��u kh�ng thi�u� ", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Gi�o ch� c� l�nh, thu�c c�a b�n gi�o ch� b�n cho c�c �� t� trung th�nh.")
	end
end;

function yes()
Sale(62)
end;

function no()
end;
