--������ ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	if (GetFaction() == "shaolin") or (Uworld38 == 127) then
		Say("Ng��i xu�t gia kh�ng th� xa hoa, c�c lo�i �o m� n�y ��u do c�c s� huynh �� t� l�m l�y.", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Ch��ng m�n c� l�nh, trang b� c�a b�n ph�i ch� b�n cho ��ng m�n")
	end
end;

function yes()
Sale(70)
end;

function no()
end;
