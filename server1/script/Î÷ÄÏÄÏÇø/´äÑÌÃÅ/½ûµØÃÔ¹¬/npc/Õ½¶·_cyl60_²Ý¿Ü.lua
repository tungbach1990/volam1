-- �����Ž����Թ� ս��NPC �������������ų�ʦ����
-- by��Dan_Deng(2003-07-27)

function OnDeath()
	UTask_cy = GetTask(6)
	if (UTask_cy == 60*256+10) and (HaveItem(237) == 0) and (random(1,100) < 20) then		-- 20%����
		AddEventItem(237)
		Msg2Player("Nh�n ���c chi�c kh�n th�u h�nh vu�ng. ")
		AddNote("Nh�n ���c chi�c kh�n th�u. ")
	end
end;
