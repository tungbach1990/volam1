-- TimerHead.lua
-- By: Dan_Deng(2003-08-23) ��ʱ����ع���

FramePerSec = 18			-- ÿ��֡��������������
CTime = 600					-- ÿ��ʱ����600�루10���ӣ�����

function GetRestSec(i)		-- ֱ�ӷ��ؼ�ʱ��ʣ������
	return floor(GetRestTime(i) / FramePerSec)
end;

function GetRestCTime(i)			-- ��ȡ��ʱ��ʣ��ʱ�䣬����һ��ʱ��ʱ���й�ʱ��ת��
	x = floor(GetRestTime(i) / FramePerSec)
	if (x < CTime) then		-- ����һ��ʱ��
		y = x.." gi�y"
	else
		y = floor(x / CTime).."m�t gi� "
	end
	return y
end;

function GetTimerTask(i)			-- ͨ����ʱ��ID�Ž�����Ӧ����
	
end