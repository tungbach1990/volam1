--���ϱ��� ��˿��һ��to��˿������
--Trap ID�����ϱ��� 7
-- Update: Dan_Deng(2003-08-13)

function main(sel)
	UTask_tm = GetTask(2);
	if ((UTask_tm == 60*256+20) and (HaveItem(99) == 1)) then			--�����в�����Կ��
		DelItem(99)
		SetFightState(1)
		NewWorld(27, 1522, 3205)
		SetTask(2, 60*256+40)
	elseif (UTask_tm > 60*256+20) and (GetFaction() == "tangmen") then		-- ������һ���ı��ŵ��ӿ�����������
		SetFightState(1)
		NewWorld(27, 1522, 3205)
	else
		Talk(1,"","Kh�ng c� ch�a kh�a, b�n kh�ng th� v�o t�ng 2 Tr�c T� ��ng.")
	end
end;
