--description: �����������ص�����
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),3)
	if (UTask_wd == 60*256+20) and (UTask_wd60sub == 2) then
		Talk(2, "", "C�u quan! Nh� l�y, t� nay ��ng bao gi� h� hi�p d�n l�nh. N�u kh�ng, anh h�ng trong thi�n h� ��u kh�ng tha cho ng��i!", "T��ng th� T��ng D��ng: Kh�ng d�m! Ta s� l�m!")
		Msg2Player("Gi�o hu�n th�nh c�ng T��ng D�ong Th� t��ng. ")
		SetTask(17, SetByte(GetTask(17),3,5))
		AddNote("Ti�n v�o ���ng h�m � nha m�n, ��nh b�i T��ng D�ong Th� t��ng, ti�u di�t ch� �� cai tr� b�o t�n � T��ng D��ng ")
	end
end;
