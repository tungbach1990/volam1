-- ����ְ�� �ӻ����ϰ�
-- By: Dan_Deng(2003-09-16)
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
	Say("�� � ch� ta v�a r� l�i d� b�n, h�m qua v�a mua h�ng m�i v�, vui qu�! ", getn(Buttons), Buttons)
end;

function yes()
	Sale(17)
end;

function BuyChristmasCard()
	Sale(97);
end

function no()
end;
