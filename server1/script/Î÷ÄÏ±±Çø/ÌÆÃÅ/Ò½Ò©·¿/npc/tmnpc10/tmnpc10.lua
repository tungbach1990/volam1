--���ϱ���\����\ҽҩ��\npc\tmnpc10.lua
--description: ������Ұ 40������ 
--author: yuanlan	
--date: 2003/3/12
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-13)
-- Update: xiaoyang(2004\4\13)  ����90���嶾����

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2)
	Uworld124 = GetTask(124)
	if(GetFaction() == "tangmen") and (GetSeries() == 1) then
		if((UTask_tm == 40*256) and (GetLevel() >= 40) and (GetFaction() == "tangmen")) then		--40����������
			Talk(4,"L40_get","Ta c� m�t chuy�n duy nh�t m� ��n nay v�n ch�a ho�n th�nh! Th�t bu�n qu�!", "L�o phu t�ng c� ng��i b�n t�n C�nh T� K�, 10 n�m tr��c, v� C�nh T� K� m�c b�nh l� ��n xin c�u gi�p. Nh�ng B�n m�n c� quy ��nh kh�ng ph�i l� ng��i trong ���ng M�n kh�ng ���c c�u ch�a. B�t lu�n C�nh T� K� c�u xin l�o phu v�n c��ng quy�t kh�ng ra tay gi�p ��, k�t qu� kh�ng l�u sau v� h�n qua ��i, hai ta t� �� tr� m�t th�nh th�.", "M�y ng�y tr��c, ta c� nh�n ���c 1 b�c th� c�a C�nh T� K�, h�n ta ra g�p m�t. Ta bi�t h�n ��n t�m ta �� b�o th�, ta n� h�n 1 m�ng tr� l�i h�n c�ng kh�ng sao. Ch� l� ta kh�ng m�t m�i n�o g�p l�i c� nh�n! ", "S� th�c! Chuy�n n�y kh�ng th� tr�ch ng��i ���c, ng��i n�n gi�i th�ch r� nguy�n nh�n v�i �ng ta, �� �ng ta hi�u r� n�i kh� n�m x�a c�a ng��i.")
		elseif(UTask_tm == 40*256+40) then 
			Talk(3, "L40_step44", "���ng D� s� th�c! Con g�i c�a C�nh ti�n b�i v� m� c� ta c�ng m�c gi�ng m�t ch�ng b�nh, t�nh m�ng �ang nguy k�ch, n�u S� th�c c� th� c�u con c�a �ng ta, �ng ta nh�t ��nh s� kh�ng tr�ch ng��i n�a!", "Nh�ng m� m�n quy.....", "S� th�c y�n t�m, �� t� �� ngh� ra m�t bi�n ph�p hay. S� th�c kh�ng c�n ph� m�n quy m� v�n c� th� c�u ng��i. Ch� c�n cho �� t� bi�t ph��ng thu�c l� ���c!")
		elseif(UTask_tm == 40*256+80) then
			Talk(4, "L40_prise", "Ph��ng thu�c m� S� th�c ��a qu� nhi�n c� hi�u qu�, con g�i c�a C�nh ti�n b�i ���c c�u r�i! �ng ta �� kh�ng c�n tr�ch ng��i n�a!", "Th�t kh�ng? Th� th� hay qu�! Nh�ng con g�i c�a �ng ta kh�ng ph�i l� do ta c�u m� l� ng��i c�u, hi�u � ta ch�?", "D� hi�u! Vi�c n�y kh�ng li�n can ��n S� th�c, l� do �� t� l�m! ", "Ng��i qua nhi�n th�ng minh, l�o phu kh�ng nh�n l�m ng��i, ha ha ha! ")
		elseif(UTask_tm > 40*256) and (UTask_tm < 40*256+60) then					--40����������ͨ�Ի�
			Talk(1,"","<color=Red>C�nh T� K�<color> �n c� � <color=Red>ph�a t�y Thanh Th�nh s�n<color>.")
		elseif(UTask_tm >= 40*256+60) and (UTask_tm < 50*256) then					--��δ���40������
			Talk(1,"","D��c li�u c� 5 lo�i:<color=Red>da c�c<color>, <color=Red>gan r�n ��c<color>,<color=Red>h�t anh t�c<color>,<color=Red>�u�i r�t ��c<color>,<color=Red>��u thi�n t�m<color>. Nh�ng d��c li�u n�y c� nhi�u � <color=Red>Thanh D��ng L�nh<color> <color=Red>��ng b�c Thanh Th�nh s�n<color>.")
		elseif(UTask_tm >= 50*256) and (GetFaction() == "tangmen") then					--�Ѿ����40��������δ��ʦ
			Talk(1,"","Ng��i �� gi�p l�o phu h�a gi�i �n o�n 10 n�m nay, th�t kh�ng bi�t sao �� c�m t�!")
		else
			Talk(1,"","B�n b� tr� m�t, th�t khi�n ng��i ta �au l�ng!")
		end
	elseif (Uworld124 == 20) and (HaveItem(385) == 1) then
		Talk (2,"Uworld_wdutask","���ng ti�n sinh! � ��y c� b�c th� xin ng�i xem qua!","V�t n� �i! Ta kh�ng th�m xem!")
	elseif (Uworld124 == 20) then
		Msg2Player("B�c th� ph�i ch�ng �� b� m�t tr�n ���ng �i, h�y �i t�m th�. ")
	elseif (Uworld124 == 25) then
		Talk (15,"Uworld_wdutask2","Chuy�n g� v�y?","Ti�u t�! Ng��i su�t m�t m�ng c� bi�t kh�ng?","Oh! T�i h� ngu mu�i!","N�u nh� ta kh�ng c� n�i gi�n trong Ng� ��c Gi�o xem ra h�m nay b� tr�ng k� c�a V�n l�o nhi r�i. C� ph�i ��y l� b�c th� V�n B�t T� nh� ng��i chuy�n gi�p kh�ng?","��ng v�y.","Haha! Ng��i tr�ng k� r�i! Th� n�y c� ��c v� h�nh ��, b� ngo�i kh�ng th�y g� h�t nh�ng khi m� ra s� l�m cho kinh m�ch ��ol�n, V�n l�o nhi v�n d� mu�n h�i ta, kh�ng xem m�ng s�ng c�a ng��i ra g� h�t.","Huhu! T�nh sao ��y ti�n sinh?","��ng lo! V�n l�o nhi h�i ta l� v� ta th��ng c�u nh�ng ng��i m� l�o h� ��c. B�nh c�a ng��i giao cho l�o phu.","���ng D� s� d�ng n�i c�ng tr� ��c cho b�n, b�n c� c�m gi�c nh� c� ng�n vi�n bi b�n ra xu�ng ��t v�y.","���ng D�: May l� ph�t hi�n s�m, kh�ng th� ng��i ti�u r�i.","C�m �n ���ng L�o gia.","Kh�ng ph�i l�m c�ng kh�ng ��u! Ng��i gi�p ta �em b�c th� n�y v� b�n �� ta c� b� s�n thu�c ��c kh�c r�i ch� c�n ng��i n�i l� �� ph�t hi�n ra �m m�u c�a h�n, h�n s� gi�t ngay b�c th� xem ��n l�c �y s� c� ng��i ��n l�y m�ng c�a h�n.","V�n B�t T� nu�i ��c h�i ng��i nh�t ��nh ta kh�ng tha cho h�n ��u.","Ng��i u�ng thu�c gi�i xong l�n ���ng ngay �i.","D�!")
	elseif(Uworld124 == 30 ) and (HaveItem(386) == 0) then
		Talk (1,"","Ti�u t� nh� ng��i, l� th� � ��, �i ���ng c�n th�n, V�n l�o t�c tuy�t kh�ng d� ��i ph� ��u. ") 
		AddEventItem(386)
		Msg2Player("Nh�n l�i th� c�a ���ng D� ")
	elseif(UTask_tm == 70*256) then							--�Ѿ���ʦ
		Talk(1,"","C� r�nh ��n u�ng r��u v�i l�o phu!")
	else										--δ���40������ȱʡ�Ի���
		Talk(1,"","���ng m� n�y �� n�i m�t l�i quy�t kh�ng thay ��i!")
	end
end;

function L40_step44()
	SetTask(2, 40*256+60)
	AddNote("Tr� v� ph�ng Y D��c g�p ���ng D� s�, bi�t ���c ph��ng thu�c g�m c�: Da C�c, Gan R�n ��c, �u�i R�t ��c v� ��u Thi�n t�m.")
	Msg2Player("�i Thanh Th�nh S�n,  ��n Thanh D��ng Phong t�m d��c li�u")
	Talk(2,"", "Vi�c ��n n��c n�y ch� ��nh v�y, mu�n tr� b�nh n�y c�n c� 5 lo�i ��c v�t:<color=Red>da c�c<color>,<color=Red>gan r�n ��c<color>,<color=Red>v� anh t�c<color>,<color=Red> �u�i b� c�p ��c<color>,<color=Red>��u con t�m<color>. L�y ��c tr� ��c.","5 lo�i ��c v�t n�y c� � nhi�u � <color=Red>Thanh D��ng L�nh<color> tr�n <color=Red>��ng B�c Thanh Th�nh s�n<color>. Nh�ng m� � �� th��ng c� <color=Red> H�c �ng<color>,<color=Red>Hung th�u<color>,<color=Red>Linh �i�u<color> xu�t hi�n, ng��i ph�i c�n th�n!")
end;

function L40_get()
	Say("H�n h�n ta th�y ch�t kh�ng c�u, l�m g� nghe ta gi�i th�ch.", 2, "H�a gi�i �n o�n gi�a hai ng��i/L40_get_yes", "Ta kh�ng th� gi�p g� ���c/L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","<color=Red>C�nh T� K�<color> c� �n c� � <color=Red> ph�a t�y Thanh Th�nh s�n<color>.")
	SetTask(2, 40*256+20)
	AddNote("T�i ph�ng Y D��c g�p ���ng D�, nh�n <color=red> nhi�m v� C�nh T� K�<color>, h�a gi�i �n o�n gi�a ���ng D� v� C�nh T� K�.")
	Msg2Player("Nh�n nhi�m v� C�nh T� K� t� ���ng D�: H�a gi�i �n o�n gi�a ���ng D� v� C�nh T� K�.")
end;

function L40_get_no()
end;

function L40_prise()
	SetRank(29)
	SetTask(2, 50*256)
--	AddMagic(345)
	add_tm(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng b�n! B�n �� ���c th�ng l�m �� t� Nh�p C�c! C� th� h�c v� c�ng H�n B�ng Th�ch c�a ���ng M�n. ")
	AddNote("��n ph�ng thu�c ���ng m�n, ph�c m�nh ���ng D�, ho�n th�nh nhi�m v� C�nh T� K�, th�ng l�m �� t� Nh�p C�c. ")
end;

function Uworld_wdutask()
	DelItem(385)
	Msg2Player("B�n n�m b� th� c�a V�n B�t T� ")
	SetTask(124,25)
end

function Uworld_wdutask2()
	AddEventItem(386)
	Msg2Player("Ch�t ��c �� gi�i h�t, nh�n ���c th� c�a ���ng D�, giao cho V�n B�t T� ")
	AddNote("�em th� tr� l�i c�a ���ng D� giao cho V�n B�t T�. ")
	SetTask(124,30)
end
