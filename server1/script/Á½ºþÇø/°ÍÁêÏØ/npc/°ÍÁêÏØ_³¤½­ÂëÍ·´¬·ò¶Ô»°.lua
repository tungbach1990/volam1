--������ ������ ������ͷ����Ի�
--suyu
--200306015
-- Update: Dan_Deng(2003-08-21) ���ͳ���ȼ�Ҫ��Ϊ5��

CurWharf = 5;
Include("\\script\\global\\station.lua")

function main(sel)
	--if (GetLevel() >= 5) then		--�ȼ��ﵽ�弶
	--	Say("Ta c� bi�t hi�u l� 'L�ng L� B�ch �i�u', ba ��i ��u s�ng d�a v�o s�ng n��c! Kh�p Ba L�ng huy�n n�y kh�ng c� ai l� ��i th�! Kh�ch quan mu�n �i ��u!", 2, "Ng�i thuy�n/WharfFun", "Kh�ng ng�i/OnCancel")
	--else		
	--	Talk(1,"","B�n ngo�i lo�n l�c, xem ng��i tr�i g� kh�ng ch�t! Ra ngo�i th�n ta e kh�ng gi� ���c m�ng ��u!")
	--end
end;

function  OnCancel()
   Talk(1,"","Kh�ng ti�n kh�ng th� ng�i thuy�n! ")
end;
