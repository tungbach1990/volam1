-- ����ѩ��ɽ�� ս��NPC ѩ�� ��������
-- by��Dan_Deng(2003-07-30)

function OnDeath()
	UTask_kl = GetTask(9);
	if (UTask_kl == 30*256+10) and (GetItemCount("D� Minh Ch�u") < 3) and (random(0,99) < 60) then
			AddEventItem(111) 
			Msg2Player("L�y ���c D� Minh ch�u ")
			AddNote("T�m th�y D� Minh ch�u ")
	end
end;
