--Creator:yfeng
--Date:2004-9-6
--Comm:�ͻ���������ʾ��Ϣ

STRTAB_LEVELUP={
	[2]="<#> Ch�c m�ng b�n �� l�n c�p 2, b�n �� c� th� �i t�m V� s� �� h�c Khinh c�ng",
	[5]="<#> Ch�c m�ng b�n �� l�n ��n c�p 5! B�n �� c� th� �i xem th� gi�i b�n ngo�i r�i!.",
	[10]="<#> Ch�c m�ng b�n �� l�n ��n c�p 10! B�n �� c� th� gia nh�p m�n ph�i, PK v�i ng��i kh�c, tham gia b�t c� ho�t ��ng n�o c�a V� l�m!",
	[20]="<#> Ch�c m�ng b�n �� l�n ��n c�p 20! B�y gi� b�n �� c� th� t�m ng��i t�m ��u � h�p �� k�t b�n tr�m n�m, ho�c ti�p t�c con ���ng giang h� c�a m�nh",
	[30]="<#> Ch�c m�ng b�n �� l�n ��n c�p 30!H�y quay v� m�n ph�i, c� r�t nhi�u nhi�m v� tr�ng ch� b�n!",
	[40]="<#> Ch�c m�ng b�n �� l�n ��n c�p 40! B�n �� c� th�  tham gia chi�n tr��ng T�ng  Kim. ��ng qu�n quay v� m�n ph�i, c� r�t nhi�u nhi�m v� tr�ng ch� b�n!",
	[50]="<#> Ch�c m�ng b�n �� l�n ��n c�p 50! B�n �� c� th� �i ��o T�y T�y, n�i �� b�n c� v� s� l�n th� nghi�m hi�u qu� t�y �i�m c�a m�nh/ ho�c ��n ��o hoa ��o �� th��ng ch�? ch�o L�p B�t t�ng kinh nghi�m! C�c thuy�n phu v� Xa phu ��u c� th� ��a b�n �i! Nh� v� m�n ph�i l�m nhi�m v�u xu�t s� �� h�c ���c tuy�t k� tr�n ph�i",
	[60]="<#> B�n c� th� nh�n nhi�m v� H�i s�, ho�n th�nh s� h�c ���c tuy�t h�c tr�n ph�i! ",
}

function main(lvl)
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	if ( GetLevel() == 30 ) then
		if ( Uworld1001 == 60 ) and ( Uworld1002 == 60 ) and ( Uworld1003 == 108) then
			nt_setTask(1001,80)
			nt_setTask(1002,80)
			nt_setTask(1003,109)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� ch�nh, trung, t� c�p 30.")
		elseif ( Uworld1001 == 60 ) and ( Uworld1002 == 60 )  then
			nt_setTask(1001,80)
			nt_setTask(1002,80)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� ch�nh ph�i, trung l�p c�p 30.")
		elseif ( Uworld1001 == 60 ) and ( Uworld1003 == 108)  then
			nt_setTask(1001,80)
			nt_setTask(1003,109)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� ch�nh ph�i, t� ph�i c�p 30 ")
		elseif ( Uworld1002 == 60 ) and ( Uworld1003 == 108)  then
			nt_setTask(1002,80)
			nt_setTask(1003,109)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� trung l�p, t� ph�i c�p 30.")
		elseif ( Uworld1001 == 60 ) then
			nt_setTask(1001,80)
			SendTaskOrder("B�n nh�n ���c nhi�m v� ch�nh ph�i c�p 30.")
		elseif ( Uworld1002 == 60 ) then
			nt_setTask(1002,80)
			SendTaskOrder("B�n nh�n ���c nhi�m v� trung l�p c�p 30.")
		elseif ( Uworld1003 == 108) then
			nt_setTask(1003,109)
			SendTaskOrder("B�n nh�n ���c nhi�m v� t� ph�i c�p 30.")
		end
	elseif ( GetLevel() == 40 ) then
		if ( Uworld1001 == 130 ) and ( Uworld1002 == 110 ) and ( Uworld1003 == 208 ) then
			nt_setTask(1001,150)
			nt_setTask(1002,130)
			nt_setTask(1003,209)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� ch�nh, trung, t� c�p 40")
		elseif ( Uworld1001 == 130 ) and ( Uworld1002 == 110 )  then
			nt_setTask(1001,150)
			nt_setTask(1002,130)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� ch�nh, trung c�p 40.")
		elseif ( Uworld1001 == 130 ) and ( Uworld1003 == 208 )  then
			nt_setTask(1001,150)
			nt_setTask(1003,209)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� ch�nh, t�  c�p 40")
		elseif ( Uworld1002 == 110 ) and ( Uworld1003 == 208 )  then
			nt_setTask(1002,130)
			nt_setTask(1003,209)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� trung, t� c�p 40.")
		elseif ( Uworld1001 == 130 ) then
			nt_setTask(1001,150)
			SendTaskOrder("B�n nh�n d��c nhi�m v� ch�nh ph�i c�p 40.")
		elseif ( Uworld1002 == 110 ) then
			nt_setTask(1002,130)
			SendTaskOrder("B�n nh�n ���c nhi�m v� trung l�p c�p 40.")
		elseif ( Uworld1003 == 208 ) then
			nt_setTask(1003,209)
			SendTaskOrder("B�n nh�n ���c nhi�m v� t� ph�i c�p 40.")
		end
	elseif ( GetLevel() == 50 ) then
		if ( Uworld1001 == 200 ) and ( Uworld1002 == 180 ) and ( Uworld1003 == 328) then
			nt_setTask(1001,220)
			nt_setTask(1002,200)
			nt_setTask(1003,329)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� ch�nh, trung, t� c�p 50")
		elseif ( Uworld1001 == 200 ) and ( Uworld1002 == 180 )  then
			nt_setTask(1001,220)
			nt_setTask(1002,200)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� ch�nh ph�i, trung l�p  c�p 50")
		elseif ( Uworld1001 == 200 ) and ( Uworld1003 == 328 )  then
			nt_setTask(1001,220)
			nt_setTask(1003,329)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� ch�nh ph�i, t� ph�i c�p 50")
		elseif ( Uworld1002 == 180 ) and ( Uworld1003 == 328 )  then
			nt_setTask(1002,200)
			nt_setTask(1003,329)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� trung l�p, t� ph�i c�p 50")
		elseif ( Uworld1001 == 200 ) then
			nt_setTask(1001,220)
			SendTaskOrder("B�n nh�n ���c nhi�m v� ch�nh ph�i c�p 50")
		elseif ( Uworld1002 == 180 ) then
			nt_setTask(1002,200)
			SendTaskOrder("B�n nh�n ���c nhi�m v� trung l�p c�p 50")
		elseif ( Uworld1003 == 328 ) then
			nt_setTask(1003,329)
			SendTaskOrder("B�n nh�n ���c nhi�m v� t� ph�i c�p 50")
		end
	elseif ( GetLevel() == 60 ) then
		if ( Uworld1001 == 270 ) and ( Uworld1002 == 240 ) and ( Uworld1003 == 408 ) then
			nt_setTask(1001,290)
			nt_setTask(1002,260)
			nt_setTask(1003,409)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� ch�nh, trung, t� c�p 50")
		elseif ( Uworld1001 == 270 ) and ( Uworld1002 == 240 )  then
			nt_setTask(1001,290)
			nt_setTask(1002,260)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� ch�nh ph�i, trung l�p  c�p 50")
		elseif ( Uworld1001 == 270 ) and ( Uworld1003 == 408 )  then
			nt_setTask(1001,290)
			nt_setTask(1003,409)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� ch�nh ph�i, t� ph�i c�p 50")
		elseif ( Uworld1002 == 240 ) and ( Uworld1003 == 408 )  then
			nt_setTask(1002,260)
			nt_setTask(1003,409)
			SendTaskOrder("B�n ��ng th�i nh�n ���c nhi�m v� trung l�p, t� ph�i c�p 50")
		elseif ( Uworld1001 == 270 ) then
			nt_setTask(1001,290)
			SendTaskOrder("B�n nh�n ���c nhi�m v� ch�nh ph�i c�p 50")
		elseif ( Uworld1002 == 240 ) then
			nt_setTask(1002,260)
			SendTaskOrder("B�n nh�n ���c nhi�m v� trung l�p c�p 50")
		elseif ( Uworld1003 == 408 ) then
			nt_setTask(1003,409)
			SendTaskOrder("B�n nh�n ���c nhi�m v� t� ph�i c�p 50")
		end
	else
		return Msg2Player(STRTAB_LEVELUP[lvl])
	end
end
