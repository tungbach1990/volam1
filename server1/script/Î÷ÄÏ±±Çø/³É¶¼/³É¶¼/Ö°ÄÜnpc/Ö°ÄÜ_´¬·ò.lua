--���ϱ��� �ɶ� ����Ի�

CurWharf = 9;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	if (GetLevel() >= 50) then
		Say("� ��y tuy kh�ng c� b�u t�u nh�ng ta c�ng c� c�ch ��a ng��i �i!", 2, "�i ��o Hoa ��o (6) /go_thd", "Kh�ng ng�i/OnCancel")
	else
		Talk(1, "", "Kh�ng bi�t bao gi� � ��y m�i c� m�t b�n t�u!")
	end
end;

function  OnCancel()
   Talk(1,"","Kh�ng ti�n kh�ng th� ng�i thuy�n! ")
end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(240);
	-- if (nRet == 1) then
	--	Msg2Player("�������ȥ�һ������˿���ࡣ�ðɣ�������ඣ�")
	if (nRet == -1) then
		Talk(1,"","Ph� �i thuy�n ��n ��o Hoa ��o "..AEXP_TICKET.."L��ng, ng��i c� �� kh�ng? ")
	end
end
---------------------------------------------------------------
