--description: ���ִ�_��ԥ
--author: wangzg	
--date: 2003/7/21
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-09)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ
-- Update: Dan_Deng(2003-09-20) Ϊ��VSS��δ���£���д�޸���������

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world69=GetTask(69)
	if ((UTask_world69 == 0) and (GetLevel() >= 5)) then
		Talk(3, "select", "Y ��i thi�n khoan dung b�t h�i, vi y ti�u ��c nh�n ti�u tu� ","V� huynh ��i n�y, c� g� �au l�ng v�y?","Ch� ti�c l� tr��c gi� c� ta kh�ng c� bi�u hi�n g� v�i ta. T�i sao tr�n th� gian n�y c� ng��i �au kh� nh� ta ch�?")
	elseif (UTask_world69 == 4) then
		Talk(4,"W69_step2","Xu�n H��ng ra cho huynh m�t �� thi: 'Y ��i thi�n khoan chung b�t h�i', t�c gi� Li�u V�nh c�a c�u th� tr�n c�n ���c g�i l� g�?","Th�t ��ng ch�t! Ta th�t ngh� kh�ng ra!","Kh�ng bi�t� C�u h�i ��n gi�n nh� th� m� kh�ng bi�t?","Th�t ng�i qu�! Huynh c� th� gi�p ta kh�ng?")
	elseif (UTask_world69 == 8) then
		Talk(2, "prise", "Xu�n H��ng c� n��ng �� ch�p nh�n t�n v�t c�a huynh, c�n m�i huynh ��n nh� l�m kh�ch! Ch�c m�ng ch�c m�ng!", "Chi�c nh�n n�y l� th�nh � c�a ta t�ng ng��i! Xin nh�n cho!")
	elseif (UTask_world69 == 2) then
		Talk(1,"","C� ta t�n l� Xu�n H��ng, � ph�a ��ng tr�n, phi�n ng��i mang qu�t l� sen n�y t�ng cho c� ta.")
	elseif (UTask_world41==10) then
		Talk(1,"","Xu�n H��ng v�a ��m �ang v�a hi�n l�nh, l�y ���c ng��i v� nh� th� th� c�n g� b�ng!")
	else
		Talk(1,"","�a t�nh�Th� gian n�y ai m� ch�ng v�y!")
	end
end

function select()
	Say("Ng��i c� th� gi�p ta truy�n ��t t�m � ��n c� ta kh�ng?", 2, "Ta c� th� gi�p ng��i n�i v�i n�ng. /yes", "Chuy�n n�y ta kh�ng gi�p n�i ��u. /no")
end;

function yes()
	Talk(1,"","C� ta t�n l� Xu�n H��ng, � ph�a ��ng tr�n, phi�n ng��i mang qu�t l� sen n�y t�ng cho c� ta.")
	AddEventItem(190)
	Msg2Player("Nh�n nhi�m v�: Gi�p L� D� truy�n ��t t�nh � ��n Xu�n Hu�ng, ��a hoa sen nh� l� t�n v�t c�a L� D� cho Xu�n H��ng. ")
	SetTask(69,2)
	AddNote("Nh�n nhi�m v�: Gi�p L� D� truy�n ��t t�nh � ��n Xu�n Hu�ng, ��a hoa sen nh� l� t�n v�t c�a L� D� cho Xu�n H��ng. ")
end

function no()
end

function W69_step2()
	Talk(1,"","Tu�n l�nh!")
	SetTask(69,6)
	AddNote("L� D� kh�ng tr� l�i ���c c�u h�i, nh� ng��i gi�p L� D� tr� l�i c�u h�i n�y. ")
	Msg2Player("L� D� kh�ng tr� l�i ���c c�u h�i, nh� ng��i gi�p L� D� tr� l�i c�u h�i n�y. ")
end

function prise()
	SetTask(69,10)
	AddRepute(7)		-- ������7��
	AddNote("Mang c�u tr� l�i c�a Xu�n H��ng n�i v�i L� D�, nhi�m v� ho�n th�nh. ")
	Msg2Player("Mang c�u tr� l�i c�a Xu�n H��ng n�i v�i L� D�, nhi�m v� ho�n th�nh. ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if (random(0,3) == 0) then
		AddItem(0, 3, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("Nh�n ���c chi�c nh�n Ho�ng ng�c ")
	else
		AddItem(0, 3, 0, 2, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("Nh�n ���c chi�c nh�n �� oliu ")
	end
	Msg2Player("Danh ti�ng giang h� c�a b�n t�ng th�m 7 �i�m ")
end
