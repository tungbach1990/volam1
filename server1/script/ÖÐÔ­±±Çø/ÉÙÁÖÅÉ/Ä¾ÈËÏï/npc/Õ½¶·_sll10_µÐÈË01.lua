-- ����ľ���� ս��NPC ���� ������10������ȭ����������
-- by��Dan_Deng(2003-08-01)

function OnDeath()
	UTask_sl = GetTask(7);
	if (UTask_sl == 10*256+10) and (HaveItem(26) == 0) and (random(0,99) < 80) then
		AddEventItem(26) 
		Msg2Player("L�y ���c Kim Li�n Hoa. ")
		AddNote("T�m th�y Kim Li�n Hoa. ")
	elseif (GetTask(75) == 10) and (GetTask(54) == 10) and (HaveItem(26) == 0) and (random(0,99) < 40) then		-- ȭ���������񣬰����ʵõ�
		AddEventItem(26)
		Msg2Player("L�y ���c Kim Li�n Hoa, c� th� quay l�i g�p Th�i ��i th�c. ")
	end
end;
