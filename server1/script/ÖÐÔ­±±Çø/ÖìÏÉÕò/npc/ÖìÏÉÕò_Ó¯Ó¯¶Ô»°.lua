--description: ���ִ�_ӯӯ
--author: wangzg	
--date: 2003/7/22
--72	UTask_world44
--update 2003/7/28 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world44=GetTask(72)
	if ((UTask_world44==0) and (GetLevel() >= 2)) then		-- ������������Ҫ2������
		Talk(3, "select", "Sao ��u �c l�i tr�ng r�ng, nh�c b�ng b�ng th� n�y? 'Ph��ng l�u ch� x�ch, giai k� y�u v� ��nh. Tri�n chuy�n v� mi�n, x�n ch�m b�ng l�nh'. L� ai khi�n ta b� nh� v�y?", "�...C� n��ng x�y ra chuy�n g� v�y, v� sao l�i t�n th��ng nh� th�?", "C� ai hi�u ���c n�i �au trong l�ng ta. V� ��i hi�p c� th� gi�p ta ���c kh�ng?")
	elseif (UTask_world44==2)  then
		Talk(1,"","Phi�n huynh n�i v�i t�nh lang Tr��ng ��i Nguy�n, canh ba ��m nay, t�i ch� c�, kh�ng g�p kh�ng v�.")
	elseif (UTask_world44==4) then		-- �������
		Talk(7,"prise","Tr��ng ��i Nguy�n kia n�i kh�ng quen c� n��ng.","C�i g�?.....�o�n huy�n v� t�c, n��c �� kh� thu, v�n li�n h� v�i ng��i tr��c ��y. N�i h�i ti�c lu�n day d�t. B�y gi� bi�t l�m sao ��y?","......C� n��ng th�t l� ng��i l�ng m�n!","�i, th�i �i, h�i �c n�y ta ch� gi� trong l�ng th�i.", "��ng n�n l�ng, ��n �ng tr�n th� gian n�y c�n r�t nhi�u.", "�a t� c�c h� �� quan t�m, ��i gi�y n�y xin t�ng l�i c�c h�. �i�...ph�ng kh�ng chi�c b�ng, th�t s�u n�u ru�t.", "......")
	else
		Talk(1,"","V� ch�ng ng��i ta c� ��i c� c�p, ta sao kh� th� n�y, ch� m�t m�nh thui th�i?")
	end
end;

function select()
	Say("H�y gi�p ti�u n� �em chi�c kh�n tay n�y ��n t�nh lang Tr��ng ��i Nguy�n, v� n�i v�i huynh �y canh ba ��m nay, ch� c�, kh�ng g�p kh�ng v�.", 2, "���c, ta s� gi�p /yes", "Ta c�n vi�c kh�c ph�i l�m /no")
end

function yes()
	AddEventItem(192)
	SetTask(72,2)
	AddNote("Nh�n nhi�m v�: Gi�p Doanh Doanh ��a chi�c kh�n tay cho t�nh lang Tr��ng ��i Nguy�n, chuy�n l�i l�i nh�n. ")
	Msg2Player("Nh�n nhi�m v�: Gi�p Doanh Doanh ��a chi�c kh�n tay cho t�nh lang Tr��ng ��i Nguy�n, chuy�n l�i l�i nh�n. ")
	Msg2Player("L�y ���c m�t chi�c kh�n tay. ")
end

function no()
end

function prise()
	DelItem(192)
	SetTask(72,10)
	AddRepute(5)
	AddNote("N�i l�i th�i �� c�a Tr��ng ��i Nguy�n cho Doanh Doanh bi�t, khuy�n n�ng ta ��ng q�a �au bu�n, ho�n th�nh nhi�m v�. ")
	Msg2Player("N�i l�i th�i �� c�a Tr��ng ��i Nguy�n cho Doanh Doanh bi�t, khuy�n n�ng ta ��ng q�a �au bu�n, ho�n th�nh nhi�m v�. ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if (GetSex()== 0) then
		AddItem(0,5,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("L�y ���c ��i gi�y c� ")
	else
		AddItem(0,5,2,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("L�y ���c ��i h�i th�u ")
	end
	Msg2Player("Danh v�ng c�a b�n t�ng th�m 5 �i�m")
end;
