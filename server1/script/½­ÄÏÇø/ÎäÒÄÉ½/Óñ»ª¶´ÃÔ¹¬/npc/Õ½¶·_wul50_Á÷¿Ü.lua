-- ����ɽ�񻪶��Թ� ս��NPC ����01���嶾50������
-- by��Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 50*256+10) then
		SetTask(10,50*256+20)
		AddNote("L�i �i l�n n�i La Ti�u �� ��nh b�i b�n c��ng ��o, l�y l�i Ng�c San H� ")
		Msg2Player("B�t ���c t�n ��u l�nh, m�i bi�t ���c l� Ng�c San H� �� b� b�n c��ng ��o V� Di s�n c��p �i, ch�ng v� b�n c��p � La Ti�u c� quan h� v�i nhau ")
	end
end;
