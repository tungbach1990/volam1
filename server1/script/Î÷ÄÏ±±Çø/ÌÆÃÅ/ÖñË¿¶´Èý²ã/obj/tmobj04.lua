--description: ���ų�ʦ���� ��˿�������㱦��
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function main()

	UTask_tm = GetTask(2)
	if (UTask_tm == 60*256+60) then
		if (HaveItem(49) == 0) then 
			Say("1 v�n l��ng.", 2, "C�n /accept", "Kh�ng c�n /refuse")
		else
			Talk(1,"","B�n �� m� 1 r��ng kh�c n�n kh�ng th� m� l�i r��ng n�y!")
		end
	elseif (UTask_tm == 60*256+70) then
		Talk(1,"","B�o r��ng �� r�ng")
	else
		Talk(1,"","B�n th� m� r��ng b�u, nh�ng h�nh nh� n� �� b� r� s�t!")
	end
end;

function accept()
	Earn(10000)
	SetTask(2, 60*256+70)
	AddNote("L�y ���c m�t v�n l��ng trong r��ng b�u t�i t�ng th� 3 c�a Tr�c T� ��ng. ")
	Msg2Player("Nh�n ���c m�t v�n l��ng b�c ")
end;

function refuse()
end;
