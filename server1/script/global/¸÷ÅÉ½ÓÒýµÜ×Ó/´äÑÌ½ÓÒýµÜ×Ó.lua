-- �����ɽ������ӽű���������
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "Th�y Y�n Hoa S� "

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 5 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyucuiyan","Ng��i �� l� �� t� c�a b�n ph�i, kh�ng c�n ph�i �i, c� th� g�p tr�c ti�p Long Ng� n�i chuy�n.")
	elseif (player_Faction == "cuiyan") then		-- ����
		Say("Mu�i l�i l�n �i ch�i n�a �?",4,"Uhm! Phi�n t� t� ��a mu�i v�!/return_yes","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","T� c� gi� v� nh� kh�ng th�y mu�i l� ���c r�i!/no")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Xinh ��p nh� hoa t��i m� h�ng ng�y c� ��i di�n v�i Thanh ��ng C� Ph�t!  Ta kh�ng th�ch c�c ng��i � �i�m n�y! ")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Hai ph�i ch�ng ta li�n minh l�i, kh�ng c�n ph�i ph�n tranh n�a! Ch�ng ph�i l� h� s� �?")
	elseif (player_Faction == "wudu") then
		Talk(1,"","Ta gh�t nh�t l� c�i b�n len l�n h� ��c h�i ng��i!  �y!  Kh�ng ph�i ta n�i ng��i! ")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","D��ng H� c�a Thi�n V��ng bang c�c ng��i c�n k�m xa t� t� c�a ta, thi�n h� nam nh�n qu� nhi�n ch�ng ra g� h�t! ")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","H�a th��ng ��u tr�c sao l�i ��n n�i c�a c�c n� nhi th� n�y?! ")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Qu� m�n l�y hi�p ngh�a l�m tr�ng, nh�ng kh�ng bi�t ��n T� Nam c� bi�t h� th�n hay kh�ng m� c� b�m theo c�c s� t� xinh ��p c�a ch�ng ta")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","C�n L�n ph�i ph�t tri�n th�n t�c! Ti�u n� r�t ng��ng m�! ")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Ai l�m ho�ng �� th� c�ng m�c!  Nh�ng c�c ng��i t�n s�t sinh linh th� b�n c� n��ng kh�ng b� qua! ")
	elseif (player_Faction == "gaibang") then
		Talk(2,"","��i hi�p!  ��ng qua ��y! ","�! B� ch�t!!! ")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","T� h�c kh� luy�n!  T�i h� v� c�ng b�i ph�c! ")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_cy = nt_getTask(6)
--		if (GetSeries() == 2) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_cy < 5*256) and (nt_getTask(1) == 70*256) then		-- ת������������
--			Say("���̻�ʹ���绨���Ů�ӣ�ƫҪ���������ƹŷ𣬺α��ء��������Ǵ������£����컶��Ц��ǲ�����������Ӧ��ӵ�е�����ѽ��",2,"�е�����ô�����Ͷ���̸���ô���أ�/defection_get","��ƹŷ�����Ը����㲻�ض���/no")
		if ((UTask_cy > 5*256) and (UTask_cy < 10*256)) then		-- ����������
			Talk(1,"","Mu�i ti�p nh�n nhi�m v� nh�p m�n �� l�u v�n ch�a ho�n th�nh! Ch� c�n th�ng qua kh�o nghi�m Hoa Kh�i tr�n th� ch�ng ta s� l� t� mu�i t�t")
		elseif (UTask_cy >= 70*256) and (player_Faction ~= "cuiyan") then					--�Ѿ���ʦ
			Say("T� t� t�i sao xu�t s� v�y!  C� � ��y t� t�i ch�ng ph�i vui v� l�m sao!?",3,"T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","K�t th�c ��i tho�i/no")
		else
			Talk(1,"enroll_select","Th�y Y�n m�n ch�ng ta tuy to�n l� n�, nh�ng v� ngh� l�y 'Khinh, Kho�i, K�, M�' m� n�i ti�ng giang h�. T� mu�i t� t�m!  Trong giang h� kh�ng ai d�m coi khinh")
		end
	end
end;

function defection_get()
	Talk(1,"","Ch� c�n mu�i ��n th�nh c�u Thanh Hi�u S� Th�i xin chuy�n qua Th�y Y�n m�n, sau �� ��n tr�nh ki�n v�i Do�n H�m Y�n ch��ng m�n c�a ta th� c� th� ���c!  Y�n t�m!  Thanh Hi�u S� Th�i th�ng t�nh ��t l�, s� kh�ng l�m kh� mu�i ��u! ")
	nt_setTask(6,5*256+10)
	Msg2Player("Mu�n gia nh�p Th�y Y�n m�n, ch� c�n ��n xin ph�p Thanh Hi�u S� Th�i sau �� ��n tr�nh ki�n v�i Do�n H�m Y�n l� ���c!")
	AddNote("Mu�n gia nh�p Th�y Y�n m�n, ch� c�n ��n xin ph�p Thanh Hi�u S� Th�i sau �� ��n tr�nh ki�n v�i Do�n H�m Y�n l� ���c!")
end

function enroll_select()
	UTask_em = nt_getTask(1)
	UTask_cy = nt_getTask(6)
	if ((UTask_em > 5*256) and (UTask_em < 10*256)) then		-- �ѽ��˴�����������
		Talk(1,"","L�i c� th�m 1 ng��i mu�n ��n c�u kinh ni�m ph�t! Th�t l� ��ng ti�c! ")
	elseif (GetSeries() == 2) and (GetCamp() == 0) and (UTask_em < 5*256) and (UTask_cy < 5*256) then		--ˮϵ��δ����Ҵ���
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("Mu�i c� mu�n gia nh�p Th�y Y�n m�n c�a ch�ng ta kh�ng?", 3, "Gia nh�p Th�y Y�n M�n/go", "�� ta suy ngh� k� l�i xem/no","T�m hi�u tinh hoa v� ngh� c�c m�n ph�i/Uworld1000_knowmagic")
		else
			Talk(1,"","Tr��c ti�n mu�i h�y luy�n t�p l�i c�n b�n, ��t ��n <color=Red>c�p 10<color> ch�ng ta s� l� t� mu�i 1 nh�! ")
		end
	end		-- ����ˮϵ�ľͲ��ٶ�˵���ˡ�
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(154,61)		  				-- ������
	nt_setTask(6,10*256)						-- ֱ������
	SetFaction("cuiyan")      			--��Ҽ��������
	SetCamp(3)
	SetCurCamp(3)
	SetRank(31)
	nt_setTask(137,66)
	SetLastFactionNumber(5)
-- ֱ�Ӵ�������
--	nt_setTask(6,80*256)
--	SetRank(67)
--	Msg2Player("��ӭ���������ţ�������ֱ��ѧ�᱾�����м��ܡ�")
	add_cy(GetLevel())			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
	Msg2Player("Hoan ngh�nh b�n gia nh�p Th�y Y�n m�n! Tr� th�nh Hoa T�. H�c���c Phong Hoa Tuy�t Nguy�t, Phong Quy�n T�n Tuy�t")
	AddNote("gia nh�p Th�y Y�n m�n, tr� th�nh Hoa T� ")
	Msg2Faction("cuiyan",GetName().."t� h�m nay gia nh�p Th�y Y�n m�n. Xin b�i ki�n c�c v� s� t�. Mong c�c v� quan t�m ch� gi�o!",GetName())
---off--	NewWorld(154, 403, 1361)			-- ����������

end;

function return_yes()
	NewWorld(154, 403, 1361)			-- ����������
end;

function cy_check_yes()					-- �ɶ��Ҹ�����������δ��Ӧ����
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

function cy_check_no()
	Say("Mu�i l�i l�n �i ch�i n�a �?",2,"Uhm! Phi�n t� t� ��a mu�i v�!/return_yes","T� c� gi� v� nh� kh�ng th�y mu�i l� ���c r�i!/no")
end

function Uworld1000_jiaoyucuiyan()
	nt_setTask(1000,260)
	Msg2Player("�� t� ti�p d�n Th�y Y�n m�n b�o b�n c� th� tr�c ti�p �i g�p Long Ng� n�i chuy�n.")
end

function no()
end;
