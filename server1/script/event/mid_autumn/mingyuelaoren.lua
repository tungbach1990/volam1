--�������˶Ի�
--�±�����Ӧ��Ʒ
--mingyuelaoren.lua
--2005-09-07


tbCAKE2GIFT = {
		[891] = { "<#> B�nh trung thu nh�n ��u ", "<#> 1 Ti�n Th�o l� ",			{ 6, 1, 71, 1, 0, 0, 0 } },
		[893] = { "<#> B�nh Trung Thu ��u Tr�ng", "<#> 1 Ph�c Duy�n l� (��i) ",		{ 6, 1, 124, 1, 0, 0, 0 } },
		[895] = { "<#> B�nh Trung thu H�nh nh�n", "<#> Th�n B� ��i H�ng Bao",			{ 6, 1, 402, 1, 0, 0, 0 } },
		[896] = { "<#> B�nh trung thu th�p c�m ", "shijin_ex_goldequip()" }
}

tbSHIJIN2GOLDEQUIP = {
		{ "<#> �� ph� Ho�ng Kim - ��nh Qu�c Thanh Sa Tr��ng Sam", { 0, 159 }, 0.12 },
		{ "<#> �� ph� Ho�ng Kim - ��nh Qu�c � Sa Ph�t Qu�n", { 0, 160 }, 0.12 },
		{ "<#> �� ph� Ho�ng Kim - ��nh Qu�c X�ch Quy�n Nhuy�n Ngoa", { 0, 161 }, 0.12 },
		{ "<#> �� ph� Ho�ng Kim - ��nh Qu�c T� ��ng H� uy�n", { 0, 162 }, 0.12 },
		{ "<#> �� ph� Ho�ng Kim - ��nh Qu�c Ng�n T�m Y�u ��i", { 0, 163 }, 0.12 },
		{ "<#> �� ph� Ho�ng Kim - An Bang B�ng Tinh Th�ch H�ng Li�n", { 0, 164 }, 0.1 },
		{ "<#> �� ph� Ho�ng Kim - An Bang C�c Hoa Th�ch Ch� ho�n", { 0, 165 }, 0.1 },
		{ "<#> �� ph� Ho�ng Kim - An Bang �i�n Ho�ng Th�ch Ng�c B�i", { 0, 166 }, 0.1 },
		{ "<#> �� ph� Ho�ng Kim - An Bang K� Huy�t Th�ch Gi�i Ch� ", { 0, 167 }, 0.1 },
}

function main()
	local tbOpp = {
				"<#> ��y l� B�nh trung thu nh�n ��u, xin m�i d�ng th�!/#cake_ex_gift(891)",
				"<#> ��y l� b�nh trung thu ��u tr�ng, xin m�i d�ng th�!/#cake_ex_gift(893)",
				"<#> ��y l� B�nh Trung thu H�nh nh�n, xin m�i d�ng th�!/#cake_ex_gift(895)",
				"<#> ��y l� b�nh trung thu th�p c�m, xin m�i d�ng th�!/#cake_ex_gift(896)",
				"<#> Kh�ng c� g�! Ta ch� ��n th�m l�o th�i!/OnCancel",
	}
	Say("<#> Tay ngh� l�m b�nh c�a c�c v� s� ph� � ��y ��u v�o h�ng th��ng th�a. M�i n�m ta ��u tr�ng ��i d�p trung thu n�y. B�n tr� c� chuy�n g� kh�ng?", getn(tbOpp), tbOpp )
end

function OnCancel()
end

function cake_ex_gift(dtype)
	local count = CalcEquiproomItemCount( 6, 1, dtype, -1 )
	if ( count <= 0 ) then
		Say("<#> B�n tr�! B�nh trung thu c�a ng��i ��u? ��nh tr�u ch�c gi� n�y �?", 1, "<#> Xin l�i! Ta sai r�i!/OnCancel" )
		return
	end
	Say("<#> A! X�a gi� ta ch�a bao gi� ���c �n b�nh ngon nh� v�y! ��y l� ch�t th�nh �! C� b�nh ngon nh� quay l�i t�ng cho ta nh�!", 1, "Nh�n l� ph�m!/#take_ex_gift("..dtype..")")

end

function take_ex_gift(dtype)
	local dpass = ConsumeEquiproomItem(1, 6, 1, dtype, -1)
	if ( dpass ~= 1 ) then
		print("delete item cake error dtype = "..dtype)
		return
	end
	Msg2Player("<#> B�n m�t 1 "..tbCAKE2GIFT[dtype][1])
	
	if ( dtype == 896 ) then
		shijin_ex_goldequip()
	else
		AddItem(tbCAKE2GIFT[dtype][3][1], tbCAKE2GIFT[dtype][3][2], tbCAKE2GIFT[dtype][3][3], tbCAKE2GIFT[dtype][3][4], tbCAKE2GIFT[dtype][3][5], tbCAKE2GIFT[dtype][3][6], tbCAKE2GIFT[dtype][3][7] )
		Msg2Player("<#> B�n nh�n ���c "..tbCAKE2GIFT[dtype][2])
		WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..", give "..tbCAKE2GIFT[dtype][1].." in exchange for "..tbCAKE2GIFT[dtype][2])
	end
end

function shijin_ex_goldequip()
	local base = 0
	for i = 1, getn( tbSHIJIN2GOLDEQUIP ) do
		base = base + tbSHIJIN2GOLDEQUIP[ i ][ 3 ]
	end
	base = 100 * base
	
	local sum = 0
	local num = random(1, base)

	for i = 1, getn( tbSHIJIN2GOLDEQUIP ) do
		sum = sum + tbSHIJIN2GOLDEQUIP[i][3] * 100
		if( sum >= num ) then
			AddGoldItem( tbSHIJIN2GOLDEQUIP[i][2][1], tbSHIJIN2GOLDEQUIP[i][2][2] )
			Msg2Player("<#> B�n nh�n ���c 1 b� "..tbSHIJIN2GOLDEQUIP[i][1])
			WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..", give "..tbCAKE2GIFT[896][1].." in exchange for "..tbSHIJIN2GOLDEQUIP[i][1])
			break
		end
	end
end