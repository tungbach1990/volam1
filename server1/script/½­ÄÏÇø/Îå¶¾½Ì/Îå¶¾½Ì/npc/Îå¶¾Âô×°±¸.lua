--�嶾�� ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("Ch�ng ta ��ng qu� quan tr�ng v� nh�ng th� n�y. Trang b� t�i th��ng nh�t ch�nh l� s� �ng ph� linh ho�t.", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Gi�o ch� c� l�nh: trang b� c�a m�n ph�i kh�ng ���c b�n cho ng��i ngo�i")
	end
end;

function yes()
	Sale(79)
end;

function no()
end;
