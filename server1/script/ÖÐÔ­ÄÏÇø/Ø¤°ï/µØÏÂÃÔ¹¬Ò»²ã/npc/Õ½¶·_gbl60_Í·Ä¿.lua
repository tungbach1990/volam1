-- ؤ���ض� ս��NPC01 ��ʦ���񣨶�Ӧ����1��
-- by��Dan_Deng(2003-07-29)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 60*256+10) and (HaveItem(203) == 0) then			--����������û��Կ��
		AddEventItem(203)
		AddNote("T�i t�ng th� nh�t c�a m�t ��ng, l�y ���c m�t chi�c ch�a kh�a ")
		Msg2Player("T�i t�ng th� nh�t c�a m�t ��ng, l�y ���c m�t chi�c ch�a kh�a ")
	end
end;
