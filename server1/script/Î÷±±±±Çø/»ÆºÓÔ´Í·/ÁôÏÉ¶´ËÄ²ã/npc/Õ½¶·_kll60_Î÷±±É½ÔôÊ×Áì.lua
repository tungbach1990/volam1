-- �ƺ�Դͷ���ɶ��Թ�4F ս��NPC ɽ��04�����س�ʦ����
-- by��Dan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	if ((UTask_kl == 60*256+20) and (HaveItem(14) == 0) and (random(1,99) < 30)) then
		AddEventItem(14)
		Msg2Player("Ph�i �i t�m Chuy�n H�c ")
		AddNote("Ph�i �i t�m Chuy�n H�c ")
	end
end;
