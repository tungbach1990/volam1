-- �ƺ�Դͷ���ɶ��Թ�2F ս��NPC ɽ��02�����س�ʦ����
-- by��Dan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	if ((UTask_kl == 60*256+20) and (HaveItem(12) == 0) and (random(1,99) < 50)) then
		AddEventItem(12)
		Msg2Player("L�y ���c kh�a Vi�m �� ")
		AddNote("L�y ���c kh�a Vi�m �� ")
	end
end;
