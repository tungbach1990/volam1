-- ��������������Թ� ս��NPC ���� 30������
-- by��Dan_Deng(2003-08-01)

function OnDeath()
	UTask_sl = GetTask(7)
	if (UTask_sl == 30*256+20) and (HaveItem(27) == 0) and (random(0,99) < 40) then
		AddEventItem(27)
		Msg2Player("Mang v� Thuy�n nh��c ba la m�t �a t�m kinh ")
		AddNote("Mang v� Thuy�n nh��c ba la m�t �a t�m kinh ")
	end
end;
