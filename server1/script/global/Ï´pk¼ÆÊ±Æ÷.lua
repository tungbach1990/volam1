-- ϴPK��ʱ��.lua
-- Update: Dan_Deng(2003-11-27)
-- Timer: 9

Include("\\Script\\Global\\TimerHead.lua")

function OnTimer()
	local Uworld96	= GetTask(96)
	local PK_value	= GetPK();
	local nMapId	= GetWorldPos();
	StopTimer();
	
	if (nMapId == 208) then			-- ֻ�����η��в������PKֵ
		if (PK_value > 1) then		-- ��δϴ��PKֵ
			Msg2Player("Qua t�nh t�m h�i c�i, t�i c�a b�n �� gi�m nh� ")
			SetPK(PK_value - 1)
			SetTask(96,100 + (PK_value - 1));
			SetTimer(12 * CTime * FramePerSec, 9)						--���¿�ʼ��ʱ��12��ʱ��==120���ӣ�
		else							-- ϴ��PK��
			Msg2Player("Sau khi xem x�t k� h�nh vi ph�m t�i, cu�i c�ng b�n c�ng �� r�a s�ch t�i c�a m�nh. ")
			SetPK(0)
			SetTask(96,100)
		end
	end
end;
