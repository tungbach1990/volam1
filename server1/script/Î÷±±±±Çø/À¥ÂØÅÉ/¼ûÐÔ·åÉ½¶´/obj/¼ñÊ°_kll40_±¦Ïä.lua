-- ���Է�ɽ�� ���� ����40������
-- by��Dan_Deng(2003-07-30)

function main()
	UTask_kl = GetTask(9)
	if ((UTask_kl == 40*256+20) and (HaveItem(212) == 1)) then		-- Կ��Ӧʹ��ID��
		Msg2Player("B�n th� d�ngch�a kh�am� chi�c r��ng ")
		DelItem(212)
		AddEventItem(9)
		AddNote("B�n nh�n ���c Huy�t H�n Th�n Ki�m ")
		Msg2Player("B�n nh�n ���c Huy�t H�n Th�n Ki�m ")
	else
		Talk(1,"","B�o r��ng n�y �� kh�a r�i")
	end
end;
