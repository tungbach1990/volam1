-- ؤ���ض� ����4 ��ʦ������¥��һ������Ӧ����6������7��
-- by��Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if ((UTask_gb == 60*256+10) and (HaveItem(204) == 1)) then
		Msg2Player("B�n th� d�ngch�a kh�am� chi�c r��ng ")
		DelItem(204)
		if (HaveItem(206) == 0) then
			AddEventItem(206)
			AddNote("B�n l�y ���c t�i v�i th� s�u ")
			Msg2Player("B�n l�y ���c m�t chi�c t�i v�i ")
		elseif (HaveItem(207) == 0) then
			AddEventItem(207)
			AddNote("B�n l�y ���c t�i v�i th� b�y ")
			Msg2Player("B�n l�y ���c m�t chi�c t�i v�i ")
		else
			Msg2Player("B�n th�t v�ng v� chi�c r��ng n�y tr�ng r�ng.")
		end
	else
		Talk(1,"","B�o r��ng n�y �� kh�a r�i")
	end
end;
