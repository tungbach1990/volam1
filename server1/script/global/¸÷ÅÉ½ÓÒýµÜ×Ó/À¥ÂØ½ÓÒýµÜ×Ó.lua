-- �����ɽ������ӽű�������
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "C�n L�n H� Ph�p"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 9 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyukunlun","Ng��i �� l� �� t� c�a b�n ph�i, kh�ng c�n �i n�a, c� th� tr�c ti�p g�p Long Ng� n�i chuy�n.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Qu� ��ng l� m� n�! Ng��i x� T�y B�c kh� h�n kh� m� s�nh ���c! ")
	elseif (player_Faction == "emei") then				
		Talk(1,"","N� l�u th� n�n h�c c�ch ch�m s�c ch�ng con! Vung g��m m�a ki�m ch�ng ra th� th�ng g�!  ��ng l� th�i th� ��o lo�n! ")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","���ng m�n �m kh� l�m sao c� th� so s�nh v�i ch� thu�t ��o ph�p thi�n t�n c�a b�n ta! ")
	elseif (player_Faction == "wudu") then
		Talk(1,"","A! T� ma ngo�i ��o l�i d�m xu�t hi�n � ��y! H�y xem thanh ki�m c�a l�o gia ��y! ")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Thi�n v��ng bang tuy hi�n nay kh� m�nh, nh�ng do m�t n� l�u l�nh ��o!  R�i c�ng c� ng�y l�m ti�u tan c� nghi�p")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Ai c�ng b�o Thi�u l�m l� v� h�c ch�nh t�ng nh�ng s�nh sao ���c v�i Thi�n s� ��o thu�t c�a C�n L�n ta?")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Hai ph�i ch�ng ta c�ng thu�c ��o gia!  Vi�c g� c� ph�i ph�n tranh cao th�p! ")
	elseif (player_Faction == "kunlun") then
		Say("Th� gi�i ngo�i kia t��i ��p ch� kh�ng nh� x� T�y b�c kh� h�n n�y! C� mu�n �i v� kh�ng?",4,"V� th�i! �a t� ��o huynh! /return_yes","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Ch�i vui nh� th� n�y, v� s�m l�m g�?/no")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Di�t s�ch c�u Kim ch�nh l� b�n ph�n c� ��i ta!  L�i ��y n�m th� m�t ki�m c�a l�o gia n�o! ")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","C�i bang anh h�ng!  H�!  Th�c ch�t ch� l� m�t b�n � h�p ch� ra g�! ")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","T� h�c kh� luy�n!  T�i h� v� c�ng b�i ph�c! ")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_kl = nt_getTask(9)
--		if (GetSeries() == 4) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_kl < 5*256) and (nt_getTask(5) == 70*256) then		-- ת������������
--			Say("���ػ��������ŵ�һ�϶���ʲô�û�����һ���ϼһ�����Ż�˵�������껹����ӣ��������������ʲôǰ;���������������������ˣ������������ɷ���ǣ��ѵ��㲻��Ľ��",2,"��...���Կ���/defection_get","��ҥ�̰�����ҡײƭ֮ͽ�����ޣ�/no")
		if ((UTask_kl > 5*256) and (UTask_kl < 10*256)) then		-- ����������
			Talk(1,"","B�n ph�i kh�ng nh�n nh�ng k� l��i bi�ng!  Tr��c ti�n h�y ho�n th�nh nhi�m v� nh�p m�n, sau h�y t�nh! ")
		elseif (UTask_kl >= 70*256) and (player_Faction ~= "kunlun") then					--�Ѿ���ʦ
			Say("Nghe n�i sau khi ng��i xu�ng n�i �� l�p ch�t c�ng danh, c� nh� ��n s� �� s� mu�i ch�ng ta kh�ng?",3,"T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","K�t th�c ��i tho�i/no")
		else
			Talk(1,"enroll_select","C�n L�n ph�i � T�y V�c xa x�i, r�t �t giao h�o v�i Trung Nguy�n. Tr�i qua m�y ��i ch��ng m�n �� d�n tr� th�nh m�t trong Nh�t ��i m�n ph�i. ")
		end
	end
end;

function defection_get()
	Talk(1,"","Ng��i m�i l� anh h�ng th�c th�i!  H�y mau �i n�i v�i l�o ��o nhi, sau �� ��n di�n ki�n ch��ng m�n Tuy�n C� T� c�a ta �� xin nh�p m�n! ")
	nt_setTask(9,5*256+10)
	Msg2Player("Mu�n gia nh�p C�n L�n ph�i, h�y �i xin ph�p ��o Nh�t Ch�n Nh�n, sau �� ��n di�n ki�n ch��ng m�n Tuy�n C� T� l� ���c!")
	AddNote("Mu�n gia nh�p C�n L�n ph�i, h�y �i xin ph�p ��o Nh�t Ch�n Nh�n, sau �� ��n di�n ki�n ch��ng m�n Tuy�n C� T� l� ���c!")
end

function enroll_select()
	UTask_kl = nt_getTask(9)
	UTask_wd = nt_getTask(5)
	if ((UTask_wd > 5*256) and (UTask_wd < 10*256)) then		-- �ѽ����䵱��������
		Talk(1,"","Th� ra ng��i v�n mu�n gia nh�p V� �ang!  C�ng t�t th�i!  Nh�n s� Trung nguy�n th�ch s�ng b�i c�c danh m�n ch�nh ph�i")
	elseif (GetSeries() == 4) and (GetCamp() == 0) and (UTask_wd < 5*256) and (UTask_kl < 5*256) then		--ˮϵ��δ���䵱����
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("B�n m�n tinh th�ng ��o ch� ki�m thu�t. B�n V� �ang  l� c�i th� g� ch�!  C� mu�n gia nh�p b�n ph�i kh�ng?", 3, "Gia nh�p C�n L�n/go", "�� ta suy ngh� k� l�i xem/no","T�m hi�u tinh hoa v� ngh� c�c m�n ph�i/Uworld1000_knowmagic")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m qu�!  H�y luy�n ��n c�p 10 �i r�i ��n t�m ta! ")
		end
	end		-- ������ϵ�ľͲ��ٶ�˵���ˡ�
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(131,57)		  				-- �ȴ��ṩ������
	nt_setTask(9,10*256)						-- ֱ������
	SetFaction("kunlun")      			-- ��Ҽ�������
	SetCamp(3)
	SetCurCamp(3)
	SetRank(19)
	nt_setTask(137,69)
	SetLastFactionNumber(9)
-- ֱ�Ӵ�������
--	nt_setTask(9,80*256)
--	SetRank(75)
--	Msg2Player("��ӭ������䵱�ɣ�������ֱ��ѧ�᱾�����м��ܡ�")
	add_kl(GetLevel())			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
	Msg2Player("Hoan ngh�nh b�n gia nh�p C�n L�n ph�i. Tr� th�nh Ph�t tr�n �� t�! H�c ���c H� Phong Ph�p, Cu�ng L�i Ch�n ��a")
	AddNote("Gia nh�p C�n L�n ph�i, tr� th�nh Ph�t Tr�n �� t�.")
	Msg2Faction("kunlun",GetName().."t� h�m nay gia nh�p C�n L�n ph�i! Xin b�i ki�n c�c v� ��o huynh s� t�! Mong c�c v� quan t�m ch� gi�o!",GetName())
---off--	NewWorld(131, 1582, 3175)			-- �ȴ��ṩ����

end;

function return_yes()
	NewWorld(131, 1582, 3175)			--����Ҵ��͵��������
end;

function kl_check_yes()			-- ������ȷ����������ļ�顣������δ��Ӧ����
	if (GetSeries() ~= 2) then
		Talk(1,"","Ng� h�nh c�a ng��i kh�c v�i b�n ta!  ��n ��y l�m g�? H�y l�n di�n ��n h�c h�i th�m!")
	elseif (HaveMagic(91) >= 0) then		-- ������50������,�������
		nt_setTask(1,60*256)
		Talk(1,"","Ta �� ph�c h�i l�i tr�ng th�i nhi�m v� c�a ng��i! B�y gi� ng��i c� th� �i nh�n nhi�m v� xu�t s� ")
	elseif (HaveMagic(88) >= 0) then		-- ������40������,���𲻾�
		nt_setTask(1,50*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 40.")
	elseif (HaveMagic(85) >= 0) then		-- ������30������,һҶ֪��
		nt_setTask(1,40*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 30.")
	elseif (HaveMagic(82) >= 0) then		-- ������20������,����ͬ��
		nt_setTask(1,30*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 20.")
	elseif (HaveMagic(77) >= 0) then		-- ������10������,��ü����
		nt_setTask(1,20*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 10.")
	else
		nt_setTask(1,10*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� c� th� nh�n nhi�m v� c�p 10.")
	end
end;

function em_check_no()
	Say("Th� gi�i ngo�i kia t��i ��p ch� kh�ng nh� x� T�y b�c kh� h�n n�y! C� mu�n �i v� kh�ng?",2,"V� th�i! �a t� ��o huynh! /return_yes","Ch�i vui nh� th� n�y, v� s�m l�m g�?/no")
end

function Uworld1000_jiaoyukunlun()
	nt_setTask(1000,260)
	Msg2Player("�� t� ti�p d�n C�n L�n ph�i b�o b�n kh�ng c�n �i n�a, c� th� tr�c ti�p g�p Long Ng� n�i chuy�n")
end

function no()
end;
