-- ������ ս�� Ұ�� ��������Ұ����
-- By��Dan_Deng(2003-09-17)

function OnDeath()
	UTask_world27 = GetTask(27)
	if (UTask_world27 == 5) and (random(0,99) < 80) then
		AddEventItem(228)
		if (GetItemCount(228) >= 3) then
			Msg2Player("Khi n�o ng��i l�y ���c 3 mi�ng th�t heo r�ng th� m�i c� th� �i ti�p ")
			AddNote("Khi n�o ng��i l�y ���c 3 mi�ng th�t heo r�ng th� m�i c� th� �i ti�p ")
		else
			Msg2Player("Gi�t ���c m�t con heo r�ng th� b�n l�y ���c m�t mi�ng th�t ")
		end
	end
end;
