--description: ���̽�ʥ�����㱦�� ���̳̽�ʦ����
--author: yuanlan	
--date: 2003/5/20
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+70) then
		if (HaveItem(132) == 1) then
			Talk(1,"","B�o r��ng �� r�ng")
		elseif (HaveItem(102) == 1) then
			DelItem(102)
			AddEventItem(132)
--			SetTask(4, 68)
			AddNote("M� r��ng b�u, l�y ���c Thi�n Nh�n th�nh th���s�ch da d�. ")
			Msg2Player("M� r��ng b�u, l�y ���c m�t quy�n s�ch da d�. ")
		else
			Talk(1,"","Kh�ng c� ch�a kh�a, kh�ng m� ���c r��ng.")
		end
	else
		Talk(1,"","Kh�ng c� ch�a kh�a, kh�ng m� ���c r��ng.")
	end
end;
