--description: ��ԭ���� ���̽�ʥ��1to���̽�ʥ��2 ���̳̽�ʦ����
--author: yuanlan	
--date: 2003/5/20
--Trap ID����ԭ���� 7
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4)
	UTask_tr60tmp = GetTask(28)
	if (UTask_tr60tmp == 15) then		-- bin: 1000 + 0100 + 0010 + 0001
		SetFightState(1)
		NewWorld(52, 1729, 3225)
		SetTask(4, 60*256+70)
		SetTask(28,0)	-- ���ӱ�����λ�ͷ�
--		AddNote("�õ��ľ�ھ�������ʥ���ڶ��㡣")
	elseif (UTask_tr >= 60*256+70) and (GetFaction() == "tianren") then
		SetFightState(1)
		NewWorld(52, 1729, 3225)
	else
		Talk(1,"","Ch�a l�y ���c <color=Red>b�n c�u kh�u quy�t<color>, kh�ng th� v�o t�ng hai c�a Th�nh ��ng.")
		SetPos(1767, 3186)						--�����߳�Trap��
		AddNote("Mu�n v�o t�ng hai, ph�i l�y ���c b�n c�u kh�u quy�t. ")
	end	
end;
