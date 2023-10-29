-- ���� ·��NPC �������� 10������40������
-- by��Dan_Deng(2003-08-01)
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
	G_TASK:OnMessage("Thi�u L�m", tbDailog, "DialogWithNpc")
	if (GetLevel() >= 120 and GetTask(LV120_SKILL_STATE) ~= 19 and GetLastFactionNumber() == 0) then
		tbDailog:AddOptEntry("H�c k� n�ng c�p 120.", lvl120skill_learn)
	end
	tbDailog:AddOptEntry("Mu�n th�nh gi�o vi�c kh�c", oldentence)
	tbDailog:Show() 
end

function oldentence()

	local UTask_sl = GetTask(7)
	local nFactID = GetLastFactionNumber();
	
	if (UTask_sl == 70*256) and (GetFaction() == "shaolin") then			-- ��ʦ��������
		SetFaction("")
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_sl == 70*256) and (GetTask(3) >= 5*256) and (GetTask(3) < 10*256) then		-- ��ǰ�ӹ����������
		SetTask(3,0)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_sl == 80*256) and (GetCamp() == 4) then			-- ��ʦ��������
		SetTask(7,70*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (GetTask(3) == 70*256) and (GetTask(7) == 70*256) then			-- ת���ɴ�������
		SetTask(3,75*256)
		Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
		return
	elseif (UTask_sl == 80*256 and nFactID == 0 and GetCamp() == 1 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("shaolin");
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	elseif (UTask_sl == 70*256 and nFactID == 0 and GetCamp() ~= 4 and GetFaction() == "M�i nh�p giang h� ") then
		 local _, nTongID = GetTong();
		 if (nTongID == 0) then
			SetFaction("");
			SetCurCamp(GetCamp());
			Say("H� th�ng ph�t hi�n sai s�t, �� k�p th�i h�i phuc!",0)
			return
		end
	end
	
	local tbDes = {"��i ngh� ��u s�/#daiyitoushi_main(0)", "Mu�n th�nh gi�o vi�c kh�c/common_talk"};
	
	Say("G�n ��y ta c� r�t nhi�u vi�c gi�i quy�t, ng��i ��n ��y c� vi�c g�.", getn(tbDes), tbDes);
end

function common_talk()
	local UTask_sl = GetTask(7)
	if (GetTask(39) == 10) and (GetBit(GetTask(40),7) == 0) then				-- ��������������
		Talk(1,"","��c C� Minh ch� �� c� h�ng t�i ch� l�n th� n�y, l�o n�p ��y nh�t ��nh nghe theo. Ch� l� b�n t� �ang l�m v�o c�nh b� trong tay ng��i Kim, l�o n�p kh�ng th� kh�ng m�ng ��n t�nh m�ng c�c ch�ng t�ng trong ch�a, kh�ng d�m t�y ti�n h�nh s�. Phi�n anh v� n�i v�i ��c C� Minh ch� l�o n�p ��y xin kh��t t�.")
		Uworld40 = SetBit(GetTask(40),7,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "shaolin") then
		if (UTask_sl == 10*256+10) and (HaveItem(26) == 1) then
			L10_prise()
		elseif ((UTask_sl == 10*256) and (GetLevel() >= 10)) then		--10����������
			Say("A Di �� Ph�t! T�t c� �� t� nh�p m�n ��u ph�i qua kh�o nghi�m, ng��i �� chu�n b� xong ch�a?",2,"Ta �� s�n s�ng!/L10_get_yes","Ta ch�a s�n s�ng!/L10_get_no")
		elseif (UTask_sl == 40*256+50) then		-- 40�����������
			SetTaskTemp(43,0)		-- ��ʱ����43,�����ش���ȷ�Ļ�
			Talk(1,"L40_sele3_1","Hai v� S� th�c t� nh� �� t� �em n�m c�u n�y chuy�n l�i cho Ch��ng m�n, n�i t�m � c�a hai ng��i �� n�m trong n�m c�u n�i n�y:")
		elseif ((UTask_sl == 40*256) and (GetLevel() >= 40)) then		--40����������
			Say("S� th�c t� b�n m�n T�ch Di�t hai ng��i v� c�ng �� ��t ��n c�nh gi�i th��ng th�a, nh�ng do n�m x�a hai v� v� mu�n tr�nh n� s� c�u x� tranh gi�nh trong b�n ph�i, �� v�o m�t th�t ph�a sau n�i b� quan kh�ng b��c ch�n ra, gi� ��y thi�n h� ��i lo�i, Trung Nguy�n nguy hi�m b�n b�, vi s� ��y mu�n nh� ng��i th�nh hai v� S� th�c t� ra t�m c�ch h�a gi�i, ng��i ��ng � �i m�i h� ra kh�ng?",2,"��ng �!/L40_get_yes","�� t� n�ng l�c y�u k�m, e kh�ng g�nh v�c ���c /no")
		elseif (UTask_sl == 80*256) or (UTask_sl == 80) then						-- �ط�������ɳ��룬�Լ����ܵ�������ж�
			check_skill()
		else
			Talk(1,"","T�t! T�t! C� g�ng l�n! Ph�t T� s� ph� h� cho ng��i ��.")
		end
--	elseif (UTask_sl == 5*256+20) then			-- ת�������
--		Talk(1,"defection_complete","�����ɣ������ӷ𣬼�����ţ��ͺú���ʰ�������вؾ����ڵ伮����Ҫ��ȥ����ս����ɱ�����޼ҳ��ˡ�")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_sl == 70*256) and ((GetTask(3) < 5*256) or (GetTask(3) == 75*256)) then		-- �ط�ʦ������
		Talk(1,"return_sele","S� ph�, �� t� c� th� m��n kinh �i�n trong T�ng Kinh C�c ���c kh�ng v�y?")
	elseif (GetCamp() == 4) and ((UTask_sl == 70*256+10) or (UTask_sl == 70*256+20)) then		-- �ط�ʦ��������
		Say("5 v�n l��ng �� chu�n b� xong ch�a?",2,"�� chu�n b� xong/return_complete","V�n ch�a chu�n b� xong/return_uncompleted")
--	elseif (GetTask(3) == 70*256+10) and (HaveMagic(21) >= 0) then		-- �������ط����ɣ��ջؽ�����
--		Say("�����ɣ�����������ս������������Ͷ��������ֽ���Դ��������ơ�",2,"Ϊ��ʦ�����գ����ջص�������/defection_yes","���ӿ���δ�ܣ���ʦ��ԭ��/no")
	else							-- ����Ի�
		Talk(1,"","��i v�i t�ng nh�n trong ch�a Thi�u L�m m� n�i, c�ng phu l� s� tu h�nh, s� t�a thi�n. M�c ��ch luy�n c�ng c�a ch�ng ta l� mu�n thay ��i t� ch�t c�a m�t ng��i, c�c t�ng nh�n luy�n v� trong Thi�u L�m ch�nh l� tu h�nh ��y.")
	end
end;
---------------------- ���ܵ������ ------------------------
function check_skill()
--	if (HaveMagic(273) == -1) then
--		AddMagic(273)					-- ����ǧҶ��
--		Msg2Player("��ѧ���ˡ�����ǧҶ�֡�")
--		Say("�����ɣ�Ϊʦ��αչؿ�˼���գ��´���һ�С�����ǧҶ�֡������ڴ������㡣��ѧ����Ȼ�ȥ�ú���Ϣһ���������˵�������",1,"��лʦ��/KickOutSelf")
--	else
		Say("Kh� Thi�n Tu B�t T�n, Nh�t Phi�n Du T� T�m. Gi� ng��i �� tr� th�nh ng��i trong giang h� r�i n�u mu�n xu�ng n�i th� h�y �i �i!",2,"�� t� ph��ng Tr��ng �n chu�n /goff_yes","�� t� kh�ng d�m l�m x�ng l�m b�y /no")
--	end
end
--------------------- ת������� ------------------------
function defection_complete()
	Msg2Player("Hoan ngh�nh b�n gia nh�p Thi�u L�m ph�i, tr� th�nh T�o ��a T�ng. ")
	SetRevPos(103,51)		  			--����������
	SetTask(7,10*256)					-- ����
	SetFaction("shaolin")       	--��Ҽ�������
	SetCamp(1)
	SetCurCamp(1)
	SetRank(1)
	AddMagic(10)
	Msg2Player("H�c ���c Kim Cang Ph�c Ma. ")
	AddNote("Gia nh�p Thi�u L�m ph�i, tr� th�nh T�o ��a T�ng, h�c ���c Kim Cang Ph�c Ma. ")
	Msg2Faction("shaolin",GetName().." t� Thi�n V��ng bang ��n gia nh�p Thi�u L�m ph�i. L�c l��ng b�n ph�i �� m�nh l�i c�ng m�nh!",GetName())
end

---------------------- �ط�������� --------------------------
function goff_yes()
	Talk(1,"","H�ng Tr�n V�ng B�t Xuy�n, Ph�n Tranh K� Th�i ��nh. �i �i! Nh�ng nh� l�y xu�ng n�i v�n ph�i gi� l�ng t� bi ��y.")
	SetTask(7,70*256)
	AddNote("R�i kh�i Thi�u L�m t�, xu�ng n�i ti�p t�c h�nh t�u giang h�. ")
	Msg2Player("R�i kh�i Thi�u L�m t�, xu�ng n�i ti�p t�c h�nh t�u giang h�. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function return_sele()
	Say("Xu�t s� xong �� kh�ng c�n l� �� t� Thi�u L�m, ���ng nhi�n l� kh�ng ���c r�i. Nh�ng n�u mu�n tham kh�o Ph�t l� th� Thi�u L�m lu�n r�ng m� ��n ng��i tr�ng ph�n m�n ph�i.",2,"Ta mu�n quay l�i Thi�u L�m /return_yes","Kh�ng c�n ��u/no")
end;

function return_yes()
	Talk(1,"","T��ng Ph�t l�u ng�y kh�ng tu s�a n�n c� ph�n h� h�i, n�u nh� ng��i h�a duy�n cho b�n t� 50000 l��ng th� c� th� tr�ng ph�n Thi�u L�m..")
	SetTask(7,70*256+20)
	AddNote("N�p 50000 l��ng b�c �� quay l�i Thi�u L�m ")
	Msg2Player("N�p 50000 l��ng b�c �� quay l�i Thi�u L�m ")
end;

function return_complete()
	if(GetCash() >= 50000) then								-- ��50000��
		Talk(1,"","R�t t�t! C�n c� theo s� ��ng g�p c�a ng��i cho b�n t�, ���c vinh h�nh nh�n ch�c danh H� Ph�p Tr��ng l�o.")
		Pay(50000)
		SetTask(7,80*256)
		SetFaction("shaolin")
		SetCamp(1)
		SetCurCamp(1)
		SetRank(72)
--		if (HaveMagic(273) == -1) then
--			AddMagic(273)
--			AddMagic(21)
		add_sl(70)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		Msg2Player("B�n h�c ���c tuy�t h�c tr�n Thi�u L�m ph�i Nh� Lai Thi�n Di�p, v� c�ng D�ch C�n Kinh. ")
--		end
		AddNote("�� quay tr� l�i Thi�u L�m ph�i. ")
		Msg2Faction(GetName().." �� tr� l�i Thi�u L�m, ���c phong l�: H� Ph�p Tr��ng l�o ")
	else
		Talk(1,"","A Di �� Ph�t, h�nh nh� kh�ng �� 5 v�n l��ng th� ph�i.")
	end
end;

------------------------- ����������� --------------------------------
function L10_get_yes()
	Talk(1, "", "Ch� c�n ng��i thu�n l�i l�y ���c Kim Li�n hoa trong h�m M�c Nh�n th� c� th� th�ng qua kh�o nghi�m")
	DelItem(26)
	SetTask(7,10*256+10)
	AddNote("Ti�p nh�n th� th�ch c�a Thi�u L�m ph�i: l�y Kim Li�n Hoa t� M�c Nh�n H�ng. ")
	Msg2Player("Ti�p nh�n th� th�ch c�a Thi�u L�m ph�i: l�y Kim Li�n Hoa t� M�c Nh�n H�ng. ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","R�t t�t! Ng��i ���c th�ng l�m H� Vi�n V� T�ng.")
	DelItem(26)
	SetTask(7,20*256)
	SetRank(2)
--	AddMagic(8)
--	AddMagic(4)
--	AddMagic(6)
	add_sl(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	AddNote("L�y ���c Kim Li�n Hoa, tr� l�i g�p Huy�n Nh�n ph��ng Tr��ng, ho�n th�nh th� th�ch Thi�u L�m ph�i. Th�ng c�p H� Vi�n V� T�ng. ")
	Msg2Player("Ch�c m�ng b�n! B�n �� th�ng c�p H� Vi�n V� T�ng c�a Thi�u L�m ph�i! H�c ���c Thi�u L�m Quy�n Ph�p, Thi�u L�m C�n Ph�p, Thi�u L�m �ao ph�p. ")
end;

function L40_get_yes()
	SetTask(7,40*256+10)
	AddNote("Nh�n l�nh c�a Huy�n Nh�n ph��ng Tr��ng, �i th�nh T�ch Di�t Nh� T�ng xu�t quan. ")
	Msg2Player("Nh�n l�nh c�a Huy�n Nh�n ph��ng Tr��ng, �i th�nh T�ch Di�t Nh� T�ng xu�t quan. ")
end;

function L40_sele3_1()
	Say("C�u th� nh�t l�:",5,"Sinh di�t bi�n d�, h� ng�y v� ch� /L40_sele3_2","T� ��i kh� kh�ng, ng� �m v� ng� /L40_sele3_2","Nh� th� quan s�t, ti�m li sinh t� /L40_sele3_2","Th� gian v� th��ng, qu�c th� nguy tuy�t /L40_sele3_correct1","T�m th� �c nguy�n, h�nh vi t�i t�u /L40_sele3_2")
end;

function L40_sele3_correct1()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ���һ������ֵ��1��ȫ�Է��ɽ���
	L40_sele3_2()
end;

function L40_sele3_2()
	Say("C�u th� hai l�:",5,"Th� gian v� th��ng, qu�c th� nguy tuy�t /L40_sele3_3","T� ��i kh� kh�ng, ng� �m v� ng� /L40_sele3_correct2","Sinh di�t bi�n d�, h� ng�y v� ch� /L40_sele3_3","Nh� th� quan s�t, ti�m li sinh t� /L40_sele3_3","T�m th� �c nguy�n, h�nh vi t�i t�u /L40_sele3_3")
end;

function L40_sele3_correct2()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ���һ������ֵ��1��ȫ�Է��ɽ���
	L40_sele3_3()
end;

function L40_sele3_3()
	Say("C�u th� ba l�:",5,"T�m th� �c nguy�n, h�nh vi t�i t�u /L40_sele3_4","Nh� th� quan s�t, ti�m li sinh t� /L40_sele3_4","T� ��i kh� kh�ng, ng� �m v� ng� /L40_sele3_4","Th� gian v� th��ng, qu�c th� nguy tuy�t /L40_sele3_4","Sinh di�t bi�n d�, h� ng�y v� ch� /L40_sele3_correct3")
end;

function L40_sele3_correct3()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ���һ������ֵ��1��ȫ�Է��ɽ���
	L40_sele3_4()
end;

function L40_sele3_4()
	Say("C�u th� b�n l�:",5,"Nh� th� quan s�t, ti�m li sinh t� /L40_sele3_5","T�m th� �c nguy�n, h�nh vi t�i t�u /L40_sele3_correct4","Th� gian v� th��ng, qu�c th� nguy tuy�t /L40_sele3_5","Sinh di�t bi�n d�, h� ng�y v� ch� /L40_sele3_5","T� ��i kh� kh�ng, ng� �m v� ng� /L40_sele3_5")
end;

function L40_sele3_correct4()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ���һ������ֵ��1��ȫ�Է��ɽ���
	L40_sele3_5()
end;

function L40_sele3_5()
	Say("C�u th� n�m l�:",5,"T� ��i kh� kh�ng, ng� �m v� ng� /L40_sele3_result","Sinh di�t bi�n d�, h� ng�y v� ch� /L40_sele3_result","Nh� th� quan s�t, ti�m li sinh t� /L40_sele3_correct5","T�m th� �c nguy�n, h�nh vi t�i t�u /L40_sele3_result","Sinh di�t bi�n d�, h� ng�y v� ch� /L40_sele3_result")
end;

function L40_sele3_correct5()
	SetTaskTemp(43,GetTaskTemp(43) + 1)		-- ���һ������ֵ��1��ȫ�Է��ɽ���
	L40_sele3_result()
end;

function L40_sele3_result()
	if (GetTaskTemp(43) == 5) then		-- ���ȫ��
		Talk(1,"","Nhi�m v� n�y ng��i ho�n th�nh t�t l�m, vi s� s� th�ng ng��i l�m �� t� c�p 40, ��ng l�m ta th�t v�ng nh�!")
		SetTask(7,50*256)
		SetRank(5)
--		AddMagic(20)
		add_sl(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
		AddNote("L�y ���c l�i ch� b�o t� ch� T�ch Di�t Nh� T�ng, ho�n th�nh nhi�m v� T�ch Di�t Nh� T�ng. Th�ng c�p Truy�n Kinh La H�n. ")
		Msg2Player("Ch�c m�ng b�n. B�n �� th�ng c�p Truy�n Kinh La H�n c�a Thi�u L�m ph�i! H�c ���c v� c�ng S� T� H�ng. ")
	else
		Talk(1,"","N�m c�u n�i n�y l� sao ��y, c� ph�i ng��i �� ��c ng��c kh�ng?")
	end
	SetTaskTemp(43,0)			-- ������ͷű���
end;

function no()
end
