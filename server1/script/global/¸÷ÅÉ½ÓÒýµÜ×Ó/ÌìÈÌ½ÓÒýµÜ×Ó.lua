-- ���̽������� ģ�� ������ʿ
-- By: Dan_Deng(2003-10-28) ������Ի��޸Ķ���
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "Thi�n Nh�n T� S� "

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 7 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyutianren","Ng��i �� l� �� t� c�a b�n ph�i, kh�ng c�n �i n�a, c� th� tr�c ti�p g�p Long Ng� n�i chuy�n.")
	elseif (player_Faction == "emei") then
		Talk(1,"","N�u Nga My ph�i ch�u gia nh�p b�n gi�o, v�y th� b�n ta su�t ng�y ��u ���c ng�m nh�n ng��i ��p! �i! Sung s��ng ch�t �i th�i!")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","S�m �� nghe con g�i ph��ng Nam s�c ��p nghi�ng th�nh, h�m nay ���c g�p ��y, qu� l� ti�ng ��n kh�ng ngoa")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Gi�o ch� c�a b�n gi�o lu�n c� l�ng mong m�i qu� gi�o c�ng gia nh�p, vinh hoa ph� qu�, cao quan b�ng l�c, h��ng c� ��i kh�ng h�t!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","Thi�n Nh�n v� Ng� ��c gi�o m� h�p th�nh Nam c�ng B�c k�ch, Trung Nguy�n s�m mu�n c�ng r�i v�o tay ch�ng ta")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Kh�ng ai c� th� ng�n c�n ���c s� nghi�p h�ng b� Trung nguy�n c�a Thi�n Nh�n gi�o")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Cao th� Thi�u L�m ph�i c�a c�c ng��i �� s�p quy ti�n h�t r�i!Nh�n t�i tr� tu�i l�i ch�ng c� m�y ng��i! Xem ra Thi�u L�m c�ng �� s�p ��n ng�y t�n nghi�p! Ha! Ha! Ha!")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Ta �� nghe N�i c�ng, ki�m thu�t c�a V� �ang l�ng danh Trung nguy�n! C� c� h�i nh�t ��nh ph�i th�nh gi�o!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","C�n L�n ph�i c�c ng��i h�ng c� T�y V�c,c� d� t�m d�m ng� Trung nguy�n �� l�u. S� c�  m�t ng�y b�n gi�o v� c�c ng��i ph�n chia cao th�p t�i Trung Nguy�n")
	elseif (player_Faction == "tianren") then
		Say("Nhi�m v� �� ho�n th�nh ch�a?",4,"Nhi�m v� �� ho�n th�nh! H�y ��a ta v� T�ng ��n!/return_yes","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Kh�ng h�i n�a!/no")
--		Say("������ʿ��������˼����Ϊ��Щ�˵�����״̬����ȷ��������������Ϊ���µ��ӽ��м�顣��Ҫ����������״̬���������Ϊ���״̬����ȷ�ľͲ��ؼ���ˡ�",2,"���/tr_check_yes","������/tr_check_no")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","T�n �n m�y n�y mu�n tr� tr�n v�o ��y l�m gian t� �?")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","T� h�c kh� luy�n! Ti�n �� r�t s�ng l�n! T�i h� v� c�ng b�i ph�c!")
	else
		UTask_tr = nt_getTask(4)
		if ((UTask_tr > 5*256) and (UTask_tr < 10*256)) then		-- ����������
			Talk(1,"","Ng��i �� ti�p nh�n nhi�m v� nh�p m�n nh�ng ��n gi� v�n ch�a ho�n th�nh. H�y mau l�n Hoa S�n mang V� V��ng ki�m v� ��y!")
		elseif (UTask_tr >= 70*256) and (player_Faction ~= "tianren") then					--�Ѿ���ʦ
			Say("Nghe n�i ng��i sau khi xu�t s� �� l�p n�n nhi�u c�ng danh! Qu� kh�ng h� danh l� �� t� c�a b�n ph�i",3,"T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","K�t th�c ��i tho�i/no")
		else
			Talk(1,"select","Gi�o ch� c�a b�n gi�o l� Ho�n Nhan H�ng Li�t. Danh ch�n thi�n h�! Ho�ng �� Kim qu�c c�ng ph�i nh��ng 3 ph�n. Cao th� c�a b�n gi�o nhi�u v� s�! Nh�n t�i ng�a h� t�ng long")
		end
	end
end;

function select()
	UTask_tr = nt_getTask(4)
	UTask_gb = nt_getTask(8)
	if ((UTask_gb > 5*256) and (UTask_gb < 10*256)) then		-- �ѽ���ؤ����������
		Talk(1,"","Nam tri�u u m�! T�i g� c�c ng��i c� ph�i b�n m�nh cho c�i g� h� Tri�u ngu ng�c �� v�y?")
	elseif (GetSeries() == 3) and (GetCamp() == 0) and (UTask_gb < 5*256) and (UTask_tr < 5*256) then		--��ϵ��δ��ؤ������
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("C� mu�n gia nh�p b�n gi�o kh�ng?", 3, "Gia nh�p Thi�n Nh�n gi�o/yes", "Kh�ng gia nh�p/no","T�m hi�u tinh hoa v� ngh� c�c m�n ph�i/Uworld1000_knowmagic")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n <color=Red>c�p 10<color> l�i ��n t�m ta!")
		end
	end
end;

function yes()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	Talk(1,"","Gia nh�p b�n gi�o c�n ph�i ch�p h�nh hi�u l�nh! M�nh ���c y�u thua ch�nh l� t�n ch� c�a b�n gi�o! Ng��i h�y t� d�ng th�c l�c �� ch�ng minh m�nh!")
	SetRevPos(49,28)	 						--����������
	nt_setTask(4, 10*256)
	SetFaction("tianren")      					--��Ҽ������̽�
	SetCamp(2)
	SetCurCamp(2)
	SetRank(55)							--���óƺ�
	nt_setTask(137,64)
	SetLastFactionNumber(7)
	Msg2Player("Gia nh�p Thi�n Nh�n gi�o, tr� th�nh S�t th�. H�c ���c v� c�ng: T�n D��ng Nh� Huy�t; ��n Ch� Li�t Di�m")
	AddNote("Gia nh�p Thi�n Nh�n gi�o, tr� th�nh S�t th� ")
	Msg2Faction("tianren",GetName().."t� h�m nay gia nh�p Thi�n Nh�n gi�o! Xin b�i ki�n c�c v� ��o huynh s� t�! Mong c�c v� quan t�m ch� gi�o!",GetName())
-- ֱ�Ӵ�������
--	nt_setTask(4,80*256)
--	SetRank(81)
--	Msg2Player("��ӭ��������̣̽�������ֱ��ѧ�᱾�����м��ܡ�")
	add_tr(GetLevel())			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
---off--	NewWorld(49, 1644, 3215)					--����Ҵ��͵��������

end;

function return_yes()
	NewWorld(49, 1644, 3215)			--����Ҵ��͵��������
end;

function tr_check_yes()
	if (GetSeries() ~= 3) then
		Talk(1,"","Ng��i kh�ng thu�c nh�m Ng� h�nh h� H�a c�a ta, ��n ��y l�m g�? H�y l�n di�n ��n h�c h�i �i!")
	elseif (HaveMagic(148) >= 0) then		-- ������50������,��ɱ��ȭ
		nt_setTask(4,60*256)
		Talk(1,"","Ta �� ph�c h�i l�i tr�ng th�i nhi�m v� c�a ng��i! B�y gi� ng��i c� th� �i nh�n nhi�m v� xu�t s� ")
	elseif (HaveMagic(146) >= 0) then		-- ������40������,������
		nt_setTask(4,50*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 40.")
	elseif (HaveMagic(141) >= 0) then		-- ������30������,�һ�����
		nt_setTask(4,40*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 30.")
	elseif (HaveMagic(138) >= 0) then		-- ������20������,��ɽ�
		nt_setTask(4,30*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 20.")
	elseif (HaveMagic(131) >= 0) then		-- ������10������,����ì��
		nt_setTask(4,20*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 10.")
	else
		nt_setTask(4,10*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� c� th� nh�n nhi�m v� c�p 10.")
	end
end

function tr_check_no()
	Say("Nhi�m v� �� ho�n th�nh ch�a?",2,"Nhi�m v� �� ho�n th�nh! H�y ��a ta v� T�ng ��n!/return_yes","Kh�ng h�i n�a!/return_no")
end

function Uworld1000_jiaoyutianren()
	nt_setTask(1000,260)
	Msg2Player("�� t� ti�p d�n Thi�n Nh�n b�o b�n �� l� �� t� c�a m�n ph�i, c� th� tr�c ti�p �i g�p Long Ng� n�i chuy�n.")
end

function no()
end;
