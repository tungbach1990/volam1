-- ؤ�� ս��NPC ��Զ�� 20������
-- by��Dan_Deng(2003-07-28)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 20*256+10) then			--����20������
		Talk(2,"","Ta thay m�t anh em trong bang gi�o hu�n ng��i. Mu�n ng��i ph�i th��ng xuy�n n�m ���c m�i v� c�a s� gi�o hu�n, n�u nh� ng��i v�n c�n ti�p t�c l�m c�n, ta s� kh�ng quan t�m ��n chuy�n ng��i l� th�n th�ch c�a ai, ��nh kh�ng th��ng ti�c!","Ta s� r�i! Sau n�y kh�ng d�m n�a!")
		SetTask(8,20*256+20)
		AddNote("�� gi�o hu�n cho M�nh Vi�n T�i m�t tr�n nh� ��i ")
		Msg2Player("�� gi�o hu�n cho M�nh Vi�n T�i m�t tr�n nh� ��i ")
	end
end;
