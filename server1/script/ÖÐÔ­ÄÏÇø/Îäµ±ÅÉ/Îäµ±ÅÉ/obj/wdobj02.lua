--description: �䵱�ɳ�ʦ���� �䵱ɽ����2
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function main()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),2)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 0) then
			Talk(1,"","B�o r��ng: G�n ��y <color=Red>binh kh�<color> c�a T�ng qu�n kh�ng ��, <color=Red>th��ng vong<color> tr�m tr�ng, h�y ��n <color=Red>T��ng D��ng<color> t�m <color=Red>th� r�n <color> gi�p ��.")
			Msg2Player("G�n ��y kh� gi�i ch�ng Kim kh�ng ��, <color=Red>binh s� th��ng vong tr�m tr�ng<color>, c�n ��n th�nh T��ng D��ng nh� Th� r�n gi�p �� gi�i quy�t. ")
			SetTask(17, SetByte(GetTask(17),2,2))
			AddNote("L� b�a tr�n b�o r��ng � Th�i T� nham vi�t: ��n th�nh T��ng D��ng t�m Th� r�n t�m c�ch gi�i quy�t v�n �� s�c m�nh ch�ng qu�n Kim kh�ng ��. ")
		elseif (UTask_wd60sub > 0) and (UTask_wd60sub < 8) then
			Talk(1,"","B�o r��ng: Do thi�u <color=Red>kh� gi�i<color>, T�ng qu�n th��ng t�n tr�m tr�ng� ")
			Msg2Player("Do s�c m�nh kh�ng ��, t�o n�n th��ng vong kh�ng tr�nh kh�i khi ch�ng qu�n Kim... ")
		elseif (UTask_wd60sub == 8) then
			AddEventItem(70)
			Say("C� binh kh� k�p th�i, s�c chi�n ��u c�a quan binh ti�n tuy�n t�ng m�nh! M� B�o r��ng, l�y ���c 1 quy�n <color=Red>'Th��ng Thanh Ch�n Kinh'<color>.", 0)
			Msg2Player("C�n ph�i b� sung binh kh� g�p, s�c m�nh chi�n ��u c�a quan binh nh� Kim r�t m�nh. M� B�o r��ng, c� ���c b� Th��ng Thanh Ch�n Kinh. ")
			SetTask(17, SetByte(GetTask(17),2,10))
			AddNote("M� B�o r��ng, c� ���c b� Th��ng Thanh Ch�n Kinh. ")
		elseif (UTask_wd60sub == 10) then
			if (HaveItem(70) == 0) then
				AddEventItem(70)
			else
				Talk(1,"","B�o r��ng �� r�ng")
			end
		end
	else
		Talk(1,"","Ch�a nh�n nhi�m v�! B�n kh�ng th� m� B�o r��ng n�y!")
	end
end;
