-- �㵴ɽ��Ƕ��Թ� ս��NPC ��BOSS01���嶾��ʦ����
-- by��Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 60*256+20) and (HaveItem(222) == 0) and (random(0,99) < 50) then
		AddEventItem(222)
		AddNote("B�n ��nh b�i ���c t�n ��u l�nh c�a Nh�n ��ng ph�i, l�y l�i T� ��c Chu cho Ng� ��c Gi�o ")
		Msg2Player("B�n ��nh b�i ���c t�n ��u l�nh c�a Nh�n ��ng ph�i, l�y l�i T� ��c Chu cho Ng� ��c Gi�o ")
	end
end;
