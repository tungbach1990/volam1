--description: ���ų�ʦ���� ��˿�������㱦��
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2)
	if (UTask_tm == 60*256+60) then
		if (HaveItem(49) == 0) then 
			Say("Trong r��ng c� 1 thanh ki�m b� s�t ", 2, "C�n /accept", "Kh�ng c�n /refuse")
		else
			Talk(1,"","B�o r��ng �� r�ng")
		end
	elseif (UTask_tm == 60*256+70) then 
		Talk(1,"","B�n �� m� 1 r��ng kh�c n�n kh�ng th� m� l�i r��ng n�y!")
	else
		Talk(1,"","B�n th� m� r��ng b�u, nh�ng h�nh nh� n� �� b� r� s�t!")
	end
end;

function accept()
	AddEventItem(49)
	Msg2Player("�o�t ���c Th�t Tinh Tuy�t M�nh Ki�m ")
--	SetTask(2, 67)
	AddNote("T�i t�ng th� 3 c�a Tr�c T� ��ng c� 2 r��ng b�u ��nh v� 1 r��ng b�u, s� ���c Th�t Tinh Tuy�t M�nh Ki�m. ")
end;

function refuse()
end;
