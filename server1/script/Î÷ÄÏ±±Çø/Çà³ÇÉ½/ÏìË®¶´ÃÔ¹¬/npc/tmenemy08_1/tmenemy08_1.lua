--description: ����50������ ���ɽ��ˮ���ƺ�
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	UTask_tm = GetTask(2)
	if (UTask_tm == 50*256+60) then
		Talk(1,"","H�! D� ta �� th�n b�i danh li�t, c� ��nh b�i ta th� ng��i c�ng ��ng h�ng l�y ���c '�m kh� ph�'! Ta �� gi�u n� trong s�n ��ng r�i, c� ��i ng��i c�ng ��ng mong t�m ���c!")
		SetTask(2, 50*256+80)
		Msg2Player("��nh b�i ���ng H�a t�i ��ng H��ng Th�y Thanh Th�nh s�n, bi�t ���c '�m kh� ph�' ���c c�t gi�u trong s�n ��ng ")
		AddNote("��nh b�i ���ng H�a t�i ��ng H��ng Th�y Thanh Th�nh s�n, bi�t ���c '�m kh� ph�' ���c c�t gi�u trong s�n ��ng ")
	end
end;
