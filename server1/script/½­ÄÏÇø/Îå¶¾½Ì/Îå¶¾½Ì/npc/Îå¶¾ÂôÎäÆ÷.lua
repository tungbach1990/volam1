--�嶾�� �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("B�n ph�i v�n kh�ng d�ng s�c m�nh �� chi�n th�ng, b�i v� nh�ng v� kh� n�y khi bi�t v�n d�ng th� tuy�t x�o v� song ", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Gi�o ch� c� l�nh: binh kh� c�a m�n ph�i kh�ng ���c b�n cho ng��i ngo�i")
	end
end;

function yes()
	Sale(78)
end;

function no()
end;
