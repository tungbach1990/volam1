-- �ƺ�Դͷ���ɶ��Թ�5F ս��NPC ɽ��05�����س�ʦ����
-- by��Dan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	if ((UTask_kl == 60*256+20) and (HaveItem(15) == 0) and (random(0,99) < 20)) then
		AddEventItem(15)
		Msg2Player("L�y ���c kh�a Chuy�n H�c ")
		AddNote("L�y ���c kh�a Chuy�n H�c ")
	end
end;
