--�������� ���� ������ͷ����Ի�
--suyu
--20031029

CurWharf = 9;
Include("\\script\\global\\station.lua")
Include("\\script\\missions\\autohang\\function.lua")
---------------------------------------------------------------
function main(sel)
	--if (GetLevel() >= 50) then
	--	Say("S�ng Ho�ng H� u�n l��n ch�n kh�c cong, em � v�ng bi�n anh tr�n n�i, c�ch nhau Th��ng S�n Nh� H�i, mu�n g�p c�ng kh�ng ���c.", 3, "Ng�i thuy�n/WharfFun", "Kh�ng ng�i/OnCancel", "�i ��o Hoa ��o (5) /go_thd")
	--else
	--	Say("S�ng Ho�ng H� u�n l��n ch�n kh�c cong, em � v�ng bi�n anh tr�n n�i, c�ch nhau Th��ng S�n Nh� H�i, mu�n g�p c�ng kh�ng ���c.", 2, "Ng�i thuy�n/WharfFun", "Kh�ng ng�i/OnCancel")
	--end
end;

function  OnCancel()
   Talk(1,"","Kh�ng ti�n kh�ng th� ng�i thuy�n! ")
end;

---------------------------------------------------------------
function go_thd()
	nRet = aexp_gotothd(239);
	-- if (nRet == 1) then
	--	Msg2Player("�������ȥ�һ������˿���ࡣ�ðɣ�������ඣ�")
	if (nRet == -1) then
		Talk(1,"","Ph� �i thuy�n ��n ��o Hoa ��o "..AEXP_TICKET.."L��ng, ng��i c� �� kh�ng? ")
	end
end
---------------------------------------------------------------
