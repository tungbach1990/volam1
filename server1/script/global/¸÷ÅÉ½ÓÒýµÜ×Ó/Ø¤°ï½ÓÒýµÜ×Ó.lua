-- �����ɽ������ӽű���ؤ��
-- By: Dan_Deng(2003-10-27)
-- Update: Dan_Deng(2004-05-25) �������ȫ���޸ģ������ⲿ�ļ���ʽ��
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\knowmagic.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\map_helper.lua")
Include( "\\script\\missions\\freshman_match\\head.lua" )
npc_name = "�� t� 3 t�i C�i Bang "

function default_talk()
	player_Faction = GetFaction()
	Uworld1000 = nt_getTask(1000)
	if (( Uworld1000 == 240 ) or ( Uworld1000 == 250 )) and ( GetLastFactionNumber() == 6 ) then
			nt_setTask(1000,250)
			Talk(1,"Uworld1000_jiaoyugaibang","Ng��i �� l� �� t� c�a b�n gi�o, kh�ng c�n �i n�a, c� th� tr�c ti�p g�p Long Ng� n�i chuy�n.")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","T� l�u nghe ti�ng c�c c� n��ng Th�y Y�n ��p nh� ti�n n�, v� c� n��ng n�y cho �n m�y ta �t ti�n u�ng r��u ���c ch�ng?")
	elseif (player_Faction == "emei") then				
		Talk(1,"","K� �n m�y n�y v�n t� l�u ng��ng m� Nga My ki�m thu�t. H�m nay ���c g�p n� hi�p ��y, th�t th�a l�ng mong ��c!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","�m kh� ���ng m�n khi�n nhi�u k� v�a nghe danh �� bi�n s�c. �ao ph�p c�a qu� m�n c�ng l�i h�i kh�ng k�m!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","X�a nay T� ch�nh ph�n minh, b�n ti�u nh�n d�ng ��c nh� c�c ng��i c�ng d�m khoe danh �?")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","B�n bang v� qu� bang h�p th�nh Thi�n h� l��ng ��i ph�i, ch�ng ta n�n gi�p �� nhau nhi�u h�n �� th�ng l�nh v� l�m! Ha! Ha! Ha!")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Qu� ph�i v� s� t�n vong c�a V� l�m Trung nguy�n, d�m ���ng ��u v�i Kim qu�c h�ng m�nh! K� �n m�y n�y mu�n ph�n b�i ph�c")
	elseif (player_Faction == "wudang") then
		Talk(1,"","V� �ang hi�p kh�ch l�ng danh thi�n h�, x�ng l� Danh m�n ch�nh ph�i! Xin cho k� �n m�y n�y g�i l�i h�i th�m ��n ��o Nh�t Ch�n Nh�n v� c�c v� ��o tr��ng!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Th� ra l� �� t� c�a C�n L�n ph�i. Th�o n�o c�t c�ch b�t ph�m! R� m�t anh t�i!")
	elseif (player_Faction == "tianren") then
		Talk(1,"","M�c d� qu� ph�i l� ch�, nh�ng C�i bang v� Thi�n Nh�n x�a nay v�n kh�ng ��i tr�i chung. Ch�ng ta kh�ng c�n ph�i nhi�u l�i. H�n g�p nhau tr�n sa tr��ng!")
	elseif (player_Faction == "gaibang") then				-- ����
		Say("C� l�i g� mu�n n�i v�i bang ch� kh�ng? Hay mu�n ta ��a v� T�ng ��n?",4,"Xin ��a t�i h� v� T�ng ��n!/return_yes","T�m hi�u khu v�c luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
	elseif (nt_getTask(75) == 255) then		-- ѧ��Ұ��ȭ�ģ���������������
		Talk(1,"","T� h�c kh� luy�n! Ti�n �� r�t s�ng l�n! T�i h� v� c�ng b�i ph�c!")
	else						-- ֻҪ������10�����ɣ����ٵ�����⡰�����ɡ�
		UTask_gb = nt_getTask(8)
--		if (GetSeries() == 3) and (GetCamp() == 4) and (GetLevel() >= 50) and (UTask_gb < 5*256) and (nt_getTask(4) == 70*256) then		-- ת������������
--			Say("ؤ���������ӣ���Ϊ���ζ�Ů��ȴ��������Ϊ����Ч��������Ҳ���ߣ�����������Ͷ����ʵ���ж���֤����ȭȭ�����ģ�",2,"�ǣ�����һ������ؤ��Ϊ���γ���/defection_get","û��Ȥ/defection_no")
		if ((UTask_gb > 5*256) and (UTask_gb < 10*256)) then		-- ����������
			Talk(1,"","��i hi�p hi�n �ang th�c hi�n nhi�m v� nh�p m�n � D��ng Ch�u, kh�ng n�n k�o d�i qu� l�u nh� v�y!")
		elseif (UTask_gb >= 70*256) and (player_Faction ~= "gaibang") then					--�Ѿ���ʦ
			Say("�� l�u kh�ng g�p! M�i ng��i ��u r�t mong nh�! ��i hi�p d�o n�y c� kh�e kh�ng?",3,"T�m hi�u s� tr��ng luy�n c�ng/map_help","T�m hi�u v� ngh� b�n m�n/skill_help","K�t th�c ��i tho�i/no")
		else
			Talk(1,"enroll_select","B�n bang �� c� danh x�ng Thi�n h� �� nh�t bang, danh ch�n giang h�.Nh�n t�i ng�a H� t�ng Long, th�i n�o c�ng c� ")
		end
	end
end;

function defection_get()
	Talk(1,"","N�u �� c� � h�i c�i, h�y ��n g�p Ho�ng Nhan H�ng Li�t �� xin ly gi�o, sau �� ��n di�n ki�n Bang ch� H� Nh�n Ng� �� xin nh�p m�n")
	nt_setTask(8,5*256+10)
	Msg2Player("N�u mu�n gia nh�p C�i bang, h�y ��n g�p Ho�n Nhan H�ng Li�t �� xin ly gi�o, sau �� ��n di�n ki�n Bang ch� H� Nh�n Ng� �� xin nh�p m�n")
	AddNote("N�u mu�n gia nh�p C�i bang, h�y ��n g�p Ho�n Nhan H�ng Li�t �� xin ly gi�o, sau �� ��n di�n ki�n Bang ch� H� Nh�n Ng� �� xin nh�p m�n")
end

function defection_no()
	Talk(1,"","X�a nay Th�nh v��ng b�i kh�u, c�n n�i g� ��n chuy�n ��ng sai?! C�i bang c� lo�i �� t� c� ch�p nh� ng��i, s�m mu�n g� c�ng th�n b�i danh li�t!")
end

function enroll_select()
	UTask_gb = nt_getTask(8)
	UTask_tr = nt_getTask(4)
	if ((UTask_tr > 5*256) and (UTask_tr < 10*256)) then		-- �ѽ���������������
		Talk(1,"","C�i Bang v� Thi�n Nh�n x�a nay v�n kh�ng ��i tr�i chung! N�u ng��i �� quy�t t�m gia nh�p Thi�n Nh�n, ta kh�ng c�n g� �� n�i!")
	elseif (GetSeries() == 3) and (GetCamp() == 0) and (UTask_tr < 5*256) and (UTask_gb < 5*256) then		--��ϵ��δ������ؤ��
		if (GetLevel() >= 10) then						--�ȼ��ﵽʮ��
			Say("C� h�ng th� gia nh�p C�i bang kh�ng? M�i ng��i c� c�m c�ng �n, c� r��u c�ng u�ng!", 3, "Gia Nh�p C�i bang/go", "�� ta suy ngh� k� l�i xem/no","T�m hi�u tinh hoa v� ngh� c�c m�n ph�i/Uworld1000_knowmagic")
		else
			Talk(1,"","C�n b�n c�a ng��i c�n k�m l�m! H�y �i luy�n t�p th�m, bao gi� ��n c�p 10 l�i ��n t�m ta!")
		end
	end		-- ���ǻ�ϵ�ľͲ��ٶ�˵���ˡ�
end;

function go()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 240 ) or ( Uworld1000 == 250 ) then
		nt_setTask(1000,260)
	end
	SetRevPos(115,53)		  			--�ȴ��ṩ������
	nt_setTask(8, 10*256)				-- ֱ������
	SetFaction("gaibang")       			--��Ҽ�������
	SetCamp(1)
	SetCurCamp(1)
	SetRank(37)
	nt_setTask(137,68)
	SetLastFactionNumber(6)
-- ֱ�Ӵ�������
--	nt_setTask(8,80*256)
--	SetRank(78)
--	Msg2Player("��ӭ�����ؤ�������ֱ��ѧ�᱾�����м��ܡ�")
	add_gb(GetLevel())			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
-- ����
	Msg2Player("Hoan ngh�nh b�n gia nh�p C�i bang, tr� th�nh �� t� kh�ng t�i! H�c ���c Ki�n Nh�n Th�n Th�, Di�n M�n Th�c B�t")
	AddNote("Gia nh�p C�i bang, tr� th�nh �� t� kh�ng t�i.")
	Msg2Faction("gaibang",GetName().."T� h�m nay gia nh�p C�i bang! Xin b�i ki�n c�c v� s� huynh s� t�! Mong c�c v� quan t�m ch� gi�o!",GetName())
---off--	NewWorld(115, 1501, 3672)			--����Ҵ��͵��������

end;

function return_yes()
	NewWorld(115, 1501, 3672)			--����Ҵ��͵��������
end;

function gb_check_yes()			-- ������ȷ����������ļ�顣������δ��Ӧ����
	if (GetSeries() ~= 2) then
		Talk(1,"","Ng� h�nh c�a ng��i kh�c h� H�a v�i b�n ta!  ��n ��y l�m g�? H�y l�n di�n ��n h�c h�i �i!")
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

function gb_check_no()
	Say("C� l�i g� mu�n n�i v�i bang ch� kh�ng? Hay mu�n ta ��a v� T�ng ��n?",2,"Xin ��a t�i h� v� T�ng ��n!/return_yes","Xin chuy�n d�m l�i h�i th�m s� ph� /no")
end

function Uworld1000_jiaoyugaibang()
	nt_setTask(1000,260)
	Msg2Player("Ng��i �� l� �� t� c�a b�n bang, kh�ng c�n �i n�a, c� th� tr�c ti�p g�p Long Ng� n�i chuy�n.")
end

function no()
end;
