--��ԭ���� �䵱�� ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("C�c l�ai thu�c n�y ��u d�ng th�o d��c sinh tr��ng tr�n V� �ang s�n ch� th�nh, c� th� c�m m�u ch�a th��ng, l�i c� th� t�ng c��ng s�c kh�e.", 2, "Giao d�ch/yes", "Kh�ng giao d�ch/no")
	else
		Talk(1,"","Ch��ng m�n c� l�nh,d��c ph�m b�n gi�o ch� c� th� b�n cho m�n h� V� �ang.")
	end
end;

function yes()
Sale(65);  			
end;

function no()
end;






