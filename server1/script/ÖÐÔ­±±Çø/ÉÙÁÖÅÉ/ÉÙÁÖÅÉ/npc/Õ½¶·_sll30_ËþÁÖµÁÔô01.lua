-- �����Թ� ս��NPC ���� 30������
-- by��Dan_Deng(2003-08-01)

function OnDeath()
	UTask_sl = GetTask(7);
	if (UTask_sl == 30*256+10) and (random(0,99) < 50) then
		SetTask(7,30*256+20)
		Msg2Player("Th� ra k� h�nh tung b� m�t n�y l� tay ch�n c�a ng��i Kim, ��ng ��ng c�a ch�ng �� l�y c�p B�t Nh� Ba La M�t �a T�m Kinh, ch�y ��n Kim Quang ��ng ph�a t�y B�c Ki�m C�c. ")
		AddNote("Ng��i h�nh tung b� m�t � Th�p L�m l� tay ch�n c�a ng��i Kim, ��ng ��ng c�a ch�ng �� l�y c�p B�t Nh� Ba La M�t �a T�m Kinh, ch�y ��n Kim Quang ��ng ph�a T�y B�c Ki�m C�c. ")
	end
end;
