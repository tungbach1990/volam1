--description: ���ִ�_С��
--author: wangzg	
--date: 2003/7/22
--update 2003/7/28 yuanlan
--Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world45=GetTask(73)
	if (UTask_world45 == 1) then
		Talk(4, "Fpay", "Ch�u l� Ti�u Long? Ch� ch�u �ang t�m ��, mau v� �i!", "Ta ch�a mu�n v�, t� t� cho ch�u 10 l��ng b�c b�o ta mua k�o, nh�ng �� ch�u l�m m�t ti�n r�i, t� s� m�ng ch�u th�i","Ch�u t�m xung quanh r�t l�u, c�ng kh�ng t�m ���c 10 l��ng v�ng, hu hu hu!.....","Ch�u ��ng lo, ta cho ch�u 10 l��ng!")
	else
		Talk(1,"","T� r�t t�t v�i ta, nh�ng ta r�t s� t� �y!")
	end
end

function Fpay()
	if (GetCash() < 10) then
		Talk(1,"","�i ch�! Ta kh�ng c� ti�n, kh�ng gi�p ���c ch�u r�i!")
	else
		Pay(10)
		Talk(1,"","C�m �n ng��i! S�i y�u ��i n�y l� ta kh�ng d�ng ��n, t�ng ng��i!")
		SetTask(73,10)
		AddNote("T�m ���c ti�u Long, ��a cho n� ti�n, thuy�t ph�c n� v� nh�, nhi�m v� ho�n th�nh. ")
		Msg2Player("T�m ���c ti�u Long, ��a cho n� ti�n, thuy�t ph�c n� v� nh�, nhi�m v� ho�n th�nh. ")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		AddItem(0,6,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("C� ���c 1 s�i th�t l�ng b�ng da. ")
		AddRepute(5)
		Msg2Player("Danh v�ng c�a b�n t�ng th�m 5 �i�m ")
	end				
end

function no()
end
