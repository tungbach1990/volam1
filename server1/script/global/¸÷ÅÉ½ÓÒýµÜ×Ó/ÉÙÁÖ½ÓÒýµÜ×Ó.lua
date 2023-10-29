-- �����ɽ������ӽű�������
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "Thi�u L�m La H�n"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 0 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyushaolin","Ng��i �� l� �� t� c�a b�n ph�i, kh�ng c�n �i n�a, c� th� tr�c ti�p g�p Long Ng� n�i chuy�n.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Qu� m�n l�y v� luy�n v�! Uy�n chuy�n m� tinh di�u! Ti�u t�ng v� c�ng b�i ph�c!")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Thanh Hi�u S� Th�i c�a qu� ph�i tinh th�ng ph�t h�c, v� ngh� cao c��ng, ti�u t�ng ng��ng m� �� l�u!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Nghe n�i t� ���ng m�n ��i �m kh� th�nh minh kh�, h� th� xu�t th�n! T�i h� r�t kh�m ph�c!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","��c M�n c�a qu� ph�i thi�n h� ��u o�n gh�t! B�n t�ng m�o mu�i khuy�n c�c ng��i n�n tu s�a Ph�t t�p! Quay ��u l� b�!")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Nghe n�i Kim qu�c �ang mu�n ti�u di�t qu� bang t�n g�c! Xin c�c v� v� c�ng th�n tr�ng!")
	elseif (player_Faction == "shaolin") then
		Say("S� ��! S� ph� l�i ph�i �� xu�ng n�i �?",4,"V�ng! Nh� s� huynh ��a �� v� n�i!/return_yes","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin thay ta v�n an s� ph� /no")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Xin chuy�n l�i h�i th�m cu� b�n t�ng ��n ��o Nh�t Ch�n Nh�n! C� d�p s� ��n �� th�nh gi�o ng��i!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Ng��i luy�n v� k� nh�t l� h�m danh v� �� k�! A Di �� Ph�t!")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Qu� gi�o tuy ���c Kim qu�c b�o h�, nh�ng giang h� c� quy t�c c�a giang h�. Kh�ng ph�i mu�n l�m g� th� l�m.")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","D��i s� l�nh ��o c�a qu� bang, d�n ch�ng �� c� nh�ng ng�y y�n b�nh h�nh ph�c! V�n l�n b�i ph�c! B�i ph�c!")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","T� h�c kh� luy�n!  T�i h� v� c�ng b�i ph�c! ")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_sl = nt_getTask(7)
--		if (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_sl < 5*256) and (nt_getTask(3) == 70*256) then		-- ת������������
--			Say("�����޺��������书�����֣������书�������ڣ�������ǧ���ӽ�����Ϊ����",2,"�����Ͷ����ѧ��/defection_get","û��Ȥ/defection_no")
		if ((UTask_sl > 5*256) and (UTask_sl < 10*256)) then		-- ����������
			Talk(1,"","Ch� c�n ho�n th�nh nhi�m v� nh�p m�n l� c� th� tr� th�nh huynh �� t�t v�i ch�ng ta!")
		elseif (UTask_sl >= 70*256) and (player_Faction ~= "shaolin") then					--�Ѿ���ʦ
			Say("Th� ra l� huynh �� ��ng m�n! Kh�ng bi�t d�o n�y th� n�o?",3,"T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","K�t th�c ��i tho�i/no")
		else
			Talk(1,"enroll_select","Thi�u l�m ph�i lu�n ���c xem l� V� l�m �� nh�t m�n ph�i, m�nh danh 'Th�i s�n b�c ��u' c�a Trung nguy�n v� l�m")
		end
	end
end;

function defection_get()
	Talk(1,"","A di �� ph�t! Huynh ch� c�n th�nh c�u qu� bang D��ng bang ch� �� r�i kh�i Thi�n v��ng bang, r�i ��n b�m b�o v�i Huy�n Nh�n ph��ng tr��ng l� c� th� nh�p ��n t� t�!")
	nt_setTask(7,5*256+10)
	Msg2Player("Ch� c�n th�nh c�u D��ng bang ch� �� r�i kh�i Thi�n v��ng bang, r�i ��n b�m b�o v�i Huy�n Nh�n ph��ng tr��ng l� c� th� gia nh�p Thi�u l�m!")
	AddNote("Ch� c�n th�nh c�u D��ng bang ch� �� r�i kh�i Thi�n v��ng bang, r�i ��n b�m b�o v�i Huy�n Nh�n ph��ng tr��ng l� c� th� gia nh�p Thi�u l�m!")
end

function defection_no()
	Talk(1,"","V� ngh� b�n bang c�ng c� s� tr��ng ri�ng kh�ng thua k�m Thi�u L�m! Ta nguy�n trung th�nh v�i D��ng bang ch� ")
end

function enroll_select()
	UTask_sl = nt_getTask(7)
	UTask_tw = nt_getTask(3)
	if ((UTask_tw > 5*256) and (UTask_tw < 10*256)) then		-- �ѽ�����������
		Talk(1,"","Thi�n V��ng bang �ang l� c�i gai trong m�t Kim qu�c! Ng��i ch�n nh� th� ch�a h�n l� t�t!")
	elseif (GetSeries() == 0) and (GetCamp() == 0) and (UTask_tw < 5*256) and (UTask_sl < 5*256) then		--��ϵ��δ����������
		if ((GetLevel() >= 10) and (HaveMagic(29) == -1)) then						--�ȼ��ﵽʮ��������ûѧ����ն��������
			Say("Thi�u L�m kh�ng h� danh l� danh m�n ch�nh ph�i! Huynh �� c� mu�n gia nh�p kh�ng?", 3, "Gia nh�p Thi�u L�m ph�i/go", "�� ta suy ngh� k� l�i xem/no","T�m hi�u tinh hoa v� ngh� c�c m�n ph�i/Uworld1000_knowmagic")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n c�p 10 l�i ��n t�m ta!")
		end
	end		-- ���ǽ�ϵ�ľͲ��ٶ�˵���ˡ�
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(103,51)		  			--����������
	nt_setTask(7,10*256)				-- ֱ������
	SetFaction("shaolin")       			--��Ҽ�������
	SetCamp(1)
	SetCurCamp(1)
	SetRank(1)
	nt_setTask(137,67)
	SetLastFactionNumber(0)
-- ֱ�Ӵ�������
--	nt_setTask(7,80*256)
--	SetRank(72)
--	Msg2Player("��ӭ����������ɣ�������ֱ��ѧ�᱾�����м��ܡ�")
	add_sl(GetLevel())			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
	Msg2Player("Hoan ngh�nh b�n gia nh�p Thi�u L�m, tr� th�nh T�o ��a t�ng! H�c ���c H�ng Long B�t V�, Kim Cang Ph�c Ma ")
	AddNote("Gia Nh�p Thi�u L�m ph�i, tr� th�nh T�o ��a t�ng.")
	Msg2Faction("shaolin",GetName().."t� h�m nay gia nh�p Thi�u l�m, xin b�i ki�n c�c v� huynh ��! Mong c�c v� quan t�m ch� gi�o!",GetName())
---off--	NewWorld(103, 1845, 2983)			--����Ҵ��͵��������

end;

function return_yes()
	NewWorld(103, 1845, 2983)			--����Ҵ��͵��������
end;

function sl_check_yes()			-- ������ȷ����������ļ�顣������δ��Ӧ����
	if (GetSeries() ~= 2) then
		Talk(1,"","Ng� h�nh c�a ng��i kh�c h� Kim v�i b�n ta!  ��n ��y l�m g�? H�y l�n di�n ��n h�c h�i �i!")
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
	Say("S� ��! S� ph� l�i ph�i �� xu�ng n�i �?",2,"V�ng! Nh� s� huynh ��a �� v� n�i!/return_yes","Xin thay ta v�n an s� ph� /no")
end

function Uworld1000_jiaoyushaolin()
	nt_setTask(1000,260)
	Msg2Player("�� t� ti�p d�n Thi�u L�m b�o b�n �� l� �� t� c�a m�n ph�i, c� th� tr�c ti�p �i g�p Long Ng� n�i chuy�n.")
end

function no()
end;
