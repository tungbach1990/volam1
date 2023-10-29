-- ������������ ģ�� ��������
-- By: Dan_Deng(2003-10-28) ������Ի��޸Ķ���
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )

npc_name = "Thi�n V��ng T��ng L�nh"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 1 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyutianwang","Ng��i �� l� �� t� c�a b�n gi�o, kh�ng c�n �i n�a, c� th� tr�c ti�p g�p Long Ng� n�i chuy�n.")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Thanh Hi�u S� Th�i c�a qu� ph�i tinh th�ng ph�t h�c, v� ngh� cao c��ng, b�n m�n ng��ng m� �� l�u!")
	elseif (player_Faction == "cuiyan") then				
		Talk(1,"","N� nh�n v�n �� phi�n, n� nh�n bi�t v� c�ng l�i c�ng phi�n h�n! Ng��i c�a qu� ph�i ch�ng ta kh�ng d�m tr�u v�o!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Ng��i h�c v� c�n ph�i quang minh l�i l�c! Ta gh�t nh�t b�n ng��i d�ng �m kh� h� ��c th� ng��i kh�c!")
	elseif (player_Faction == "wudu") then				
		Talk(1,"","Tuy b�n bang kh�ng m� mu�i t�n nhi�m b�t c� danh m�n ch�nh ph�i n�o nh�ng c�ng coi khinh b�n h� ��c �� h�n!")
	elseif (player_Faction == "shaolin") then				
		Talk(1,"","C�ng phu Thi�u L�m th� c� g� hay ho? H�a th��ng ��c kinh gi�i m�i l� ��ng, h�c ng��i ta ��nh nhau �� l�m gi?")
	elseif (player_Faction == "wudang") then				
		Talk(1,"","Xin chuy�n l�i h�i th�m c�a t�i h� ��n ��o Nh�t Ch�n Nh�n! C� d�p s� ��n �� th�nh gi�o ng��i!")
	elseif (player_Faction == "kunlun") then				
		Talk(1,"","Qu� ph�i g�n ��y ph�t tri�n th�n t�c! Qu� kh�ng ph�i h� danh! Nh�ng c�ng ��ng qu� xem th��ng v� l�m Trung nguy�n!")
	elseif (player_Faction == "tianren") then				
		Talk(1,"","Ch�ng ta quy�t kh�ng giao h�o v�i b�n ng��i Kim!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Qu� bang v� b�n bang h�p th�nh Thi�n h� l��ng ��i bang, c� c� h�i ch�ng ta n�n th�n thi�t h�n n�a")
	elseif (player_Faction == "tianwang") then
		Say("Huynh ��! C� mu�n ta ��a v� ��o kh�ng?",4,"���c! �a t� huynh ��i!/return_yes", "T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Kh�ng c�n ��u! �a t�!  /no")
--		Say("�������죺������˼����Ϊ��Щ�˵�����״̬����ȷ��������������Ϊ���µ��ӽ��м�顣��Ҫ����������״̬���������Ϊ���״̬����ȷ�ľͲ��ؼ���ˡ�",2,"���/tw_check_yes","������/tw_check_no")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","T� h�c kh� luy�n! T�i h� v� c�ng b�i ph�c!")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_tw = nt_getTask(3)
--		if ((UTask_tw > 5*256) and (UTask_tw < 10*256)) then		-- ����������
--			Talk(1,"","�������죺���Ѿ�������������촦���˱�����������񣬵�����δ��ɣ�����Ҫȥ�����ؾƹ������ơ���������")
		if (UTask_tw >= 70*256) then					--�������ʦ
			Say("H�o huynh ��! Ch�ng ta l�i g�p nhau r�i! C� c� h�i ta s� u�ng r��u c�ng nhau!",3,"T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","K�t th�c ��i tho�i/no")
		elseif (UTask_tw == 5*256+80) and (GetByte(nt_getTask(38),1) == 127) then		-- ����������ɣ�������BUG���˵��޲�
			Talk(1,"","Th�t xin l�i! L�c ng��i ti�n h�nh nhi�m v� K� danh �� t�, ch�ng ta ghi gh�p c� sai s�t! Nh�ng b�y gi� �� s�a l�i r�i")
			if (HaveMagic(29) >= 0) then		-- ѧ����ն�����ģ����ŵ��ӣ�������Ϊ�ѳ�ʦ
				nt_setTask(3,70*256)
			else										-- ��������㣬������ǰ�ѵ����ֵġ�
				nt_setTask(3,0)
			end
		else
			Talk(3, "select", "Bang ch� D��ng Anh v� ngh� cao c��ng, gan d� h�n ng��i, kh�ng k�m g� tu mi nam t�!", "B�n m�n quy lu�t uy nghi�m, ng��i ��ng th� m�nh! Kh�ng ai trong thi�n h� d�m coi khinh!", "B�n bang v�a ch�ng Kim v�a kh�ng T�ng! Huynh �� ��u xu�t th�n l� d�n ngh�o, phi�u b�t giang h� l� v� k� sinh nhai! Ai l�m vua b�n ta ch� c�n quan t�m")
		end
	end
end;

function select()
	UTask_tw = nt_getTask(3)
	UTask_sl = nt_getTask(7)			-- ��ʱ�������ط��������ط�������
	if ((UTask_sl > 5*256) and (UTask_sl < 10*256)) then		-- �ѽ���������������
		Talk(1,"","Tuy huynh �� gia nh�p ph�i Thi�u l�m nh�ng r�nh r�i v�n c� th� ��n Thi�n v��ng bang l�m kh�ch!")
	elseif (GetCamp() == 0) and (GetSeries() == 0) and (UTask_sl < 5*256) and (UTask_tw < 5*256) then		--��ϵ��δ����������
		if (GetLevel() >= 10) then					--�ȼ��ﵽʮ��
			Say("Gia nh�p b�n bang, ch�ng ta s� l� huynh �� m�t nh�, h�a ph�c c�ng h��ng!", 3, "Gia nh�p Thi�n V��ng Bang/go", "�� ta suy ngh� k� l�i xem/no","T�m hi�u tinh hoa v� ngh� c�c m�n ph�i/Uworld1000_knowmagic")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n <color=Red>c�p 10<color> l�i ��n t�m ta!")
		end
	end
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(59,21)	  				--����������
	nt_setTask(3, 10*256)
	SetFaction("tianwang")       			--��Ҽ���������
	SetCamp(3)
	SetCurCamp(3)
	SetRank(43)
	nt_setTask(137,63)
	SetLastFactionNumber(1)
-- ֱ�Ӵ�������
--	nt_setTask(3,80*256)
--	SetRank(69)
--	Msg2Player("��ӭ����������������ֱ��ѧ�᱾�����м��ܡ�")
	add_tw(GetLevel())			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
	Msg2Player("Hoan ngh�nh b�n gia nh�p Thi�n V��ng bang! H�y kh�i ��u t� m�t ng��i Th� v�!")
	Msg2Player("H�c ���c v� c�ng Kinh L�i Tr�m, H�i Phong L�c Nh�n, Tr�m Long Quy�t")
	AddNote("Gia nh�p Thi�n V��ng Bang, tr� th�nh Th� V�.")
	Msg2Faction("tianwang",GetName().." t� h�m nay gia nh�p Thi�n V��ng bang, xin b�i ki�n c�c v� huynh ��! Mong c�c v� quan t�m ch� gi�o!",GetName())
---off--	NewWorld(59,1552,3188)			--����Ҵ��͵��������
end;

function return_yes()
	NewWorld(59, 1425, 3472)			--����Ҵ��͵��������
end;

function tw_check_yes()
	if (GetSeries() ~= 0) then
		Talk(1,"","Ng� h�nh c�a ng��i kh�c h� Kim v�i b�n ta! ��n ��y l�m g�? H�y l�n di�n ��n h�c h�i �i!")
	elseif (HaveMagic(41) >= 0) then		-- ������50������,Ѫս�˷�
		nt_setTask(3,60*256)
		Talk(1,"","Ta �� ph�c h�i l�i tr�ng th�i nhi�m v� c�a ng��i! B�y gi� ng��i c� th� �i nh�n nhi�m v� xu�t s� ")
	elseif (HaveMagic(37) >= 0) then		-- ������40������,�÷�ն
		nt_setTask(3,50*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 40.")
	elseif (HaveMagic(36) >= 0) then		-- ������30������,����ս��
		nt_setTask(3,40*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 30.")
	elseif (HaveMagic(33) >= 0) then		-- ������20������,���ľ�
		nt_setTask(3,30*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 20.")
	elseif (HaveMagic(23) >= 0) then		-- ������10������,����ǹ��
		nt_setTask(3,20*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 10.")
	else
		nt_setTask(3,10*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� c� th� nh�n nhi�m v� c�p 10.")
	end
end

function tw_check_no()
	Say("Huynh ��! C� mu�n ta ��a v� ��o kh�ng?",2,"���c! �a t� huynh ��i!/return_yes","Kh�ng c�n ��u! �a t�!  /return_no")
end


function Uworld1000_jiaoyutianwang()
	nt_setTask(1000,260)
	Msg2Player("�� t� ti�p d�n Thi�n V��ng b�o b�n �� l� �� t� c�a bang ph�i, c� th� tr�c ti�p �i g�p Long Ng� n�i chuy�n.")
end


function no()
end;


