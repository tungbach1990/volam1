--��ԭ���� �꾩�� �ӻ����ϰ�Ի�
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
	Say("Kh�ch quan c�n g�? Hi�n gi� th� ��o h�n lo�n s�ng ���c qua ng�y th�t kh�ng d�, ti�m ta th� g� c�ng r�, mu�n mua th� g�?", getn(Buttons), Buttons);
end;


function yes()
Sale(8);  			--�������׿�
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;


