--description: �䵱�ɳ�ʦ���� �䵱ɽ����3
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),3)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","B�o r��ng: <color=Red>Th� t��ng<color> trong <color=Red>Nha m�n T��ng D��ng<color> c� ng�y ch� bi�t u�ng r��u, �c hi�p b� t�nh, l�o b� t�nh o�n gi�n, <color=Red>b�o ch�nh<color> l�n n�y, l�m sao di�t ���c?")
			Msg2Player("L� b�a tr�n b�o r��ng � Th�i T� nham vi�t: �i c�nh c�o ch� t��ng T��ng D��ng, gi�p d�n tr� �c. ")
			SetTask(17, SetByte(GetTask(17),3,2))
			AddNote("L� b�a tr�n b�o r��ng � Th�i T� nham vi�t: �i c�nh c�o ch� t��ng T��ng D��ng, gi�p d�n tr� �c. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 5) then
			Talk(1,"","B� t�nh T��ng D��ng v�n s�ng ���c d��i <color=Red>ch�nh s�ch t�n b�o<color> c�a <color=Red>Th� t��ng<color>.....")
			Msg2Player("Nh�n d�n � th�nh T��ng D��ng v�n trong c�nh d�u s�i l�a b�ng... ")
		elseif (UTask_wd60sub == 5) then
			AddEventItem(71)
			Talk(1,"","X�a b� <color=Red>ch�nh s�ch t�n b�o<color> c�a T��ng D��ng, m� B�o r��ng, l�y ���c 1 quy�n <color=Red>'Th�i Thanh Ch�n Kinh'<color>.")
			Msg2Player("Di�t xong b�o quy�n � th�nh T��ng D��ng, c� ���c 1 b� Th�i Thanh Ch�n Kinh. ")
			SetTask(17, SetByte(GetTask(17),3,10))
			AddNote("M� B�o r��ng c� ���c b� Th�i Thanh Ch�n Kinh ")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(71) == 0) then
				AddEventItem(71)
			else
				Talk(1,"","B�o r��ng �� r�ng")
			end
		end
	else
		Talk(1,"","Ch�a nh�n nhi�m v�! B�n kh�ng th� m� B�o r��ng n�y!")
	end
end;
