-- �ƺ�Դͷ���ɶ��Թ�1F ս��NPC ɽ��01�����س�ʦ����
-- by��Dan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	if (UTask_kl == 60*256+20) and (HaveItem(11) == 0) and (random(1,99) < 60) then
		AddEventItem(11)
		Msg2Player("L�y ���c Ph�c Hy t�a ")
		AddNote("L�y ���c Ph�c Hy t�a ")
	end
end;
