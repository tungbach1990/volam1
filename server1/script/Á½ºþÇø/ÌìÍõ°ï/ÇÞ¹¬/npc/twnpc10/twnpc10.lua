--description: �������޹� ������������ʦ�����ط���������
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ���
-- Update��Dan_Deng(2003-10-27)Ϊ�ط�ʦ���������ȡ�������ܣ��Լ��������ɶ�Ӧ

Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


function main()
	if (vt06_isactive() ~= 0) then
		Say("T�m ta c� vi�c g�?", 2, "Mu�n th�nh gi�o ��i s�!/oldentence", "M�ng l� �n S�, t�i h� �� t�m �� �Th� �n S�� v� �Th� Cao ��./vt06_prizeenter");
		return
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�."
	G_TASK:OnMessage("Thi�n V��ng", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 1) then
		tbDailog:AddOptEntry("H�c k� n�ng c�p 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Mu�n th�nh gi�o vi�c kh�c", oldentence)
	tbDailog:Show() 
	
end

function oldentence()
--	if (check_skill() == 0) then
--		return
--	end

	UTask_tw = GetTask(3);
	local nFactID = GetLastFactionNumber();

	if (UTask_tw == 70*256) and (GetFaction() == "tianwang") then			-- ��ʦ��������
		SetFaction("")
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_tw == 70*256) and (GetTask(7) >= 5*256) and (GetTask(7) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(7,0)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_tw == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(3,70*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_tw == 80*256 and nFactID == 1 and GetCamp() == 3 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tianwang");
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	elseif (UTask_tw == 70*256 and nFactID == 1 and GetCamp() ~= 4 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	end
	local tbDes = {"��i ngh� ��u s�/#daiyitoushi_main(1)", "Mu�n th�nh gi�o vi�c kh�c/common_talk"};
	
	Say("G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tw = GetTask(3);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),3) == 0) then				-- ��������������
		Talk(1,"","Tri�u ��nh nh� T�ng ngu xu�n, kh�ng ��i tr�i chung v�i D��ng gia ta. N�m x�a S� V��ng c�ng cha ta th� quy�t di�t T�ng. D��ng Anh tuy b�t t�i, nh�ng c�ng quy�t th�c hi�n ch� l�n!")
		Uworld40 = SetBit(GetTask(40),3,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 60*256+40) and (HaveItem(96) == 1) then					--�õ���������
			Talk(3, "L60_prise", "Thu�c h� kh�ng d�m khinh s� m�nh, �� l�y ���c 'Thi�n V��ng Di Th�', xin Bang ch� xem qua! ", "T�t qu�! L�y ���c 'Thi�n V��ng Di Th�' kh�ng nh�ng b�o to�n ���c b�n bang m� c�n c� th� ng�n ch�n ���c tai ��ng tr�n ch�n v� l�m! Ng��il�m r�t t�t! T� h�m nay tr� �i, ng��ic� th� t� do h�nh t�u giang h�!", "Ch�c m�ng b�n th�nh ngh� xu�t s�! B�n ���c phong l� K�nh Thi�n Nguy�n So�i, t� nay v� sau c� th� t� do h�nh t�u giang h�! Hy v�ng b�n s� ph�t huy n�ng l�c, ph�t tri�n ti�n ��!")
		elseif (UTask_tw == 60*256) and (GetLevel() >= 50) then
			Talk(3, "L60_get", "Nh� n�m x�a, S� V��ng kh�i binh t�i ��ng ��nh H�, Nam kh�ng Tri�u T�ng, B�c ch�ng Kim binh. Sau khi S� V��ng b�ng h�, ngh�a qu�n c�n l�i ti�n c� cha ta ��i Th�nh Thi�n V��ng l�m l�nh ��o. Ngh�a qu�n ph�t tri�n m�nh m�, tri�u ��nh ho�ng s� c� qu�n ��n t�m di�t. Trong tr�n huy�t chi�n cha ta kh�ng may b� b�n ph�n b�i b�n ��ng, �� hy sinh t�i Thanh Loa ��o", "Sau khi cha ta qua ��i, ta l�y ���c �o b�o, ki�m b�u v� m�t b� binh th� gi�u t�i <color=Red>Thanh Loa ��o<color>. T�n cu�n binh th� �� l� <color=Red>'Thi�n V��ng Di Th�'<color>, b�n trong kh�ng ch� ghi l�i ph��ng ph�p b� tr�n c�a cha ta, m� c�n ghi ch� chi ti�t ��a th� chi�n l��c c�a ��ng ��nh H�, v� th� ��y ���c xem nh� l� b� k�p c�a b�n bang. ", "Th� nh�ng g�n ��y kh�ng bi�t b� ai �� cung c�p th�ng tin ra ngo�i, cu�n s�ch n�y b� qu�n Kim d� ra, ch�ng �� c� b�n s�t th� ��n l�y c�p cu�n s�ch n�y. ")
		elseif (UTask_tw == 80*256) or (UTask_tw == 80) then						-- �ط�������ɳ���
			Say("Th� n�o! Mu�n h�nh t�u giang h� m�t phen �?",2,"V�ng, xin Bang ch� �n chu�n. /goff_yes","Kh�ng, ta t� th�y c�ng phut�p luy�n v�n ch�a ��. /no")
		elseif (UTask_tw > 60*256) and (UTask_tw < 70*256) then		--�Ѿ��ӵ���ʦ������δ���
			Talk(1,"","<color=Red>'Thi�n V��ng Di th�'<color> ���c gi�u trong m�t <color=Red>B�o r��ng <color>, B�o r��ng ���c gi�u � <color=Red>ph�a b�c Thanh Loa ��o<color>, tr��c ti�n c�n ph�i t�m ���c <color=Red>Ch�a kh�a �� m� B�o r��ng<color>.")
		else
			Talk(1,"","Kim qu�c c� � mu�n ng�ng cu�ng l�t �� v� l�m Trung Nguy�n ta, n�u nh� huynh �� ch�ng ta kh�ng ��ng t�m, l�m sao c� th� ch�ng ���c qu�n th�?")
		end
--	elseif (GetTask(7) == 5*256+10) then		-- ת����������
--		Say("�������Ѱ���Ҫ��ȥ����ȫ���书�������Ҫ��������Ͷ�������ɣ�",2,"���������Ѿ�/defection_yes","�����һ��ǲ���Ͷ������/defection_no")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tw == 70*256) and (GetTask(7) < 5*256) then		-- �ط�ʦ������
		Talk(1,"return_select","T�t l�m! H�nh t�u giang h� nh� gi�p �� nh�ng ng��i kh�n kh�!")
	elseif (GetCamp() == 4) and ((UTask_tw == 70*256+10) or (UTask_tw == 70*256+20)) then
		Say("Ng��i �� chu�n b� �� 5 v�n l��ng ch�a?",2,"�� chu�n b� xong/return_complete","V�n ch�a chu�n b� xong/no")
	elseif (UTask_tw >= 70*256) and (GetFaction() ~= "tianwang") then		--�Ѿ���ʦ
		Talk(1,"","Sau khi r�i kh�i Thi�n V��ng Bang, m�i ng��i v�n nh� anh em ru�t th�t!")
	else
		Talk(1,"","Thi�n V��ng Bang ��ng gi�a m�i th� T�ng Kim v�n ��ng v�ng, th�m ch� v�n ph�t tri�n m�nh m�, ��u do huynh �� trong Bang �o�n k�t m�t l�ng")
	end
end

---------------------- ���ܵ������ ------------------------
function check_skill()
	x = 0
	skillID = 38					-- �̹ž�ʽ
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- ���м��ܷ����仯���������ߣ����򷵻ؼ�������
		Say("Vi s� l�n n�y b� quan suy ngh� m�y ng�y, s�ng ch� ra ���c chi�u th�c m�i, b�y gi� truy�n l�i cho ng��i. H�c xong nh� ph�i t�nh d��ng m�t th�i gian �� kh�i l�m t�n th��ng kinh m�ch.",1,"�a t� s� ph� /KickOutSelf")
		return 0
	else
		return 1
	end
end

---------------------- �ط����� ----------------------
function goff_yes()
	Talk(1,"","T�t l�m! H�nh t�u giang h� nh� gi�p �� nh�ng ng��i kh�n kh�!")
	SetTask(3,70*256)
	AddNote("R�i kh�i Thi�n V��ng bang, ti�p t�c h�nh t�u giang h�. ")
	Msg2Player("Ban �� r�i kh�i Thi�n V��ng bang, ti�p t�c h�nh t�u giang h�. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()
-- ˢ������
	n = 0
	i=29; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ն����
	i=23; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ǹ��
	i=24; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	i=26; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	i=30; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �ط�����
	i=31; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ƾ�
	i=32; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ն
	i=33; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ľ�
	i=34; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ն
	i=35; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��������
	i=36; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ս��
	i=37; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �÷�ն
	i=38; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �̹ž�ʽ����ȡ�����ܣ�
	i=40; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �ϻ���
	i=41; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ѫս�˷�
	i=42; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������
	AddMagicPoint(n)
-- ˢ�꼼�ܺ����ת��������
	SetTask(7,5*256+20)
	SetTask(3,75*256)				-- Ϊԭ�����������
	SetRank(79)						-- ͷ�ν�Ϊ���Ԫ˧
	if (GetRepute() < 200) then
		Msg2Player("V� h�nh vi b�t trung v�i m�n ph�i, danh v�ng c�a b�n gi�m xu�ng "..GetRepute().."�i�m!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V� h�nh vi b�t trung v�i m�n ph�i, danh v�ng c�a b�n gi�m xu�ng 200 �i�m! ")
		AddRepute(-200)
	end
	AddNote("D��ng Anh ph� b� v� c�ng Thi�n V��ng bang c�a b�n, �o�t l�i ch�c K�nh Thi�n Nguy�n So�i d�ng th�i c�ng b� cho thi�n h� b�n �� ra kh�i Thi�n V��ng Bang. B�y gi� ng��i c� th� gia nh�p Thi�u L�m ph�i. ")
	Msg2Player("D��ng Anh ph� b� v� c�ng Thi�n V��ng bang c�a b�n, �o�t l�i ch�c K�nh Thi�n Nguy�n So�i d�ng th�i c�ng b� cho thi�n h� b�n �� ra kh�i Thi�n V��ng Bang. B�y gi� ng��i c� th� gia nh�p Thi�u L�m ph�i. ")
	Talk(1,"KickOutSelf","Th�t ��ng ti�c! Ta ph�i thu h�i l�i v� c�ng �� d�y ng��i! H�y b� danh x�ng K�nh Thi�n Nguy�n So�i c�a ng��i")
end

function defection_no()
	SetTask(7,1*256)				-- Ϊ��ͼ��ʦ������ǣ��Ա�������ʱ֮��
	AddNote("B�n t� b� � ��nh gia nh�p Thi�u L�m ph�i. ")
	Msg2Player("B�n t� b� � ��nh gia nh�p Thi�u L�m ph�i. ")
end

function return_select()
	Say("��ng v�y! S�c m�t con ng��i ch� c� h�n, ph�i �o�n k�t c�ng m�i ng��i th� m�i n�n chuy�n. B�n bang v�n c�n tuy�t k� tr�n ph�i 'Kim Chung Tr�o', ch� truy�n cho nh�ng �� t� trung th�nh. Th� n�o,c� mu�n quay l�i b�n bang kh�ng?",2,"V�ng, ta mu�n tr� l�i Thi�n V��ng bang /return_yes","Kh�ng, ta ch� bu�t mi�ng n�i v�y th�i. /return_no")
end;

function return_yes()
	Talk(2,"","R�t t�t! Tr��c m�t qu�n ta �ang giao chi�n v�i qu�n T�ng, qu�n ph� kh�ng ��, ng��i n�p 50000 l��ng th� c� th� tr� l�i b�n bang h�c Kim Chung Tr�o","V�ng! Xin �� �� t� chu�n b� m�t ch�t. ")
	SetTask(3,70*256+20)
	AddNote("H� tr� 50000 l��ng qu�n ph� cho Thi�n V��ng bang c� th� quay l�i m�n ph�i. ")
	Msg2Player("H� tr� 50000 l��ng qu�n ph� cho Thi�n V��ng bang c� th� quay l�i m�n ph�i. ")
end;

function return_no()
	Talk(1,"","Ta ch� l� nh�n ti�n gh� th�m ��ng m�n th�i!")
end;

function return_complete()
	if(GetCash() >= 50000) then								-- ��50000��
		Talk(1,"","R�t t�t! Hoan ngh�nh ng��i tr� l�i Thi�n V��ng Bang, ta phong ng��i l� K�nh Thi�n Nguy�n So�i. ")
		Pay(50000)
		SetTask(3, 80*256)
		SetFaction("tianwang")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(69)
--		if (HaveMagic(36) == -1) then
--			AddMagic(32)
--			AddMagic(41)
--			AddMagic(324)
--			AddMagic(36)
		add_tw(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("B�n h�c ���c tuy�t k� tr�n ph�i c�a Thi�n V��ng bang: Thi�n V��ng Chi�n �, V� C�ng V� T�m Tr�m, Huy�t Chi�n B�t ph��ng, Th�a Long Quy�t. ")
--		end
		AddNote("�� quay tr� l�i Thi�n V��ng bang. ")
		Msg2Faction(GetName().." �� tr� l�i Thi�n V��ng bang, ���c phong l� K�nh Thi�n Nguy�n So�i")
	else
		Talk(2,"","H�?H�nh nh� v�n ch�a ��?","Xin l�i! �� ta ki�m tra l�i.")
	end
end;

---------------------- ��ʦ���� ----------------------
function L60_get()
	Say("<color=Red>'Thi�n V��ng Di th�'<color> tuy�t ��i kh�ng th� �� r�i v�o tay ng��i Kim. Ng��i h�y l�p t�c ��n <color=Red>Thanh Loa ��o<color>, l�y <color=Red>'Thi�n V��ng Di th�'<color> v� ��y! C� l�m ���c kh�ng?", 2, "Thu�c h� t�n l�c thi h�nh /L60_get_yes", "E r�ng kh� c� th� nh�n nhi�m v� /no")
end;

function L60_get_yes()
	Talk(1,"","<color=Red>'Thi�n V��ng Di th�'<color> ���c gi�u trong m�t <color=Red>B�o r��ng <color>, B�o r��ng ���c gi�u � <color=Red>ph�a b�c Thanh Loa ��o<color>, tr��c ti�n c�n ph�i t�m ���c <color=Red>Ch�a kh�a �� m� B�o r��ng<color>. Ng��i h�y l�p t�c �i thuy�n ��n <color=Red>Thanh Loa ��o<color>. Nh� pah� h�t s�c c�n th�n!")
	SetTask(3, 60*256+20)
	AddNote("T�i T�m cung Thi�n V��ng bang (223, 196) g�p D��ng Anh, ti�p nh�n nhi�m v� �i Thanh Loa ��o thu h�i Thi�n V��ng Di Th�. ")
	Msg2Player("T�i T�m cung Thi�n V��ng bang (223, 196) g�p D��ng Anh, ti�p nh�n nhi�m v� �i Thanh Loa ��o thu h�i Thi�n V��ng Di Th�. ")
end;

function L60_prise()
DelItem(96)
Msg2Player("Ch�c m�ng b�n �� xu�t s� th�nh c�ng, b�n ���c phong l� Tr�n Bang Nguy�n So�i! Danh v�ng t�ng th�m 120 �i�m! ")
--AddGlobalCountNews(GetName().."�ճɳ�ʦ�����ͬ��ʦ�ܿ�ʼ����������", 1)
Msg2SubWorld("Thi�n V��ng"..GetName().."Xu�t s� th�nh c�ng, c�o bi�t D��ng bang ch� v� c�c ��ng m�n huynh ��, ti�p t�c h�nh t�u giang h�. ")
AddRepute(120)
SetRank(79)
SetTask(3, 70*256)
SetFaction("")
SetCamp(4)			   				--����˳�������
SetCurCamp(4)
AddNote("Quay l�i T�m cung Thi�n V��ng Bang, ��a Thi�n V��ng Di Th� cho Bang ch� D��ng Anh, ho�n th�nh nhi�m v� xu�t s�. Th�ng ch�c K�nh Thi�n Nguy�n So�i.. ")
end;

function no()
end
