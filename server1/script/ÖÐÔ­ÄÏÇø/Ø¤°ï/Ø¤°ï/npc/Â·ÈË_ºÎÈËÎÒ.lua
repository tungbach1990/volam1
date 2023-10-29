-- ؤ�� ���������ҡ�10������50�������ط�ʦ������
-- by��Dan_Deng(2003-07-28)
-- Update��Dan_Deng(2003-10-27)��д�ط�ʦ�����񣬲���������ű�

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
	G_TASK:OnMessage("C�i Bang", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 6) then
		tbDailog:AddOptEntry("H�c k� n�ng c�p 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Mu�n th�nh gi�o vi�c kh�c", oldentence)
	tbDailog:Show() 
end
	

function oldentence()
--	check_skill()
	local UTask_gb = GetTask(8)
	local nFactID = GetLastFactionNumber();

	if (UTask_gb == 70*256) and (GetFaction() == "gaibang") then			-- ��ʦ��������
		SetFaction("")
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_gb == 70*256) and (GetTask(4) >= 5*256) and (GetTask(4) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(4,0)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_gb == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(8,70*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (GetTask(4) == 70*256) and (GetTask(8) == 70*256) then			-- ת���ɴ�������
		SetTask(4,75*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_gb == 80*256 and nFactID == 6 and GetCamp() == 1 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("gaibang");
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	elseif (UTask_gb == 70*256 and nFactID == 6 and GetCamp() ~= 4 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	end

	local tbDes = {"��i ngh� ��u s�/#daiyitoushi_main(6)", "Mu�n th�nh gi�o vi�c kh�c/common_talk"};
	
	Say("G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_gb = GetTask(8)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),8) == 0) then				-- ��������������
		Talk(1,"","C�i bang v� Kim Qu�c kh�ng ��i tr�i chung, h�n n�a Minh ch� c� l�nh, t�i h� kh�ng d�m kh�ng nghe! M�i ng��i v� chuy�n l�i: C�i Bang tr�n d��i s� nghe theo l�nh c�a ng�i.")
		Uworld40 = SetBit(GetTask(40),8,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 50*256+60) then		-- 50���������
			Talk(1,"L50_prise","Chuy�n n�y l� nh� v�y ��, �� t� �� �em t�m Trung Nguy�n ��a �� giao cho Tr��ng ��i Nh�n, nh� �ng ta tr�nh l�n Ho�ng Th��ng.")
		elseif ((UTask_gb == 50*256+10) or (UTask_gb == 50*256+20)) and (HaveItem(199) == 0) then		--�����У����߶���
			Talk(2,"","Sao ng��i c�u th� th� n�y! Ta d�n �i d�n l�i m�y l�n r�i ph�i c�n th�n gi� b�c ��a �� ch�, sao c� th� ��nh r�i ���c!","� ��y c�n m�t b�n, l�n n�y ph�i c�n th�n h�n ��, ��ng �� x�y ra chuy�n n�a!")
			AddEventItem(199)
		elseif ((UTask_gb == 50*256) and (GetLevel() >= 50)) then		--50����������
			Say("Trong c�m h�p n�y l� m�t b�c tranh mi�u t� Trung Nguy�n ��a ��, c�n ng��i �em ��n L�m An d�ng cho tri�u ��nh. Ng��i c� ��ng � �i kh�ng?",2,"��ng �!/L50_get_yes","�� t� c�n y�u k�m qu�! E kh�ng ���ng n�i vi�c n�y!/no")
		elseif (UTask_gb == 10*256+40) and (HaveItem(76) == 1) and (HaveItem(77) == 1) and (HaveItem(78) == 1) and (HaveItem(79) == 1) and (HaveItem(80) == 1) then
			L10_prise()
		elseif (UTask_gb == 10*256) and (GetLevel() >= 10) then		--10����������
			Talk(3,"L10_get","Ng��i s�ng tr�n ��i, ��ng n�n th� o�n l�n nhau, �n u�ng no say qua ng�y th� t�t bi�t m�y!","Bang ch�! C� ph�i ng�i �� u�ng say r�i ph�i kh�ng?","Hahaha, c�ng say ta c�ng t�nh ��y! Ta l� ai! Ai l� ta! Hahaha!")
		elseif (UTask_gb == 80*256) then						-- �ط�������ɳ���
			Say("Khi�u h�a t� ta ��y ch� t�i b�n ph��ng ng��i ��ng su�t ng�y ng�i kh�ng ra ��y!",2,"D�! �� t� mu�n ra giang h� r�n luy�n th�m!/goff_yes","�� t� t� th�y m�nh v� ngh� c�n k�m, ch�a th� xu�t s�!/no")
		elseif (UTask_gb > 10*256) and (UTask_gb < 20*256) then		--10���������ʱ����ͨ�Ի�
			Talk(1,"","Sao r��u c�n ch�a mang ��n? L� �i n�o, l� �i!")
		else
			Talk(1,"","Tr��c gi� Th�nh nh�n ��u phi�n mu�n ch� c� nh� ta ��y m�i vui v� th�i.")
		end
--	elseif (UTask_gb == 5*256+20) then			-- ת�������
--		Talk(1,"defection_complete","�����ң��ܺã�����Ͷ�����Ǵ��Ǵ��¡�������ǰ����ȥ֤����ĳ൨���İɣ�")
	elseif (GetSeries() == 3) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_gb == 70*256) and ((GetTask(4) < 5*256) or (GetTask(4) == 75*256)) then		-- �ط�ʦ������
		Talk(3,"return_sele","Khi�u h�a t� b�n ngo�i ch�u nhi�u l�i ��m ti�u qu�!","���ng nhi�n, cho c�m ng��i �n ph�i c� ch�t g� �� ch�, chuy�n ���ng nhi�n th�i, haha!","Th��ng kh�ng cho c�m �n c�n b�t ch�ng t�i ra �� tr�t gi�n n�a ��y!")
	elseif (GetCamp() == 4) and ((UTask_gb == 70*256+10) or (UTask_gb == 70*256+20)) then		-- �ط�ʦ��������
		Say("5 v�n l��ng �� chu�n b� xong ch�a v�y?",2,"�� chu�n b� xong/return_complete","V�n ch�a chu�n b� xong/return_uncompleted")
--	elseif (GetTask(4) == 70*256+10) and (HaveMagic(128) >= 0) then		-- �����ط����ɣ��ջؿ����л�
--		Say("�����ң����������Ĳ��������㾹�뱳������Ͷ�������",2,"���������Ѿ�/defection_yes","�Բ�������֪����/no")
	else
		Talk(1,"","B� T�u ���ng Ca, Nh�n Sinh K� H�.")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()		-- Ŀǰû����ұ䶯�޸�����û��60������
	x = 0
	skillID = 121					-- 
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- ���м��ܷ����仯���������ߣ����򷵻ؼ�������
		Say("Vi s� nay ph�i b� quan �� suy ngh�, nay �em v� ngh� tuy�t h�c b�n gi�o truy�n cho ng��i, h�c xong n�n ngh� ng�i m�t l�t, tr�nh vi�c t�n th��ng kinh m�ch.",1,"�a t� s� ph� /KickOutSelf")
	else
		return
	end
end

--------------------- ת������� ------------------------
function defection_complete()
	SetRevPos(115,53)		  			--�ȴ��ṩ������
	SetTask(8, 10*256)				-- ֱ������
	SetFaction("gaibang")       			--��Ҽ�������
	SetCamp(1)
	SetCurCamp(1)
	SetRank(37)
	AddMagic(117)
	Msg2Player("Hoan ngh�nh b�n gia nh�p C�i bang,tr� th�nh �� t� kh�ng t�i!")
	Msg2Player("H�c ���c Ki�n Nh�n Th�n Th�, Di�n M�n Th�c B�t")
	AddNote("Gia  nh�p C�i bang, tr� th�nh �� t� kh�ng t�i! H�c ���c Ki�n Nh�n Th�n Th�, Di�n M�n Th�c B�t")
	Msg2Faction("gaibang",GetName().."C� th�m ng��i c�a Thi�n Nh�n gia nh�p, l�c l��ng C�i bang �� m�nh th�m",GetName())
end

--------------- �ط�ʦ����� ------------------------
function goff_yes()
	Talk(1,"","T�t! nh� ��y g�p chuy�n b�t b�nh, ph�i ra tay ngh�a hi�p ��!")
	SetTask(8,70*256)
	AddNote("R�i kh�i C�i bang, ti�p t�c h�nh t�u giang h� ")
	Msg2Player("B�n r�i kh�i C�i bang, ti�p t�c h�nh t�u giang h� ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_sele()
	Say("Haha, mau tr� v� b�n bang �i, m�i ng��i c� th� c�ng nhau �n c�m, kh�ng ai tr�t gi�n ai ��u m� lo.",2,"�a t� Bang ch�!/return_yes","Th�i kh�ng c�n ��u!/return_no")
end;

function return_yes()
	Talk(2,"","Ch� t�i b�n bang chi c�c kho�n l�n, th��ng kh�ng �� xoay s�, n�u ng��i mu�n tr�ng ph�i b�n ph�i th� ph�i quy�n g�p 50000 l��ng.","���c! �� t� chu�n b� ti�n ngay ��y.")
	SetTask(8,70*256+20)
	AddNote("Giao n�p 50000 l��ng, tr�ng ph�n C�i bang.")
	Msg2Player("Giao n�p 50000 l��ng, tr�ng ph�n C�i bang.")
end;

function return_no()
	Talk(1,"","S� ph�, con c�m th�y s�ng tr�n ��i ph�i g�y d�ng s� nghi�p, kh�ng th� �n b�m ng��i kh�c qua ng�y ���c. V� v�y c�n t�nh kh�ng quay l�i ��u.")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","Haha, kh�ng ng� ng��i chu�n b� �� s� ng�n l��ng m� ta n�i, t�t l�m! Ta l�y th�n ph�n bang ch� cho ng��i tr�ng ph�n b�n ph�i ��ng th�i ��m nhi�m ch�c C�u ��i Tr��ng L�o c�a b�n gi�o.")
		Pay(50000)
		SetTask(8,80*256)
		SetFaction("gaibang")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(78)
--		if (HaveMagic(130) == -1) then
--			AddMagic(360)
--			AddMagic(130)
		add_gb(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("B�n h�c ���c tuy�t h�c tr�n ph�i T�y �i�p Cu�ng V�, v� c�ng Ti�u Di�u C�ng")
--		end
		AddNote("�� ���c ph�p tr� l�i C�i bang")
		Msg2Player(GetName().."Tr�ng ph�n C�i bang, ���c phong l� C�u ��i Tr��ng L�o")
	else
		Talk(2,"","��ng ngh� ta �� say, ng�n l��ng th� ta nh�n r� l�m, ��y kh�ng �� 5 v�n l��ng m�!","Xin l�i! L� t�i ��m nh�m, �� t�i ki�m tra l�i.")
	end
end;

function return_uncompleted()
	Talk(1,"","5 v�n l��ng kh�ng ph�i s� nh�, ng��i t� t� �i kh�ng sao ��u!")
end;

---------------- ����������� -----------------------
function L10_get()
	Say("�i nhanh mua gi�p ta 5 lo�i danh t�u Giang Nam ��n ��y g�m: Hu� Tuy�n T�u, Kim L�ng Xu�n, B�ch Hoa Nh��ng, Kinh Hoa L�, Song C�u ��i Kh�c.",2,"�i mua r��u/L10_get_yes","Gi� v� nh� kh�ng nghe/no")
end;

function L10_get_yes()
	SetTask(8,10*256+10)
	AddNote("Ti�p nh�n nhުm v� c�p 10, �i mua 5 lo�i r��u Hu� Tuy�n T�u, Kim L�ng Xu�n, B�ch Hoa Nh��ng, Kinh Hoa L�, Song C�u ��i Kh�c v� cho Bang ch�.")
	Msg2Player("Ti�p nh�n nhުm v� c�p 10, �i mua 5 lo�i r��u Hu� Tuy�n T�u, Kim L�ng Xu�n, B�ch Hoa Nh��ng, Kinh Hoa L�, Song C�u ��i Kh�c v� cho Bang ch�.")
end;

function L10_prise()
	Talk(2,"","Bang ch�, r��u t�i �� mua v� r�i!","T�t! Huynh �� l�i u�ng chung �i n�o?")
	DelItem(76)
	DelItem(77)
	DelItem(78)
	DelItem(79)
	DelItem(80)
	SetTask(8,20*256)
	SetRank(38)
--	AddMagic(116)
--	AddMagic(115)
	add_gb(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("Mua �� 5 l�i r��u, ho�n th�nh nhi�m v� c�p 10, tr� th�nh Ch�p ��i �� t� ")
	Msg2Player("Ch�c m�ng b�n! ���c phong l� Ch�p ��i �� t�! H�c ���c C�i bang Ch��ng ph�p, C�i bang B�ng ph�p.")
end;

function L50_get_yes()
	Talk(1,"","T�m Trung Nguy�n ��a �� n�y quan h� tr�ng ��i, c�n th�n ��ng �� l�t v�o tay ng��i Kim ��y!")
	SetTask(8,50*256+10)
	AddEventItem(199)
	AddNote("Ti�p nh�n nhi�m v� c�p 50, hi�n t�ng b�c ��a �� Trung nguy�n cho tri�u ��nh.")
	Msg2Player("Ti�p nh�n nhi�m v� c�p 50, hi�n t�ng b�c ��a �� Trung nguy�n cho tri�u ��nh.")
end;

function L50_prise()
	Talk(1,"","Bang ch�: Ng��i l�m t�t l�m, mong r�ng vi�c l�m l�n n�y gi�p cho s� nghi�p kh�ng Kim, �� kh�i b� c�ng kh�ng v� �ch!")
	SetTask(8,60*256)
	SetRank(42)
--	AddMagic(128)
--	AddMagic(125)
	add_gb(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! ���c phong l� ��i Long ��u! H�c ���c v� c�ng Kh�ng Long H�u H�i, B�ng �� �c C�u.")
	AddNote("Giao th�nh c�ng b�c ��a �� Trung nguy�n cho Tr��ng Tu�n, ho�n th�nh nhi�m v� c�p 50. Tr� th�nh ��i Long ��u.")
end;

function no()
end;
