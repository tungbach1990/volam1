-- ؤ���ض� ����1 ��ʦ����һ¥��һ������Ӧ����1������2��
-- by��Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(203) == 1) then
		Msg2Player("B�n th� d�ngch�a kh�am� chi�c r��ng ")
		DelItem(203)
		i = 0
		if ((HaveItem(211) == 0) and (random(0,99) < 60)) then
			AddEventItem(211)
			AddNote("L�y ���c chi�c t�i th� nh�t ")
			i = i + 1
		end
		if ((HaveItem(201) == 0) and (random(0,99) < 60)) then
			AddEventItem(201)
			AddNote("L�y ���c chi�c t�i th� hai ")
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
