-- ����ɽ�Թ� ս��NPC ����02���嶾30������
-- by��Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 30*256+20) and (HaveItem(221) == 0) and (random(0,99) < 40) then
		AddEventItem(221)
		AddNote("��nh b�i ph�n ��, l�y l�i ���c M�c H��ng ��nh th�t ")
		Msg2Player("��nh b�i ph�n ��, l�y l�i ���c M�c H��ng ��nh th�t ")
	end
end;
