--description: �����Ʋ�Ⱦ 30������ 
--author: yuanlan	
--date: 2003/3/11
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-13)
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>T� T� ��nh n�y l� n�i t� li�t t� li�t t�ng c�a b�n ph�i, ph�m l� ng��i th��ng ��ng c� m� b�n m�ng v�o ��y!"
	G_TASK:OnMessage("���ng M�n", tbDailog, "DialogWithNpc")
	tbDailog:AddOptEntry("Ta ��n t�m �ng c� vi�c kh�c", main2)
	tbDailog:Show() 
end

function main2()
	UTask_tm = GetTask(2)
	Uworld123 = GetTask(123)
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then		-- ������������
		if (UTask_tm == 30*256) and (GetLevel() >= 30) then		--30����������
			Talk(3, "L30_get", "<color=Red>ph�ng H�a kh�<color> c�a <color=Red>���ng V�n<color> s� th�c th�t ��ng th��ng. Hai n�m tr��c c� m�t g� lai l�ch b�t minh b�t c�c Ti�u Xuy�n, ��a con ��c nh�t c�a �ng, mu�n �p �ng giao ra B� ki�p <color=Red>'H�a Kh� Ph�'<color> c�a b�n m�n.", "���ng V�n s� th�c kh�ng d�m quay l�ng l�i v�i m�n quy. K�t qu� l� ng�y th� 2 g� kia ��a t�i c�nh tay c�a Ti�u Xuy�n. S� th�c ch� c� ��a con trai n�y, nh�ng l�i kh�ng th� giao 'H�a Kh� ph�' cho ch�ng ���c. N�o ng�, l�i ��i l�y thi th� c�a Ti�u Xuy�n. S� th�c �au ��n t�t c�ng, th� nh�t ��nh ph�i tr� m�i th� s�u ��m!", "Nh�ng v� ���ng V�n s� th�c ti�t l� ���ng M�n B� ki�p, n�n ph�i ch�u s� tr�ng ph�t c�a m�n quy c� ��i kh�ng th� r�i kh�i ���ng M�n n�a b��c. Th� h�n kia e r�ng ki�p n�y kh�ng th� tr� ���c!")
		elseif (UTask_tm == 30*256+50) then
			Talk(2, "", "T�i h� �� t�m ���c t�n th� ph� b�t c�c con trai c�a ���ng V�n s� th�c, �o�t v� <color=Red> 'H�a Kh� Ph�'<color>.", " T�t l�m,<color=Red>���ng V�n<color> s� th�c nh�t ��nh s� c�m th�y an �i ph�n n�o. H�y giao <color=Red> 'H�a Kh� Ph�'<color>cho �ng �y. �ng ta � trong <color=Red>ph�ng H�a kh�<color>.")
			Msg2Player("V� ph�ng t� t� t�m ���ng B�t Nhi�m, ���c bi�t ���ng V�n s� th�c �ang � H�a Kh� ph�ng. ")
			SetTask(2,30*256+60)
		elseif (UTask_tm == 30*256+60) then
			Talk(1, "", "���ng V�n s� th�c nh�t ��nh s� c�m th�y an �i ph�n n�o. H�y ��n <color=Red>ph�ng H�a kh�<color> n�i v�i �ng �y tin m�ng n�y!")
		elseif (UTask_tm > 30*256) and (UTask_tm < 40*256) then					--�Ѿ��ӵ�30��������δ���
			Talk(1,""," Ta �� �m th�m d� la, t�n th� ph� �� d��ng nh� th��ng xu�t hi�n � <color=Red>B�ch V�n ��ng<color> ph�a ��ng Thanh Th�nh s�n.")
		elseif (UTask_tm >= 40*256) then					--�Ѿ����30�����񣬱��ŵ���
			Skill150Dialog("Ng��i c� th� gi�p ���ng V�n s� th�c x�a �i n�i oan khu�t. Xem ra, ta th�t k�nh n� ng��i!")
		else		
			Skill150Dialog("T� T� ��nh n�y l� n�i t� li�t t� li�t t�ng c�a b�n ph�i, ph�m l� ng��i th��ng ��ng c� m� b�n m�ng v�o ��y!")
		end
	elseif (Uworld123 == 10) then											-- ����90����������
		Say("C� th� thay ta chuy�n m�t b�c th� kh�ng?",2,"Tu�n l�nh!/Uworld123_get","Th�t �y n�y, m�n ch� v�a m�i g�i ta qua ch� �ng �y. /L30_get_no")
	elseif (Uworld123 == 20) and (HaveItem(379) == 0) then		-- �Ʋ�Ⱦ���񣬵��߶���
		Talk(1,"","Ng��i th�t l��.., th� c�n ch�a c�m �� v�i v� ch�y �i!")
		AddEventItem(379)
		Msg2Player("Nh�n l�i th� c�a ���ng B�t Nhi�m ")
	elseif (Uworld123 == 30) and (HaveItem(380) == 1) then		-- �Ʋ�Ⱦ���񣬿���
		Talk(3,"Uworld123_step2","Ha ha�Qu� nhi�n di�u k�! S� khi�n ���ng nh�t Tr�n ch�t c�ng kh�ng c� ��t dung th�n!","H��? Ng��i l� ai? Sao kh�ng ph�i l� A T�i?","Ng��i �� nghe th�y �i�u b� m�t, mu�n s�ng c�ng kh�ng ���c, h�y xem chi�u c�a ta ��y!")
	elseif (Uworld123 == 40) then											-- û���꣬������
		Talk(1,"Uworld123_step2","��ng ch�y! H�y coi ��y!")
	elseif (Uworld123 == 50) then
		if (GetSex() == 0) then
			sexstr = "��i hi�p "
		else
			sexstr = "N� hi�p"
		end
		Talk(8,"Uworld123_step3","C�ng t� h� t�t ph�i lo l�ng. Tuy ta kh�ng th�n v�i c�ng t� nh�ng c�ng ch�ng vi�c g� l�m h�ng chuy�n c�a c�ng t�. ","Ng��i. Ng��i. ","C�ng t� th�n l� thi�u ch� ���ng Gia B�o. Ta tuy b�t t�i nh�ng kh�ng gi�p c�ng t� ch�ng l� �i gi�p ng��i ngo�i. ","Kh�ng sai, ��ng nh� v� anh h�ng n�y n�i, xin cho h�i cao danh qu� t�nh? ","T�i h� "..GetName().."Ti�n th�. ","�, Ra v�y "..GetName()..sexstr.."Nghe danh �� l�u, nh�ng kh�ng ng� l�n ��u g�p m�t l�i trong ho�n c�nh n�y. ","��i hi�p �� �ng h� t�i h� nh� v�y, kh�ng bi�t c� th� gi�p ta mang quy�n s�ch n�y trao cho �oan M�c Du� ���c ch�ng? Quy�n s�ch n�y ��i v�i t�i h� l� m�u ch�t thu�n l�i �� n�m gi� ���ng M�n. S� vi�c v� c�ng tr�ng ��i, kh�ng th� nh� v� ng��i kh�c ���c. ","Chuy�n nh�, giao cho ta ���c r�i. ")
	elseif (Uworld123 == 60) and (HaveItem(377) == 0) then		-- ���Ŷ���
		if (GetSex() == 0) then
			Talk(1,"","��i hi�p qu�n mang B� ki�p �i r�i!")
		else
			Talk(1,"","N� hi�p qu�n mang B� ki�p �i r�i!")
		end
		AddEventItem(377)
		Msg2Player("L�y l�i b� k�p ���ng m�n ")
	elseif (Uworld123 == 70) or (Uworld123 == 75) then			-- �������
		Talk(1,"Uworld123_prise","Ha ha ha. Ta s� ��i tin m�ng c�a ng��i. Th�t l�ng c�m �n ng��i!")
	elseif (Uworld123 >= 10) and (Uworld123 < 80) then		-- �Ʋ�Ⱦ���������
		Talk(1,"","Chuy�n ta n�i ng��i mau l�m ngay �i, kh�ng vi�c g� th� ��ng l�ng ph� th�i gian!")
	elseif (GetTask(51) >= 90) then		-- һ����ϴ��ԩ��������֮�󣬶Ի��ı�
		Talk(1,"","T�i sao cu�i c�ng h�n l�i ���c s�ng �i, c�n ta th� b� ��i x� t� b�c? Qu� th�t b�t c�ng!")
	elseif (Uworld123 >= 80) then									-- �Ʋ�Ⱦ�����Ѿ����
		Talk(1,"","Chuy�n l�n n�y th�t nh� c�ng c�a ng��i, khi ta tr� th�nh m�n ch� nh�t ��nh s� kh�ng qu�n c�ng lao c�a ng��i!")
	elseif (UTask_tm >= 70*256) then							--�Ѿ���ʦ
		Skill150Dialog("Ta lu�n mu�n ra �i nh�ng cha ta kh�ng ��ng �.")
	else
		Skill150Dialog("T� T� ��nh n�y l� n�i t� li�t t� li�t t�ng c�a b�n ph�i, ph�m l� ng��i th��ng ��ng c� m� b�n m�ng v�o ��y!")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("���ng M�n", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L30_get()
--	DelItem(42)							--��ֹ�ؽ��������Ҽ����������
	Say(" ���ng V�n s� th�c t�ng n�i b�t lu�n l� ai, ch� c�n c� th� gi�p �ng tr� m�i th� gi�t con, l�y v� <color=Red> H�a Kh� Ph�<color>, �ng s� mang n�ng �n s�u!", 2, "Gi�p �ng ta b�o th�. /L30_get_yes", "Ta kh�ng quan t�m!/L30_get_no")
end;

function L30_get_yes()
	Talk(1,""," Ta �� �m th�m d� la, t�n th� ph� �� d��ng nh� th��ng xu�t hi�n � <color=Red>B�ch V�n ��ng<color> ph�a ��ng Thanh Th�nh s�n.")
	SetTask(2, 30*256+20)
	AddNote("G�p ���ng B�t Nhi�m � t� ���ng ( 514, 318) , nh�n <color=Red>nhi�m v� H�a Kh� Ph�<color>, gi�p ���ng V�n s� th�c �o�t 'H�a Kh� Ph�' v�. ")
	Msg2Player("Nh�n nhi�m v� 'H�a Kh� Ph�', gi�p ���ng V�n s� th�c �o�t 'H�a Kh� Ph�' v�. ")
end;

function Uworld123_get()
	Talk(1,"","T�t! Mau k�p thay ta trao b�c th� n�y ��n Bi�n Kinh cho B�ch C�ng T�. �i s�m v� s�m!")
	SetTask(123,20)
	Msg2Player("Nh�n nhi�m v�: Thay ���ng B�t Nhi�m �em th� ��n trao cho B�ch c�ng t�. ")
	AddEventItem(379)
	Msg2Player("Nh�n ���c th� c�a ���ng B�t Nhi�m ")
end

function Uworld123_step2()
	DelItem(380)
	SetTask(123,40)
	SetFightState(1)
	NewWorld(229,1616,3195)
end

function Uworld123_step3()
	AddEventItem(377)
	SetTask(123,60)
	Msg2Player("L�y ���c b� k�p ���ng M�n. ")
end

function Uworld123_prise()
	AddRepute(10)
	Earn(20000)
	if (GetTask(123) == 70) then			-- ���Ǳ���
		SetTask(123,245)
	else
		SetTask(123,255)
	end
	Msg2Player("Nhi�m v� ho�n th�nh, b�n s� ���c th��ng 20000 l��ng, thanh th� c�a b�n t�ng 10 �i�m. ")
	AddNote("Nhi�m v� ho�n th�nh, b�n s� ���c th��ng 20000 l��ng, thanh th� c�a b�n t�ng 10 �i�m. ")
end

function L30_get_no()
end;
