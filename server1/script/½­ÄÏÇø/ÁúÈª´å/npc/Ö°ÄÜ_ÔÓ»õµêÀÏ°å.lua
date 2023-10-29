--��Ȫ�� ְ�� �ӻ����ϰ�
--��Ȫ���������񣺺���ò��á�������ѩ��
-- By: Dan_Deng(2003-09-03)
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\itemhead.lua")
Include("\\script\\global\\global_zahuodian.lua");


function main(sel)
	UTask_world18 = GetTask(18)
	if (UTask_world18 == 0) then 		--������ò��á���������
		Talk(4,"W18_get","�y! Th�t l� kh�ng may m�n!","�ng l�i g�p ph�i chuy�n phi�n ph�c n�a �?","N�i th�t x�u h�! N�m r�i ta c��i m�t ng��i v�! C� ta l� ng��i t�i gi�, d�n theo m�t ��a con. �y! Ta th�t kh�ng hi�u l� ��a b� n� mu�n g�. Nh�ng bi�t l� n� r�t gh�t ta ","C� l� t�i v� �ng qu� m�c c�m th�i! C� h�i th�ng ngay ��a b� xem n� mu�n g� c� t�t h�n kh�ng ")
	elseif (UTask_world18 == 6) then		-- ������ò��á��������
		Talk(1,"W18_prise","Ta �� h�i qua ��a nh� �� r�i! N� tuy�t ��i kh�ng h� gh�t �ng ��u! �ng c� y�n t�m �i!")
	elseif (GetTask(20) == 5) and (HaveItem(231) == 0) then		-- ��������ѩ������������в���û�д˵���
		if (UTask_world18 == 10) then			-- ����ɡ�����ò��á�����
			Talk(1,"","D��ng Xu�n Linh Chi? Lo�i linh chi n�y hi�n nay r�t �t th�y. Nh�ng m� � ��y ta v�n c�n m�t �t. Ng��i gi�p cho ta m�t chuy�n n�y th� ta s� t�ng h�t s� Linh Chi �� cho ng��i ")
			AddEventItem(231)
			AddNote("���c �ng ch� t�p h�a t�ng cho D��ng Xu�n Linh Chi")
			Msg2Player("���c �ng ch� t�p h�a t�ng cho D��ng Xu�n Linh Chi")
		else
			local buttons = store_sel_village_extend();
			tinsert(buttons, 1, "Mua D��ng Xu�n Linh Chi/W20_buy");
			Say("D��ng Xu�n Linh Chi? Lo�i linh chi n�y hi�n nay r�t �t th�y. Nh�ng m� � ��y ta v�n c�n m�t �t. Ch� c�n c� 500 l�ng b�c",getn(buttons),buttons);
		end
	else
		local buttons = store_sel_village_extend();
		Say("Ta tr��c ��y v�n l� m�t th��ng nh�n, k�t giao r�t nhi�u b�ng h�u. Sau �� x�y ra ��i lo�n, ��n ��u c�ng th�y chi�n tranh. N�n ta ��nh an ��nh n�i n�y v�y",getn(buttons),buttons)
	end
end;

function W18_get()
	local buttons = store_sel_village_extend();
	tinsert(buttons, 1, "Th�i v�y �� ta gi�p �ng h�i cho/W18_get_yes");
	Say("Nh�ng m��.Nh�ng m� ta v�n l� ng��i th�t b�i! C� m�t ��a tr� th�i m� c�ng kh�ng th� l�y l�ng ���c n� ",getn(buttons),buttons)
end

function W18_get_yes()
	SetTask(18,3)
	Talk(1,"","V�y th� t�t qu�! Ta s� � ��y ��i tin vui c�a ng��i nh�!")
	AddNote("Nh�n nhi�m v�: gi�p �ng ch� �i h�i t�m � c�a Kh�ng Hi�u")
	Msg2Player("Nh�n nhi�m v�: gi�p �ng ch� �i h�i t�m � c�a Kh�ng Hi�u")
end

function W18_prise()
	Talk(1,"","V�y th� t�t qu�! Ta th�t c�m r�t c�m �n ng��i!� ��y c� ch�t l�ng th�nh! Mong ng��i nh�n cho")
	SetTask(18,10)
	AddNote("N�i l�i suy ngh� c�a Kh�ng Hi�u v�i �ng ch� t�p h�a, ho�n th�nh nhi�m v�.")
	Msg2Player("N�i l�i suy ngh� c�a Kh�ng Hi�u v�i �ng ch� t�p h�a, ho�n th�nh nhi�m v�.")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if(GetSex() == 0) then
		AddItem(0, 2, 6, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("���c m�t �o v�i th�.")
	else
		AddItem(0, 2, 13, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("���c m�t B�ch �i�t qu�n.")
	end
	AddRepute(5)
	Msg2Player("Danh v�ng c�a b�n t�ng th�m 5 �i�m")
end

function W20_buy()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(231)
		AddNote("Mua ���c D��ng Xu�n Linh Chi.")
		Msg2Player("Mua ���c D��ng Xu�n Linh Chi.")
		Talk(2,"","Th� Linh Chi n�y th�t l� qu� ","M�t ph�n ti�n th� m�t ph�n h�ng. Ng��i kh�ng thi�t th�i ��u!")
	else
		Talk(1,"","B�n th�t l� m�c! Ta ��u c� nhi�u ti�n nh� v�y")
	end
end

function yes()
	Sale(29)
end;

function no()
end;
