--description: �������ͻ���Ѩ����
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1)
	if (UTask_em >= 20*256+50) and (UTask_em < 20*256+53) then	
		UTask_em = UTask_em + 1
		SetTask(1,UTask_em)
		if (UTask_em == 20*256+53) then
			Talk(1,"","Tuy B�ch H� Tinh hung h�n, nh�ng sau khi b� b�n 3 l�n thu ph�c, cu�i c�ng �� ngoan ngo�n khu�t ph�c. N�n H� d� �� di�t xong, b�n c� th� tr� v� ph�c m�nh!")
			SetTask(1,20*256+80)
			Msg2Player("Ch�c m�ng b�n thu ph�c ���c m�nh h�! ")
			AddNote("� M�nh H� ��ng sau n�i, li�n t�c ba l�n ��nh b�i h� v��ng b�ch h� tinh, thu ph�c th�nh c�ng m�nh h�. ")
		else
			Msg2Player("Ng��i �� ��nh b�i b�ch h� tinh, nh�ng t�nh h� c�ng ��u ch�a ch�c �� thu ph�c ���c. ")
		end
	end
end;
