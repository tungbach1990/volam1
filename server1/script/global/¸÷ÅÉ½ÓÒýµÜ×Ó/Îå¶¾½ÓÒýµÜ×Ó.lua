-- �����ɽ������ӽű����嶾
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "Ng� ��c T�n Nh�n"

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 3 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyuwudu","Ng��i �� l� �� t� c�a b�n gi�o, kh�ng c�n �i n�a, c� th� tr�c ti�p g�p Long Ng� n�i chuy�n.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Ti�u m� n�! ��n th�m ca ca n�y �? Cho ta th�m m�t c�i n�o! Hi hi!")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Ni c� th�i! Th�t l� xui x�o! C� �i �i l�i l�i! Ph� ph� ph�!��i c�t ��i l�i!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","��ng t��ng Phi �ao c�a c�c ng��i l� �� nh�t thi�n h�,��c thu�t c�a b�n bang v� h�nh v� �nh, gi�t ng��i trong nh�y m�t")
	elseif (player_Faction == "wudu") then
		Say("Nghe n�i tr�n n�i v�a xu�t hi�n m�t ��i nam thanh n� t�,ng��i v�i v�ng ��n xem h�? H�! H�! H�!",4,"Ha! Ha! C�m phi�n ��a t�i h� �i m�t chuy�n!/return_yes","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Ch�a c�n! Ta c�n vi�c ph�i l�m!/no")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","��i ��u v�i ��i Kim s� ch�ng �ch l�i g� ��u! S�m mu�n g� Kim qu�c c�ng b�nh ��nh Trung Nguy�n, l�c �� c�c ng��i h�i h�n c�ng mu�n r�i!")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","B�n ��u tr�c c�c ng��i th�n � Kim Qu�c nh�ng h�n l�i h��ng v� Nam tri�u! N�u �� l�t v�o tay ta th� c�c ng��i m�t manh gi�p c�ng kh�ng c�n! Ha! Ha! Ha!")
	elseif (player_Faction == "wudang") then
		Talk(1,"","V� �ang ��i hi�p l�i mu�n ch� gi�o cho t�i h� �? Th�t l� n�c c��i!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","B�n c�c ng��i qu� l� kh�ng bi�t nh�n th�i th�! D�a v�o s�c c�c ng��i m� c�ng ��i ch�ng ��i v�i ��i kim �?")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Ch�ng ta l��ng ph�i li�n minh, Nam c�ng B�c k�ch, sang s�n hoa l� n�y s�m mu�n g� c�ng thu�c v� ch�ng ta th�i! Ha! Ha! Ha!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","�n m�y th�i! �i �i! ��ng c� l�m b�n �o c�a ��i gia!")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","T� h�c kh� luy�n! Ti�n �� r�t s�ng l�n! T�i h� v� c�ng kh�m ph�c!")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_wu = nt_getTask(10)
--		if (GetSeries() == 1) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_wu < 5*256) and (nt_getTask(2) == 70*256) then		-- ת������������
--			Say("�嶾ɢ�ˣ������Ű��������Ҷ�ҩ����֮�����ο��Ƴ������Ⱥ���������ѣ��������ᱻ��������ѵ���㲻������Ͷ�ҽ̣��������ƽ����ԭ֮ʱ���ɷ�һ������",2,"ɢ��֮�����������Ͷ�嶾��/defection_get","��������/no")
		if ((UTask_wu > 5*256) and (UTask_wu < 10*256)) then		-- ����������
			Talk(1,"","Ch� c�n ho�n th�nh nhi�m v� nh�p m�n,ng��i s� vinh quang tr� th�nh �� t� c�a b�n ph�i")
		elseif (UTask_wu >= 70*256) and (player_Faction ~= "wudu") then					--�Ѿ���ʦ
			Say("L�u l�m kh�ng g�p! Xem ra d�o n�y ng��i �� kh� h�n tr��c nhi�u",3,"T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","K�t th�c ��i tho�i/no")
		else
			Talk(1,"enroll_select","Ng� ��c gi�o hi�n nay �ang l�c h�ng th�nh, l�i li�n k�t v�i Thi�n Nh�n gi�o h� tr� ��i Kim nam h�! Ng�y sau vinh hoa ph� qu� s� c�ng h��ng!")
		end
	end
end;

function defection_get()
	Talk(1,"","Ha! Ha! Ha! Qu� nhi�n l� tu�n ki�t th�c th�i!Ng��i ch� c�n ��n g�p l�o gi� ���ng C�u xin ly gi�o sau �� ��n g�p gi�o ch� H�c Di�n Lang Qu�n c�a ta �� b�o danh l� c� th� nh�p m�n")
	nt_setTask(10,5*256+10)
	Msg2Player("Mu�n gia nh�p Ng� ��c gi�o, ch� c�n xin ph�p ���ng C�u, sau �� ��n g�p H�c Di�n Lang Qu�n b�o danh!")
	AddNote("Mu�n gia nh�p Ng� ��c gi�o, ch� c�n xin ph�p ���ng C�u, sau �� ��n g�p H�c Di�n Lang Qu�n b�o danh!")
end

function enroll_select()
	UTask_wu = nt_getTask(10)
	UTask_tm = nt_getTask(2)
	if ((UTask_tm > 5*256) and (UTask_tm < 10*256)) then		-- �ѽ���������������
		Talk(1,"","Ng��i kh�ng mu�n gia nh�p th� bi�n kh�i ��y �i! H�m! Hao c� n�a ng�y n��c b�t c�a ta")
	elseif (GetSeries() == 1) and (GetCamp() == 0) and (UTask_tm < 5*256) and (UTask_wu < 5*256) then		--ľϵ��δ�������嶾
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("Sao h�? C� mu�n gia nh�p b�n gi�o kh�ng?", 3, "Gia nh�p Ng� ��c Gi�o/go", "�� ta suy ngh� k� l�i xem/no","T�m hi�u tinh hoa v� ngh� c�c m�n ph�i/Uworld1000_knowmagic")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n c�p 10 l�i ��n t�m ta!")
		end
	end		-- ����ľϵ�ľͲ��ٶ�˵���ˡ�
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(183,70)		  			--����������
	nt_setTask(10,10*256)				-- ֱ������
	SetFaction("wudu")       			--��Ҽ��������
	SetCamp(2)
	SetCurCamp(2)
	SetRank(49)
	nt_setTask(137,70)
	SetLastFactionNumber(3)
-- ֱ�Ӵ�������
--	nt_setTask(10,80*256)
--	SetRank(80)
--	Msg2Player("��ӭ������嶾�̣�������ֱ��ѧ�᱾�����м��ܡ�")
	add_wu(GetLevel())			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
	Msg2Player("Hoan ngh�nh b�n Gia nh�p Ng� ��c gi�o, tr� th�nh Ng� ��c ��ng T�! H�c ���c ��c Sa Ch��ng, Huy�t �ao ��c S�t.")
	AddNote("Gia nh�p Ng� ��c gi�o, tr� th�nh Ng� ��c ��ng T�.")
	Msg2Faction("wudu",GetName().."t� h�m nay gia nh�p Ng� ��c gi�o, xin b�i ki�n c�c v� huynh t�. Mong c�c v� quan t�m ch� gi�o!",GetName())
---off--	NewWorld(183, 1746, 2673)			--����Ҵ��͵��������

end;

function return_yes()
	NewWorld(183, 1746, 2673)			--����Ҵ��͵��������
end;

function wu_check_yes()					-- ������ȷ����������ļ�顣������δ��Ӧ����
	if (GetSeries() ~= 2) then
		Talk(1,"","Ng� h�nh c�a ng��i kh�c h� M�c v�i b�n ta!  ��n ��y l�m g�? H�y l�n di�n ��n h�c h�i �i!")
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
	Say("Nghe n�i tr�n n�i v�a xu�t hi�n m�t ��i nam thanh n� t�,ng��i v�i v�ng ��n xem h�? H�! H�! H�!",2,"Ha! Ha! C�m phi�n ��a t�i h� �i m�t chuy�n!/return_yes","Ch�a c�n! Ta c�n vi�c ph�i l�m!/no")
end

function Uworld1000_jiaoyuwudu()
	nt_setTask(1000,260)
	Msg2Player("�� t� ti�p d�n Ng� ��c b�o b�n �� l� �� t� c�a m�n pah�, c� th� tr�c ti�p �i g�p Long Ng� n�i chuy�n.")
end

function no()
end;
