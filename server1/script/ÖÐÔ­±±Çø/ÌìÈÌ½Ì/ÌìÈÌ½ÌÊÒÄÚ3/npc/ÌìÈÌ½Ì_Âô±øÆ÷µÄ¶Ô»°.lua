--��ԭ���� ���̽� �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("Lo�i v� kh� n�y ��u do th� r�n gi�i nh�t Kim qu�c l�m ra, ��u l� h�ng t�t.", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no");
	else
		Talk(1,"","Gi�o ch� c� l�nh, v� kh� c�a b�n gi�o ch� b�n cho c�c �� t� trung th�nh.")
	end
end;

function yes()
Sale(60)
end;

function no()
end;
