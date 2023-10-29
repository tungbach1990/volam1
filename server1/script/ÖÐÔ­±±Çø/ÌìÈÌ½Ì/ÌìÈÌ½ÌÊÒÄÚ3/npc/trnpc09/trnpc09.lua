--description: ���̽̽������պ��ҡ����̳̽�ʦ�����ط���������
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-14)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ���
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
				"T�ng b�nh ng�y xu�n/#tbMasterGift:getGift('tianren')",
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
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 7) then
		Describe("T�m ta c� vi�c g�?", 2,
			"H�c k� n�ng c�p 120./lvl120skill_learn",
			"Mu�n th�nh gi�o vi�c kh�c/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_tr = GetTask(4);
	local nFactID = GetLastFactionNumber();

	if (UTask_tr == 70*256) and (GetFaction() == "tianren") then			-- ��ʦ��������
		SetFaction("")
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_tr == 70*256) and (GetTask(8) >= 5*256) and (GetTask(8) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(8,0)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_tr == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(4,70*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_tr == 80*256 and nFactID == 7 and GetCamp() == 2 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tianren");
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	elseif (UTask_tr == 70*256 and nFactID == 7 and GetCamp() ~= 4 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	end

	local tbDes = {"��i ngh� ��u s�/#daiyitoushi_main(7)", "Mu�n th�nh gi�o vi�c kh�c/common_talk"};
	
	Say("G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tr = GetTask(4);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),4) == 0) then				-- ��������������
		Talk(1,"","��c C� Ki�m b� m�t tr� �? B�n gi�o v�n l� ��i Kim qu�c gi�o, ��c C� Ki�m ph�i ng��i ��n h�i l�o phu chuy�n n�y. ���c! Ng��i n�i l�i v�i ��c C� Ki�m r�ng: C�c ng��i ch� l� l� qu�n � h�p, d�m ch�ng v�i ��i qu�n h�ng m�nh c�a ��i Kim, h�y lo chuy�n h�u s� tr��c r�i h�y n�i! Ha ha ha!")
		Uworld40 = SetBit(GetTask(40),4,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 60*256) and (GetLevel() >= 50) then		-- ��ʦ��������
			Say("Th�nh th� c�a b�n gi�o l� cu�n s�ch ghi r� v� qu�c gi�o c�a ��i Kim-- <color=Red>cu�n s�ch da d�<color> c�a T�t M�n Gi�o Kinh V�n, cu�n s�ch n�y ���c Gi�o ch� c�t gi�u t�i <color=Red>Th�nh ��ng<color>, nghe n�i ai v�o Th�nh ��ng s� kh�ng c� ���ng v�. Ng��i v�n l� H� Gi�o Ph�p V��ng c�a b�n gi�o, c� d�m v�o Th�nh ��ng l�y cu�n s�ch �� kh�ng?", 2, "Thu�c h� t�n l�c thi h�nh /L60_get_yes", "Thu�c h� e r�ng kh�ng ��m nhi�m n�i/L60_get_no")
		elseif (UTask_tr == 60*256+20) and (HaveItem(127) == 1 and HaveItem(128) == 1 and HaveItem(129) == 1 and HaveItem(130) == 1 and HaveItem(131) == 1) then 
			DelItem(127)
			DelItem(128)
			DelItem(129)
			DelItem(130)
			DelItem(131)
			SetTask(28,0)		-- ���ӱ�����λ��ʥ�����ټ���ʹ��
			SetTask(4,60*256+50)		-- ������ѶϽ����������պ��Ҳ��ܽ�ʥ�����򻯳�����
			AddNote("Sau khi t�m �� n�m Thanh �o�n ki�m, quay l�i Thi�n Nh�n Gi�o, ���c ph�p v�o Th�nh ��ng. ")
			Msg2Player("B�n �� ���c ph�p v�o Th�nh ��ng ")
			Talk(1,"","R�t t�t! b�y gi� ng��i c� th� v�o Th�nh ��ng l�y cu�n s�ch da d� mang v� ��y.")
		elseif (UTask_tr == 60*256+70) and (HaveItem(132) == 1) then		-- ��ʦ�������
			Talk(2, "L60_prise", "��y qu� nhi�n l� Th�nh th� c�a b�n gi�o! T�t! T�t! L�o phu �� kh�ng nh�n l�m ng��i, v�i tr�nh �� v� c�ng c�ng nh� l�ng cam ��m c�a ng��i hi�n gi�, c� ng�y s� l�m n�n nh�ng chuy�n kinh thi�n ��ng ��a! Hy v�ng sau khi ng��i xu�t s�, s� kh�ng tr� th�nh k� th� c�a l�o phu! Ha ha ha!", "Ch�c m�ng b�n c� th� xu�t s�! B�n ���c phong l� T�t M�n Ph�p S� c�a Thi�n Nh�n gi�o, t� nay v� sau c� th� t� do h�nh t�u giang h�! Hy v�ng b�n s� ph�t huy n�ng l�c, ph�t tri�n ti�n ��!")
		elseif (UTask_tr == 80*256) then						-- �ط�������ɳ���
			check_skill()
		elseif (UTask_tr > 60*256) and (UTask_tr < 60*256+50) then					--�Ѿ��ӵ���ʦ������δ�õ���ѶϽ�
			Talk(1,"","Tr��c khi v�o <color=Red>Th�nh ��ng<color> l�y <color=Red>cu�n s�ch da d�<color>, ng��i ph�i ��n <color=Red>Bi�n Kinh<color> t�m <color=Red>n�m thanh �o�n ki�m<color> �ang l�u l�c.")
		elseif (UTask_tr >= 60*256+50) and (UTask_tr <= 60*256+70) then					--�Ѿ��ӵ���ʦ������δ�õ���Ƥ��
			Talk(1,"","<color=Red>cu�n s�ch da d�<color> � ph�a sau trong <color=Red>Th�nh ��ng<color>.")
		else
			Talk(1,"","X�a nay, quy�n cao ch�c tr�ng lu�n h�p d�n m�i ng��i, n�m x�a Th�nh Th��ng tuy r�t �n s�ng ta, nh�ng v�n c� l�ng �� k�, n�u kh�ng sao l�i ph�i Th�t c�ng ch�a ��n b�n gi�o l�m m�t ���ng ch� nh� nhoi n�y? �i! L�o phu kh�ng h� h� th�n l��ng t�m, nh�ng c�ng kh�ng qu�n n�i nh�ng l�i ph� b�ng d�m pha!")
		end
--	elseif (GetTask(8) == 5*256+10) then		-- ת���ɵ�ؤ��
--		Say("���պ��ң�ؤ���뱾���Ĳ��������㾹�뱳�����̸�Ͷؤ�С���ҷ�����Ĺ���",2,"�Բ��𣬵������Ѿ�/defection_yes","�һ��ǲ�ȥ��/defection_no")
	elseif (GetSeries() == 3) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tr == 70*256) and (GetTask(8) < 5*256) then		-- �ط�ʦ������
		Talk(1,"return_sele","Th�a Gi�o ch�, nh�ng ng��i xu�t s� r�i c� th� quay tr� l�i m�n ph�i ti�p t�c ph�ng s� kh�ng?")
	elseif (GetCamp() == 4) and ((UTask_tr == 70*256+10) or (UTask_tr == 70*256+20)) then		-- �ط�ʦ��������
		Say("�� chu�n b� �� 5 v�n l��ng ch�a?",2,"�� chu�n b� xong/return_complete","V�n ch�a chu�n b� xong/return_uncompleted")
	elseif (UTask_tr >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","Th�t l� h�u sinh kh� �y! V�i tr�nh �� v� c�ng c�ng nh� l�ng cam ��m c�a ng��i, s� c� ng�y l�m n�n nh�ng chuy�n kinh thi�n ��ng ��a! Hy v�ng sau khi ng��i xu�t s�, s� kh�ng tr� th�nh k� th� c�a l�o phu!")
	else
		Talk(1,"","Ch� c�n nh�ng ai c� t�i, th�t l�ng mu�n gia nh�p b�n gi�o, b�n gi�o s�n s�ng hoan ngh�nh.")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
--	if (HaveMagic(150) == -1) then
--		AddMagic(142)
--		AddMagic(148)
--		AddMagic(150)
--		AddNote("��ѧ�������ɾ�ѧ��ħ���塢�书͵�컻�ա�ħ����ɱ��")
--		Msg2Player("��ѧ�������ɾ�ѧ��ħ���塢�书͵�컻�ա�ħ����ɱ��")
--		Say("���պ��ң�Ϊʦ��αչؿ�˼���գ��Ľ��˱����书�����ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
		Say("Ng��i c� mu�n �i Nam tri�u th�m d� t�nh h�nh?",2,"���c, thu�c h� c�ng �ang mu�n th�m nh�p giang h� m�t phen. /goff_yes","Thu�c h� t� th�y luy�n t�p ch�a �� /no")
--	end
end

----------------------- �ط�������� --------------------
function goff_yes()
	Talk(1,"","T�t! Nh� ��ng sa v�o nh�ng c�m d� c�a Nam tri�u. ")
	SetTask(4,70*256)
	AddNote("R�i kh�i Thi�n Nh�n Gi�o, ti�p t�c h�nh t�u giang h�. ")
	Msg2Player("Ban r�i kh�i Thi�n Nh�n Gi�o, ti�p t�c h�nh t�u giang h�. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- ת�ɣ��ջ�ԭ�����书����
-- ˢ������
	n = 0
	i=135; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������Ѫ
	i=131; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���̵���
	i=132; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����ì��
	i=134; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���̴���
	i=136; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �����ٻ�
	i=137; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��Ӱ�ɺ�
	i=138; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ɽ�
	i=139; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ˮ����
	i=140; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �ɺ��޼�
	i=141; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ˮ����
	i=142; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ͵�컻��
	i=143; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ħ���
	i=145; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ָ����
	i=146; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������
	i=147; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ڤ����
	i=148; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ɱ��ȭ
	i=149; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ʴ��Ѫ��
	i=150; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ħ����
	i=254; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ζ���
	AddMagicPoint(n)
-- ˢ�꼼�ܺ����ת��������
	SetTask(8,5*256+20)
	SetTask(4,75*256)				-- Ϊԭ�����������
	SetRank(71)
	if (GetRepute() < 200) then
		Msg2Player("V� h�nh vi b�t trung v�i m�n ph�i, danh v�ng c�a b�n gi�m xu�ng "..GetRepute().."�i�m!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V� h�nh vi b�t trung v�i m�n ph�i, danh v�ng c�a b�n gi�m xu�ng 200 �i�m! ")
		AddRepute(-200)
	end
	AddNote("Sau khi b� �i c�c k� n�ng v� danh hi�u tr��ng l�o c�a Thi�n Nh�n Gi�o, B�y gi� b�n c� th� gia nh�p C�i Bang. ")
	Msg2Player("Sau khi b� �i c�c k� n�ng v� danh hi�u tr��ng l�o c�a Thi�n Nh�n Gi�o, B�y gi� b�n c� th� gia nh�p C�i Bang. ")
	Talk(1,"KickOutSelf","�� th�, h�y ph� b� v� c�ng, ng��i th�ch th� n�o s� nh� th� ��. ")
end

function defection_no()
	AddNote("B�n t� b� � ��nh gia nh�p C�i Bang. ")
	Msg2Player("B�n t� b� � ��nh gia nh�p C�i Bang. ")
	SetTask(8,1*256)			-- Ϊ��ͼ��ʦ������ǣ��Ա�������ʱ֮��
end

function return_sele()
	Say("Ng��i n�i mu�n quay l�i b�n gi�o �?",2,"Tu�n l�nh!/return_yes","Kh�ng. /return_no")
end;

function return_yes()
	Talk(2,"","�� nh� ��n qu� tr�nh ph�t tri�n t� gian kh� c�a b�n gi�o, b�n gi�o quy ��nh nh�ng �� t� ngao du giang h� nh� ng��i mu�n quay tr� l�i ph�i giao n�p 50000 l��ng. ","V�ng, �� t� �� �em 5 v�n l��ng ��n.")
	SetTask(4,70*256+20)
	AddNote("Giao n�p 5 v�n l��ng �� quay l�i Thi�n Nh�n Gi�o. ")
	Msg2Player("Giao n�p 5 v�n l��ng �� quay l�i Thi�n Nh�n Gi�o. ")
end;

function return_no()
	Talk(1,"","Sau n�y s� quay v� ph�c v� b�n gi�o, c�n b�y gi� v�n c�n chuy�n t�i h� ch�a l�m xong. ")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","R�t t�t! Ng��i �� tr� th�nh K� danh �� t� c�a b�n gi�o. Ta s� �� c� ng��i v�i Th�nh Gi�o Tr��ng L�o c�a b�n gi�o, ��ng l�m ta th�t v�ng.")
		Pay(50000)
		SetFaction("tianren")	
		SetCamp(2)
		SetCurCamp(2)
		SetRank(81)
		SetTask(4, 80*256)
--		if (HaveMagic(150) == -1) then
--			AddMagic(142)
--			AddMagic(148)
--			AddMagic(150)
		add_tr(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("B�n �� h�c ���c tr�n ph�i tuy�t h�c: Thi�n Ma Gi�i Th�, Du Thi�n Ho�n Nh�t, Ma Di�m Th�t S�t. ")
--		end
		AddNote("Quay tr� l�i Thi�n Nh�n Gi�o, l�i ��ng v�o h�ng ng�. ")
		Msg2Player(GetName().."Quay tr� l�i Thi�n Nh�n Gi�o, ���c phong l�m Th�nh Gi�o tr��ng l�o. ")
	else
		Talk(2,"","Sao? Ng��i ch� �em bao nhi�u ng�n l��ng th�i sao?","Xin l�i! �� ta ki�m tra l�i.")
	end
end;

function return_uncompleted()
	Talk(1,"","�, nhanh l�n!")
end;

----------------------- ��ʦ���� ------------------------
function L60_get_yes()
	Talk(1,"","L�o phu qu� kh�ng nh�n l�m ng��i, ng��i qu� c� l�ng can ��m! Nh�ng tr��c khi v�o Th�nh ��ng, ph�i t�m ���c <color=Red>5 thanh �o�n ki�m<color> l�u l�c � <color=Red>Bi�n Kinh<color> cho ta.")
	SetTask(4, 60*256+20)
	AddNote("G�p Gi�o ch� Ho�n Nhan H�ng Li�t, ti�p nh�n nhi�m v� xu�t s�. Tr��c ti�n ph�i �i Bi�n Kinh t�m 5 thanh �o�n ki�m. ")
	Msg2Player("G�p Gi�o ch� Ho�n Nhan H�ng Li�t, ti�p nh�n nhi�m v� xu�t s�. Tr��c ti�n ph�i �i Bi�n Kinh t�m 5 thanh �o�n ki�m. ")
end;

function L60_get_no()
	Talk(1,""," L� n�o ng��i kh�ng ch� tr�ng h� danh sao?")
end;

function L60_prise()
	DelItem(132)
--	AddGlobalCountNews(GetName().."�ճɳ�ʦ������λ�������½�����", 1)
	Msg2SubWorld("T�n �� Thi�n Nh�n Gi�o "..GetName().."Xu�t s� th�nh c�ng, c�o bi�t ch� v� gi�o h�u tr� v� ph��ng Nam. ")
	SetRank(71)
	SetTask(28,0)		-- ���ӱ�����λ
	SetTask(4, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Quay l�i Thi�n Nh�n ��i ��nh, ��a quy�n s�ch da d� cho Ho�n Nhan H�ng Li�t, ho�n th�nh nhi�m v� xu�t s�. Th�ng c�p T�t M�n Ph�p S�. ")
	Msg2Player("Ch�c m�ng B�n! Xu�t s� th�nh c�ng! ���c phong l� T�t M�n Ph�p S�! Danh v�ng t�ng th�m 120 �i�m! ")
	AddRepute(120)
end;

function no()
end
