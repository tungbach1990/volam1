Include([[\script\event\springfestival07\head.lua]]);

tab_goods = {
{"Ph�o ti�u",	1351	,	80	,},
{"Ph�o trung",	1352	,	96	,},
{"Ph�o ��i",	1353	,	100	,},
};
function main()
	if (sf07_isactive() == 0) then
		Say("V�t ph�m n�y �� h�t h�n", 0);
		return 1;
	end;
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>Ch� c� ng��i ch�i c�p tr�n 50 �� n�p th�<color> m�i c� th� s� d�ng bao l� x�.", 0);
		return 1;
	end;
	if (CalcFreeItemCellCount() == 0) then
		Say("Xin h�y s�p x�p l�i h�nh trang tr��c ��!", 0);
		return 1;
	end;
	local nSeed = random(1, 100);
	for i = 1, getn(tab_goods) do
		if (tab_goods[i][3] >= nSeed) then
			AddItem(6, 1, tab_goods[i][2], 1,0,0,0);
			Msg2Player("B�n �� m� 1 bao l� x�, nh�n ���c 1 <color=yellow>"..tab_goods[i][1].."<color>.");
			break;
		end;
	end;
end;