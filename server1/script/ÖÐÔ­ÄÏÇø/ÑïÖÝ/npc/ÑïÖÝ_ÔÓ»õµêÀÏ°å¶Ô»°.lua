--��ԭ���� ���ݸ� �ӻ����ϰ�Ի�
Include("\\script\\global\\global_zahuodian.lua");

function main(sel)
	local Buttons = store_sel_extend();
	Say("���ng th�y D��ng Ch�u c�a ch�ng ta th�ng ra b�n ng�, l� n�i c� �� h�ng h�a t� Nam t�i B�c, v� th� v�t ph�m ch�ng t�i c� �� ��ng T�y Nam B�c, th� g� c�ng c�, mua m�t �t g� �i?", getn(Buttons), Buttons);

end;


function yes()
Sale(5);  			--�������׿�
end;

function BuyChristmasCard()
	Sale(97);
end


function no()
end;





