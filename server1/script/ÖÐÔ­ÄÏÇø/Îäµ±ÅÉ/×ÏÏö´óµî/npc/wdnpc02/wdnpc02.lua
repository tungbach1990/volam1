--description: �䵱�ɵ�һ���ˡ��䵱10������40�����񡢳�ʦ�����ط���������
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ���
-- �޸�Dan_Deng�Ĵ���QBJ
-- Update��Dan_Deng(2003-10-27)Ϊ�ط�ʦ���������ȡ�������ܣ��Լ��������ɶ�Ӧ

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ
--dinhhq: new lunar year 2011
Include("\\script\\vng_event\\LunarYear2011\\npc\\mastergift.lua")

function main()
	if tbVNG_LY2011:isActive() == 1 then
		local tbSay = 
			{
				"T�ng b�nh ng�y xu�n/#tbMasterGift:getGift('wudang')",
				"Mu�n th�nh gi�o vi�c kh�c/oldMain"
			}
		Say("N�m m�i an khang th�nh v��ng", getn(tbSay), tbSay)
		return
	end
	oldMain()
end
function oldMain()
	if (vt06_isactive() ~= 0) then
		Say("T�m ta c� vi�c g�?", 2, "Mu�n th�nh gi�o ��i s�!/oldentence", "M�ng l� �n S�, t�i h� �� t�m �� �Th� �n S�� v� �Th� Cao ��./vt06_prizeenter");
		return
	end;
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 8) then
		Describe("T�m ta c� vi�c g�?", 2,
			"H�c k� n�ng c�p 120./lvl120skill_learn",
			"Mu�n th�nh gi�o vi�c kh�c/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_wd = GetTask(5)
	local nFactID = GetLastFactionNumber();

	if (UTask_wd == 70*256) and (GetFaction() == "wudang") then			-- ��ʦ��������
		SetFaction("")
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_wd == 70*256) and (GetTask(9) >= 5*256) and (GetTask(9) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(9,0)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_wd == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(5,70*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_wd == 80*256 and nFactID == 8 and GetCamp() == 1 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("wudang");
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	elseif (UTask_wd == 70*256 and nFactID == 8 and GetCamp() ~= 4 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	end

	local tbDes = {"��i ngh� ��u s�/#daiyitoushi_main(8)", "Mu�n th�nh gi�o vi�c kh�c/common_talk"};
	
	Say("G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_wd = GetTask(5)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),5) == 0) then				-- ��������������
		Talk(1,"","B�y gi� Minh ch� l�y danh ngh�a ' Thi�n h� ��i ngh�a' �� m�i, V� �ang ph�i kh�ng th� kh�ng ��n. H�y chuy�n l�i t�i ��c C� minh ch�: V� �ang ph�i tu�n theo s� s�p x�p c�a Minh ch�.")
		Uworld40 = SetBit(GetTask(40),5,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 4) and (GetFaction() == "wudang") then
		if (UTask_wd == 60*256+20) and (HaveItem(69) == 1 and HaveItem(70) == 1 and HaveItem(71) == 1) then
			Talk(2, "L60_prise", "C� th� l�m ng��i lo cho c�i lo c�a thi�n h�, l� �� ��t ���c m�t ch� 'hi�p'. B�y gi� th�i th� l�an l�c, b�nh d�ch, chi�n tranh, b�o quy�n, nh�n d�n �au kh� l�m than, ng��i c� th� l�m thu�n theo l�ng d�n, �em v� ngh� �� h�c t�o ph�c cho b� t�nh", "Ch�c m�ng b�n th�nh ngh� xu�t s�! B�n ���c phong l� Huy�n V� Th�n Th�, T� h�m nay c� th� t� do h�nh hi�p giang h�!C� th� ch�n gia nh�p v�o m�n ph�i kh�c ti�p t�c h�c ngh�, c�ng c� th� t� l�p bang h�i m� r�ng th� l�c giang h�, ho�c l�m ��c kh�ch h�nh oai phong l�m li�t! Giang h� ki�m hi�p, tr�i cao ��t r�ng, hy v�ng b�n s� ti�p t�c ph�t tri�n ti�n �� c�a m�nh")
		elseif (UTask_wd == 60*256) and (GetLevel() >= 50) then					--��ʦ����
			Say("Tr�n <color=Red>Th�i T� Nham<color> c� <color=Red>3 c�i B�o r��ng <color>, m�i c�i B�o r��ng c� ni�m l� b�a, n�u ng��i c� th� ho�n th�nh nhi�m v� ghi tr�n l� b�a, th� c� th� m� B�o r��ng l�y <color=Red>3 m�n b�o v�t<color> mang v� ��y!", 2, "Ti�p nh�n nhi�m v� /L60_get_yes", "T�m th�i kh�ng xu�t s� /L60_get_no")
		elseif ((UTask_wd == 40*256+60) or (UTask_wd == 40*256+80)) and (HaveItem(164) == 1) then		--40���������
			Talk(3, "L40_prise", " S� ph�! �� t� thay Chu s� huynh �i n�i Ph�c Ng�u m�t chuy�n,�em th� giao cho Nhu�n N��ng, ��y l� th� tr� l�i c�a b� �y!", "Th� ra l� v�y.....vi�c n�y ng��i kh�ng n�n n�i lung tung, nh� ch�a?", " �� t� hi�u r�! ")
--		Ϊ��ʱ������򲹶�������ֵΪ35��δѧ�䵱����(151)�ģ�Ҳ���Խ�10��������ȡ����
--		elseif ((UTask_wd == 10*256) or (((UTask_wd == 35) or (UTask_wd >= 20*256)) and (HaveMagic(151) == -1))) and (GetLevel() >= 10) and (GetFaction() == "wudang") then
		elseif (UTask_wd == 10*256) and (GetLevel() >= 10) then
			Talk(1,"","�� t� V� �ang ph�i ta ��u ph�i h�c thu�c <color=Red>'��o ��c Kinh'<color>. Ng��i h�y ��n th�nh gi�o <color=Red>Di�p Ti�p M�<color> s� th�c, h�c thu�c'��o ��c Kinh'. Sau �� quay l�i l�i t�m ta")
			SetTask(5, 10*256+20)
			AddNote("T�i T� Ti�u ��i �i�n g�p ��o Nh�t Ch�n Nh�n, nh�n nhi�m v� ��o ��c kinh, t�m Di�p Ti�p M� h�c ��o ��c kinh. ")
			Msg2Player("T�i T� Ti�u ��i �i�n g�p ��o Nh�t Ch�n Nh�n, nh�n nhi�m v� ��o ��c kinh, t�m Di�p Ti�p M� h�c ��o ��c kinh. ")
		elseif (UTask_wd == 10*256+50) then					--10������
			Talk(1,"L10_Q1","�� thu�c ch�a? Vi s� mu�n ki�m tra ng��i, nghe r� ch�a?")
		elseif (UTask_wd == 10*256+60)  then
			L10_Q2()
		elseif (UTask_wd == 10*256+70)  then
			L10_Q3()
		elseif (UTask_wd == 80*256) then						-- �ط�������ɳ��루�¼Ӽ��ܣ�
			check_skill()
		elseif (UTask_wd == 10*256+20) then
			Talk(1,"","�� t� V� �ang ph�i ta ��u ph�i h�c thu�c <color=Red>'��o ��c Kinh'<color>. Ng��i h�y ��n th�nh gi�o <color=Red>Di�p Ti�p M�<color> s� th�c, h�c thu�c'��o ��c Kinh'. Sau �� quay l�i l�i t�m ta")
		elseif (UTask_wd > 60*256) and (UTask_wd < 70*256) then					--��δ��ɳ�ʦ����
			Talk(1,"","Ng��i ph�i m� 3 b�o r��ng tr�n<color=Red>Th�i T� Nham<color>ph�a sau<color=Red>h�u s�n<color>, l�y ���c<color=Red>3 b� b�o v�t<color>b�n trong, m�i c� th� xu�t s� ���c!")
		elseif (UTask_wd >= 50*256) and (GetFaction() == "wudang") then					--�Ѿ����40��������δ�ӵ���ʦ����
			Talk(1,"","Chuy�n c�a Nhu�n N��ng kh�ng ���c n�i lung tung, nh� ch�a?")
		else					--�Ѿ����10��������δ���40������ȱʡ�Ի���
			Talk(1,"","L�m ng��i c� th� k�t th�nh huynh �� b�ng h�u, ��u l� do duy�n s� c�!")
		end
--	elseif (GetTask(9) == 5*256+10) then		-- ת���ɵ�����
--		Say("��һ���ˣ��������ŷ粻��������Ϊ�����ǣ�ת���ɵĻ��ұ����ջ������б������ա������ִ��Ҫ�����أ�",2,"���������Ѿ�/defection_yes","���һ��ǲ�ȥ��/defection_no")
	elseif (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_wd == 70*256) and (GetTask(9) < 5*256) then		-- �ط�ʦ������
		Talk(2,"return_select","H� s�n trong nh�ng ng�y n�y, ng��i c�m th�y th� n�o?","Phi�u b�t giang h� nhi�u ng�y m�i bi�t v� c�ng c�a m�nh th�t t�.")
	elseif (GetCamp() == 4) and ((UTask_wd == 70*256+10) or (UTask_wd == 70*256+20)) then		-- �ط�ʦ��������
		Say("Chu�n b� �� 5 v�n l��ng ch�a?",2,"�� chu�n b� xong/return_complete","V�n ch�a chu�n b� xong/return_uncompleted")
	elseif (UTask_wd >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","Tuy ng��i �� xu�t s�, ta c�ng c� v�i l�i mu�n g�i g�m c�ng ng��i: V�i ng��i t�p v�, ��o v� v�n r�t quan tr�ng, ��c v� c�ng c�ng ph�i chuy�n t�m tu d��ng. Ng��i h�c v� m� kh�ng tu luy�n ��c s� kh�ng th� ��t ���c c�nh gi�i v� h�c, mong ng��i c� g�ng tu d��ng!")
	else
		Talk(1,"","V� h�c c� ��o, theo ���ng ch�nh ��o m�i c� th� ��t th�nh. N�u �i nh�m ���ng, s� u�ng c�ng c� ��i tu luy�n")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
--	if (HaveMagic(267) == -1) then
--		AddMagic(267)					-- ��������
--		Msg2Player("��ѧ���ˡ��������¡�")
--		Say("��һ���ˣ�Ϊʦ��αչؿ�˼���գ��´���һ�С��������¡������ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
		Say("V� ngh� c�a ng��i �� c� nhi�u ti�n b�! Ch�c c� th� h� s�n th� luy�n m�t phen!",2,"D�! �� t� �i li�n /goff_yes","�� t� t�p luy�n v�n ch�a �� /no")
--	end
end

-------------------------- �ط�������� ---------------------
function goff_yes()
	Talk(1,"","���c! H�y ghi nh� t�n ch� c�a b�n ph�i: 'Lu�n l�m vi�c thi�n, gi�p �� k� y�u �u�i ngh�o kh�'")
	SetTask(5,70*256)
	AddNote("R�i kh�i V� �ang ph�i, l�i chu du giang h�. ")
	Msg2Player("R�i kh�i V� �ang ph�i, l�i chu du giang h�. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- ת�ɣ��ջ�ԭ�����书����
-- ˢ������
	n = 0
	i=153; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ŭ��ָ
	i=151; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �䵱����
	i=152; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �䵱ȭ��
	i=155; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �׺�����
	i=156; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �����ķ�
	i=157; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	i=158; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ɾ���
	i=159; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������
	i=160; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������
	i=161; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �����ķ�
	i=162; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��һ����
	i=164; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	i=165; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �����޽�
	i=166; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ̫����
	i=267; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	AddMagicPoint(n)
-- ˢ�꼼�ܺ����ת��������
	SetTask(9,5*256+20)
	SetTask(5,75*256)				-- Ϊԭ�����������
	SetRank(63)
	if (GetRepute() < 200) then
		Msg2Player("V� h�nh vi b�t trung v�i m�n ph�i, danh v�ng c�a b�n gi�m xu�ng "..GetRepute().."�i�m!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V� h�nh vi b�t trung v�i m�n ph�i, danh v�ng c�a b�n gi�m xu�ng 200 �i�m! ")
		AddRepute(-200)
	end
	AddNote("Thu h�i v� c�ng V� �ang, h�y b� ch�c v� Huy�n v� ch�n nh�n. B�n c� th� gia nh�p C�n L�n ph�i. ")
	Msg2Player("Thu h�i v� c�ng V� �ang, h�y b� ch�c v� Huy�n v� ch�n nh�n. B�n c� th� gia nh�p C�n L�n ph�i. ")
	Talk(1,"KickOutSelf","N�u �� nh� th�, ta ��nh ph�i thu l�i v� ngh� b�n ph�i m� ng��i �� h�c!")
end

function defection_no()
	AddNote("B�n t� b� suy ngh� quay l�i C�n L�n ph�i. ")
	Msg2Player("B�n t� b� suy ngh� quay l�i C�n L�n ph�i. ")
	SetTask(9,1*256)			-- Ϊ��ͼ��ʦ������ǣ��Ա�������ʱ֮��
end

function return_select()
	Say("C� r�t nhi�u ng��i nghi�n c�u v� ph�t huy v� c�ng c�a b�n ph�i. Th� n�o? Ng��i c� h�ng th� quay l�i c�ng ta nghi�n c�u v� h�c ��n c�nh gi�i t�i cao kh�ng?",2,"�� t� hy v�ng c� th� c�ng nghi�n c�u v� h�c /return_yes","Kh�ng c�n ��u/return_no")
end;

function return_yes()
	Talk(1,"","V� �ang s�n c� nhi�u du kh�ch th��ng l�m, s�n l� c�ng v� th� m� h� h�ng nhi�u! �� th� th�ch ng��i, ng��i c� th� quy�n g�p 5 v�n l��ng ti�n tu s�a s�n l� kh�ng? ")
	SetTask(5,70*256+20)
	AddNote("Giao 50000 l��ng b�c c� th� quay l�i V� �ang ph�i. ")
	Msg2Player("Giao 50000 l��ng b�c c� th� quay l�i V� �ang ph�i. ")
end;

function return_no()
	Talk(1,"","Xin �a t� h�o � c�a Ch��ng m�n. Nh�ng hi�n ��o suy ma th�nh, sinh linh ch�u c�nh th��ng t�m. �� t� sao c� th� m�t l�p tai ng�!")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","Hay l�m! Ta s� th�ng b�o tin ng��i �� quay l�i m�n ph�i!")
		Pay(50000)
		SetTask(5, 80*256)
		SetFaction("wudang")
--		if (HaveMagic(166) == -1) then
--			AddMagic(165)
--			AddMagic(267)
--			AddMagic(166)
		add_wd(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("B�n h�c ���c tr�n ph�i tuy�t h�c Th�i C�c Th�n C�ng, V� Ng� V� Ki�m, Tam Ho�n Thao Nguy�t. ")
--		end
		SetCamp(1)
		SetCurCamp(1)
		SetRank(73)
		AddNote("�� tr� v� V� �ang ph�i,��ng trong h�ng ng�. ")
		Msg2Player(GetName().."���c phong l�m Huy�n V� Ch�n Qu�n c�a V� �ang ph�i, ti�p t�c � l�i V� �ang t�p luy�n. ")
	else
		Talk(2,"","H�? H�nh nh� kh�ng �� l�m!","�! Xin l�i! �� �� t� ki�m tra l�i c�i ��!")
	end
end;

function return_uncompleted()
	Talk(1,"","N�o, c� l�n!")
end;

------------------- 10������ --------------------
function L10_Q1()
	Say("C�u th� nh�t kh�i bi�n trong ch��ng 1 '��o ��c Kinh' l� g�?", 3, "��o sinh nh�t, nh�t sinh nh�, nh� sinh tam, tam sinh v�n v�t /no", "Nh�n ph�p ��a, ��a ph�p thi�n, thi�n ph�p ��o, ��o ph�p t� nhi�n /no", "��o kh� ��o, phi th��ng ��o; danh kh� danh, phi th��ng danh /L10_Q2")
end;

function L10_Q2()
	SetTask(5,10*256+60)
	Say("C�u h�i k� ti�p: '��i T��ng' trong '��i T��ng v� h�nh' l� ch� c�i g�?", 3, "M�t lo�i ��ng v�t /no", "H�nh tr�ng l�n nh�t /L10_Q3", "Th�i t��ng /no")
end;

function L10_Q3()
	SetTask(5,10*256+70)
	Say("Gi�i! C�u h�i cu�i c�ng: Ph�a sau c�a c�u 'Tri Nh�n Gi� Tr�, T� Tri Gi� Minh' l� c�u g�?", 3, "��i tr�c nh��c kh�c, ��i x�o nh��c chuy�t /no", "Th�ng nh�n gi� h�u l�c, t� th�ng gi� c��ng /L10_prise", "H�a h�, ph�c chi s� k�; h�a h�, h�a chi s� ph�c /no")
end;

function no()
	Talk(1,"","Xem ra ng��i ch�ng c� ch�t kh� c�ng g�! H�c thu�c '��o ��c Kinh' r�i h�y ��n!")
end;

function L10_prise()
	Talk(1,"","Xem ra ng��i �� b� ch�t c�ng phu luy�n t�p! Gi�i l�m!")
	SetRank(8)
	SetTask(5, 20*256)
--	AddMagic(152)
--	AddMagic(151)
	add_wd(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("V� T� Ti�u ��i �i�n, tr� l�i ch�nh x�c 3 c�u h�i c�a ch��ng m�n, ho�n th�nh nhi�m v� ��o ��c kinh. Tr� th�nh Nh�n T�n ��o nh�n. ")
	Msg2Player("Ch�c m�ng B�n! �� tr� th�nh Nh�n T�n ��o Nh�n! H�c ���c V� �ang Quy�n Ph�p, V� �ang Ki�m Ph�p. ")
end

----------------------- 40������ -----------------------
function L40_prise()
	DelItem(164)
	SetRank(11)
	SetTask(5, 50*256)
--	AddMagic(160)
	add_wd(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng B�n! Tr� th�nh Nh�p Quan ��o Nh�n! H�c ���c v� c�ng Th� V�n Tung c�a V� �ang ph�i. ")
	AddNote("��n T� Ti�u ��i �i�n, giao th� c�a Nhu�n N��ng cho ��o Nh�t Ch�n Nh�n, ho�n th�nh nhi�m v�. Tr� th�nh Nh�p Quan ��o nh�n. ")
end;

------------------------- ��ʦ���� -------------------------
function L60_get_yes()
Say("Ng��i ph�i m� 3 b�o r��ng tr�n<color=Red>Th�i T� Nham<color>ph�a sau<color=Red>h�u s�n<color>, l�y ���c<color=Red>3 b� b�o v�t<color>b�n trong, m�i c� th� xu�t s� ���c!", 0);
SetTask(5, 60*256+20)	
AddNote("G�p ��o Nh�t Ch�n Nh�n t�i T� Ti�u ��i �i�n, nh�n nhi�m v� xu�t s�, ra v�ch Th�i T� Nham sau n�i l�u 3 v�t qu� trong 3 B�o r��ng. ")
Msg2Player("G�p ��o Nh�t Ch�n Nh�n t�i T� Ti�u ��i �i�n, nh�n nhi�m v� xu�t s�, ra v�ch Th�i T� Nham sau n�i l�u 3 v�t qu� trong 3 B�o r��ng. ")
end;

function L60_get_no()
	Talk(1,"","C�ng t�t! V�y ng��i h�y � l�i V� �ang h�c ngh� th�m m�t th�i gian!")
end;

function L60_prise()
	DelItem(69)
	DelItem(70)
	DelItem(71)
--	AddGlobalCountNews(GetName().."�ճɳ�ʦ������λʦ��ʦ�ó�ɽ����������", 1)
	Msg2SubWorld("�� t� V� �ang ph�i "..GetName().."Xu�t s� th�nh c�ng, c�o bi�t c�c s� �� s� mu�i xu�t s�n h�nh hi�p tr��ng ngh�a! ")
	SetRank(63)
	SetTask(5, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("V� T� Ti�u ��i �i�n, l�y 3 b�n ch�n kinh giao cho ch��ng m�n ��o Nh�t Ch�n Nh�n, ho�n th�nh nhi�m v� x�t s�. Tr� th�nh ng��i gi�p vi�c, thu�n l�i xu�t s�. ")
	Msg2Player("Ch�c m�ng b�n xu�t s�! ���c phong l�m Huy�n V� Th�n Th�! Danh v�ng c�a b�n t�ng th�m 120 �i�m! ")
	AddRepute(120)
end;

function no()
end
