--description: ���������ƴ� 
--author: yuanlan	
--date: 2003/3/5
--update: Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1)
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 30*256+50) then				-- 30��������
			if (HaveItem(120) == 1) then		-- �������
				L30_prise()
			else
				Talk(1,"","Phi�n mu�i ��n<color=Red>b� h� � h�u s�n<color>t�m xem. <color=Red>H�a h�<color>th�ch �n<color=Red>��i g�<color>nh�t.H�y d�ng ��i g� �� d� n� tr� v�, n�u kh�ng n� s� kh�ng �i v�i k� l� m�t ��u.")
			end
		elseif (UTask_em == 30*256) and (GetLevel() >= 30) then		-- 30����������
			Say("<color=Red>H�a h�<color> c�a ta kh�ng th�y n�a, mu�i c� th� gi�p ta t�m kh�ng?", 2, "T�m gi�p /L30_get_yes", "Kh�ng c�n th�i gian n�a /L30_get_no")
		elseif (UTask_em >= 40*256) then   							--�Ѿ����30��������δ��ʦ
			Skill150Dialog("Ti�u s� mu�i, c�m �n mu�i gi�p ta!")
		else
			Skill150Dialog("H�a H� ��u, H�a H� ng��i � ��u, ng��i ch�y ��u r�i h�? Nhanh ra ��y mau!")
		end
	elseif (UTask_em == 70*256) then								--�Ѿ���ʦ
		Skill150Dialog("Ti�u s� mu�i ph�i h� s�n �? Ta v� h�a h� s� r�t nh� mu�i.")
	else
		Skill150Dialog("H�a H� c�a ta �� th�ng linh r�i, kh�ng th� n�o l� ng��i b�t l��ng ���c.")
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

function L30_get_yes()
	Talk(1,"","T�t l�m! Phi�n mu�i ��n <color=Red>b� h� � h�u s�n<color> t�m xem. H�a h� th�ch �n <color=Red>��i g�<color>. H�y d�ng ��i g� �� d� n� tr� v�, n�u kh�ng n� s� kh�ng �i v�i k� l� m�t ��u.")
	SetTask(1, 30*256+50)
	AddNote("� g�n h�u ���ng Nga Mi ph�i (242, 305) g�p M�c V�n T�, nh�n <color=red>nhi�m v� Ho� H�<color>, �i ��n ph�i sau n�i Ng�c Ng� t�m Ho� H�. ")
	Msg2Player("Ti�p nh�n nhi�m v� Ho� H� c�a M�c V�n T�, �i ��n ph�a sau n�i Ng�c Ng� t�m Ho� H�. ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","H�a h� �! Mu�i th�t l� �� tinh ranh, l�n sau kh�ng �� ng��i ch�y lung tung n�a! C�m �n mu�i �� gi�p ta!")
	DelItem(120)
	SetRank(16)
	SetTask(1, 40*256)
--	AddMagic(385)
--	AddMagic(82)
--	AddMagic(89)
	add_em(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! ���c phong l�: B�ch Li�n Ti�n T� ")
	AddNote("Mang Ho� H� giao cho M�c V�n T�, ho�n th�nh nhi�m v� Ho� H�, ���c phong l�: B�ch Li�n Ti�n T� ")
end;	
