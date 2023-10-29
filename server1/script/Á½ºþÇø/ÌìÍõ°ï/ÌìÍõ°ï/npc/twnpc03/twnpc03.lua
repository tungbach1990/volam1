--description: ��������ʹ���������20������
--author: yuanlan	
--date: 2003/4/25
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-16)
-- by xiaoyang (2004\4\20)

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta ��n t�m �ng c� vi�c kh�c", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end

function old_main()
	UTask_tw = GetTask(3)
	Uworld121 = GetTask(121)
--	if (UTask_tw == 70*256) and (Uworld121 == 245) then		-- ��������90������������������ģ�ֱ�Ӹ�����
--		Talk(1,"","�����С�ֵܹ�ȻӢ�۳��ڣ���������������һ�����������ж��ܷ�����")
--  	AddMagic("����ն")
--		AddMagic("׷���")
--		AddMagic("׷������")
--   	Msg2Player("���������������ն��׷�����׷������")
--   	SetTask(121,255)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 20*256+50) and (HaveItem(92) == 1 ) then	-- ֻ�����ߣ������߶�ʧֻҪ�ش����һ�����˾Ϳ����´����
			L20_prise()
		elseif (UTask_tw == 20*256) and (GetLevel() >= 20) then
			Say("Th�m t� h�i b�o: g�n ��y tr�n <color=Red>V� L�ng s�n<color> xu�t hi�n m�t nh�m <color=Red>Th� Ph�<color>,chuy�n gi� m�o c�c danh ngh�a c�a Thi�n V��ng bang �� c��p c�a gi�t ng��i, ng��i d�n n�i ��y v� c�ng o�n gi�n. S� vi�c n�y c� li�n quan ��n danh d� c�a b�n m�n. Ng��ic� ��ng � �i ��n �� x�m nh�p v�o s�o huy�t b�n th� ph� kh�ng?", 2, "Thu�c h� t�n l�c thi h�nh /L20_get_yes", "Thu�c h� v� c�ng th�p k�m, s� r�ng g�nh kh�ng ���c tr�ng tr�ch n�y /L20_get_no")
		elseif (UTask_tw < 20*256) then								--��δ��20������
			Talk(1,"","Thi�n V��ng bang ch�ng ta danh ti�ng l�y l�ng, n�n th��ng c� b�n x�u gi� m�o�� t� b�n bang �� l�m vi�c x�u")
		elseif (UTask_tw > 20*256) and (UTask_tw < 20*256+80) then					--�Ѿ��ӵ�20��������δ���
			Talk(1,"","B�n th� ph� �� th��ng xu�t hi�n � <color=Red>B�ch Th�y ��ng<color> t�i <color=Red>ph�a ��ng V� L�ng s�n<color>.")
		else					--�Ѿ����20��������δ��ʦ��ȱʡ�Ի���
			Talk(1,"","Thi�n V��ng Bang ch�ng ta v� l�o b� t�nh g�n b� v�i nhau nh� m�i v�i r�ng, n�n ng��ic�n ph�i nh� r�ng tuy�t ��i kh�ng ���c t� ti�n d�ng v� c�ng �� �p b�c l�o b� t�nh, nh� ch�a?")
		end
	elseif (Uworld121 == 20) and (HaveItem(10) == 1) then
		Talk(7,"Uworld121_yanghu","D��ng H�u S�.","C�c h� d��ng nh� c� g� kh� n�i, ch�ng hay �� x�y ra vi�c g�?","�!... � ��y c� m�t b�i t�c c�a T��ng Vi ti�n t�, ng��i h�y nh�n �i!"," H�! M� Tuy�t? C� ta l�m sao?","Y�n t�m! H� c� n��ng ch� h�i ti�u t�y m�t ch�t!","Ta hi�u r�i!","Ti�n T� nh� ta chuy�n l�i cho ng��i r�ng: tr��c th�ng 7 n�u ng��i kh�ng ��n Thu� Y�n g�p m�t c� ta, hai ng��i t� ��y v� sau s� ch�ng g�p m�t nhau n�a ��u")
	elseif(Uworld121 == 50 ) then
		Talk(8,"Uworld121_yanghu2","L�m sao? ","�i. T��ng Vi Ti�n T� nh�t ��nh s� kh�ng h�i t�m chuy�n � ","D��ng H�:... ","Nh�ng m� c� �y �� b�o ta �i t�m Kh�u Anh, anh ta �� n�i t��ng t�n cho ta bi�t v� k� ho�ch c�a C�n L�n ph�i ","M� Tuy�t, n�ng qu� nhi�n �� v� ta m� �i c�u xin t�n gian x�o Kh�u Anh, ta �� ph� n�ng r�i. ","th�t kh�ng g� c� th� b� ��p ch� tr�ng �� sao? ","��ng n�i h�m qua �� c�ng nhau h�t ca vui v�, h�m nay ta l�i c� u�ng th�m r��u n�ng, u�ng cho say s�a. Chuy�n t�c xanh hay b�c l� chuy�n c�a n�m m��i n�m. R�t ki�m ch�m l�n tr�i, m�i chuy�n d� nh� tr� b�n tay. ","Ng��i ch�i:. ")
	else
		Talk(1,"","Nh�n t�m t�i giang h�, ch� c� ho�i b�o l�n, b�t k� � n�i n�o c�ng gi� th�n m�nh l� thanh thi�n b�ch nh�t, n�u nh� trong l�ng m� c�n ngh� g� x�u xa b�n th�u th� b�t k� �i ��n ��u c�ng b� ng��i ��i ph� b�ng!")
	end
end;

function L20_get_yes()
	Talk(1,"","B�n th� ph� �� th��ng xu�t hi�n � <color=Red>B�ch Th�y ��ng<color> t�i <color=Red>ph�a ��ng V� L�ng s�n<color>.")
	SetTask(3, 20*256+50)
	AddNote("T�i c�a v�o �i�n ��ng Thi�n c�a Thi�n V��ng bang g�p D��ng H� (218, 198) , nh�n <color=red>nhi�m v� B�ch Th�y ��ng<color>, ��n ��ng B�ch Thu� n�i V� L�ng di�t th� ph�. ")
	Msg2Player("T�i c�a v�o �i�n ��ng Thi�n c�a Thi�n V��ng bang g�p D��ng H� nh�n nhi�m v� �i ��n ��ng B�ch Thu� n�i V� L�ng di�t th� ph� ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(1,"","Ng��i��n th�n ��c m� x�ng v�o s�o huy�t c�a b�n th� ph� v� d�n tr� h�i, l�m th�t t�t! B�n to� xem v�i t� ch�t c�a ng��i ch� c�n t�p luy�n m�t th�i gian ch�c ch�n s� tr� th�nh m�t nh�n v�t n�i ti�ng vang danh thi�n h�!")
	DelItem(92)
	SetRank(45)
	SetTask(3, 30*256)
--	AddMagic(33)
	add_tw(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! �� ho�n th�nh nhi�m v� ��ng B�ch Thu� ���c phong l�m Th� Tr�i H�n T��ng, s� ���c h�c v� c�ng T�nh T�m Quy�t c�a Thi�n V��ng bang ")
	AddNote("Tr� l�i ��o Thi�n V��ng mang C�m K� giao cho D��ng H� ho�n th�nh nhi�m v� ��ng B�ch Thu�, ���c phong l�m Th� Tr�i H�n T��ng ")
end;

function Uworld121_yanghu()
	Talk(6,"","M� Tuy�t! N�ng h� t�t ph�i nh� v�y ch�!","H� Ti�n T� l� ti�n n� kh� m� t�m ���c � nh�n gian! D��ng H�u S�! Ng��i c� m� gi� l�y nh�, h�y qu�n h�t nh�ng sai l�m �� qua","N�u sinh ra trong th�i th�i b�nh, th� ta ��u c�n c�i h� danh Thi�n V��ng H�u s� n�y l�m g� ch�? Ch� c�n c�ng c� �y s�ng an b�nh � ��ng ��nh h�. Nh�ng ��ng ti�c ng�y nay thi�n h� l�m thanh, c�nh m�u ch�y li�n mi�n, ta l�m sao c� th� b� m�c �� t� trong bang m� kh�ng lo ���c ch�?",".....�.","G�n ��y nghe tin truy�n r�ng ph�i C�n L�n c� � �� ti�n qu�n v� ph�a Nam. T�i ��ng ��nh h� �� ph�t hi�n ra tung t�ch c�a �� t� ph�i C�n L�n, e r�ng tr��c ti�n b�n h� s� m�u �� h�m h�i Thi�n v��ng bang ch�ng ta, s� t�n vong c�a b�n bang �ang g�p nguy hi�m, t�i h� kh�ng th� n�o ��ng ngo�i cu�c ���c, s� vi�c �� ��n n��c n�y ta s� t� m�nh Y�n Thu� y�n �� n�i r� cho c� �y bi�t","C�ng ch� c�n c�ch n�y th�i!")
	SetTask(121,30) --�����������30
	DelItem(10)
	Msg2Player("Tham v�ng l�n c�a C�n L�n ph�i l� mu�n ti�n c�ng Thi�n Bang ph�i, D��ng H� kh�ng th� r�i kh�i ")
	AddNote("D��ng H� kh�ng c� c�ch n�o g�p m�t H� M� Tuy�t, nh� ng��i khuy�n c� �y d�m ")
end

function Uworld121_yanghu2()
   if(GetTask(3) >= 70*256) and (GetTask(3) ~= 75*256) then			-- ���������ӻ��ʦ����
		Talk(2,"","Th�t v�t v� cho ng��i�� n�i cho t�i h� bi�t k� ho�ch x�m chi�m c�a ph�i C�n L�n! ��y c� m�t quy�n m�t t�ch c�a Thi�n V��ng bang! Xin h�y nh�n l�y!","Ta nh�t ��nh s� chuy�n c�n r�n luy�n v� ngh�! C�ng v�i D��ng H�u S� b�o v� giang s�n T�ng tri�u!")
		if (HaveMagic(322) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(322,1)
		end
		if (HaveMagic(323) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(323,1)
		end
		if (HaveMagic(325) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(325,1)
   	end
   	Msg2Player("H�c ���c k� thu�t Ph� Thi�n Tr�m, Truy Tinh Tr�c Nguy�t, Truy Phong Quy�t c�a Thi�n V��ng bang ")
   	SetTask(121,255)
	else
		SetTask(121,245)
	end
	add_repute = ReturnRepute(30,95,4)			-- �������������30�㣬��100����ÿ���ݼ�4%
	AddRepute(add_repute)
	Msg2Player("Nhi�m v� ho�n th�nh, danh v�ng c�a b�n ���c t�ng l�n "..add_repute.."<<δ����>>")
	AddNote("Nhi�m v� Bi Luy�n M� Tuy�t: N�i cho D��ng H� bi�t k� ho�ch x�m chi�m c�a C�n L�n ph�i nh�ng v�n kh�ng c� c�ch n�o h�n g�n l�i quan h� gi�a H� M� Tuy�t v� D��ng H�, nhi�m v� ho�n th�nh. ")
end
