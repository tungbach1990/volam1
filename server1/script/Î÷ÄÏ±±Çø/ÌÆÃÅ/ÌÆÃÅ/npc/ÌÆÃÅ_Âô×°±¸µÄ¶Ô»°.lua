--���ϱ��� ���� ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetFaction() == "tangmen") or (Uworld37 == 127) then
		Say("�� t� b�n m�n th�n ph�p nhanh nh�n, th�ch h�p trang b� nh�ng v� kh� nh� g�n!", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","M�n ch� c� l�nh: trang b� m�n ph�i ch� b�n cho t� mu�i ��ng m�n!")
	end
end;

function yes()
Sale(55)
end;

function no()
end;
