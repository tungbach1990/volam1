-- ��ͼ��Ʒ �����º����� ʯͷ1 ����50������
-- by��Dan_Deng(2003-08-04)

function main()
	UTask_sl = GetTask(7)
	if (UTask_sl == 50*256+30) and (HaveItem(28) == 0) then		--����50��������
		i = GetTaskTemp(47)
		if (i == 2) then
			Talk(1,"","T�ng �� d�n ���c x� d�ch, b�n h�nh th�y ph�a d��i h�nh nh� c� 1 quy�n s�ch")
			AddEventItem(28)
			AddNote("L�y ���c D�ch C�n Kinh. ")
			Msg2Player("L�y ���c D�ch C�n Kinh. ")
			SetTaskTemp(47,0)			--��λ��ʱ��������һ������...
		elseif (i == 1) then
			Talk(1,"","B�n th� d�ng s�c ��y t�ng ��, h�h nh� n� c� ch�t lay chuy�n")
			SetTaskTemp(47,2)
		else
			Talk(1,"","B�n th� d�ng s�c ��y t�ng ��, nh�ng n� c� n�m tr� tr� ")
			SetTaskTemp(47,1)
		end
	else
		Talk(1,"","B�n th� d�ng s�c ��y t�ng ��, nh�ng n� c� n�m tr� tr� ")
	end
end;
