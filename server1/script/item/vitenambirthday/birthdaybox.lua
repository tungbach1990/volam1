tbSHENGRILIHE_GIFT = {
			{ "<#> S�a t��i", 0.03, 975 },
			{ "<#> B�t tinh", 0.47, 976 },
			{ "<#> ���ng tinh", 0.47, 977 },
			{ "<#> Tr�ng g�", 0.03, 978 },
}

function main()
	local base = 0;
	local sum = 0;
	local gift_index = 0;
	for i = 1, getn( tbSHENGRILIHE_GIFT ) do
		base = base + tbSHENGRILIHE_GIFT[i][2] * 100000;
	end
	local rannum = random(base);
	for i = 1, getn(tbSHENGRILIHE_GIFT) do
		sum = tbSHENGRILIHE_GIFT[i][2] * 100000 + sum
		if ( sum >= rannum ) then
			gift_index = i;
			break
		end;
	end;
	if ( gift_index ~= 0 ) then
		AddEventItem(tbSHENGRILIHE_GIFT[gift_index][3])
		Msg2Player("<#> B�n nh�n ���c m�t c�i"..tbSHENGRILIHE_GIFT[gift_index][1])
		WriteLog(date("%y-%m-%d,%H:%M,").."ACCOUNT:"..GetAccount()..",NAME:"..GetName()..",use zhongqiu_lihe , get "..tbSHENGRILIHE_GIFT[gift_index][1])
	else
		Say("Sao kh�ng c� g� h�t v�y?", 0)
	end
end