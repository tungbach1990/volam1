-- ��Ѩ�Թ� ս��NPC ��Ѩ���ˣ�����50������
-- by��Dan_Deng(2003-07-31)

function OnDeath()
	if (GetTask(9) == 50*256+127) and (HaveItem(10) == 0) then
		AddEventItem(10)
		AddNote("��nh b�i ���c qu�i nh�n trong b�ng ��ng v� l�y ���c n�m t�c tr�n ��u c�a h�n ")
		Msg2Player("��nh b�i ���c qu�i nh�n trong b�ng ��ng v� l�y ���c n�m t�c tr�n ��u c�a h�n ")
	end
end;
