--������ �ٰ��� ������ͷ����Ի�
--suyu
--20031029

CurWharf = 11;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")

function main(sel)
	--if (GetLevel() >= 50) then
	--	Say("Thuy�n c�a ta kh�ng ph�i t�m th��ng! T�ng ch� qua ��i th�n t� t��ng c�a tri�u ��nh! Mu�n �i ��u ph�i ��t tr��c!", 3, "Ng�i thuy�n/WharfFun", "Kh�ng ng�i/OnCancel", "<#> �i ��o Hoa ��o (1) ["..AEXP_TICKET.."<#> L��ng]/go_thd");
	--else
	--	Say("Thuy�n c�a ta kh�ng ph�i t�m th��ng! T�ng ch� qua ��i th�n t� t��ng c�a tri�u ��nh! Mu�n �i ��u ph�i ��t tr��c!", 2, "Ng�i thuy�n/WharfFun", "Kh�ng ng�i/OnCancel")
	--end
end;

function  OnCancel()
   Talk(1,"","Kh�ng ti�n kh�ng th� ng�i thuy�n! ")
end;

function go_thd()
	nRet = aexp_gotothd(235);
	-- if (nRet == 1) then
	--	Msg2Player("�������ȥ�һ������˿���ࡣ�ðɣ�������ඣ�")
	if (nRet == -1) then
		Talk(1,"","<#> Ph� �i ��o Hoa ��o"..AEXP_TICKET.."<#> ng�n l��ng, ng��i tr� n�i kh�ng?")
	end
end
