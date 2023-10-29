-- ���� ���� ����� �������񡢳�ʦ�����ط���������
-- by��Dan_Deng(2003-07-30)
-- Update��Dan_Deng(2003-10-27)��д�ط�ʦ�����񣬲���������ű�

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	-- ����Ͷʦ

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�."
	G_TASK:OnMessage("C�n L�n", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 9) then
		tbDailog:AddOptEntry("H�c k� n�ng c�p 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Mu�n th�nh gi�o vi�c kh�c", oldentence)
	tbDailog:Show() 
end

function oldentence()
	local UTask_kl = GetTask(9);
	local nFactID = GetLastFactionNumber();

	if (UTask_kl == 70*256) and (GetFaction() == "kunlun") then			-- ��ʦ��������
		SetFaction("")
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_kl == 70*256) and (GetTask(5) >= 5*256) and (GetTask(5) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(5,0)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_kl == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(9,70*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (GetTask(5) == 70*256) and (GetTask(9) == 70*256) then			-- ת���ɴ�������
		SetTask(5,75*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_kl == 80*256 and nFactID == 9 and GetCamp() == 3 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("kunlun");
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	elseif (UTask_kl == 70*256 and nFactID == 9 and GetCamp() ~= 4 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	end

	local tbDes = {"��i ngh� ��u s�/#daiyitoushi_main(9)", "Mu�n th�nh gi�o vi�c kh�c/common_talk"};
	
	Say("G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_kl = GetTask(9);
	local Uworld31 = GetByte(GetTask(31),2)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),9) == 0) then				-- ��������������
		Talk(1,"","Th�n l� th�n d�n ��i T�ng, ch�ng gi�c ngo�i x�m t�t nhi�n ngh�a b�t kh� t�, nh�ng nh�c ph� c�a ��c C� Ki�m Tr��ng Phong t�ng ph�c v� cho ng��i Kim. �� h�n th� l�nh, ch� e kh� l�ng m� ph�c t�ng")
		Uworld40 = SetBit(GetTask(40),9,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl == 60*256+20) and (HaveItem(16) == 1)) then	-- ��ʦ�������
			Talk(2,"L60_prise","Ch��ng m�n! �� t� kinh tr�i tr�m gian ng�n kh�, cu�i c�ng �� t�m ���c Ng� S�c th�ch t�i Ho�ng H� nguy�n ��u!","Ch� hy v�ng vi�n Ng� S�c th�ch n�y c� th� mang l�i h�ng ph�c cho b�n m�n. Ng��ic� th� ho�n th�nh nhi�m v� to l�n kh� kh�n n�y, ta c�ng c�m th�y r�t y�n vui! T� ��y ng��i c� th� thu�n l�i xu�t s� r�i!")
		elseif ((UTask_kl == 60*256) and (GetLevel() >=50)) then		-- ��ʦ����
			Say("Truy�n thuy�t k�: n�m x�a N� Oa luy�n Ng� S�c th�ch v� tr�i, v� xong tr�i, l�y nh�ng vi�n �� d� ra r�i xu�ng tr�n gian, trong �� c� 1 vi�n r�i ngay Ho�ng H� nguy�n ��u. Ng� S�c th�ch t��ng tr�ng quang minh v� h�nh ph�c, ai c� ���c Ng� S�c th�ch, ng��i �� s� g�p may tr�nh n�n. N�u ng��ic� th� gi�p b�n ban t�m ���c Ng� S�c th�ch, ng��ic� th� thu�n l�i xu�t s�.",2,"V�y �� t� s� �i t�m /L60_get_yes","Chuy�n �� nh� m� kim ��y bi�n, hay l� th�i v�y. /L60_get_no")
		elseif (UTask_kl == 80*256) then						-- �ط�������ɳ���
			check_skill()
			Say("C� v� nh� v� ngh� c�a ng��i c�ng kh�ng k�m, c� th�ch xu�ng n�i th�c ti�n m�t phen?",2,"�� t� c�ng �ang c� � �� /goff_yes","�� t� mu�n t�p luy�n th�m 1 th�i gian n�a. /no")
		else
			Talk(1,"","L�m Ch��ng m�n kh�ng d� d�ng ch�t n�o!")
		end
	elseif (Uworld31 == 20) then		--��������
		Talk(4,"enroll_prise","Nghe n�i ng��i b�t cho con g�i ta 1 con kim t� h�u?","��ng v�y!","Uhm! Th� th� ng��ic� y�u c�u g�?","V�n b�i mu�n b�i t� nh�p C�n L�n ph�i h�c ngh� ")
--	elseif (UTask_kl == 5*256+20) then			-- ת�������
--		Talk(1,"defection_complete","����ӣ��ã��ã���Ҳת�˹������䵱�������ӣ�")
	elseif (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_kl == 70*256) and ((GetTask(5) < 5*256) or (GetTask(5) == 75*256)) then		-- �ط�ʦ������
		Talk(1,"return_select","S� ph�! �� t� ra giang h� phi�u b�t �� ���c m�t th�i gian, c�m th�y m�nh ki�n th�c k�m c�i, c� th� cho �� t� quay v� t�i nh�p m�n �� ti�n tu v� c�ng?")
	elseif (GetCamp() == 4) and ((UTask_kl == 70*256+10) or (UTask_kl == 70*256+20)) then		-- �ط�ʦ��������
		Say("��o l� l�m ng��i nh� ng��i v�a n�i ��, h�c ���c � ��u v�y?",2,"�� chu�n b� xong/return_complete","V�n ch�a chu�n b� xong/return_uncompleted")
	elseif (GetTask(5) == 70*256+10) and (HaveMagic(182) >= 0) then		-- �䵱�ط����ɣ��ջ���������
		Say("V� �ang to�n m�t l� tham danh l�a g�t m�i ng��i, u�ng c�ng ta t�n t�m l�c ��o t�o ng��i th� m� ng��i d�m l�m chuy�n v� �n b�i ngh�a nh� v�y!",2,"Kh�ng sai, � ta �� quy�t. /defection_yes","�� t� �� bi�t l�i r�i. /no")
	else
		Talk(1,"","Thi�u L�m, V� �ang th� �� l� g�? S� c� m�t ng�y, ta ��p b�n h� d��i g�t gi�y")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
--	if (HaveMagic(275) == -1) then
--		AddMagic(275)					-- ˪������
--		Msg2Player("��ѧ���ˡ�˪�����ء�")
--		Say("����ӣ�Ϊʦ��αչؿ�˼���գ��´���һ�С�˪�����ء������ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
		Say("C� v� nh� v� ngh� c�a ng��i c�ng kh�ng k�m, c� th�ch xu�ng n�i th�c ti�n m�t phen?",2,"D�! �� t� �i li�n /goff_yes","�� t� t�p luy�n v�n ch�a �� /no")
--	end
end
--------------------- ת������� ------------------------
function defection_complete()
	Msg2Player("Hoan ngh�nh b�n gia nh�p C�n L�n ph�i, tr� th�nh Ph�t tr�n �� t�. ")
	SetRevPos(131,57)		  				-- ����������
	SetTask(9,10*256)						-- ����
	SetFaction("kunlun")      			-- ��Ҽ�������
	SetCamp(3)
	SetCurCamp(3)
	SetRank(19)
	AddMagic(169)
	Msg2Player("H�c ���c H� Phong ph�p ")
	AddNote("Gia nh�p C�n L�n ph�i, tr� th�nh Ph�t Tr�n �� t�, h�c ���c H� Phong ph�p ")
	Msg2Faction("kunlun",GetName().." t� V� �ang ��n gia nh�p C�n L�n ph�i. L�c l��ng b�n ph�i �� m�nh l�i c�ng m�nh!",GetName())
end

-------------------------- �ط�������� ---------------------
function goff_yes()
	Talk(1,"","���c r�i! Ng��i h�y �i �i! ��ng qu�n r�ng nh� c� ch�ng ta m� ng��i m�i c� ���c ng�y h�m nay!")
	SetTask(9,70*256)
	AddNote("R�i kh�i C�n L�n ph�i, l�i ti�p t�c phi�u b�t giang h� ")
	Msg2Player("R�i kh�i C�n L�n ph�i, l�i ti�p t�c phi�u b�t giang h� ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_select()
	Say("�i�u n�y kh�ng h�p v�i quy ��nh c�a m�n ph�i. Nh�ng n�u ng��i l� ng��i th�u hi�u ��o l�, ta c� th� gi�p ng��i ngh� c�ch ",2,"T�ng 50000 l��ng b�c /return_yes","Kh�ng tr�ng ph�n s� m�n n�a /return_no")
end;

function return_yes()
	Talk(1,"","T�t l�m! Qu� nhi�n l� ng��i bi�t �i�u. Ng��i �� ng� ra nh�ng ��o l� l�m ng��i r�i, c�ng n�n nhanh ch�ng chu�n b� �i!")
	SetTask(9,70*256+20)
	AddNote("Ch� c�n giao n�p 50. 000 l��ng b�c th� c� th� tr�ng ph�n s� m�n ")
	Msg2Player("Ch� c�n giao n�p 50. 000 l��ng b�c th� c� th� tr�ng ph�n s� m�n ")
end;

function return_no()
	Talk(1,"","N�u nh� v�y ch�c ta l�i ph�i quay v� giang h� ti�p t�c h�c t�p th�m m�t th�i gian n�a. ")
end;

function return_complete()
	if(GetCash() >= 50000) then
		Talk(1,"","T�t l�m! V�y th� ta s� �i th�ng b�o tin ng��i �� quay tr� l�i m�n ph�i. ")
		Pay(50000)
		SetTask(9,80*256)
		SetFaction("kunlun")
--		if (HaveMagic(275) == -1) then
--			AddMagic(182)
--			AddMagic(275)
		add_kl(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("B�n �� h�c tuy�t h�c Tr�n ph�i S��ng Ng�o C�n L�n, Ng� L�i Ch�nh Ph�p")
--		end
		SetCamp(3)
		SetCurCamp(3)
		SetRank(75)
		AddNote("�� quay tr� l�i C�n L�n ph�i, l�i ghi t�n trong m�n ph�i ")
		Msg2Player(GetName().."<#>���c phong l�m H� Ph�p Ch�n Qu�n c�a C�n L�n ph�i, tr� v� ph�i C�n L�n ti�p t�c tu h�nh. ")
	else
		Talk(2,"","Ch� n�i mi�ng kh�i kh�i, kh�ng ��a ra h�nh ��ng c� th� n�o sao?","Xin l�i! Ta s� l�p t�c �i ki�m ti�n!")
	end
end;

function return_uncompleted()
	Talk(1,"","C� �m �m �ng �ng nh� th�, l�m sao cho ng��i ta tin ���c th�nh � c�a ng��i!")
end;

----------------------- ����������� -------------------
function enroll_prise()
	Talk(1,"","Mu�n nh�p m�n th� ch� b�ng c�i vi�c nh� nh�t nh� v�y th�i kh�ng ��, nh�ng th�y ng��ith�ng minh lanh l�, b�n to� cho ph�p ng��i l�m K� Danh �� t� v�y! ")
	i = ReturnRepute(30,29,3)		-- ȱʡ�������������ĵȼ���ÿ���ݼ�
	AddRepute(i)
	Uworld31 = SetByte(GetTask(31),2,127)
	SetTask(31,Uworld31)
	AddNote("<#>Ho�n th�nh nhi�m v� Kim T� H�u, tr� th�nh <color=Red>K� Danh �� t�<color>. Danh v�ng c�a b�n t�ng th�m "..i.."<#>�i�m.")
	Msg2Player("Ho�n th�nh nhi�m v� Kim T� H�u, tr� th�nh K� danh �� t�. ")
end;

function L60_get_yes()
	SetTask(9,60*256+10)
	AddNote("Ti�p nh�n nhi�m v� xu�t s�: ��n Ho�ng H� Nguy�n ��u t�m Ng� S�c th�ch ")
	Msg2Player("Ti�p nh�n nhi�m v� xu�t s�: ��n Ho�ng H� Nguy�n ��u t�m Ng� S�c th�ch ")
end;

function L60_get_no()
end;

function L60_prise()
	Talk(1,"","�a t� Ch��ng m�n! ")
	DelItem(16)
	SetRank(65)
	SetTask(9, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Ho�n th�nh nhi�m v� xu�t s�, ���c phong l� Ti�n Ph� Ch�n Qu�n ")
	Msg2Player("Ch�c m�ng B�n! Th�nh ngh� xu�t s�! B�n �� ���c phong l� Ti�n Ph� Ch�n Qu�n ")
end;
