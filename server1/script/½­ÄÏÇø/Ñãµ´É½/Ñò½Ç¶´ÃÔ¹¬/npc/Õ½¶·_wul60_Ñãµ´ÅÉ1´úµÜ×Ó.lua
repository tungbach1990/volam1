-- �㵴ɽ��Ƕ��Թ� ս��NPC 1�����ӣ��嶾��ʦ����
-- by��Dan_Deng(2003-08-05)

function OnDeath()
	UTask_wu = GetTask(10)
	if ((UTask_wu == 60*256+10) and (HaveItem(222) == 0)) then		-- �������У���δ�õ�������Ʒ
		i = GetTaskTemp(48) + random(0,2)			-- �����������0��2���ӵ�5���ɴ��BOSS
		if (i >= 5) then
			SetTask(10,60*256+20)
			SetTaskTemp(48,0)
			AddNote("Ch��ng m�n c�a Nh�n ��ng ph�i �� xu�t hi�n ")
			Msg2Player("Sau khi ng��i gi�t v� s� t�n, ch��ng m�n Nh�n ��ng ph�i cu�i c�ng �� xu�t hi�n ")
		else
			SetTaskTemp(48,i)
			Msg2Player("B�n gi�t ���c m�t t�n �� t� c�a Nh�n ��ng ph�i ")
		end
	end
end;
