-- �ٰ���·�ˡ��ƹ�
-- by��Dan_Deng(2003-09-16)
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main()
	i = random(0,6)
	Uworld1059 = nt_getTask(1059)
	if ( Uworld1059 ~= 0 ) then
		branch_zuihan()
	else
		if (i == 0) then
			Talk(1,"","T�u qu� ta t�m nguy�n l�n nh�t l� ���c u�ng t�t c� r��u ngon c�a thi�n h�,ch� c�n ��t ���c t�m nguy�n n�y c� ch�t c�ng cam l�ng. ")
		elseif (i == 1) then
			Talk(1,"","R��u Giang T�, r��u L�m An, T�y H� �� nh�t t�u, Thanh xuy�n H�ng l�c t�u, C�u Ch�u nh�t d� t�u...t�t c� ta �� ��u n�m qua nh�ng v�n ch�a x�ng l� �� nh�t t�u ")
		elseif (i == 2) then
			Talk(1,"","R��u Giang T�, r��u L�m An, T�y H� �� nh�t t�u, Thanh xuy�n H�ng l�c t�u, C�u Ch�u nh�t d� t�u...t�t c� ta �� ��u n�m qua nh�ng v�n ch�a x�ng l� �� nh�t t�u ")
		elseif (i == 3) then
			Talk(1,"","R��u Giang T�, r��u L�m An, T�y H� �� nh�t t�u, Thanh xuy�n H�ng l�c t�u, C�u Ch�u nh�t d� t�u...t�t c� ta �� ��u n�m qua nh�ng v�n ch�a x�ng l� �� nh�t t�u ")
		elseif (i == 4) then
			Talk(1,"","R��u Giang T�, r��u L�m An, T�y H� �� nh�t t�u, Thanh xuy�n H�ng l�c t�u, C�u Ch�u nh�t d� t�u...t�t c� ta �� ��u n�m qua nh�ng v�n ch�a x�ng l� �� nh�t t�u ")
		elseif (i == 5) then
			Talk(1,"","R��u T�n Ngh�a th� ��ng, r��u L�ng Thanh th� chua, nh�ng h��ng th�m th� kh�ng th� ch� ���c gi�ng nh� c� tr�m lo�i c� th�m v�y. B�t k� l� nam ph� l�o �u ch� c�n nghe m�i h��ng n�y l� bi�t ngay T�n L�ng t�u. Nh�ng k� b� t� t�i ���c u�ng m�t v� tr��c khi b� ch�m ��u k� c�ng th�a l�ng ")
		else
			Talk(1,"","C�n ph�i bi�t! C�nh gi�i c�a m� t�u c�ng ch� cao nh� nh�n sinh v�y. �i ch�, c� n�i ra ng��i c�ng kh�ng hi�u! ")
		end
	end
end;
