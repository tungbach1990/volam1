-- ����Ƕ���ص� ս��NPC ��������������40������
-- by��Dan_Deng(2003-07-26)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+10) and (random(0,100) < 40) then				-- 40%�Ļ��ʳɹ�
		SetTask(6,40*256+20)
		AddNote("Gi�i c�u nh�ng thi�u n� b� b�t trong m�t ��o, ���c bi�t t�n �c b� �� mang nh�ng ng��i con g�i kh�c �i �i�m Th��ng s�n r�i. ")
		Msg2Player("��nh b�i tr� th� c�a t�n �c b�, gi�i c�u nh�ng thi�u n� b� b�t trong m�t ��o, ���c bi�t t�n �c b� �� mang nh�ng ng��i con g�i kh�c �i �i�m Th��ng s�n r�i. ")
	end
end;
