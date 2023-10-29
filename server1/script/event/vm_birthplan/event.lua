function vm_BirthPlan()
	Say("<#> Ch�o m�ng 'V� L�m Truy�n K�' tr�n m�t tu�i, t� 11/6/2006 ��n 18/6 c�c hi�p kh�ch luy�n c�ng s� nh�n ���c nhi�u qu� th��ng th� v�! H�y nhanh ch�n l�n!", 3,
	"<#> L�m b�nh sinh nh�t./vm_birth_wantcake1",
	"<#> L�m b�nh sinh nh�t th��ng h�n./vm_birth_wantcake2",
	"<#> Ta ch� ��n ch�i th�i!/OnCancel")
end

function vm_birth_wantcake1()
	Say("<#> L�m b�nh sinh nh�t c�n <color=yellow>5 b�t tinh v� 5 ���ng tinh<color>. L�m ngay ch�?", 2,
	"<#> ��ng! Xin s� ph� tr� t�i!/vm_birth_makecake1",
	"<#> L�t n�a s� quay l�i!/OnCancel")
end

function vm_birth_makecake1()
	local nCount_flour = CalcEquiproomItemCount(4, 976, 1, 1)
	local nCount_sugar = CalcEquiproomItemCount(4, 977, 1, 1)
	if (nCount_flour >= 5 and nCount_sugar >= 5 and ConsumeEquiproomItem(5, 4, 976, 1, -1) == 1 and ConsumeEquiproomItem(5, 4, 977, 1, -1) == 1) then
		AddItem(6,1,1100,1,1,1)--���յ���
		Say("<#> B�nh sinh nh�t �� l�m xong! H�y mang �i chung vui v�i m�i ng��i!", 0)
		WriteLog(GetLocalDate("%Y%m%d").."\t sinh nh�t V� l�m Truy�n K� \t"..GetName().."\t"..GetAccount().."\t L�m b�nh sinh nh�t.")
	else
		Say("<#> L�m b�nh sinh nh�t c�n <color=yellow>5 b�t tinh v� 5 ���ng tinh<color>, c� �� nguy�n li�u l�i ��n nh�!", 0)
	end
end

function vm_birth_wantcake2()
	Say("<#> L�m b�nh sinh nh�t th��ng h�n c�n <color=yellow>5 b�t tinh, 5 ���ng tinh, 2 s�a t��i v� 2 tr�ng g�<color>. L�m ngay ch�?", 2,
	"<#> ��ng! Xin s� ph� tr� t�i!/vm_birth_makecake2",
	"<#> L�t n�a s� quay l�i!/OnCancel")
end

function vm_birth_makecake2()
	local nCount_flour = CalcEquiproomItemCount(4, 976, 1, 1)
	local nCount_sugar = CalcEquiproomItemCount(4, 977, 1, 1)
	local nCount_egg = CalcEquiproomItemCount(4, 978, 1, 1)
	local nCount_milk = CalcEquiproomItemCount(4, 975, 1, 1)
	if (nCount_flour >= 5 and nCount_sugar >= 5 and nCount_egg >= 2 and nCount_milk >= 2) then
		ConsumeEquiproomItem(2, 4, 978, 1, -1)
		ConsumeEquiproomItem(2, 4, 975, 1, -1)
		ConsumeEquiproomItem(5, 4, 976, 1, -1)
		ConsumeEquiproomItem(5, 4, 977, 1, -1)
		AddItem(6,1,1101,1,1,1)--�߼�����
		Say("<#> B�nh sinh nh�t �� l�m xong! H�y mang �i chung vui v�i m�i ng��i!", 0)
		WriteLog(GetLocalDate("%Y%m%d").."\t sinh nh�t V� l�m Truy�n K� \t"..GetName().."\t"..GetAccount().."\t L�m b�nh sinh nh�t th��ng h�n")
	else
		Say("<#> L�m b�nh sinh nh�t th��ng h�n c�n <color=yellow>5 b�t tinh, 5 ���ng tinh, 2 s�a t��i v� 2 tr�ng g�<color>, c� �� nguy�n li�u l�i ��n nh�!", 0)
	end
end