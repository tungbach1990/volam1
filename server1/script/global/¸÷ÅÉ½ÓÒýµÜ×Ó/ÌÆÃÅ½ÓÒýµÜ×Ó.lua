-- ���Ž������� ģ�� ��������
-- By: Dan_Deng(2003-10-28) ������Ի��޸Ķ���
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "���ng M�n Th� v� "

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 2 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyutangmen","Ng��i �� l� �� t� c�a b�n ph�i, kh�ng c�n �i n�a, c� th� tr�c ti�p g�p Long Ng� n�i chuy�n.")
	elseif (player_Faction == "tangmen") then
		Say("M�n ch� ph�i ng��i ��n ��y l�m g�??",4,"Xin ��a t�i h� v� T�ng ��n!/return_yes","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Ta ph�i �i l�m vi�c kh�c ��y/no")
--		Say("����������������˼����Ϊ��Щ�˵�����״̬����ȷ��������������Ϊ���µ��ӽ��м�顣��Ҫ����������״̬���������Ϊ���״̬����ȷ�ľͲ��ؼ���ˡ�",2,"���/tm_check_yes","������/tm_check_no")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Qu� ph�i ��i v� b�n m�n tr��c t�i nay ch�a h� qua l�i! Kh�ng bi�t c� g� ch� gi�o!")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","B�n m�n h�nh s� tuy kh�ng theo lu�t l�, nh�ng c�ng kh�ng bao gi� b�t n�t nh�ng ph� n� y�u �u�i!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","��c d��c c�a Ng� ��c gi�o tuy l�i h�i nh�ng c�ng ch�a ch�c �� th�ng ���c �m kh� c�a ���ng m�n! L�c n�o r�nh r�i ta xin th�nh gi�o v�i chi�u!")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Qu� bang xa t�n ��ng ��nh H�, tr��c gi� h�nh nh� ch�a qua l�i v�i b�n bang! Xin h�i c� g� ch� gi�o?!")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","B�n m�n x�a nay v�n ch�ng �a g� c�i b�n t� x�ng l� danh m�n ch�nh ph�i c�c ng��i")
	elseif (player_Faction == "wudang") then
		Talk(1,"","B�n m�n x�a nay v�n ch�ng �a g� c�i b�n t� x�ng l� danh m�n ch�nh ph�i c�c ng��i")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","C� g� ch� gi�o?")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Ta ng��i v�n kh�ng ��ch th�, c�ng ch�a k�t qua b�ng h�u! Kh�ng bi�t ph�i ��i ��i th� n�o cho ti�n ��y!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Kh�ng ng� c�i b�n �n m�y �� m� c�ng c� th� vang danh thi�n h�! T�i h� th�t mu�n ph�n b�i ph�c")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","T� h�c kh� luy�n! Ti�n �� r�t s�ng l�n! T�i h� v� c�ng b�i ph�c!")
	else
		UTask_tm = nt_getTask(2)
		if ((UTask_tm > 5*256) and (UTask_tm < 10*256)) then		-- ����������
			Talk(1,"","Ng��i �� ti�p nh�n nhi�m v� nh�p m�n � Tr�c H�i Tam Quan ��n gi� v�n ch�a ho�n th�nh. H�y mau �i l�y 3 c�y g�y tr�c Xanh, T�m, Tr�ng mang ��n giao cho ��ng m�n � l�i ra!")
		elseif (UTask_tm >= 70) and (GetFaction() ~= "tangmen") then					--�Ѿ���ʦ
			Say("L�u qu� kh�ng g�p! Sau khi xu�t s� �� l�p n�n k� t�ch g� ch�a? K� nghe th�!",3,"T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","K�t th�c ��i tho�i/no")
		else
			Talk(2, "select", "���ng m�n h�ng c� Xuy�n Th�c, �m kh� v� h�a kh� �� l�ng danh thi�n h�. Ng��i trong giang h� nghe ��n ���ng m�n th�y ��u bi�n s�c, �� th�y s� l�i h�i c�a b�n m�n", "C�i g� l� V� l�m ch�nh ��o, d�n t�c ��i ngh�a? To�n l� b�n l�o to�t. B�n m�n kh�ng �a b�n ch�nh ��o, c�ng ch�ng k�t giao v�i t� ��o. Mu�n gia nh�p b�n m�n kh�ng ph�i l� chuy�n ��n gi�n!")
		end
	end
end;

function select()
	UTask_tm = nt_getTask(2)
	UTask_wu = nt_getTask(10)
	if ((UTask_wu > 5*256) and (UTask_wu < 10*256)) then		-- �ѽ����嶾��������
		Talk(1,"","T�i hoa tu�n ki�t nh� ng��i, l�i �i gia nh�p Ng� ��c gi�o.Ch�c! ��ng ti�c! ��ng ti�c!")
	elseif (GetSeries() == 1) and (GetCamp() == 0) and (UTask_wu < 5*256) and (UTask_tm < 5*256) then		--ľϵ��δ���嶾����
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("B�n m�n �m kh� �� l�ng danh thi�n h�. C�m b�y thu�t c�ng khi�n v� l�m nhi�u phen khi�p v�a. Ng��i c� mu�n t�m hi�u m�t v�i s� tr��ng kh�ng?", 3, "Gia nh�p ���ng M�n/go", "�� ta suy ngh� k� l�i xem/no","T�m hi�u tinh hoa v� ngh� c�c m�n ph�i/Uworld1000_knowmagic")
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
	SetRevPos(25,15)	 				--����������
	nt_setTask(2, 10*256)
	SetFaction("tangmen")      				--��Ҽ�������
	SetCamp(3)
	SetCurCamp(3)
	SetRank(25)
	nt_setTask(137,62)
	SetLastFactionNumber(2)
-- ֱ�Ӵ�������
--	nt_setTask(2,80*256)
--	SetRank(76)
--	Msg2Player("��ӭ��������ţ�������ֱ��ѧ�᱾�����м��ܡ�")
	add_tm(GetLevel())			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
	Msg2Player("Hoan ngh�nh b�n gia nh�p ���ng m�, tr� th�nh T�p d�ch! H�c ���c v� c�ng T�ch L�ch ��n")
	AddNote("Gia nh�p ���ng M�n, tr� th�nh T�p d�ch.")
	Msg2Faction("tangmen",GetName().."t� h�m nay gia nh�p ���ng M�n, xin b�i ki�n c�c v� huynh t�. Mong c�c v� quan t�m ch� gi�o!",GetName())
---off--	NewWorld(25, 3982, 5235)				--����Ҵ��͵��������

end;

function return_yes()
	NewWorld(25, 3982, 5235)			--����Ҵ��͵��������
end;

function tm_check_yes()
	if (GetSeries() ~= 1) then
		Talk(1,"","Ng��i kh�ng thu�c nh�m Ng� h�nh c�a ta, ��n ��y l�m g�? H�y l�n di�n ��n h�c h�i th�m �i")
	elseif (HaveMagic(58) >= 0) then		-- ������50������,���޵���
		nt_setTask(2,60*256)
		Talk(1,"","Ta �� ph�c h�i l�i tr�ng th�i nhi�m v� c�a ng��i! B�y gi� ng��i c� th� �i nh�n nhi�m v� xu�t s� ")
	elseif (HaveMagic(54) >= 0) then		-- ������40������,���컨��
		nt_setTask(2,50*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 40.")
	elseif (HaveMagic(50) >= 0) then		-- ������30������,׷�ļ�
		nt_setTask(2,40*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 30.")
	elseif (HaveMagic(47) >= 0) then		-- ������20������,�����
		nt_setTask(2,30*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 20.")
	elseif (HaveMagic(43) >= 0) then		-- ������10������,���Ű���
		nt_setTask(2,20*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� ho�n th�nh nhi�m v� c�p 10.")
	else
		nt_setTask(2,10*256)
		Talk(1,"","Ta �� ch�nh l� l�i tr�ng th�i nhi�m v� c�a ng��i. Ng��i �� c� th� nh�n nhi�m v� c�p 10.")
	end
end;

function tm_check_no()
	Say("M�n ch� ph�i ng��i ��n ��y l�m g�??",2,"Xin ��a t�i h� v� T�ng ��n!/return_yes","Ta ph�i �i l�m vi�c kh�c ��y/return_no")
end

function Uworld1000_jiaoyutangmen()
	nt_setTask(1000,260)
	Msg2Player("�� t� ti�p d�n ���ng M�n b�o b�n �� l� �� t� c�a m�n ph�i, c� th� tr�c ti�p �i g�p Long Ng� n�i chuy�n.")
end

function no()
end;
