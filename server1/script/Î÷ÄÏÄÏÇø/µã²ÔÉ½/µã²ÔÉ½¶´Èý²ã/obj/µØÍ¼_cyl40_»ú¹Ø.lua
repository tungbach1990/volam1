-- ���ɽ��Զ� ·��NPC ���أ�������40������
-- by��Dan_Deng(2003-07-26)

function main()
	UTask_cy = GetTask(6)
	if (UTask_cy == 40*256+20) then
		if (HaveItem(197) == 1) and (HaveItem(196) == 1) and (HaveItem(198) == 1) then		--����40��������Կ����ȫ
			DelItem(197)
			DelItem(196)
			DelItem(198)
			SetTask(6,40*256+30)
			AddNote("��nh b�i tr� th� c�a t�n �c b�, l�y ba ch�a kh�a m� c�a ba ph�ng t�i c�u nh�ng thi�u n� b� b�t kh�c. ")
			Msg2Player("��nh b�i tr� th� c�a t�n �c b�, l�y ba ch�a kh�a m� c�a ba ph�ng t�i c�u nh�ng thi�u n� b� b�t kh�c. ")
		else
			Msg2Player("B�n t�m ra c� quan ph�ng t�i giam c�c thi�u n�, nh�ng c�n c� 3 chi�c ch�a kh�a m�i m� ���c c� quan n�y. ")
		end
	else
		Msg2Player("� ��y c� m�t c� quan nh�ng kh�ng bi�t d�ng l�m g�. ")
	end
end;
