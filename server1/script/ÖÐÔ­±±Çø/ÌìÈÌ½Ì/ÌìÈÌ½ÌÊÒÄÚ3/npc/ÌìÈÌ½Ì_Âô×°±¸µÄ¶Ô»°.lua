--��ԭ���� ���̽� ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("��y ��u l� do Cung n� trong cung l�m ra, ng��i xem, th� c�ng r�t tinh x�o...", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Gi�o ch� c� l�nh, trang b� c�a b�n gi�o ch� b�n cho c�c �� t�.")
	end
end;

function yes()
Sale(61)
end;

function no()
end;
