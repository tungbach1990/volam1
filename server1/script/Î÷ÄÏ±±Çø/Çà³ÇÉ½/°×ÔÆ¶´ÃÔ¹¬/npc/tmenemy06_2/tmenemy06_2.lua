--description: ����30������ ���ɽ���ƶ����2
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2);
	if (UTask_tm == 30*256+30) and (HaveItem(98) == 0) and (random(0,99) < 50) then		-- ������33%��Ϊ50%
		AddEventItem(98)
		Msg2Player("L�y ���c ch�a kh�a ")
		AddNote("��nh b�i Ph� Ti�u ��u M�c, l�y ���c ch�a kh�a ")
	end
end;
