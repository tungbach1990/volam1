--description: ��ţɽ ���Ķ��Թ����ˡ��䵱50������
--author: yuanlan	
--date: 2003/5/16
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5)
	if (UTask_wd == 50*256+20) and (random(0,99) < 33) then
		SetTask(5, 50*256+50)
		Earn(10000)
		Msg2Player("��nh b�i t�n ��u m�c th� ph� Thi�t C�c, l�y ���c 1 v�n l��ng b�n ch�ng c��p ���c. ")
		AddNote("T�i Thi�n T�m ��ng Ph�c Ng�u s�n, ��nh b�i t�n ��u m�c th� ph� Thi�t C�c, l�y ���c 1 v�n l��ng. ")
	end
end;
