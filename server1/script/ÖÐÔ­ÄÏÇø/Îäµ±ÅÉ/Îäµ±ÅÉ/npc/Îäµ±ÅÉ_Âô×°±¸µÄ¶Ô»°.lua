--��ԭ���� �䵱�� ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("��o b�o ��p ai m� kh�ng th�ch? L�a m�t c�i �i?", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Ch��ng m�n c� l�nh, c�c trang b� c�a b�n gi�o ch� c� th� b�n cho �� t� V� �ang.")
	end
end;

function yes()
Sale(64)
end;

function no()
end;
