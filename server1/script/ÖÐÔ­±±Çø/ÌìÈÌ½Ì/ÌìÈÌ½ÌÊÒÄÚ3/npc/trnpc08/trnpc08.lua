--description: ���̽��󻤷���ľ�
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-14)

-- ��������ϵͳ����޸Ĺ���Ķ�ľű�
-- Edited by peres
-- 2005/01/20

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\item\\skillbook.lua")

Include("\\script\\global\\skills_table.lua")

function main()

-- ������ϵͳ��а��������صĽű� --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

	if (myTaskValue==360) then
		task_level60_01();
		return
	end


-- ������ϵͳ��а��������صĽű� --

	UTask_tr = GetTask(4)
	Uworld123 = GetTask(123)
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 50*256) and (GetLevel() >= 50) then
			Say("<color=Red>Tinh ��n ��n Ch� Ph�ng H�p Nh�<color> b� qu�n T�ng b�t giam t�i <color=Red>t�a th�p s�t<color> � <color=Red>Bi�n Kinh<color>, n�u qu�n T�ng moi ���c b� m�t g� t� mi�ng �ng ta, s� l�m nguy ��n ��i nghi�p c�a b�n gi�o, v� v�y b�ng m�i gi�, ng��i ph�i c�u ���c Ph�ng H�p Nh� v�.",2, "Thu�c h� tu�n m�nh/yes", "Thu�c h� e r�ng kh�ng ��m nhi�m n�i/no")
		elseif (UTask_tr == 50*256+50) then 
			L50_prise()
		elseif (UTask_tr > 50*256) and (UTask_tr < 50*256+50) then					--�Ѿ��ӵ�50��������δ���
			Talk(1,"","<color=Red>Thi�t Th�p � Bi�n Kinh<color> giam <color=Red>Ph�ng H�p Nh�<color> c� <color=Red>ba c� quan<color>, m� ���c t�t c� m�i c� th� c�u ���c Ph�ng H�p Nh�, h�y nh� b�ng b�t c� gi� n�o, c�ng kh�ng th� �� Ph�ng H�p Nh� r�i v�o tay qu�n T�ng!")
		else							--�Ѿ����50��������δ��ʦ��ȱʡ�Ի���
			Skill150Dialog("Nh�ng ng��i m�i trong gi�o lu�n lu�n c�, t�nh h�nh th�ng b�i l� b�t kh� thi")
		end
	elseif (Uworld123 == 60) and (HaveItem(377) == 1) then			-- �Ʋ�Ⱦ���޻�һ��������
		if (GetTask(2) >= 70*256) and (GetTask(2) ~= 75*256) then			-- ���ŵ��ӻ����ų�ʦ�Ĳ���ѧ������
			Talk(11,"Uworld123_step4a","��i l�u nh� v�y, cu�n s�ch m�t c�a ���ng M�n n�y qu� kh�ng ph� ta!","A! Qu� nhi�n l� kh�ng kh�, ��ng ti�c thi�n h� l�i kh�ng ai ngh� ra.","�oan M�c ti�n sinh, ng��i xem c� th� hi�u v� c�ng trong cu�n s�ch m�t ���ng M�n n�y kh�ng?","S�ch m�t n�y vi�t qu� r� r�ng r�i, c� g� m� kh�ng hi�u?","Qu� th�c kh�ng d�m gi�u, ta tr��c gi� xem r�t �t s�ch, v�y n�n kh�ng hi�u.","N�u �� nh� v�y, c� g� kh�ng hi�u th� ng��i c� h�i l�o phu.","............","...............� ","............","...............� ")
		else
			Talk(1,"Uworld123_step4b","��i l�u nh� v�y, cu�n s�ch m�t c�a ���ng M�n n�y qu� kh�ng ph� ta!")
		end
	elseif (UTask_tr >= 70*256) then							--�Ѿ���ʦ
		Skill150Dialog("Th�nh t�u ��i s� gi�, nhu b�t c�u ti�u ti�t, n�u nh� l�m vi�c g� m� kh�ng quy�t �o�n, nh�t nh�t, thi�u ��u thi�u �u�i, nh� v�y th� kh�ng l�m ���c tr� tr�ng g� h�t!")
	else
		Skill150Dialog("V� c�ng v�n kh�ng kh�ng c� ch�nh t�, ch� c� m�nh y�u, chuy�n giang h�, n�ng gi�=3 v� chi, thi�n h� chi th�, c��ng gi� ch��ng chi.")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("Thi�n Nh�n", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end

function yes()
	Talk(1,"","<color=Red>Thi�t Th�p � Bi�n Kinh<color> giam <color=Red>Ph�ng H�p Nh�<color> c� <color=Red>ba c� quan<color>, m� ���c t�t c� m�i c� th� c�u ���c Ph�ng H�p Nh�, h�y nh� b�ng b�t c� gi� n�o, c�ng kh�ng th� �� Ph�ng H�p Nh� r�i v�o tay qu�n T�ng!")
	SetTask(4, 50*256+20)
	Msg2Player("G�p ���c T� H� ph�p �oan M�c Du�, nh�n nhi�m v� c�u ng��i, ��n Bi�n Kinh Thi�t Th�p c�u tinh ��n ch� Ph�ng H�p Nh� �ang b� T�ng qu�n giam gi�.")
	AddNote("G�p ���c T� H� ph�p �oan M�c Du�, nh�n nhi�m v� c�u ng��i, ��n Bi�n Kinh Thi�t Th�p c�u tinh ��n ch� Ph�ng H�p Nh� �ang b� T�ng qu�n giam gi�.")
end;

function no()
	Talk(1,"","Ng��i v�n l� Ch��ng K� S� c�a b�n gi�o, m�t vi�c nh� th� n�y l�m c�ng kh�ng xong, c�n l�m ���c g� n�a?")
end;

function L50_prise()
	Talk(1,"","Ng��i tuy l� �� t� m�i nh�ng c� th� ��m ���ng vi�c h� tr�ng, b�n gi�o r�t c�n nh�ng ng��i ��c l�c nh� ng��i, ta s� n�i v�i Gi�o ch� �� s�c phong cho ng��i.")
	SetRank(60)
	SetTask(4, 60*256)
	SetTask(21,0)		--�����ͽ������������㣬���ڽ���ظ�����
--	AddMagic(143)
	add_tr(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n �� ���c s�c phong l�m H� Gi�o S� c�a Thi�n Nh�n Gi�o! H�c ���c v� c�ng L�ch Ma �o�t H�n.")
	AddNote("V� Thi�n Nh�n Gi�o ��n g�p T� H� ph�p �oan M�c Du� ph�c m�nh, ho�n th�nh nhi�m v� c�u ng��i. Th�ng ch�c l�m H� Gi�o S�.")
end;

function Uworld123_step4a()
	DelItem(377)
	if (HaveMagic(339) == -1) then		-- ����û�м��ܵĲŸ�����
		AddMagic(339,1)
	end
	if (HaveMagic(302) == -1) then		-- ����û�м��ܵĲŸ�����
		AddMagic(302,1)
	end
	if (HaveMagic(342) == -1) then		-- ����û�м��ܵĲŸ�����
		AddMagic(342,1)
	end
	if (HaveMagic(351) == -1) then		-- ����û�м��ܵĲŸ�����
		AddMagic(351)
	end
	CheckIsCanGet150SkillTask()
	Msg2Player("B�n h�c ���c Nhi�p H�n Nguy�t �nh, B�o V� L� Hoa, C�u Cung Phi Tinh, Lo�n Ho�n K�ch!")
	Msg2Player("�oan M�c Du� ti�p t�c m�i b�n v� b�o tin cho ���ng B�t Nhi�m.")
	SetTask(123,75)
	Talk(2,"","Nh� ng��i thay ta chuy�n l�i cho B�t Nhi�m C�ng T�, n�i �oan M�c Du� ta quy�t kh�ng l�m ng�i th�t v�ng. ","���c! T�i h� c�ng xin �a t� ti�n b�i v�a r�i �� ch� d�y. ")
end

function Uworld123_step4b()
	DelItem(377)
	SetTask(123,70)
	Talk(1,"","R�t t�t! nh� ng��i thay ta chuy�n l�i cho B�t Nhi�m C�ng T�, n�i �oan M�c Du� ta quy�t kh�ng l�m ng�i th�t v�ng. ")
	Msg2Player("�oan M�c Du� ti�p t�c m�i b�n v� b�o tin cho ���ng B�t Nhi�m.")
end
