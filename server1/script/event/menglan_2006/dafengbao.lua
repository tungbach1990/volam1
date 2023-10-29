
tab_goods = {
	{"Lam Th�y Tinh",	0.005, 4,	238},
	{"T� Th�y Tinh",	0.005, 4,	239},
	{"L�c Th�y Tinh",	0.005, 4,	240},
	{"Ti�n Th�o L� ",	0.65, 6,	1,	71},
	{"Phi Phong",	0.01, 6,	1,	15},
	{"V� L�m M�t T�ch",	0.001, 6,	1,	26},
	{"T�y T�y Kinh",	0.001, 6,	1,	22},
	{"Thi�t La H�n",	0.01, 6,	1,	23},
	{"Thi�n s�n  B�o L� ",	0.15, 6,	1,	72},
	{"Bao D��c ho�n ",	0.1626, 6,	1,	910},
	{"An Bang B�ng Tinh Th�ch H�ng Li�n",	0.0001, 164},
	{"An Bang C�c Hoa Th�ch Ch� ho�n",	0.0001, 165},
	{"An Bang �i�n Ho�ng Th�ch Ng�c B�i",	0.0001, 166},
	{"An Bang K� Huy�t Th�ch Gi�i Ch� ",	0.0001, 167}
}

function main(nItem)
	local nSeed = random(1, 10000);
	
	local nIdx = 1;
	local nTotal = 0;
	for i = 1, getn(tab_goods) do
		nTotal = nTotal + tab_goods[i][2] * 10000;
		if (nSeed <= nTotal) then
			nIdx = i;
			break
		end;
	end;
	if (nIdx < 4) then
		AddEventItem(tab_goods[nIdx][4]);
	elseif (nIdx < 11) then
		AddItem(6, 1, tab_goods[nIdx][5], 1, 0, 0, 0);
	else
		AddGoldItem(0, tab_goods[nIdx][3]);
	end;
	if (nIdx < 4 or (nIdx >= 6 and nIdx <= 8) or nIdx >= 11) then
		WriteLog(date("%Y-%m-%d-%H:%M")..", Ng��i ch�i ["..GetName().."] M� bao l� x�, nh�n ���c "..tab_goods[nIdx][1]..".");
		AddGlobalNews("Ng��i ch�i ["..GetName().."] M� bao l� x�, nh�n ���c "..tab_goods[nIdx][1]..".");
	end;
	Msg2Player("B�n nh�n ���c <color=yellow>"..tab_goods[nIdx][1].."<color>");
end;
