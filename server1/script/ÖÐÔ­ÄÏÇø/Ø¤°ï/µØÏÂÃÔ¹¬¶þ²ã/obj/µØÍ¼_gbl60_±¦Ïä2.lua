-- ؤ���ض� ����2 ��ʦ���񣨶�¥����������Ӧ����3��
-- by��Dan_Deng(2003-07-29)

function main()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) then
		if (HaveItem(208) == 0) and (random(0,99) < 50) then
			Msg2Player("B�n m� chi�c r��ng �� ra, l�y ���c m�t c�i t�i v�i ")
			AddEventItem(208)
			AddNote("L�y ���c chi�c t�i th� ba ")
		else
			Msg2Player("Chi�c r��ng n�y kh�ng c� g� ")
		end
	else
		Talk(1,"","B�o r��ng n�y �� kh�a r�i")
	end
end;
