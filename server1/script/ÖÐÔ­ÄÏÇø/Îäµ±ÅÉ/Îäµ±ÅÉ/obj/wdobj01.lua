--description: �䵱�ɳ�ʦ���� �䵱ɽ����1
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),1)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","B�o r��ng: Hi�n nay ti�n tuy�n phe T�ng <color=Red>b�nh d�ch h�ch<color> k�o d�i, h�y ��n <color=Red>T��ng D��ng<color> t�m <color=Red>Ch� d��c �i�m <color> t�m c�ch gu�p ��")
			Msg2Player("G�n ��y b�nh d�ch h�ch lan tr�n trong doanh tr�i qu�n T�ng, c�n ph�i ��n th�nh T��ng D��ng t�m �ng ch� ti�m thu�c nh� gi�p �� gi�i quy�t. ")
			SetTask(17, SetByte(GetTask(17),1,2))
			AddNote("L� b�a tr�n b�o r��ng � Th�i T� nham vi�t:: ��n th�nh T��ng D��ng t�m ch� ti�m thu�c t�m c�ch ng�n ch�n b�nh d�ch h�ch lan tr�n trong doanh tr�i qu�n T�ng. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 8) then
			Talk(1,"","B�o r��ng: <color=Red>B�nh d�ch h�ch<color> v�n �ang k�o d�i.....")
			Msg2Player("B�nh d�ch h�ch v�n �ang lan tr�n... ")
		elseif (UTask_wd60sub == 8) then
			AddEventItem(69)
			Say("<color=Red>B�nh d�ch h�ch<color> �� tr�, m� b�o r��ng, ph�t hi�n 1 quy�n <color=Red>'Ng�c Thanh Ch�n Kinh'<color>.", 0)
			Msg2Player("B�nh d�ch h�ch ���c ti�u di�t, c� b� Ng�c Thanh Ch�n Kinh. ")
			SetTask(17, SetByte(GetTask(17),1,10))
			AddNote("M� B�o r��ng c� Ng�c Thanh Ch�n Kinh. ")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(69) == 0) then
				AddEventItem(69)
			else
				Talk(1,"","B�o r��ng �� r�ng")
			end
		end
	else
		Talk(1,"","Ch�a nh�n nhi�m v�! B�n kh�ng th� m� B�o r��ng n�y!")
	end
end;
