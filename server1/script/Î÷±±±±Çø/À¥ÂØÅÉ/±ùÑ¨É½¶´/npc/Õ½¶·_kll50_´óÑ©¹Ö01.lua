-- ��Ѩ�Թ� ս��NPC ??01������50������
-- by��Dan_Deng(2003-07-31)

function OnDeath()
	UTask_kl = GetTask(9)
	x = 1
	if (UTask_kl >= 50*256+64) and (UTask_kl < 60*256) and (GetBit(UTask_kl,x) == 0) then		--50����������δɱ����ֻѩ��
		i = SetBit(UTask_kl,x,1)
		if (i == 50*256+64+31) then		-- ���ϳ�Կ������
			SetTask(9,50*256+127)
			AddNote("Tr�n ���ng �i B�n gi�t ���c v� s� Tuy�t qu�i, cu�i c�ng t�m ���c ch� tr� �n c�a qu�i nh�n ")
			Msg2Player("Tr�n ���ng �i B�n gi�t ���c v� s� Tuy�t qu�i, cu�i c�ng t�m ���c ch� tr� �n c�a qu�i nh�n ")
		else
			SetTask(9,i)		-- ����ͱ������
			Msg2Player("B�n ti�n s�u v�o trong hang ��ng, tr�n ���ng �i gi�t ch�t m�t con Tuy�t qu�i ")
		end
	end
end;
