--�������� ������ �ƺ���ͷ����Ի�
--suyu
--20031029

CurWharf = 10;
Include("\\script\\global\\station.lua")

function main(sel)
	--if (GetLevel() >= 5) then		--�ȼ��ﵽ�弶
	--	Say("Ch�ng ta l�m c�ng � tr�n thuy�n n�y th�t l� c�c kh�! N�ng ch�y! Gi� qu�t! B�y gi� l�i g�p s�ng to gi� l�n, e r�ng s� kh�ng ai s�ng s�t!", 2, "Ng�i thuy�n/WharfFun", "Kh�ng ng�i/OnCancel")
	--else		
	--	Talk(1,"","B�n ngo�i lo�n l�c, xem ng��i tr�i g� kh�ng ch�t! Ra ngo�i th�n ta e kh�ng gi� ���c m�ng ��u!")
	--end
end;

function  OnCancel()
   Talk(1,"","Kh�ng ti�n kh�ng th� ng�i thuy�n! ")
end;