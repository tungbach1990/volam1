-- ���ɽ ս��NPC ��� ؤ��30������
-- by��Dan_Deng(2003-07-28)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 30*256+20) then			--30��������
		SetTask(8,30*256+30)
		AddNote("��nh b�i qu�n Kim mai ph�c, c�c �� t� C�i Bang v�n m�t t�ch ��u b� qu�n Kim mai ph�c b�t �i. ")
		Msg2Player("��nh b�i qu�n Kim mai ph�c, c�c �� t� C�i Bang v�n m�t t�ch ��u b� qu�n Kim mai ph�c b�t �i. ")
	end
end;
