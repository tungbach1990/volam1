-- ����ɽ�Թ� ս��NPC ����01���嶾30������
-- by��Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu >= 30*256+10) and (UTask_wu < 40*256) and (HaveItem(87) == 0) and (random(0,99) < 50) then
		AddEventItem(87)
		if (UTask_wu == 30*256+10) then
			AddNote("Nh�n ���c M�c H��ng ��nh ")
			Msg2Player("Nh�n ���c M�c H��ng ��nh ")
		else
			Msg2Player("Ch� l� M�c H��ng ��nh gi� ")
		end
	end
end;
