-- ؤ���ض� ����3 ��ʦ������¥����������Ӧ����4������5��
-- by��Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) then
		Msg2Player("M� b�o r��ng ra.")
		i = 0
		if ((HaveItem(209) == 0) and (random(0,99) < 40)) then
			AddEventItem(209)
			AddNote("B�n l�y ���c 4 chi�c t�i v�i ")
			i = i + 1
		end
		if ((HaveItem(210) == 0) and (random(0,99) < 40)) then
			AddEventItem(210)
			AddNote("B�n l�y ���c 5 chi�c t�i v�i ")
			i = i + 1
		end
		if (i == 2) then
			Msg2Player("B�n l�y ���c 2 chi�c t�i v�i ")
		elseif (i == 1) then
			Msg2Player("B�n l�y ���c m�t chi�c t�i v�i ")
		else
			Msg2Player("B�n th�t v�ng v� chi�c r��ng n�y tr�ng r�ng.")
		end
	else
		Talk(1,"","B�o r��ng n�y �� kh�a r�i")
	end
end;
