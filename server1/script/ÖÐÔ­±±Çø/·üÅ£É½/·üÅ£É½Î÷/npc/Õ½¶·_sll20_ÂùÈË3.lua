-- ������� ս��NPC ����3 ����20������
-- by��Dan_Deng(2003-08-01)
--�����˵Ĺ����в����˳�������Ҫ���´����

function OnDeath()
	UTask_sl = GetTask(7);
	if (UTask_sl >= 20*256+64) and (UTask_sl < 20*256+128) and (GetBit(UTask_sl,3) == 0) then			-- ����������һֻδ���
		UTask_sl = SetBit(UTask_sl,3,1)
		if (UTask_sl == 20*256+64+31) then		--�����(bin(10000 + 01000 + 00100 + 00010 + 00001))
			SetTask(7,20*256+128)
			AddNote("N�m g� ng� ng��c b� b�n gi�o hu�n �� t�m ph�c kh�u ph�c, h�a t� nay tu t�m s�a t�nh, kh�ng d�m l�ng h�nh n�a. ")
			Msg2Player("N�m g� ng� ng��c b� b�n gi�o hu�n �� t�m ph�c kh�u ph�c, h�a t� nay tu t�m s�a t�nh, kh�ng d�m l�ng h�nh n�a. ")
		else
			Msg2Player("B�n ��nh b�i m�t g� ng� ng��c. ")
			SetTask(7,UTask_sl)
		end
	end
end;
