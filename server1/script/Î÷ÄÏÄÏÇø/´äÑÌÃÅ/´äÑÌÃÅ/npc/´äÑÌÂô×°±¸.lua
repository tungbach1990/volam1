--������ ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) then
		Say("Mu�n xem c�c t� mu�i t� tay d�t v�i kh�ng? B�n ngo�i kh�ng mua ���c ��u.", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","M�n ch� c� l�nh, trang b� c�a b�n m�n ch� b�n cho T� mu�i ��ng m�n.")
	end
end;

function yes()
Sale(67)
end;

function no()
end;
