-- ������ ���������� 10������50�����񡢳�ʦ�����ط�ʦ������
-- by��Dan_Deng(2003-07-25)
-- Update: Dan_Deng(2003-09-24)��������ط����������ɾ�ѧ���
-- Update��Dan_Deng(2003-10-27)��д�ط�ʦ�����񣬲���������ű�

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ

Include("\\script\\item\\skillbook.lua")

function main()
	
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 5) then
		Describe("T�m ta c� vi�c g�?", 2,
			"H�c k� n�ng c�p 120./lvl120skill_learn",
			"Mu�n th�nh gi�o vi�c kh�c/oldentence"
			);
		return
	end;
	
	oldentence()
end;

function oldentence()
	local UTask_cy = GetTask(6)
	local nFactID = GetLastFactionNumber();

	if (UTask_cy == 70*256) and (GetFaction() == "cuiyan") then			-- ��ʦ��������
		SetFaction("")
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_cy == 70*256) and (GetTask(1) >= 5*256) and (GetTask(1) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(1,0)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_cy == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(6,70*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (GetTask(1) == 70*256) and (GetTask(6) == 70*256) then			-- ת���ɴ�������
		SetTask(1,75*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_cy == 80*256 and nFactID == 5 and GetCamp() == 3 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("cuiyan");
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	elseif (UTask_cy == 70*256 and nFactID == 5 and GetCamp() ~= 4 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	end

	local tbDes = {"��i ngh� ��u s�/#daiyitoushi_main(5)", "Mu�n th�nh gi�o vi�c kh�c/common_talk"};
	
	Say("G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_cy = GetTask(6)
	local Uworld51 = GetTask(51)
	local Uworld126 = GetTask(126)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),6) == 0) then				-- ��������������
		Talk(1,"","��c C� minh ch� �� c� l�nh, ta ��u d�m kh�ng tu�n! Nh�ng b�n m�n ch� to�n l� n� nhi y�u �u�i ch� s� vi�c kh�ng th�nh, xin h�i b�o l�i v�i ��c C� minh ch� l� b�n m�n nh�t ��nh s� �ng h� c�c v� anh h�ng, ch�c c�c v� k� khai ��c th�ng!")
		Uworld40 = SetBit(GetTask(40),6,1)
		SetTask(40,Uworld40)
	elseif (Uworld51 == 10) then			-- ϴ��ԩ�����������
		Talk(5,"Uworld51_20","���ng Nh�t Tr�n b�o ta �em kh�u t�n, cha �ng ta kh�ng bi�t v� sao ��t nhi�n ph�n ��i h�n s� c�a 2 ng��i, h�n s� c� ch�t kh� kh�n, nh�ng c� ��ng qu� lo l�ng.","Nh�t Tr�n� ","�i...��ng kh�c n�a! S� vi�c kh�ng nh�t ��nh nh� v�y ��u, ch� c�n ch�ng ta th�t t�m th� nh�t ��nh s� xoay chuy�n ���c t�nh th�.","Ta kh�ng kh�c! Ta ch� l� t�c gi�n ta v� Nh�t Tr�n �� tr�i qua nhi�u gian kh� nh� v�y cu�i c�ng c�ng ��n ���c v�i nhau, t�i sao ng��i nh� huynh �y l�i ph�n ��i?","Kh�ng ph�i nh� v�y! ���ng Nh�t Tr�n r�t y�u c�, nh�t ��nh s� kh�ng ��ng nh�n, ta nh�t ��nh s� h�i huynh �y cho r� ng�n ng�nh.")
	elseif (Uworld51 == 100) then			-- ϴ��ԩ���������
		Talk(3,"Uworld51_prise"," Th� ra v�y! Ng��i v� Nh�t Tr�n v� ta m� kh� s� b�y l�u, kh�ng bi�t l�y g� b�o ��p, xin h�y nh�n l�y!","��y l� c�i g�?","C�i n�y l� ti�n s� �� l�i cho ta, c� th� th� g�n ho�t m�ch, c� hi�u qu� t�ng c�ng l�c nh�t th�i!")
	elseif (GetSeries() == 2) and (GetFaction() == "cuiyan") then		-- ��������Լ����ɶԻ�
		if (UTask_cy == 10*256+10) and (HaveItem(0) == 1) then		-- 10���������
			Talk(2,"L10_prise","Ch��ng m�n, �� t� �� gi�p ng��i t�m l�i Th�y V� Tr�m �� m�t! ","T�t qu�! Ng��i �� t�m l�i ���c r�i.")
		elseif (UTask_cy == 10*256) and (GetLevel() >= 10) then		--10����������
			Say("Th�t �au l�ng! H�m qua khi �i d�o � khu r�ng nh� ph�a ��ng Nam �� ��nh r�i c�y Th�y V� tr�m m� ta y�u qu� nh�t!",2,"Ta gi�p ng��i t�m l�i /L10_get_yes","Gi� v� nh� kh�ng nghe/no")
		elseif (UTask_cy == 50*256+50) then		--���50������
			Talk(1,"L50_prise","�� t� �� l�m tr�n s� m�nh �� gi�p S�ng Th�nh T� t�m v� ���c V� ��ng Quan �m. Ph��ng tr��ng ��i s� nh� �� t� chuy�n l�i c�m �n ��n S� ph�.")
		elseif (UTask_cy == 50*256) and (GetLevel() >= 50) then			--50����������
			Say("Ph��ng tr��ng H� Vi�n � S�ng Th�nh T� ��i L� l� b�n th�n c�a ta. Ph��ng tr��ng m�i ph�i ng��i ��n n�i c� m�t b�n tr�m ��n l�y �i V� ��ng Quan �m m�t trong nh�ng 'S�ng Th�nh Ng� B�o', b� ph�t hi�n �� ch�y v�o Thi�n T�m Th�p. T�n tr�m v� c�ng r�t cao c��ng, c�c t�ng kh�ng ai ��ch n�i, n�n ph�i ng��i ��n c�u c�u b�n m�n, ng��i c� ��ng � ��n S�ng Th�nh T� gi�p �� b�t t�n tr�m kh�ng?",2,"Kh�ng v�n ��, ta s� �i ��n S�ng Th�nh t� /L50_get_yes","V� c�ng �� t� th�p h�n e r�ng kh�ng l�m ���c /no")
		elseif (UTask_cy == 60*256+30) then							--��ʦ�������
			L60_prise()
		elseif (UTask_cy == 80*256) then						-- �ط�������ɳ���
			check_skill()
		elseif (UTask_cy >10*256) and (UTask_cy < 20*256) then		-- 10��������
			Talk(1,"","Ch�a t�m ���c Th�y V� Tr�m sao?")
		elseif (UTask_cy > 50*256) and (UTask_cy < 60*256) then		-- 50��������
			Talk(1,"","B�t ���c b�n tr�m ch�a?")
		elseif (UTask_cy >= 60*256) then		-- ���50�������ĳ���Ի�
			Talk(1,"","Chuy�n c�a S�ng Th�nh T� ng��i quy�t ��nh r�t ��ng, tr��c ��y kh�ng l�u Ph��ng tr��ng H� Vi�n c� ��n th�m v� c� h�i th�m ��n ng��i.")
		else		-- ����������״̬�³���Ի�
			Talk(1,"","V� c�ng c�a ng��i ti�n b� r�t nhanh, nh�ng c�ng ��ng v� th� m� t� m�n, c�n ph�i t�p luy�n nhi�u m�i c� th� th�nh c�ng.")
		end
	elseif (Uworld126 == 20) then			-- 90����������
		Talk(5,"Uworld126_talk","Do�n c� n��ng!","C�c h� c� chuy�n g�?","T�i h� nh�n l�i nh� ���c s� nh� v� c�a c�ng t� �o�n T� Th�mh, mu�n t�c h�p hai ng��i l�i, nh�ng L� c� n��ng qu� c� ch�p."," �i! Thu Th�y qu� c� ch�p. N�m �� �o�n c�ng t� l� m�t nh�n t�i, ��i v�i c� ta th�t l�ng th�t �, ��ng ti�c trong gia ��nh c�ng t� l�i l� ��c t�n, l�m sao c� th� gia nh�p v�o Thu� Y�n m�n ���c ch�. ��n nay mu�n quay tr� l�i v�i nhau th� th�t l� kh�, ta khuy�n kh�ng ���c c� n��ng �y, hy v�ng ng��i s� t�m ra ���c c�ch.","Th� ra l� th�! T�i h� s� c� g�ng.")
	elseif (Uworld126 == 80) and (GetFaction() ~= "cuiyan") then
		Talk(5,"Uworld126_finish"," Do�n c� n��ng! S� vi�c th�nh c�ng r�i! ","�?","S� vi�c l� nh� v�y� nh� v�y� ","T�n n�y thi�t l�! Nh�ng h� �� g�p nhau, duy�n ph�n ch�c c�ng s� quay v�, th�t kh�ng bi�t ph�i c�m �n ng��i nh� th� n�o.","T�i h� ngh� ���c l�m b�n v�i c�c c� n��ng �� r�t sung s��ng r�i, h� t�t ph�i c�m t�.")
	elseif (Uworld126 > 20) and (Uworld126 < 70) then
		Talk(1,"","Ti�u L� t�nh t�nh c� ch�p, c� �y kh�ng ch�u ���c nh�ng chuy�n c�a b�n m�n, c� �y cho r�ng kh�ng c� vi�c g� t�t ��p c�, n�n ph�i l�m phi�n c�c h� r�i.")
--	elseif (UTask_cy == 5*256+20) then			-- ת�������
--		Talk(1,"defection_complete","�����̣����츳���ˣ����źܿ���ܳ�Ϊ���Ŷ����ˣ���������������ʱʧȥ�书������ȥ�뱾�Ÿ�λ������Ϥһ�£������������˶�������ֵ�����ɡ�")
	elseif (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_cy == 70*256) and ((GetTask(1) < 5*256) or (GetTask(1) == 75*256)) then		-- �ط�ʦ������
		Talk(2,"return_sele","C� l�i ��n r�ng g�n ��y ng��i gi�t kh�ng �t b�n c��ng ��o, n�n r�t c� ti�ng t�m trong giang h�.","Nh�ng ta v�n nh� c�i kh�ng kh� �m �p trong m�n ph�i. Th�a s� ph� ta c� th� quay v� Th�y Y�n m�n ���c kh�ng?")
	elseif (GetCamp() == 4) and ((UTask_cy == 70*256+10) or (UTask_cy == 70*256+20)) then		-- �ط�ʦ��������
		Say("�� chu�n b� xong 5 v�n l��ng ch�a?",2,"�� chu�n b� xong/return_complete","V�n ch�a chu�n b� xong/return_uncompleted")
--	elseif (GetTask(1) == 70*256+10) and (HaveMagic(111) >= 0) then		-- �������ط����ɣ��ջر̺�����
--		Say("�����̣��ع�һȥ�������������ִ��Ҫ������ţ�",2,"�쳾ʵ�޿ɾ���������������ȥ��/defection_yes","���ٿ��ǿ���/no")
	else
		Talk(1,"","N�u b�n m�n v� ���ng m�n li�n minh ���ng nhi�n l� t�t, ch� l�. ")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
--	if (HaveMagic(114) == -1) then
--		AddMagic(114)					-- ����ѩ��
--		Msg2Player("��ѧ���ˡ�����ѩ�ġ�")
--		Say("�����̣�Ϊʦ��αչؿ�˼���գ��´���һ�С�����ѩ�ġ������ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
		Say("L�i nh� th� gi�i b�n ngo�i sao?",2,"Ph�i, xin ch��ng m�n �n chu�n /goff_yes","Kh�ng, ta t� th�y c�ng phut�p luy�n v�n ch�a ��. /no")
--	end
end
--------------------- ת������� ------------------------
function defection_complete()
	Msg2Player("Hoan ngh�nh ng��i gia nh�p Th�y Y�n m�n, tr� th�nh Hoa T� ")
	SetRevPos(154,61)		  				-- ������
	SetTask(6,10*256)						-- ����
	SetFaction("cuiyan")      			--��Ҽ�������
	SetCamp(3)
	SetCurCamp(3)
	SetRank(31)
	AddMagic(99)
	Msg2Player("H�c ���c Phong Hoa Tuy�t Nguy�t ")
	AddNote("Gia nh�p Th�y Y�n m�n, tr� th�nh Hoa T�, h�c ���c Phong Hoa Tuy�t Nguy�t ")
	Msg2Faction("cuiyan",GetName().." t� Nga Mi ��n gia nh�p Th�y Y�n m�n. L�c l��ng b�n ph�i �� m�nh l�i c�ng m�nh!",GetName())
end

-------------------------- �ط�������� ------------------------
function goff_yes()
	Talk(1,"","C� m�t s� vi�c, cu�i ch� c� b�n th�n ta tr�i qua m�i hi�u r�. Ng��i �i �� c� kinh nghi�m c�ng t�t.")
	SetCamp(4)
	SetCurCamp(4)
	SetTask(6,70*256)
	SetFaction("")
	AddNote("R�i kh�i Th�y Y�n m�n, l�i m�t l�n n�a ra giang h�. ")
	Msg2Player("R�i kh�i Th�y Y�n m�n, l�i m�t l�n n�a ra giang h�. ")
end

function return_sele()
	Say("���ng nhi�n l� ���c! B�n m�n kh�ng c� ng�n kh� c� ��nh, ng��i ch� c�n 5 n�m v�n l��ng b�c th� c� th� tr� v� m�n ph�i.",2,"Th� th� t�t qu�! /return_yes","�� ta �i l�y ti�n, r�i sau �� s� n�i ti�p. /return_no")
end;

function return_yes()
	Talk(1,"","���c! �� t� �i l�y 5 v�n l��ng! ")
	SetTask(6,70*256+20)
	AddNote("G�p 50000 l��ng b�c cho Th�y Y�n m�n th� c� th� quay v� m�n ph�i. ")
	Msg2Player("G�p 50000 l��ng b�c cho Th�y Y�n m�n th� c� th� quay v� m�n ph�i. ")
end;

function return_no()
	Talk(1,"","5 v�n l��ng kh�ng ph�i l� �t, ng��i h�y ngh� k� �i.")
end;

function return_complete()
	if (GetCash() >= 50000) then
		Talk(1,"","���c! 5 v�n l��ng �� nh�n ��. Ta phong ng��i l� Hoa Th�n c�a b�n ph�i, ��ng th�i truy�n cho ng��i h�c v� c�ng tuy�t k� b�n m�n ' B�ch H�i Tri�u Sinh', hi v�ng ng��i c� th� ti�p t�c n� l�c.")
		Pay(50000)
		SetTask(6,80*256)
		SetFaction("cuiyan")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(67)
--		if (HaveMagic(114) == -1) then
--			AddMagic(108)
--			AddMagic(111)
--			AddMagic(114)
		add_cy(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("Ng��i h�c ���c tuy�t k� tr�n ph�i c�a Th�y Y�n M�n l� B�ng C�t Tuy�t T�m, v� c�ng M�c D� L�u Tinh, B�ch H�i Tri�u Sinh ")
--		end
		Msg2Player(GetName().."<#>Quay l�i Th�y Y�n m�n, ���c phong l� Hoa Th�n ")
		AddNote("�� quay v� Th�y Y�n m�n, ��ng trong h�ng ng�. ")
	else
		Talk(1,"","Ng�n l��ng ng��i mang h�nh nh� kh�ng ��, kh�o nghi�m l�i xem.")
	end
end;

---------------------- �������� ---------------------------
function L10_get_yes()
	Talk(2,"","Hi�m th�y ng��i c� l�ng nh� th� n�y, v�y th� l�m phi�n ng��i.","S� ph� qu� kh�ch s�o r�i!")
	SetTask(6,10*256+10)
	AddNote("Ti�p nh�n nhi�m v� c�p 10: ��n khu r�ng nh� � ph�a ��ng nam t�m Th�y V� tr�m ")
	Msg2Player("Ti�p nh�n nhi�m v� c�p 10: ��n khu r�ng nh� � ph�a ��ng nam t�m Th�y V� tr�m ")
end;

function L10_prise()
	Talk(1,"","���c r�i! Ng��i th�t c� t�i! Ta s� th�ng cho ng��i l�n �� t� 10 c�p.")
	DelItem(0)
	SetTask(6,20*256)
	SetRank(32)
--	AddMagic(95)
--	AddMagic(97)
	add_cy(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("Giao Th�y V� tr�m, quay v� Do�n H�m Y�n ph�c m�nh, ho�n th�nh nhi�m v� t�m tr�m. Tr� th�nh Tam Ph�m Hoa S� ")
	Msg2Player("Ch�c m�ng b�n �� ���c phong th�nh Tam Ph�m Hoa S� c�a Th�y Y�n m�n, h�c ���c v� c�ng Th�y Y�n �ao ph�p, Th�y Y�n song �ao. ")
end;

function L50_get_yes()
	Talk(1,"","M�i vi�c ph�i c�n th�n.")
	SetTask(6,50*256+10)
	AddNote("Ti�p nh�n nhi�m v� c�p 50: V� H� Vi�n ph��ng tr��ng c�a S�ng Th�nh T� �o�t l�i V� ��ng Quan �m ")
	Msg2Player("Ti�p nh�n nhi�m v� c�p 50: V� H� Vi�n ph��ng tr��ng c�a S�ng Th�nh T� �o�t l�i V� ��ng Quan �m ")
end;

function L50_prise()
	Talk(1,"","R�t t�t! Ng��i qu� tr� d�ng song to�n, �� l�m kh�ng �t chuy�n cho B�n m�n, th�t kh�ng h� danh l� tr� c�t c�a b�n m�n! ")
	SetTask(6,60*256)
	SetRank(36)
--	AddMagic(109)
	add_cy(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! �� ���c phong l� Hoa Tinh! H�c ���c v� c�ng Tuy�t �nh ")
	AddNote("�o�t l�i V� ��ng Quan �m, ho�n th�nh nhi�m v� c�p 50, ���c phong l� Hoa Tinh ")
end;

function L60_prise()
	Msg2Player("B�n giao th� cho Do�n H�m Y�n, v� k� l�i to�n b� s� vi�c cho n�ng nghe. ")
	Talk(2,"","L�n n�y ng��i �� gi�p gi�i quy�t chuy�n B�n m�n, l�p ���c ��i c�ng. Ch�c m�ng ng��i! Ng��i c� th� xu�t s�! ","�a t� Ch��ng m�n! ")
	SetTask(6,70*256)
	SetRank(35)
	SetFaction("") 		   					--�˳�����
	SetCamp(4)
	SetCurCamp(4)
	DelItem(235)
	AddNote("B�n giao th� cho Do�n H�m Y�n, v� k� l�i to�n b� s� vi�c cho n�ng nghe, ho�n th�nh nhi�m v� x�t s�, ���c phong l� Hoa Ti�n ")
	Msg2Player("Ch�c m�ng b�n ���c l�m Hoa Ti�n, ng��i �� c� th� xu�t s� ")
end;

----------------------- �������� --------------------------
function Uworld51_20()
	SetTask(51,20)
	Msg2Player("�i�u tra ���ng Nh�t Tr�n r�t cu�c �� x�y ra chuy�n g�, c� c�ch g� quay tr� v� kh�ng? ")
end

function Uworld51_prise()
	SetTask(51,255)
	AddMagicPoint(1)
	Task86_2 = GetByte(GetTask(86),2) + 1
	if (Task86_2 > 255) then Task86_2 = 255 end
	Task86 = SetByte(GetTask(86),2,Task86_2)
	SetTask(86,Task86)			-- ��¼����ü��ܵ�����
	Msg2Player("Do�n H�m Y�n v� mu�n b�o ��p m� �� l�y Kim ��n c�a s� ph� �em t�ng cho ng��i. C�ng phu c�a ng��i �� t�ng l�n th�m 1 �i�m ")
	Msg2Player("Ho�n th�nh nhi�m v� r�a s�ch n�i oan ")
	AddNote("Ho�n th�nh nhi�m v� r�a s�ch n�i oan ")
end

function no()
end;

function Uworld126_talk()
	SetTask(126,30)
	Msg2Player("Do�n H�m Y�n c�ng kh�ng c� c�ch n�o t�t h�n. B�n quy�t ��nh quay v� g�p l�i L� Thu Th�y ")
	AddNote("Do�n H�m Y�n c�ng kh�ng c� c�ch n�o t�t h�n. B�n quy�t ��nh quay v� g�p l�i L� Thu Th�y ")
end

function Uworld126_finish()
	if (GetTask(6) >= 70*256) and (GetTask(6) ~= 75*256) then
		Talk(3,"","H�nh t�u giang h� th��ng g�p nhi�u nguy hi�m, � ��y H�m Y�n c� quy�n b� k�p c�a Th�y Y�n c� th� gi�p �ch cho ng��i. ","Th�t ng�i qu�!","Giang h� nhi n� kh�ng n�n c�u n�, h�y nh�n l�y �i!")
		if (HaveMagic(336) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(336,1)
		end
		if (HaveMagic(337) == -1) then		-- ����û�м��ܵĲŸ�����
			AddMagic(337,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("H�c xong v� c�ng B�ng tung V� �nh, B�ng T�m ti�n t� c�a Th�y Y�n. ")
		SetTask(126,255)
	else
	   Talk(2,"","C�u ng��i kh�ng c�n tr� �n, ��ng l� ngh�a hi�p! ","Do�n s� ph� �� qu� khen!")
	   SetTask(126,245)								--������������ñ���245
	end
	add_repute = ReturnRepute(30,100,4)			-- �������������30�㣬��100����ÿ���ݼ�4%
	AddRepute(add_repute)
	Msg2Player("<#>�� x�a b� �n o�n gi�a L� Thu Th�y v� �o�n T� Th�nh, nhi�m v� ho�n th�nh. Danh ti�ng c�a ng��i �� ���c t�ng l�n "..add_repute.."<#>�i�m.")
	AddNote("�� xo� b� �n o�n gi�a L� Thu Th�y v� �o�n T� Th�nh. Nhi�m v� ho�n th�nh. ")
end
