--���ϱ��� ������ �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say("�� t� b�n ph�i ��u l� n� nhi m�m y�u, v� th� �a s� c�c lo�i binh �ao ��u nh� nh�ng linh ho�t", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Ch��ng m�n c� l�nh: binh kh� m�n ph�i ch� b�n cho t� mu�i ��ng m�n!")
	end
end;

function yes()
Sale(51)
end;

function no()
end;
