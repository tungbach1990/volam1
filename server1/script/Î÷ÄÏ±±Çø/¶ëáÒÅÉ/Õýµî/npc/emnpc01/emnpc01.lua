--description: ����������ʦ̫��������������50�����񡢳�ʦ�����ط���������
--author: yuanlan	
--date: 2003/3/6
--update: Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--update: Dan_Deng(2003-07-24), �ӡ��ط����ɡ�����
-- Update: Dan_Deng(2003-08-12)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ���
-- Update��Dan_Deng(2003-10-27)Ϊ�ط�ʦ���������ȡ�������ܣ��Լ��������ɶ�Ӧ
-- update: xiaoyang(2004\4\19) ����90������

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�."
	G_TASK:OnMessage("Nga Mi", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 4) then
		tbDailog:AddOptEntry("H�c k� n�ng c�p 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Mu�n th�nh gi�o vi�c kh�c", oldentence)
	tbDailog:Show() 
	
end

function oldentence()
	local UTask_em = GetTask(1)
	local nFactID = GetLastFactionNumber();

	if (UTask_em == 70*256) and (GetFaction() == "emei") then			-- ��ʦ��������
		SetFaction("")
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_em == 70*256) and (GetTask(6) >= 5*256) and (GetTask(6) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(6,0)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_em == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(1,70*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_em == 80*256 and nFactID == 4 and GetCamp() == 1 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("emei");
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	elseif (UTask_em == 70*256 and nFactID == 4 and GetCamp() ~= 4 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	end

	local tbDes = {"��i ngh� ��u s�/#daiyitoushi_main(4)", "Mu�n th�nh gi�o vi�c kh�c/common_talk"};
	
	Say("G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_em = GetTask(1)
	local Uworld125 = GetTask(125)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),1) == 0) then				-- ��������������
		Talk(1,"","B�n ph�i tuy l� ph�n n� l�u, nh�ng chuy�n Qu�c gia h�ng vong kh�ng th� ��ng ngo�i. Xin h�i ��p v�i ��c C� minh ch�, Nga Mi tu�n theo s� s�p x�p c�a ng��i!")
		Uworld40 = SetBit(GetTask(40),1,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 80*256) then						-- �ط�������ɳ���
			check_skill()
		elseif ((UTask_em == 60*256+50) and (HaveItem(24) == 1)) then		--�õ�����ָ������ʦ�������
			DelItem(24)
			Talk(1,"L60_prise","Ng��i �� l�y ���c Tr�n Ph�i chi B�o v� cho b�n ph�i, c�ng lao th�t kh�ng nh�! V�i n�ng l�c v� tr� tu� c�a ng��i �� c� th� thu�n l�i xu�t s�! T� nay h�nh t�u giang h� ph�i gi� th�n trong s�ch, h�y nh� l�y!")
		elseif (UTask_em == 60*256) and (GetLevel() >= 50) then		--��ʦ��������
			DelItem(24)
			Say("Y�n Ng�c Ch� ho�n<color=Red> l� t�n v�t c�a Ch��ng m�n, l� tr�n ph�i chi b�o c�a s� t� b�n ph�i truy�n l�i. Nh�ng m�y n�m tr��c, b�n ph�i c� m�t ph�n �� <color=Red>Thanh H�a<color>. B� ta l� s� t� c�a th�y, b�i kh�ng h�i l�ng ta l�m ch��ng m�n n�n �� l�y tr�m <color=Red>Y�n Ng�c Ch� ho�n<color>, ng��i c� b�ng l�ng gi�p b�n ph�i �o�t <color=Red>Y�n Ng�c Ch� ho�n<color> v� kh�ng?" , 2, "��ng �!/L60_get_yes", "S� kh�ng l�m n�i /L60_get_no")
		elseif (UTask_em == 50*256+80) then													--50���������
			L50_prise()
		elseif ((UTask_em == 50*256+50) or (UTask_em == 50*256+60)) and (HaveItem(23) == 0) then
			AddEventItem(23)
			Talk(1,"","Danh ti�ng v� c�ng c�a ng��i ng�y m�t cao, qu� l� r��ng c�t c�a b�n ph�i. T� nay h�nh s� kh�ng ���c t�y ti�n. Kim Cang Kinh n�y ph�i lu�n mang theo m�nh!")
		elseif (UTask_em == 50*256) and (GetLevel() >= 50) then		--50����������
			DelItem(23)
			Say("Ta v�i <color=Red>T�n H�i ��i s�<color> tr� tr� <color=Red>T�n T��ng t�<color> c� quan h� tri giao. T�n T��ng t� ���c x�y d�ng trong nh�ng n�m ��i nghi�p T�y D�ng ��, ��n nay �� 555 n�m. �� m�ng ng�y T�n T��ng t� th�nh l�p, ta ��y chu�n b� m�t b� Ph�t m�n ch� b�o <color=Red>'Kim Tuy�n T� T��ng Kim Cang Kinh'<color>�� l�m qu� ch�c m�ng. Ng��i b�ng l�ng gi�p ta t�ng ph�n qu� n�y ch�?", 2, "��ng �!/L50_get_yes", "S� kh�ng l�m n�i /L50_get_no")
		elseif (UTask_em > 50*256) and (UTask_em < 60*256) then								--�Ѿ��ӵ�50��������δ��ɵ���ͨ�Ի�
			Talk(1,"","T�ng ���c 'Kim Cang Kinh' ch�a?")
		elseif (UTask_em > 60*256) and (UTask_em < 70*256) then				-- ��ʦ�����е���ͨ�Ի�
			Talk(1,"","<color=Red>Y�n Ng�c Ch� ho�n<color> l� tr�n ph�i chi b�o l�u l�c b�n ngo�i. Nghe n�i g�n ��y <color=Red>Thanh H�a<color> �ang � <color=Red>Tr��ng Giang Nguy�n ��u<color>, ng��i ph�i h�t m�c c�n th�n!")
		else
			Talk(1,"","Ng� Ph�t t� bi! �� nh�p m�n ph�i ta, ph�i nghi�m th� m�n quy, mong ng��i chuy�n t�m tu luy�n, ��ng ph� l�ng k� v�ng c�a ta!")
		end
--	elseif (UTask_em == 5*256+70) and (HaveItem(17) == 1) and (GetSeries() == 2) and (GetCamp() == 0) then		--�õ��������⣬�����������
--		enroll_prise()
	elseif (Uworld125 == 20) and (HaveItem(388) == 1)then
		Talk(7,"Uworld125_lose","Ch�o s� th�i�.","C�c h� l�...?","T�i h� nh�n nhi�m v� c�a Ti�u B� B� mang th�nh v�t V� T� Thi�n Th� trao tr� l�i cho Nga Mi.","Th�t hay l�m! N�o ng� m�y tr�m n�m sau, th�n c�ng c�a s� t� n�m x�a �� tr� v� v�i Nga Mi. N�y v� b�ng h�u, xin �a t� ng��i!","Kh�ng c�n kh�ch s�o!","��y l� L�nh ti�n Ch��ng m�n t�i c�o c�a Nga Mi. H�y c�m l�nh ti�n �i Th�nh �� t�m Ti�u B� B� nh�n th� lao. Sau n�y quay v� Nga Mi, c� th� d�ng l�nh ti�n �i�u ��ng t�t c� l�c l��ng c�a ta.","�a t� s� th�i!.")
   elseif (Uworld125 == 30) and (HaveItem(389) == 0)then
   	Talk(1,"","H�y y�n t�m, Nga Mi ta ��p �ng �i�u ki�n c�a ng��i quy�t kh�ng h�i h�n. L�nh b�i ��y!")
   	AddEventItem(389)
		Msg2Player("L�y ���c l�nh ti�n c�a Nga Mi ")
   elseif (Uworld125 == 40) then
		Talk(5,"Uworld125_finish","S� th�i t�m t�i h� g�p th�, kh�ng bi�t c� chuy�n chi?","Nhi�u �� t� m�n h� ta v� luy�n V� T� Thi�n Th� m� kinh m�ch ��o l�n, th�n ch�u tr�ng th��ng.","Sao? Kh�ng th� n�o. Ta ch�a h� ��ng ��n m�t c�p.","�i�u n�y ta bi�t. Chuy�n x�y ra khi mang m�t c�p tr�n ng��i. S� t� luy�n s�ch n�y d�a v�o t�i n�ng tr�i cho v� s�c m�nh n�i l�c. Nh�ng ch� ng��i n�o c� duy�n m�i c� th� l�nh ng�.","H�a ra nh� th�.")
--	elseif (GetTask(6) == 5*256+10) then		-- ת����������
--		Say("����ʦ̫�������Ź���Ȼ����תͶ���ɣ��������Դ��߱����κ����ա�����Ĵ���ҪͶ������ţ�",2,"���������Ѿ�/defection_yes","�����һ��ǲ���Ͷ��/defection_no")
	elseif (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_em == 70*256) and (GetTask(6) < 5*256) then		-- �ط�ʦ������
		Talk(5,"return_sele","S� ph� ","Con l�i tr� l�n n�i ch�i n�a h�? ","D�, qu� th�t con nh� nh�ng ng�y th�ng tr�n n�i v� c�ng. ","�, ta c�ng lu�n nh� ��n nh�ng ng�y con � tr�n n�i, ch�p m�t m�t c�i m� con �� xu�ng n�i r�i. ","giang h� hi�m �c, kh�ng th� l��ng h�t m�i �i�u. Th�t ra b�y gi� con mong mu�n ���c � l�i tr�n n�i. ")
	elseif (GetCamp() == 4) and ((UTask_em == 70*256+10) or (UTask_em == 70*256+20)) then		-- �ط�ʦ��������
		Say("�� chu�n b� �� 5 v�n l��ng ch�a?",2,"�� chu�n b� xong/return_complete","V�n ch�a chu�n b� xong/return_uncompleted")
	elseif (Uworld125 > 20) and (Uworld125 < 40)then
   	Talk(1,"","Nga Mi v� c�c h� v�n c�n ch�t duy�n ph�n, sau n�y mong gi�p �� th�m.")
	elseif (UTask_em < 10*256) and (GetSeries() == 2) then 								--��δ����
		Talk(1,"","��n h�m nay, Nga Mi ta �� c� h�n 100 n�m thu nh�n ��ng ��o �� t�, m� r�ng thi�n duy�n, b�t lu�n c� nh�p m�n hay kh�ng, �� l�n n�i xem nh� ng��i c� duy�n.")
	elseif (UTask_em == 70*256) then								--��ʦ���ӣ������ط����ɵļ��ݣ�
		Talk(1,"","Ng��i �� xu�t s�, t� nay h�nh t�u giang h� ph�i nh� gi� th�n trong s�ch!")
	else														-- �Ƕ����ɶԻ�
		Talk(1,"","Tuy Nga Mi ta l� ph�n n� l�u, nh�ng quy�t kh�ng ��ng sau c�c ��i m�n ph�i kh�c.")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
--	if (HaveMagic(92) == -1) then
--		AddMagic(92)					--���Ĵ���
--		Msg2Player("��ѧ���ˡ����Ĵ��ӡ�")
--		Say("����ʦ̫��Ϊʦ��αչؿ�˼���գ��´���һ�С����Ĵ��ӡ������ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	elseif  (HaveMagic(252) == -1) then
--		AddMagic(252)					--���ޱ�
--		Msg2Player("��ѧ���ˡ����ޱߡ�")
--		Say("����ʦ̫��Ϊʦ��αչؿ�˼���գ��´���һ�С����ޱߡ������ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
		Say("L�i mu�n h� s�n du ngo�n sao?",2,"D� v�ng, xin s� ph� cho ph�p /goff_yes","Kh�ng, ta t� th�y c�ng phut�p luy�n v�n ch�a ��. /no")
--	end
end

----------------- �ط�ʦ����� ------------------
function goff_yes()				-- �ط�������ɳ��루����
	Talk(1,"","T�t! �i m�t ng�y ��ng h�c m�t s�ng kh�n.")
	SetTask(1,70*256)
	AddNote("R�i kh�i Nga Mi ph�i, l�i ngao du giang h�. ")
	Msg2Player("B�n r�i kh�i Nga Mi ph�i, l�i ngao du giang h� ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- ת�ɣ��ջ�ԭ�����书����
-- ˢ������
	n = 0
	i=80; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ʈѩ����
	i=101;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������
	i=77; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ҽ���
	i=79; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �����Ʒ�
	i=81; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���Ҷ
	i=82; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ͬ��
	i=83; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����
	i=84; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����Ʈ��
	i=85; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- һҶ֪��
	i=86; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ˮ
	i=87; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ľ�
	i=88; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���𲻾�
	i=89; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �ε�
	i=91; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �������
	i=93; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �Ⱥ��ն�
	i=252;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ޱ�
	i=92; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���Ĵ���
	AddMagicPoint(n)
-- ˢ�꼼�ܺ����ת��������
	SetTask(6,5*256+20)
	SetTask(1,75*256)				-- Ϊԭ�����������
	SetRank(74)
	if (GetRepute() < 200) then
		Msg2Player("V� h�nh vi b�t trung v�i m�n ph�i, danh v�ng c�a b�n gi�m xu�ng "..GetRepute().."�i�m!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V� h�nh vi b�t trung v�i m�n ph�i, danh v�ng c�a b�n gi�m xu�ng 200 �i�m! ")
		AddRepute(-200)
	end
	AddNote("Thanh Hi�u S� Th�i �� ph� b� v� c�ng, l�y l�i danh hi�u Th�nh n� Kim ��nh, th�ng b�o v�i thi�n h� l� �� �u�i ng��i ra kh�i Nga Mi. Ng��i c� th� gia nh�p v�o Th�y Y�n m�n r�i. ")
	Msg2Player("Thanh Hi�u S� Th�i �� ph� b� v� c�ng, l�y l�i danh hi�u Th�nh n� Kim ��nh, th�ng b�o v�i thi�n h� l� �� �u�i ng��i ra kh�i Nga Mi. Ng��i c� th� gia nh�p v�o Th�y Y�n m�n r�i. ")
	Talk(1,"KickOutSelf","N�o ng� v� c�ng n�m x�a ta ��ch th�n truy�n d�y cho ng��i, nay ng��i l�i mu�n ph� tru�t. Th�t l� th� s� tr�i ngang!")
end

function defection_no()
	AddNote("Ng��i b� � ��nh gia nh�p Th�y Y�n ph�i. ")
	Msg2Player("Ng��i b� � ��nh gia nh�p Th�y Y�n ph�i. ")
	SetTask(6,1*256)			-- Ϊ��ͼ��ʦ������ǣ��Ա�������ʱ֮��
end

function return_sele()
	Say("Ng��i �� c� th�nh �, ta kh�ng n� ch�i t�!",2,"�a t� s� ph� /return_yes","Th�i kh�ng c�n ��u/return_no")
end;

function return_yes()				-- �ط��ļ��
	Talk(3,"","�a t� s� ph�! �� t� phi�u b�t giang h� c�ng d�nh d�m ���c ch�t ng�n l��ng, kh�ng bi�t s� m�n c� c�n kh�ng?"," N�o ng� ng��i l�i c� l�ng nh� v�y, th� th� quy�n g�p 50000 ng�n l��ng tu s�a Nga Mi s�n l� nh�!","D�! �� �� t� chu�n b�! ")
	SetTask(1,70*256+20)
	AddNote("G�p 50 ng�n l��ng b�c �� tu s�a l�i con ���ng l�n n�i Nga Mi, s� ���c quay v� s� m�n. ")
	Msg2Player("G�p 50 ng�n l��ng b�c �� tu s�a l�i con ���ng l�n n�i Nga Mi, s� ���c quay v� s� m�n. ")
end;

function return_no()
	Talk(2,"","Giang h� kh�ng ���ng v�, lu�n c�n t� m�nh x�ng t�i, �a t� m� � c�a s� ph�!","Kh�ng sao ��u, n�u mu�n quay l�i, Nga Mi ta l�c n�o c�ng r�ng m�!")
end;

function return_complete()			-- �ط��ɹ�
	if (GetCash() >= 50000) then
		Talk(1,"","���c! ��y 5 v�n l��ng �� nh�n ���c. Ng��i ���c phong l� Kim ��nh Th�nh N� c�a b�n ph�i, hy v�ng ng��i c� g�ng gi�p b�n ph�i ph�t d��ng quang ��i.")
		Pay(50000)
		SetTask(1,80*256)
		SetFaction("emei")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(64)
--		if (HaveMagic(252) == -1) then
--			AddMagic(88)
--			AddMagic(91)
--			AddMagic(282)
--			AddMagic(252)
		add_em(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("B�n h�c ���c tuy�t h�c tr�n ph�i: Ph�t Ph�p V� Bi�n, V� C�ng B�t Di�t B�t Tuy�tt, Ph�t Quang Ph� Chi�u, Thanh �m Ph�n X��ng. ")
--		end
		AddNote("�� quay v� Nga Mi ph�i, ��ng trong h�ng ng� ")
		Msg2Player(GetName().."���c phong th�nh Kim ��nh Th�nh N�, l�i quay v� Nga Mi ph�i. ")
	else
		Talk(2,"","D��ng nh� ng��i kh�ng c� �em nhi�u ti�n theo ","A. Xin l�i, ta �i l�y ti�n. ")
	end
end;

--------------- �������� ----------------------
function enroll_prise()		-- �����������
	Talk(1,"","Ng� Ph�t t� bi, �� c� l�ng th�nh, b�n ni s� thu nh�n ng��i l�m m�n ��, ��ng ph� l�ng k� v�ng c�a ta.")
	DelItem(17)
	SetFaction("emei")    			
	SetCamp(1)
	SetCurCamp(1)
	SetRank(13)
	AddMagic(80)
	AddMagic(101)
	SetRevPos(13, 13)
	SetTask(1, 10*256)
	AddNote("Giao B�ch Ng�c Nh� � cho Thanh Hi�u S� Th�i, ho�n th�nh nhi�m v� nh�p m�n. Gia nh�p Nga Mi ph�i, tr� th�nh B� Y Ni, h�c ���c Phi�u Tuy�t Xuy�n V�n, Tr� Li�u thu�t ")
	Msg2Player("Giao B�ch Ng�c Nh� � cho Ch��ng m�n Thanh Hi�u S� Th�i, ho�n th�nh nhi�m v� nh�p m�n. ")
	Msg2Player("Hoan ngh�nh b�n gia nh�p Nga Mi ph�i, tr� th�nh B� Y Ni ")
	Msg2Player("H�c ���c v� c�ng 'Phi�u Tuy�t Xuy�n V�n'. ")
	Msg2Player("H�c ���c tuy�t k� Nga Mi ph�i 'Tr� Li�u Thu�t' ")
end;

--------------------- 50������ -----------------------
function L50_get_yes()
	Talk(1,"","<color=Red>T� H�i ��i s� <color> b� quan �� l�u, b�nh th��ng kh�ng mu�n g�p ng��i ngo�i, ng��i c� th� �i t�m s� �� <color=Red>T� V�n Ph�p s�<color>c�a �ng. ")
	AddEventItem(23)
	Msg2Player("Nh�n nhi�m v� ��n T�n T��ng t�: ��a Kim Tuy�n T� T��ng Kim Cang kinh ��n T�n T��ng t� � Th�nh ��. ")
	Msg2Player("Nh�n ���c Kim Tuy�n T� T��ng Kim Cang Kinh. ")
	SetTask(1, 50*256+50)
	AddNote("G�p Thanh Hi�u S� Th�i � Ch�nh �i�n, nh�n nhi�m v� ��n T�n T��ng t�, giao Kim Tuy�n T� T��ng Kim Cang kinh. ")
end;

function L50_get_no()
	Talk(1,"","V�y h�y t�m �ng �i!")
end;

function L50_prise()
	Talk(1,"","Chuy�n n�y ng��i l�m r�t t�t, ng��i t� ch�t th�ng minh, ch� c�n ti�p t�c c� g�ng, ti�n �� nh�t ��nh r�ng m�!")
	AddNote("Quay v� Ch�nh �i�n ph�c m�nh Thanh Hi�u S� Th�i, ho�n th�nh nhi�m v� T�n T��ng t�. ���c th�ng ch�c T�n Hoa Thi�n N�, h�c ���c Ph�t Quang Ph� Chi�u, Ph�t T�m T� H�u, T� H�ng Ph� ��. ")
	SetRank(18)
	SetTask(1, 60*256)
--	AddMagic(92)
	add_em(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! B�n �� ���c th�ng ch�c T�n Hoa Thi�n N�! H�c ���c Ph�t T�m T� H�u. ")
	AddNote("Nhi�m v� ho�n th�nh, ���c phong T�n Hoa Thi�n N� ")
end;

----------------------- ��ʦ���� ------------------------
function L60_get_yes()
	Talk(1,"","Nghe n�i g�n ��y <color=Red>Thanh H�a<color> xu�t hi�n � <color=Red>Tr��ng Giang nguy�n ��u<color>, ng��i ph�i h�t s�c c�n th�n! ")
	SetTask(1, 60*256+50)
	AddNote("G�p Thanh Hi�u S� Th�i � Ch�nh �i�n, nh�n nhi�m v� xu�t s�, gi�nh l�i Y�n Ng�c Ch� Ho�n. ")
	Msg2Player("Nh�n nhi�m v� xu�t s� Nga Mi ph�i: �o�t v� t�n v�t c�a ch��ng m�n Y�n Ng�c Ch� Ho�n. ")
end;

function L60_get_no()
	Talk(1,"","Xem ra ta ch� c� th� �em tr�ng tr�ch n�y giao cho ng��i kh�c th�i!")
end;

function L60_prise()
	Talk(1, "","Ch�c m�ng b�n th�nh ngh� xu�t s�! B�n ���c phong l� Th�nh N�. T� h�m nay c� th� t� do h�nh hi�p giang h�! B�n c� th� ch�n gia nh�p m�n ph�i kh�c ti�p t�c h�c ngh�, c�ng c� th� x�y d�ng bang h�i m� r�ng th� l�c tr�n giang h�. Ho�c l�m m�t ��c h�nh n� hi�p c�ng r�t oai phong! Giang h� ki�m hi�p, bi�n r�ng tr�i cao, hy v�ng b�n ph�t tri�n quy�n c��c, nh�t tri�n h�ng ��!")
	Msg2Player("Ch�c m�ng ng��i �� h�c th�nh t�i! Ng��i �� ���c phong l� Th�nh n� Nga Mi ph�i! Danh v�ng t�ng th�m 120 �i�m! ")
--	AddGlobalCountNews("����"..GetName().."�ճɳ�ʦ�����ͬ��ʦ����ɽ��������", 1)
	Msg2SubWorld("�� t� Nga Mi ph�i "..GetName().."Th�nh t�i xu�t s�, t� bi�t c�c s� mu�i ��ng m�n �� xu�ng n�i h�nh t�u giang h� ")
	AddRepute(120)
	SetRank(74)
	SetTask(1, 70*256)
	SetFaction("") 		   					--����˳�������
	SetCamp(4)
	SetCurCamp(4)
	AddNote("V� ��n Ch�nh �i�n giao Y�n Ng�c Ch� Ho�n cho Thanh Hi�u S� Th�i, ho�n th�nh nhi�m v� xu�t s�. ���c th�ng l�m Th�nh n�. ")
end;

function no()
end;

-------------------- �������� ---------------------
function Uworld125_lose()
	DelItem(388)
	AddEventItem(389)
	SetTask(125,30)
	Msg2Player("��a ra V� T� Thi�n Th�, l�y Nga My l�nh ti�n. ")
	AddNote("L�y ���c l�nh ti�n, v� Th�nh �� t�m Ti�u B� B� l�nh th��ng. ")
end

function Uworld125_finish()
	if (GetTask(1) >= 70*256) and (GetTask(1) ~= 75*256) then
		Talk(4,"","Xem ra, duy�n ph�n gi�a Nga Mi v�i thi�n th� �� t�n, s� m�ng n�y l� c�a c�c h� m�i ��ng!","T�i h�?","Ph�i, c� l� ch� c� ng��i m�i th�u hi�u ���c b� m�t b�n trong. B�n ni s� �em nh�ng chi�u th�c ghi tr�n s�ch truy�n th� cho ng��i, mong ng��i c� th� ��t th�nh, ��ng u�ng ph� m�t l�n luy�n c�ng kh� nh�c!","�� t� nh�t ��nh kh�ng ph� l�ng. T� nay c� g� d�n d�, �� t� nh�t nh�t tu�n theo!")
		if (HaveMagic(328) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(328,1)
		end
		if (HaveMagic(380) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(380,1)
		end
		if (HaveMagic(332) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(332)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("Ng��i �� h�c Tam Nga T� Tuy�t, Phong L� Th�y �nh, Ph� �� T�ng Sinh ")
		SetTask(125,255)  --ѧ�ü��ܵ����ñ���255
	else
		Talk(1,"","Quy�n thi�n th� n�y v�n kh�ng c� ng��i n�o tu luy�n ���c n�n ��nh ph�i ph�i �� trong Kinh L�u ch� ��i h�u nh�n. Ng��i b�n ba v�t v� �� l�u, m�n qu� nh� n�y xin g�i t�ng ng��i!","V�y �� t� c�ng kh�ng kh�ch s�o!")
	   SetTask(125,245)  --������������ñ���245
	end
	add_repute = ReturnRepute(30,100,4)			-- �������������30�㣬��100����ÿ���ݼ�4%
	AddRepute(add_repute)
	Msg2Player("Thi�n th� Nga My quay v� nh� �� ��nh, nhi�m v� ho�n th�nh. Danh v�ng t�ng th�m "..add_repute.."�i�m.")
	AddNote("Thi�n th� Nga My quay v� nh� �� ��nh, nhi�m v� ho�n th�nh. ")
end
