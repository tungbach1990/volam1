--description: ����ɽ ��ˮ������1������20������
--author: yuanlan	
--date: 2003/4/25
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3)
	if (UTask_tw == 20*256+50) then
		UTask_twtmp20 = SetBit(GetTaskTemp(10),1,1)
		SetTaskTemp(10,UTask_twtmp20)
		if (UTask_twtmp20 == 7) then		-- bin: 100 + 010
			Msg2Player("��nh b�i th� ph�, d�n ch�ng trong th�n ph� c�n t�ng m�t l� c� g�m �� t� �n. ")
			AddEventItem(92) 
--			SetTask(3, 28)
			AddNote("T�i B�ch Th�y ��ng V� L�ng s�n, ��nh b�i 3 t�n c�m ��u b�ng th� ph� m�o nh�n Thi�n V��ng bang, ���c d�n ch�ng ph� c�n t�ng m�t l� c� g�m. ")
		end
	end
end;
