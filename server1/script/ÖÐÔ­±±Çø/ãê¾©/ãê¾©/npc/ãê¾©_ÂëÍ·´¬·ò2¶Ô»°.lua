--��ԭ���� �꾩�� ��ͷ����2�Ի�
--suyu
--200306015

CurWharf = 3;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	--if (GetLevel() >= 50) then
	--	Say("H�m nay xu�i thuy�n ng��c d�ng, l�i g�p ph�i gi� l�n, xem ra kh�ng th� c� ch�o m�i nh� th� n�y. E r�ng ph�i l�n b� th�i, ng��i c� ch�u l�n kh�ng? ", 3, "Ng�i thuy�n/WharfFun", "Kh�ng ng�i/OnCancel", "�i ��o hoa ��o (4) /go_thd");
	--else
	--	Say("H�m nay xu�i thuy�n ng��c d�ng, l�i g�p ph�i gi� l�n, xem ra kh�ng th� c� ch�o m�i nh� th� n�y. E r�ng ph�i l�n b� th�i, ng��i c� ch�u l�n kh�ng? ", 2, "Ng�i thuy�n/WharfFun", "Kh�ng ng�i/OnCancel");		
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
