--��ԭ���� �䵱�� �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("�� t� b�n ph�i s� tr��ng l� d�ng ki�m, xem xem c� b�o ki�m th�ch h�p cho ng��i d�ng kh�ng?.....", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Ch��ng m�n c� l�nh, binh kh� b�n gi�o ch� c� th� b�n cho �� t� V� �ang.")
	end
end;

function yes()
Sale(63)
end;

function no()
end;
