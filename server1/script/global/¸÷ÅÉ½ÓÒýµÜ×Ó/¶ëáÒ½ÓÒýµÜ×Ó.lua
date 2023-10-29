-- ���ҽ������� ģ�� ���ҽ�����
-- By: Dan_Deng(2003-10-28) ������Ի��޸Ķ���
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "Nga My C�m Y Ni"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 4 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyuemei","Ng��i �� l� �� t� c�a b�n ph�i, kh�ng c�n �i n�a, c� th� tr�c ti�p g�p Long Ng� n�i chuy�n.")
	elseif (player_Faction == "emei") then
		Say("Ti�u s� mu�i l�i xu�ng n�i ch�i �? C� c�n ta ��a v� n�i kh�ng?",4,"L�i l�m phi�n t� t� n�a r�i!/return_yes", "T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Kh�ng c�n ��u! �a t� S� t� /no")
--		Say("���ҽ����᣺������˼����Ϊ��Щ�˵�����״̬����ȷ��������������Ϊ���µ��ӽ��м�顣��Ҫ����������״̬���������Ϊ���״̬����ȷ�ľͲ��ؼ���ˡ�",2,"���/em_check_yes","������/em_check_no")
	elseif (player_Faction == "cuiyan") then				
		Talk(1,"","Qu� ph�i danh ch�n V�n Nam. Tr��c gi� ch�a c�ng b�n ph�i qua l�i. Kh�ng bi�t c� g� ch� gi�o! ")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Ng��i l� ng��i c�a Th�c Nam ���ng M�n? B�n m�n l� danh m�n ch�nh ph�i, tr��c gi� kh�ng qua l�i v�i nh�ng ng��i c� t� t��ng kh�ng ch�nh th�ng")
	elseif (player_Faction == "wudu") then
		Talk(1,"","B�n t� ma ngo�i ��o c�c ng��i!  Ai ai c�ng mu�n ti�u di�t! ")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Qu� bang bang ch� D��ng Anh l� m�t b�c n� trung h�o ki�t!  B�n ni t� l�u ng��ng m�!  Mong s� c� ng�y di�n ki�n! ")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","A di �� ph�t!  Th� ra l� h�a th��ng  Thi�u l�m, kh�ng bi�t Huy�n Nh�n ��i s� g�n ��y c� kh�e kh�ng?")
	elseif (player_Faction == "wudang") then
		Talk(1,"","V� �ang hi�p ngh�a, danh ch�n thi�n h�. ��o Nh�t Ch�n Nh�n c�a qu� ph�i v� ch��ng m�n c�a b�n ph�i giao t�nh th�m s�u. Hai ph�i ch�ng ta c� th� n�i l�  anh em m�t nh� ")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","T� ph�i v� qu� ph�i ch�a h� qua l�i, kh�ng bi�t c� g� ch� gi�o!?")
	elseif (player_Faction == "tianren") then
		Talk(1,"","C�c ng��i ph� thu�c Kim qu�c, lu�n d�m ng� giang s�n  ��i t�ng ta. V� l�m ch�nh ph�i ch�ng ta v� c�c ng��i th� kh�ng ��i tr�i chung! ")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Qu� bang ng��i ��ng th� m�nh, h�o kh� xung thi�n, b�n gi�o r�t vui ���c k�t giao v�i nh�ng b�ng h�u nh� v�y! ")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","T� h�c kh� luy�n!  B�n ni v� c�ng b�i ph�c! ")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_em = nt_getTask(1)
		if ((UTask_em > 5*256) and (UTask_em < 10*256)) then		-- ����������
			Talk(1,"","Mu�i �� ti�p nh�n nhi�m v� nh�p m�n v�i  Di�p B�ng H�n nh�ng v�n ch�a ho�n th�nh. Tr��c ti�n h�y th�ng qua cu�c kh�o nghi�m Tr� C�m Th�, sau ��  l�n d�c To�n Thi�n Ph� l�y B�ch Ng�c Nh� �! ")
		elseif (UTask_em >= 70*256) and (player_Faction ~= "emei") then					--�Ѿ���ʦ
			Say("Th� ra l� S� t�, d�o n�y c� kh�e kh�ng?",3,"T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","K�t th�c ��i tho�i/no")
		else
			Talk(1,"select","Trong thi�n h� c�c m�n ph�i do n� nhi s�ng l�p th� b�n m�n ��ng ��u!  �� t� b�n m�n kh�ng nh�ng v� ngh� cao c��ng, c�m k� thi h�a ��u tinh th�ng!  Ai n�i giang h� l� th� gi�i c�a nam nh�n th� c� nh�n b�n ph�i m� l�m g��ng")
		end
	end
end;

function select()
	UTask_em = nt_getTask(1)
	UTask_cy = nt_getTask(6)
	if ((UTask_cy > 5*256) and (UTask_cy < 10*256)) then		-- �ѽ��˴�����������
		Talk(1,"","C� ng��i n�y v�n l� mu�n gia nh�p Th�y Y�n m�n! M�i ng��i c� ch� h��ng ri�ng c�a m�nh! Ta c�ng kh�ng mi�n c��ng! ")
	elseif (GetSeries() == 2) and (GetCamp() == 0) and (UTask_cy < 5*256) and (UTask_em < 5*256) then		--ˮϵ��δ����̶���
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("Gia nh�p Nga My ph�i, ch�ng ta s� l� t� mu�i 1 nh�!  H�a ph�c c�ng h��ng! ", 3, "Gia nh�p Nga Mi ph�i/go", "�� ta suy ngh� k� l�i xem/no","T�m hi�u tinh hoa v� ngh� c�c m�n ph�i/Uworld1000_knowmagic")
		else
			Say("Tr��c ti�n mu�i h�y luy�n t�p l�i c�n b�n, ��t ��n <color=Red>c�p 10<color> ch�ng ta s� l� t� mu�i 1 nh�! ", 0)		
		end
	end		-- ����ˮϵ�ľͲ��ٶ�˵���ˡ�
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(13,13)		  			--����������
	nt_setTask(1, 10*256)				-- ֱ������
	SetFaction("emei")       			--��Ҽ��������
	SetCamp(1)
	SetCurCamp(1)
	SetRank(13)
	nt_setTask(137,61)
	SetLastFactionNumber(4)
-- ֱ�Ӵ�������
--	nt_setTask(1,80*256)
--	SetRank(63)
--	Msg2Player("��ӭ���������ɣ�������ֱ��ѧ�᱾�����м��ܡ�")
	add_em(GetLevel())			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
	Msg2Player("Hoan ngh�nh b�n gia nh�p Nga Mi ph�i, tr� th�nh B� Y Ni. H�c ���c Nh�t Di�p Tri Thu, Phi�u Tuy�t Xuy�n V�n")
	AddNote("gia nh�p Nga Mi Ph�i, tr� th�nh B� Y Ni")
	Msg2Faction("emei",GetName().."t� h�m nay gia nh�p Nga Mi ph�i. Xin b�i ki�n c�c v� s� t�. Mong c�c v� quan t�m ch� gi�o!",GetName())
---off--	NewWorld(13, 1898, 4978)			--����Ҵ��͵��������

end;

function return_yes()
	NewWorld(13, 1898, 4978)			--����Ҵ��͵��������
end;

function em_check_yes()
	if (GetSeries() ~= 2) then
		Talk(1,"","Ng� h�nh c�a ng��i kh�c v�i b�n ta!  ��n ��y l�m g�? H�y l�n di�n ��n h�c h�i th�m!")
	elseif (HaveMagic(91) >= 0) then		-- ������50������,�������
		nt_setTask(1,60*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� c� th� �i nh�n nhi�m v� xu�t s�.")
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
	Say("Ti�u s� mu�i l�i xu�ng n�i ch�i �? C� c�n ta ��a v� n�i kh�ng?",2,"L�i l�m phi�n t� t� n�a r�i!/return_yes","Kh�ng c�n ��u! �a t� S� t� /return_no")
end

function Uworld1000_jiaoyuemei()
	nt_setTask(1000,260)
	Msg2Player("�� t� ti�p d�n Nga Mi b�o b�n �� l� �� t� c�a m�n ph�i, c� th� tr�c ti�p g�p Long Ng� n�i chuy�n.")
end

function no()
end;
