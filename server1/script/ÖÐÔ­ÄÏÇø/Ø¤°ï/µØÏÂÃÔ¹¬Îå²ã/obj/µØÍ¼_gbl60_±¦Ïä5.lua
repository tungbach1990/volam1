-- ؤ���ض� ����5 ��ʦ������¥����������Ӧ����8������9��
-- by��Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if ((UTask_gb == 60*256+10) and (HaveItem(202) == 1)) then
		Msg2Player("B�n th� d�ngch�a kh�am� chi�c r��ng ")
		DelItem(202)
		i = 0
		if (HaveItem(200) == 0) and (random(0,99) < 30) then
			AddEventItem(200)
			AddNote("L�y ���c chi�c t�i th� 8 ")
			i = i + 1
		end
		if (HaveItem(205) == 0) and (random(0,99) < 30) then
			AddEventItem(205)
			AddNote("L�y ���c chi�c t�i th� 9 ")
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
