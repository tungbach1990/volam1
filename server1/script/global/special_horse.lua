-- special_horse.lua ��������(80����)��NPC�ű�
-- By Dan_Deng(2003-11-10)

function main()
	UWorld97 = GetTask(97)
	if (UWorld97 == 10) then		-- �Ѿ����
		Talk(1,"","Ng��i nh�t ��nh ph�i ��i ��i t�t v�i ng�a, h�ng ng�y ph�i t�m cho n�, b�nh ��u ph�i gi� b�t cho nhuy�n... ")
	elseif (UWorld97 == 1) and (IsTongMaster() == 1) then			-- ��������
		Talk(4,"sele_color","V� anh h�ng n�y xin d�ng b��c ��. ","Huynh ��i, c� chuy�n g� c�n ch� gi�o? ","T�i h� Th�m C�u, hi�n c� 1 con thi�n l� m� mu�n b�n, xem v� huynh ��i n�y nh�t ��nh l� m�t ��i t�ng s� c�a ch�nh ph�i. Ng�a t�t c�a t�i h� th�t kh�ng x�u h� khi ph�c v� anh h�ng. ","�� ta xem th� ng�a qu� c�a huynh,,, ")
	else
		Talk(1,"","Thi�n L� m� kh�ng thi�u, nh�ng ng��i bi�t d�ng ng�a h�i c� m�y ai!")
	end
end

function sele_color()
	Say("Anh h�ng h�y xem! ",6,"��y kh�ng ph�i l� � V�n ��p Tuy�t sao! /buy_black","��y kh�ng ph�i l� X�ch Th� B�o M� sao! /buy_red","��y kh�ng ph�i l� Tuy�t �nh sao! /buy_cyan","��y kh�ng ph�i l� ��ch L� sao! /buy_yellow","��y ch�ng ph�i l� Chi�u D� Ng�c S� T� sao! /buy_white","��y l� ng�a g� v�y? T�i h� hi�u bi�t c�n k�m /buy_none")
end

function buy_black()
	the_buy(1)
end

function buy_red()
	the_buy(2)
end

function buy_cyan()
	the_buy(3)
end

function buy_yellow()
	the_buy(4)
end

function buy_white()
	the_buy(5)
end

function buy_none()
	Talk(1,"","Nh�t bang chi ch�, l� m�t nh�n v�t b�c th�y l�m sao kh�ng bi�t ��y r�t cu�c l� ng�a g� ch�? Th� l�i, xem ra t�i h� �� nh�n l�m ng��i!")
end

function the_buy(i)
	SetTaskTemp(49,i)
	Say("Kh�ng sai,anh h�ng qu� nhi�n bi�t nh�n!  T�i h� ��y c�ng kh�ng mu�n ph�i b�n n�,nh�ng hi�n gi� t�i h� c�n 300 v�n l��ng b�c!  Hy v�ng anh h�ng ��i ��i t�t v�i n�! ",2,"kh�ng sao ��u, ta nh�t ��nh s� ��i x� t�t v�i n� m� /buy_yes","Nh�t th�i l�m sao t�m ra ���c s� ti�n n�y /buy_no")
end

function buy_yes()
	if (GetCash() >= 3000000) then
		i = GetTaskTemp(49)
		Pay(3000000)
		AddItem(0,10,5,i,0,0,0)
		SetTask(97,100+i)			-- ������ֵ�����Ҽ�ס�����ʲô��ɫ��
		Talk(1,"","Ng�a �i ng�a! T� ��y v� sau ng��i h�y �i theo v� anh h�ng n�y nh�, nh�t ��nh ph�i ngoan ngo�n ��!")
	else
		Talk(1,"","Ta hi�n gi� trong ng��i kh�ng mang theo �� ng�n l��ng, huynh t�m th�i c�m �� s� ti�n n�y v�y!")
	end
end

function buy_no()
	Talk(1,"","Kh�ng l� s� ti�n n�y l�i l�m kh� anh h�ng sao")
end
