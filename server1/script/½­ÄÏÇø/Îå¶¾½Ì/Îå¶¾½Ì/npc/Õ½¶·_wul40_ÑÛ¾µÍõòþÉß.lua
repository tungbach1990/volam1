-- �嶾����Ѫ̶�Թ� ս��NPC �۾�������01���嶾40������
-- by��Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if (UTask_wu == 40*256+10) and (HaveItem(143) == 0) and (random(0,99) < 60) then		-- �������У������ʴ����
		if (HaveItem(142) == 1) then
			if (random(0,99) < 60) then
				AddEventItem(143)
				DelItem(142)
				AddNote("B�t l�y Nh�n K�nh v��ng M�ng X� ")
				Msg2Player("B�n l�i d�ng X� h��ng �� kh�ng ch� n�, v� cu�i c�ng c�ng �� b�t ���c ")
			else
				Msg2Player("B�n th� d�ng X� h��ng �� b�t Nh�n K�nh v��ng M�ng X�, v� �� kh�ng c�n th�n �� n� ch�y tho�t ")
			end
		else
			Msg2Player("K�ch ��c c�a Nh�n K�nh v��ng M�ng X� kh�ng c� th� n�o s�nh ���c. B�n kh�ng c� th� X� h��ng �� kh�c ch� n� th� v� ph��ng b�t ���c n� ")
		end
	end
end;
