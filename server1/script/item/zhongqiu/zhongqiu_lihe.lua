tbZHONGQIULIHE_GIFT = {
			{ "<#> B�t m� ", 0.45, 520 },
			{ "<#> ���ng c�t", 0.45, 521 },
			{ "<#> B�t sen", 0.0435, 523 },
			{ "<#> ��u xanh", 0.04349, 524 },
			{ "<#> Tr�ng", 0.01, 522 },
			{ "<#> H�nh Nh�n", 0.002, 525 },
			{ "<#> ��u Ph�ng", 0.001, 526 },
			{ "<#> C�m D�a", 0.00001, 527 },
}

function main()
	local base = 0;
	local sum = 0;
	local gift_index = 0;
	for i = 1, getn( tbZHONGQIULIHE_GIFT ) do
		base = base + tbZHONGQIULIHE_GIFT[i][2] * 100000;
	end
	local rannum = random(base);
	for i = 1, getn(tbZHONGQIULIHE_GIFT) do
		sum = tbZHONGQIULIHE_GIFT[i][2] * 100000 + sum
		if ( sum >= rannum ) then
			gift_index = i;
			break
		end;
	end;
	if ( gift_index ~= 0 ) then
		AddEventItem(tbZHONGQIULIHE_GIFT[gift_index][3])
		Msg2Player("<#> B�n nh�n ���c m�t c�i"..tbZHONGQIULIHE_GIFT[gift_index][1])
		WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..",use zhongqiu_lihe , get "..tbZHONGQIULIHE_GIFT[gift_index][1])
	else
		Say("Sao kh�ng c� g� h�t v�y?", 0)
	end
end