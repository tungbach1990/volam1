--description: �䵱��40������ ��ţɽ���ڶ���ֻ����5���䵱40������
--author: yuanlan	
--date: 2003/5/15
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	if (GetTask(5) == 40*256+20) then
		UTask_wd40tmp = SetBit(GetTaskTemp(16),5,1)
		if (UTask_wd40tmp == 31) then
			SetTask(5,40*256+40)
			AddNote("Thu ph�c ���c n�m con  B�ch Ng�c H� c�a Nhu�n N��ng. ")
			Msg2Player("Thu ph�c ���c n�m con  B�ch Ng�c H� c�a Nhu�n N��ng. ")
		else
			SetTaskTemp(16, UTask_wd40tmp)
		end
	end
end;
