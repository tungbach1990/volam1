--description: ���������� 
--author: yuanlan	
--date: 2003/3/4
--update: Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--update: Dan_Deng(2003-07-24), �ӡ��ط����ɡ�����
-- Update: Dan_Deng(2003-08-12)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ��أ�ȡ����˽ű���ز��ݣ�
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1);
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 20*256) and (GetLevel() >= 20) then		--�ӵ�20������
			Say("G�n ��y � <color=Red>H�u s�n s�n ��ng<color> th��ng c� <color=Red>M�nh H�<color> xu�t hi�n, h�i ch�t v� s� b� t�nh l�n n�i d�ng h��ng. Ta th�n l� �� t� Ph�t m�n sao co th� m�t l�p tai ng� nh�n M�nh H� s�t h�i d�n l�nh? Mu�i c� th� �i thu ph�c h� d� kh�ng?", 2, "��ng �!/L20_get_yes", "L�c b�t t�ng t�m /L20_get_no")
		elseif (UTask_em == 20*256+80) then										--20�����������
			L20_prise()
		elseif (UTask_em == 20*256+50) then
			Talk(1,"","C�m t�c ti�n c�m v��ng! Mu�i ch� c�n thu ph�c ���c <color=Red>H� v��ng <color>. Nh�ng con h� c�n l�i s� kh�ng d�m t�c qu�i. H� v�n c�ng ��u, mu�i ph�i thu ph�c n� <color=Red>3 l�n <color>, n� m�i bi�t khu�t ph�c th�t s�.")
		elseif (UTask_em >= 30*256) then   							--�Ѿ����20��������δ��ʦ
			Skill150Dialog("Mu�i c� �� b�n l�nh v�o hang H� thu ph�c M�nh H�, th�t x�ng danh l� �� t� Nga Mi!")
		else
			Skill150Dialog("V� h�c v� Ph�t l� ��u c�n ph�i th�u r�, chuy�n tr�n ��i ch� c�n c� l�ng �t s� ���c th�nh t�u.")
		end
	elseif (UTask_em >= 70*256) then										--�Ѿ���ʦ
		Skill150Dialog("Theo hu� c�n c�a mu�i, �t s� c� th�nh t�u, ��n l�c mu�i ph�i r�i xa t� mu�i ta!")
	else
		Skill150Dialog("V� h�c v� Ph�t l� ��u c�n ph�i th�u r�, chuy�n tr�n ��i ch� c�n c� l�ng �t s� ���c th�nh t�u.")
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
	G_TASK:OnMessage("Nga Mi", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L20_get_yes()
	Talk(1,"","C�m t�c ti�n c�m v��ng! Mu�i ch� c�n thu ph�c ���c <color=Red>H� v��ng <color>. Nh�ng con h� c�n l�i s� kh�ng d�m t�c qu�i. H� v�n c�ng ��u, mu�i ph�i thu ph�c n� <color=Red>3 l�n <color>, n� m�i bi�t khu�t ph�c th�t s�.")
	SetTask(1, 20*256+50)
	AddNote("G�p ni c� Di�u Nh� � Gi�ng Kinh ���ng (240, 308) , nh�n <color=red>nhi�m v� ph�c h�<color>, �i l�n M�nh H� ��ng sau n�i thu ph�c h� d�. ")
	Msg2Player("G�p ni c� Di�u Nh� � Gi�ng Kinh ���ng, nh�n nhi�m v� ph�c h�, �i l�n M�nh H� ��ng sau n�i thu ph�c h� d�. ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(1,"","Mu�i c� �� b�n l�nh v�o hang H� thu ph�c M�nh H�, th�t x�ng danh l� �� t� Nga Mi!")
	SetRank(15)
	SetTask(1, 30*256)
--	AddMagic(93)
	add_em(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! �� ���c th�ng l�m C�m Y Ni! H�c ���c T� H�ng Ph� ��. ")
	AddNote("Tr� v� gi�ng kinh ���ng c�a Nga Mi ph�i, ph�c m�nh Di�u Nh�, ho�n th�nh nhi�m v� thu ph�c m�nh h�, ���c phong l�: C�m Y Ni. ")
end;
