-- ؤ���ض� ս��NPC02 ��ʦ���񣨶�Ӧ����4��
-- by��Dan_Deng(2003-07-29)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(204) == 0) then			--����������û��Կ��
		AddEventItem(204)
		AddNote("T�i t�ng th� t� c�a m�t ��ng, l�y ���c m�t chi�c ch�a kh�a ")
		Msg2Player("T�i t�ng th� t� c�a m�t ��ng, l�y ���c m�t chi�c ch�a kh�a ")
	end
end;
