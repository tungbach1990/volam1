-- ���Է�ɽ���Թ� ս��NPC ɽ��СͷĿ ����40������
-- by��Dan_Deng(2003-07-30)

function OnDeath()
	UTask_kl = GetTask(9);
	if (UTask_kl == 40*256+10) then			--��������
		SetTask(9,40*256+20)
		Msg2Player("��nh b�i t�n s�n t�c ti�u ��u m�c, th� ra Huy�t H�n Th�n Ki�m �� b� th� l�nh c�a t�n ti�u s�n t�c kia c�t gi�u ")
		AddNote("��nh b�i t�n s�n t�c ti�u ��u m�c, th� ra Huy�t H�n Th�n Ki�m �� b� th� l�nh c�a t�n ti�u s�n t�c kia c�t gi�u ")
	end
end;
