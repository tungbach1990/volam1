-- ����ɽ ս��NPC ������ ؤ��40������
-- by��Dan_Deng(2003-07-28)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 40*256+10) and (HaveItem(236) == 0) and (random(0,100) < 33) then		--33%����
		AddEventItem(236)
		AddNote("��nh b�i ��m ph�c binh ng��i Kim, ph�t hi�n ra b�c m�t h�m li�n minh ")
		Msg2Player("��nh b�i ��m ph�c binh ng��i Kim, ph�t hi�n ra b�c m�t h�m li�n minh ")
	end
end;
