--��ԭ���� �꾩�� ��ͷ����1�Ի�
--suyu
--200306015

CurWharf = 3;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	--if (GetLevel() >= 50) then
	--	Say("S�ng Ho�ng H� u�n l��n ch�n kh�c, ch�ng t�i �� quen s�ng � ��y, bi�t ���c nh�ng ch� nguy hi�m. Kh�ng bi�t kh�ch nh�n mu�n �i ��n �o�n n�o? C� �i kh�ng? ", 3, "Ng�i thuy�n/WharfFun", "Kh�ng ng�i/OnCancel", "�i ��o hoa ��o (4) /go_thd");
	--else
	--	Say("S�ng Ho�ng H� u�n l��n ch�n kh�c, ch�ng t�i �� quen s�ng � ��y, bi�t ���c nh�ng ch� nguy hi�m. Kh�ng bi�t kh�ch nh�n mu�n �i ��n �o�n n�o? C� �i kh�ng? ", 2, "Ng�i thuy�n/WharfFun", "Kh�ng ng�i/OnCancel");
	--end

end;

---------------------------------------------------------------
function  OnCancel()

   Say("Kh�ng ti�n kh�ng th� l�n thuy�n! ",0)

end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(238);
	-- if (nRet == 1) then
	--	Msg2Player("�������ȥ�һ������˿���ࡣ�ðɣ�������ඣ�")
	if (nRet == -1) then
		Talk(1,"","Ph� �i thuy�n ��n ��o Hoa ��o "..AEXP_TICKET.."L��ng, ng��i c� �� kh�ng? ")
	end
end
---------------------------------------------------------------
