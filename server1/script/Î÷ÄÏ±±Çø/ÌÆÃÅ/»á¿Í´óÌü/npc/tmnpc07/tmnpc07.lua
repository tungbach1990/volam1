--description: �����Ƴ� 20�����񡢳�ʦ���� 
--author: yuanlan	
--date: 2003/3/11
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-24), �����ط���������
-- Update: Dan_Deng(2003-08-13)
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
				"T�ng b�nh ng�y xu�n/#tbMasterGift:getGift('tangmen')",
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
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 2) then
		Describe("T�m ta c� vi�c g�?", 2,
			"H�c k� n�ng c�p 120./lvl120skill_learn",
			"Mu�n th�nh gi�o vi�c kh�c/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
--	if (check_skill() == 0) then
--		return
--	end
	local UTask_tm = GetTask(2);
	local nFactID = GetLastFactionNumber();
	
	if (UTask_tm == 70*256) and (GetFaction() == "tangmen") then			-- ��ʦ��������
		SetFaction("")
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_tm == 70*256) and (GetTask(10) >= 5*256) and (GetTask(10) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(10,0)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_tm == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(2,70*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_tm == 80*256 and nFactID == 2 and GetCamp() == 3 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("tangmen");
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	elseif (UTask_tm == 70*256 and nFactID == 2 and GetCamp() ~= 4 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	end

	local tbDes = {"��i ngh� ��u s�/#daiyitoushi_main(2)", "Mu�n th�nh gi�o vi�c kh�c/common_talk"};
	
	Say("G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_tm = GetTask(2);
	local Uworld51 = GetTask(51)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),2) == 0) then				-- ��������������
		if (GetSex() == 0) then
			Talk(1,"","���ng M�n t� s� gi�o hu�n �� t� kh�ng ���c can d� chuy�n ngo�i. ���ng C�u ta kh�ng d�m tr�i l�i. Nh� c�ng t� ��y chuy�n l�i xin l�i ��n ��c c� Minh ch�.")
		else
			Talk(1,"","���ng M�n t� s� gi�o hu�n �� t� kh�ng ���c can d� chuy�n ngo�i. ���ng C�u ta kh�ng d�m tr�i l�i. Nh� c�ng t� ��y chuy�n l�i xin l�i ��n ��c c� Minh ch�.")
		end
		Uworld40 = SetBit(GetTask(40),2,1)
		SetTask(40,Uworld40)
	elseif (Uworld51 == 30) then				-- ϴ��ԩ�����������
		Talk(4,"Uworld51_40","M�n ch�, t�i h� nghe n�i ng��i c� th�nh ki�n v�i c�ng t� Nh�t Tr�n. Hi�n gi� h�n �ang b� ng��i hi�u l�m.","��y l� chuy�n c�a ���ng gia, kh�ng li�n quan ��n ng��i!","M�n ch�, c�ng t� Nh�t Tr�n ch�nh l� con ru�t c�a �ng�..!","H�! Ti�n kh�ch! ")
	elseif (Uworld51 == 80) and (HaveItem(377) == 1) then				-- ϴ��ԩ�������Ѿ��������
		Talk(8,"Uworld51_90","M�n ch�,chuy�n Thi�u L�m cao t�ng g�p n�n ta �� tra r�! Sau khi Thi�n Nh�n gi�o �o�t ���c B� ki�p c�a b�n gi�o,�� l�n �m to�n nh�ng Thi�u L�m cao th�. B� ki�p n�y do B�t Nhi�m c�ng t� ti�t l� ra ngo�i!","C�i g�? Sao l�i nh� v�y ���c?","B�t Nhi�m lo ng�i Nh�t Tr�n l� con tr��ng, e r�ng t��ng lai c� th� s� gi�nh l�y ng�i v� Ch��ng m�n. V� th� m� h�n th��ng li�n l�c v�i B�ch c�ng t� m�t s� Kim Qu�c, tr�m s�ch cho Thi�n Nh�n gi�o!","Sau khi Thi�n Nh�n gi�o c� ���c s�ch n�y, �� ph�i 2 t�n cao th� �i �m s�t Thi�u L�m cao th�. L�n n�y khi h� �ang chu�n b� �m s�t C�i Bang cao th�. T�i h� s� �i h� th� h� v� �o�t v� B� ki�p c�a b�n m�n, xin m�n ch� ��ng b�n t�m.","B�t nhi�m�l�i c� chuy�n nh� v�y �?��M�t ta m� r�i n�n nu�i nh�m ngh�ch t�!","M�n ch� b�t gi�n, suy cho c�ng B�t Nhi�m c�ng t� ch� nh�t th�i h� ��. T�i h� d�m xin m�n ch� tha cho h�n 1 l�n!","T�n ��i ngh�ch b�t ��o d�m l�m c�i chuy�n quay l�ng ch�ng l�i b�n m�n, t�i ch�t kh�ng tha v� ��ng h�ng k� th�a ng�i v� Ch��ng m�n.","Nh� ng��i thay ta an �i Nh�t Tr�n, h�a ra ta �� tr�ch l�m h�n!")
	elseif (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if ((UTask_tm >= 20*256+60) and (UTask_tm <= 20*256+70) and (HaveItem(41) == 1)) then		-- 20���������
			Talk(5, "L20_prise", "��y ch�ng ph�i l� Kim H�ng Khuy�n c�a U mu�i mu�i sao? Sao n� l�i � ��y?", "��y l� v�t m� s� c� nh� t�i h� trao cho Ch��ng M�n, b� �� tha th� cho Ch��ng m�n r�i!", "U mu�i mu�i th�t �� tha th� cho ta? C� th�t n�ng mu�n h�i gia? Ch�nh ng��i thuy�t ph�c n�ng �?", "Chuy�n n�y l� do ��i s� huynh an b�i, �� t� ch�ng bi�t l�m g� c�?", "D� ng��i c� n�i sao, nh�ng ng��i �� gi�p ta m� ra ni�m vui cho cu�c ��i n�y. C�ng lao r�t l�n, ta s� kh�ng b�c ��i ng��i.")
		elseif (UTask_tm == 60*256+60) and (HaveItem(49) == 1) then		-- ��ʦ�������
			Talk(3, "L60_prise", "Ch��ng m�n, trong Tr�c T� ��ng ta t�m ���c thanh ki�m c�n n�y. N� c� ph�i l� Th�t Tinh Tuy�t M�nh Ki�m trong truy�n thuy�t nh�c t�i?", "Kh�ng sai. ��y ch�nh l� Th�t Tinh Tuy�t M�nh Ki�m! Tuy b� ngo�i t�m th��ng nh�ng gi� tr� c�a n� ch�nh l� � ch� ng��i �� ch�n n�.Ng��i �� thu�n l�i xu�t s�!", "B�n �� ���c phong l�m Thi�n th� th�n v� c�a ���ng M�n. T� h�m nay c� th� t� do h�nh hi�p giang h�!C� th� ch�n gia nh�p v�o m�n ph�i kh�c ti�p t�c h�c ngh�, c�ng c� th� t� l�p bang h�i m� r�ng th� l�c giang h�, ho�c l�m ��c kh�ch h�nh oai phong l�m li�t! Giang h� ki�m hi�p, tr�i cao ��t r�ng, hy v�ng b�n s� ti�p t�c ph�t tri�n ti�n �� c�a m�nh")
		elseif (UTask_tm == 60*256+70) then				--��ʦ����
			Talk(3, "L60_fail", "L� Th�t Tinh Tuy�t M�nh Ki�m ta c�n �?", "............", "Ng��i �� b� ti�n t�i b�u v�t m� ho�c, l�m sao ta y�n t�m �� ng��i xu�t s� ��y? Kh�ng ch�ng c� m�t ng�y ng��i v� c�i l�i l�n h�n m� quay l�ng ph�n l�i b�n m�n!")
		elseif (UTask_tm == 60*256+80) then
			if (GetCash() >= 20000) then
				Talk(1,"","Th�y ng��i th�t t�m h�i l�i, ta s� cho ng��i th�m m�t c� h�i. H�y ��n Tr�c T� ��ng l�y v� Th�t Tinh Tuy�t M�nh Ki�m.")
				Pay(20000)
				SetTask(2, 60*256+20)
				AddNote("Tr� 20000 l��ng, c�u xin ch��ng m�n tha th�, ��n Tr�c T� ��ng l�y Th�t Tinh Tuy�t M�nh ki�m. ")
				Msg2Player("Tr� 20000 l��ng, c�u xin ch��ng m�n tha th�, ��n Tr�c T� ��ng l�y Th�t Tinh Tuy�t M�nh ki�m. ")
			else
				Talk(1,"","H�i l�i kh�ng th� n�i su�n, mau l�y ti�n n�p ra r�i m�i n�i chuy�n v�i ta!")
			end
		elseif (UTask_tm == 60*256+90) then
			if (GetCash() >= 40000) then
				Talk(1,"","H�! Ta s� cho ng��i th�m m�t c� h�i. H�y �i Tr�c T� ��ng l�y v� Th�t Tinh Tuy�t M�nh Ki�m..")
				Pay(40000)
				SetTask(2, 60*256+20)
				AddNote("Tr� 40000 l��ng, c�u xin ch��ng m�n tha th�, ��n Tr�c T� ��ng l�y Th�t Tinh Tuy�t M�nh ki�m. ")
				Msg2Player("Tr� 40000 l��ng, c�u xin ch��ng m�n tha th�, ��n Tr�c T� ��ng l�y Th�t Tinh Tuy�t M�nh ki�m. ")
			else
				Talk(1,"","N�y! Mau n�p ra 4 v�n l��ng, r�i �i Tr�c T� ��ng l�y v� Th�t Tinh Tuy�t M�nh Ki�m.. ")
			end
		elseif ((UTask_tm == 60*256) and (GetLevel() >= 50) and (GetFaction() == "tangmen")) then				--��ʦ��������
			Say("Khi ng��i � b�n m�n h�c th�m, th�y ph�i th� th�ch ng��i. N�i r�ng tr�c s�u th�m � h��ng ��ng c� 1 <color=Red>Tr�c T� ��ng<color>. N�u ng��i c� th� ��n <color=Red>Tr�c T� ��ng<color> l�y v� 1 thanh <color=Red> Th�t Tinh Tuy�t M�nh Ki�m <color> l� c� th� thu�n l�i xu�t s�!", 2, "Ti�p nh�n ki�m tra /L60_get_yes", "T�m kh�ng ti�p nh�n /no")
		elseif (UTask_tm == 80*256) then						-- �ط�������ɳ���
			Say("L�i ho�i ni�m v� s�ng gi� giang h� sao?",2,"V�ng, xin m�n ch� cho �� t� ���c h�nh t�u giang h�. /goff_yes","�� t� t�p luy�n c�n ch�a ��, ph�i n� l�c luy�n c�ng. /no")
		elseif (UTask_tm > 20*256) and (UTask_tm < 20*256+60) then					--�Ѿ��ӵ�20��������δ���
			Talk(1,"","Kh�ng bi�t U mu�i mu�i cu�c s�ng ra sao? M�i ��n h�m nay n�ng v�n kh�ng ch�u tha th� cho ca ca n�y!")
		elseif (UTask_tm >= 30*256) and (UTask_tm <= 60*256) then					--�Ѿ����20��������δ�ӵ���ʦ����
			Talk(1,""," Ng��i �� gi�p ta t�m l�i ���c ngu�n vui, ta s� kh�ng b�c ��i ng��i!")
		elseif (UTask_tm > 60*256) and (UTask_tm < 70*256) then					--�Ѿ��ӵ���ʦ������δ���
			Talk(1,"","Ch� c�n ��n <color=Red>Tr�c T� ��ng<color> l�y v� 1 thanh <color=Red> Th�t Tinh Tuy�t M�nh Ki�m <color> th� xem nh� ng��i tr�i qua th� th�ch xu�t s�!")
		else					--�Ѿ����ţ���δ��20������ȱʡ�Ի���
			Talk(1,"","K� n�ng c�a b�n m�n t� tr��c d�n nay kh�ng truy�n ra ngo�i. N�u �� t� m�n h� c� ng��i ti�t l� tuy�t k�, s� chi�u theo m�n quy m� h�nh x�, quy�t kh�ng n��ng tay!")
		end
--	elseif (GetTask(10) == 5*256+10) then		-- ת���ɵ��嶾��
--		Say("�Ƴ���Ͷ���嶾����֪���Ų��������Ͷ�������������з�ȥ���ž��ա��㲻�����¿���һ����",2,"���������Ѿ�/defection_yes","�һ��ǲ�ȥ�嶾����/defection_no")
	elseif (GetSeries() == 1) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tm == 70*256) and (GetTask(10) < 5*256) then		-- �ط�ʦ������
		Say("L�n n�y tr� v�, ng��i mu�n quay l�i ���ng M�n sao?",2,"Tu�n l�nh!/return_yes","Kh�ng. /return_no")
	elseif (GetCamp() == 4) and ((UTask_tm == 70*256+10) or (UTask_tm == 70*256+20)) then		-- �ط�ʦ��������
		Say("�� chu�n b� �� 5 v�n l��ng ch�a?",2,"�� chu�n b� xong/return_complete","V�n ch�a chu�n b� xong/return_uncompleted")
	elseif (Uworld51 >= 90) then			-- �Ѿ���ɡ�ϴ��ԩ��������
		Talk(1,"","T�n s�c sinh B�t Nhi�m cu�i c�ng �� ph� ta!")
	elseif (UTask_tm == 70*256) and (GetFaction() ~= "tangmen") then							--�Ѿ���ʦ
		Talk(1,"","Sau khi ng��i xu�t s�, ��ng �� ng��i ta xem th��ng c�ng phu c�a b�n m�n!")
	else
		Talk(1,"","Ng��i ��i ��u xem ���ng M�n l� Long ��m H� Huy�t. Xem ���ng C�u ta l� t�n ma ��u h� n� v� th��ng. H�! C� can h� g� ch�?")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
	x = 0
	skillID = 51					-- ��ľ��
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (GetFaction() == "tangmen") and (GetTask(2) == 80*256) and (HaveMagic(253) == -1) then		-- �ط�ʦ�������¼���
		AddMagic(253)
		Msg2Player("B�n h�c ���c Ng� ��c Th�c C�t. ")
		Say("Ta �� nhi�u ng�y b� quan kh� luy�n, ch� t�o ra 1 chi�u Ng� ��c Th�c C�t, nay ta truy�n l�i cho ng��i! Sau khi ng��i h�c xong, ph�i ch� � ngh� ng�i, �� tr�nh t�n th��ng kinh m�ch!",1,"�a t� s� ph� /KickOutSelf")
		return 0
	elseif (x > 0) then		-- ���м��ܷ����仯���������ߣ����򷵻ؼ�������
		Say("Ta �� nhi�u ng�y b� quan kh� luy�n, ch� t�o ra 1 chi�u Ng� ��c Th�c C�t, nay ta truy�n l�i cho ng��i! Sau khi ng��i h�c xong, ph�i ch� � ngh� ng�i, �� tr�nh t�n th��ng kinh m�ch!",1,"�a t� s� ph� /KickOutSelf")
		return 0
	else
		return 1
	end
end

------------------------ �ط�������� -------------------------
function goff_yes()
	Talk(1,"","���c, h�y �i �i! N�n nh� kh�ng th� k�t giao v�i gian t�.")
	SetTask(2,70*256)
	AddNote("Ra kh�i ���ng m�n, l�i �i h�nh t�u giang h�. ")
	Msg2Player("B�n r�i kh�i ���ng m�n, l�i �i h�nh t�u giang h�. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()			-- ת�ɣ��ջ�ԭ�����书����
-- ˢ������
	n = 0
	i=45; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ������
	i=43; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���Ű���
	i=44; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���ŵ���
	i=47; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �����
	i=48; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ����
	i=50; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ׷�ļ�
	i=51; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ��ľ������ȡ����
	i=54; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���컨��
	i=55; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- �㶾��
	i=57; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���Ǻ���
	i=58; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ���޵���
	i=249;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- С��ɵ�
	i=253;x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ԧ��ʴ��
	AddMagicPoint(n)
-- ˢ�꼼�ܺ����ת��������
	SetTask(10,5*256+20)
	SetTask(2,75*256)				-- Ϊԭ�����������
	SetRank(66)
	if (GetRepute() < 200) then
		Msg2Player("V� h�nh vi b�t trung v�i m�n ph�i, danh v�ng c�a b�n gi�m xu�ng "..GetRepute().."�i�m!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V� h�nh vi b�t trung v�i m�n ph�i, danh v�ng c�a b�n gi�m xu�ng 200 �i�m! ")
		AddRepute(-200)
	end
	AddNote("���ng C�u thu h�i v� c�ng ���ng M�n c�a b�n, h�y b� ch�c danh L�c C�c Tr��ng L�o. B�y gi� b�n c� th� gia nh�p Ng� ��c Gi�o r�I. ")
	Msg2Player("���ng C�u thu h�i v� c�ng ���ng M�n c�a b�n, h�y b� ch�c danh L�c C�c Tr��ng L�o. B�y gi� b�n c� th� gia nh�p Ng� ��c Gi�o r�I. ")
	Talk(1,"KickOutSelf","�� ph�ng ti�t l� tuy�t h�c c�a b�n m�n, ng��i �� quy�t l�ng mu�n gia nh�p Ng� ��c, ta ��nh ph�i thu h�i tuy�t k� ���ng m�n c�a ng��i!")
end

function defection_no()
	AddNote("B�n t� b� � ��nh gia nh�p Ng� ��c Gi�o. ")
	Msg2Player("B�n t� b� � ��nh gia nh�p Ng� ��c Gi�o. ")
	SetTask(10,1*256)			-- Ϊ��ͼ��ʦ������ǣ��Ա�������ʱ֮��
end

function return_yes()
	Talk(3,"","��ng! �� t� tr�n giang h� ch�a l�p n�n c�ng danh g�, mu�n xin c�c v� th�c b� ch� gi�o th�m!","Chi�u theo m�n quy, ng��i ph�i n�p 5 v�n l��ng �� tr�ng ph�n b�n m�n!","D�! �� �� t� chu�n b� m�t ch�t!")
	SetTask(2,70*256+20)
	AddNote("Giao n�p 50000 l��ng b�c th� l�p t�c c� th� quay l�i ���ng m�n ")
	Msg2Player("Giao n�p 50000 l��ng b�c th� l�p t�c c� th� quay l�i ���ng m�n ")
end;

function return_no()
	Talk(2,"","Ta mu�n t� m�nh phi�u b�t giang h� th�m 1 th�i gian n�a.","�� nh� th�, ng��i h�y t� m�nh b�o tr�ng!")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","Hay l�m! Ng��i �� th�nh t�m nh� v�y! Ta sao n� t� ch�i!")
		Pay(50000)
		SetTask(2,80*256)
		SetRank(76)
--		if (HaveMagic(48) == -1) then
--			AddMagic(249)
--			AddMagic(58)
--			AddMagic(341)
--			AddMagic(48)
		add_tm(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("B�n �� h�c ���c tuy�t h�c tr�n ph�i: T�m Nh�n, v� c�ng Ti�u L� Phi �ao, Thi�n La ��a V�ng, T�n Hoa Ti�u. ")
--		end
		SetFaction("tangmen")
		SetCamp(3)
		SetCurCamp(3)
		AddNote("�� quay l�i ���ng M�n, ��ng trong h�ng ng� ")
		Msg2Player(GetName().."Quay l�i ���ng M�n, ���c th�ng l� L�c C�c tr��ng l�o. ")
	else
		Talk(2,"","Ng��i r� l� c�n ch�a chu�n b� xong!","Xin l�i! �� ta ki�m tra l�i.")
	end
end;

function return_uncompleted()
	Talk(1,"","Kh�ng sao, ti�p t�c chu�n b� �i!")
end;

----------------------- 20������ -----------------------
function L20_prise()
	DelItem(41)
	SetRank(27)	
	SetTask(2, 30*256)
--	AddMagic(303)
	add_tm(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! B�n �� ���c th�ng l�m ���ng M�n H� Vi�n, ���c h�c v� c�ng ��c Th�ch C�t ")
	AddNote("Giao Kim H�ng quy�n cho ���ng C�u ch��ng m�n, ho�n th�nh nhi�m v� ���ng U. ���c th�ng l�m H� Vi�n. ")
end;

----------------------- ��ʦ���� --------------------------
function L60_get_yes()
	SetTask(2, 60*256+20)
	AddNote("T�i ��i s�nh ( 508, 322) , g�p ���ng C�u, nh�n <color=red>nhi�m v� xu�t s�<color>, t�i Tr�c T� ��ng thu h�i Th�t Tinh Tuy�t M�nh Ki�m. ")
	Msg2Player("T�i ��i s�nh g�p ���ng C�u, nh�n nhi�m v� xu�t s�, t�i Tr�c T� ��ng thu h�i Th�t Tinh Tuy�t M�nh Ki�m. ")
end;

function L60_prise()
	DelItem(49)
	Msg2Player("Ch�c m�ng b�n h�c th�nh t�i c� th� xu�t s�! B�n ���c phong l� Thi�n Th� Th�n V�.. Danh v�ng t�ng th�m 120 di�m. ")
--	AddGlobalCountNews(GetName().."�ճɳ�ʦ������λͬ�����߽�����", 1)
	Msg2SubWorld("���ng M�n"..GetName().."Th�nh t�i xu�t s�, t� bi�t c�c huynh mu�i ��ng m�n �� h�nh t�u giang h�. ")
	AddRepute(120)
	SetRank(66)
	SetTask(2, 70*256)
	SetFaction("")				    			--����˳�����
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Tr� v� ���ng M�n, giao Th�t Tinh Tuy�t M�nh Ki�m cho ���ng C�u ch��ng m�n, ho�n th�nh nhi�m v� xu�t s�. ���c th�ng l�m Thi�n Th� Th�n V�. ")
end;

function L60_fail()
	Say("Ch��ng m�n t�c gi�n r�i, b�n ph�i l�m sao ��y?", 2, "Ti�n ��n tay r�i m� c�n xui x�o /L60_faila", "Xin ch��ng m�n l��ng th�. /L60_failb")
end;

function L60_faila()
	SetTask(2,60*256+90)
	Talk(1,"","N�y! Mau ��a 4 v�n l��ng r�i c�t v� Tr�c T� ��ng l�y Th�t Tinh Tuy�t M�nh Ki�m v� cho ta!")
end;

function L60_failb()
	SetTask(2,60*256+80)
	Talk(1,"","Th�y ng��i th�t t�m h�i l�i, ta s� cho ng��i th�m m�t c� h�i. L�p t�c n�p 2 v�n l��ng ra, r�i �i Tr�c T� ��ng l�y v� Th�t Tinh Tuy�t M�nh Ki�m.")
end;

----------------------- �������� --------------------------
function Uworld51_40()
	SetTask(51,40)
	Msg2Player("Xem ra kh�ng c� c�ch n�o khuy�n ���ng C�u, b�n ��nh �i t�m s� ph� ���ng H�c c�a ���ng Nh�t Tr�n gi�i quy�t chuy�n n�y ")
end

function Uworld51_90()
	DelItem(377)
	SetTask(51,90)
	Msg2Player("Ch�n t��ng r� r�ng, ���ng C�u cu�i c�ng bi�t r�ng �� hi�u l�m ���ng Nh�t Tr�n. Mau �em tin t�c b�o cho Nh�t Tr�n c�ng t�. ")
	AddNote("Ch�n t��ng r� r�ng, ���ng C�u cu�i c�ng bi�t r�ng �� hi�u l�m ���ng Nh�t Tr�n. ")
end

function no()
end
