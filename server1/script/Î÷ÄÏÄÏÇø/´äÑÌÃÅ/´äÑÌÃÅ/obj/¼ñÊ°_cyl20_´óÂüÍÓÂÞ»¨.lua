-- ������Ʒ �������޻� ����20������
-- by��Dan_Deng(2003-07-26)

Include("\\Script\\Global\\TimerHead.lua")

function main()
	UTask_cy = GetTask(6)
	if (GetSeries() == 2) and (GetFaction() == "cuiyan") and (UTask_cy >= 20*256+10) and (UTask_cy < 30*256) then		--����20�������в��ܼ�˵���
		i = GetTimerId()
		if (i ~= 0) and (i ~= 8) then		-- ���м�ʱ����������
			Talk(1,"","Ng��i �ang mang nhi�m v� c�p b�ch nh� th�, m� c�n ch�y lung tung �?")
			return
		end
		SetPropState()
		AddEventItem(1)
		Msg2Player("H�i m�t b�ng hoa ��i Man �� La. ")
		if (i == 0) then									-- ��δ�ж��������ж�
			SetTimer(3 * CTime * FramePerSec, 8)									--��ʱ����Ϊ��Сʱ��3��ʱ����
			SetTask(6,20*256+20)				-- ������Ϊ�ж���һ�׶�
--			PutMessage("��е�����һ�����ԣ��Ѿ��ж��ˡ�")
			Msg2Player("B�n c�m th�y tay b� t� li�t, �� tr�ng ��c r�I. ")
		end
	else
		Msg2Player("B�n ��a tay h�i m�t ��a hoa ��i Man �� La ")
		Msg2Player("V�a s� v�o hoa, b�n c�m th�y tay m�nh b� t� li�t, h�nh nh� hoa n�y c� ��c, b�n li�n r�t tay l�i. ")
	end
end;
