-- �ƺ�Դͷ���ɶ��Թ�3F ս��NPC ɽ��03�����س�ʦ����
-- by��Dan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	if ((UTask_kl == 60*256+20) and (HaveItem(13) == 0) and (random(1,99) < 40)) then
		AddEventItem(13)
		Msg2Player("L�y ���c kh�a Thi�u Ng� ")
		AddNote("L�y ���c kh�a Thi�u Ng� ")
	end
end;
