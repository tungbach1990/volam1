--���ϱ��� ��˿������to��˿������
--Trap ID�����ϱ��� 9
-- Update: Dan_Deng(2003-08-13)

function main(sel)
	UTask_tm = GetTask(2)
	if (UTask_tm >= 60*256+60) and (GetFaction() == "tangmen") then		-- ������һ���ı��ŵ��ӿ�����������
		SetFightState(1)
		NewWorld(28, 1551, 3192)
	elseif ((UTask_tm == 60*256+40) and (HaveItem(100) == 1)) then			--�����в�����Կ��
		DelItem(100)
		SetFightState(1)
		NewWorld(28, 1551, 3192)
		SetTask(2, 60*256+60)
	else
		Talk(1,"","Kh�ng c� ch�a kh�a, b�n kh�ng th� v�o T�ng 3 Tr�c T� ��ng.")
	end
end;
