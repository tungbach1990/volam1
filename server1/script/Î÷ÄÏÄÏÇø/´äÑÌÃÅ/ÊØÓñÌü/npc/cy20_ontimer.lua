--������20������ �������޻���ʱ�ű�
-- Update: Dan_Deng(2003-09-09)
-- Timer: 8

Include("\\Script\\Global\\TimerHead.lua")

function OnTimer()
	UTask_cy = GetTask(6)
	StopTimer()
	if (UTask_cy == 20*256+20) then		-- �ж���һ�׶ε�ʱ
		PutMessage("B�n c�m th�y ��u �c quay cu�ng, nh� v�y xem ra ��c t�nh �� b�c ph�t r�i ��. ")
		Msg2Player("B�n c�m th�y ��u �c quay cu�ng, nh� v�y xem ra ��c t�nh �� b�c ph�t r�i ��. ")
		SetTask(6, 20*256+30)
		SetTimer(3 * CTime * FramePerSec, 8)						--��ʱ����Ϊ��Сʱ��3��ʱ����
	elseif (UTask_cy == 20*256+30) then		-- �ж��ڶ��׶ε�ʱ
		PutMessage("B�n c�m th�y t� chi r� r�i, c� l� ��c t�nh �� ng�m s�u v�o. ")
		Msg2Player("B�n c�m th�y t� chi r� r�i, c� l� ��c t�nh �� ng�m s�u v�o. ")
		SetTask(6, 20*256+40)
		SetTimer(3 * CTime * FramePerSec, 8)						--��ʱ����Ϊ��Сʱ��3��ʱ����
	elseif (UTask_cy == 20*256+40) then		-- �ж������׶ε�ʱ
		PutMessage("To�n th�n b�t ��u b�t ��ng, tay ch�n kh�ng c�n ph�n �ng. ")
		Msg2Player("To�n th�n b�t ��u b�t ��ng, tay ch�n kh�ng c�n ph�n �ng. ")
		SetTask(6, 20*256+50)
		SetTimer(3 * CTime * FramePerSec, 8)						--��ʱ����Ϊ��Сʱ��3��ʱ����
	else							-- ���Ľ׶γ�ʱ��������������
		SetTask(6, 20*256+10)
		for i=1,GetItemCount(1) do DelItem(1) end
		PutMessage("Ch�t ��c Hoa ��i Man �� La �� ph�t t�n, b�n �� ch�t v� ��c ph�t ")
		Msg2Player("Ch�t ��c Hoa ��i Man �� La �� ph�t t�n, b�n �� ch�t v� ��c ph�t ")
		SetFightState(1)
		KillPlayer()
	end
end;
