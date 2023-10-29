--	��ᳵ��ű�
--	lixin 2005-12-27
Include("\\script\\global\\station.lua")
Include([[\script\tong\workshop\tongcolltask.lua]]);

function main()
	local tabContent = {"Nh�ng n�i �� �i qua/WayPointFun", "Nh�ng th�nh th� �� �i qua/want2station"};
	if (GetMapType(SubWorld) == 1 and GetTask(TASK_LP_COUNT) ~= 0)then
		local nTongID = GetMapParam(SubWorld, 0)
		if (nTongID ~= 0)then
			local _,b = GetTongName()
			if (b ~= nTongID and TONG_GetTongMapBan(nTongID) == 1)then
				tinsert(tabContent, "Qu� bang �� m� c�m ��a bang h�i, phi�n chuy�n l�i ��n "..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."Ph��ng t�ng qu�n gi�p ta/chuanhua");
			end
		end
	end

	tinsert(tabContent, "��u c�ng kh�ng mu�n �i!/OnCancel");
	Say("<#>Xa phu: ��i hi�p mu�n �i ��u?", getn(tabContent), tabContent)
	
end;

function chuanhua()
	Say("B�n bang"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."T�ng qu�n �ang b�n qu� n�n c�n d�n ta chuy�n l�i ��n ��i hi�p, ��i hi�p mu�n h�i g�?", 2, "H�i tin t�c/#rwlp_dedaojianshu(1, 1)", "R�i kh�i/OnCancel")
end;

function want2station()
	Say("<#>��i hi�p mu�n �i ��u: ",8, "Ph��ng T��ng [800 l��ng]/#wlls_want2go(1)", "Th�nh �� [800 l��ng]/#wlls_want2go(11)", "��i L� [800 l��ng]/#wlls_want2go(162)", "Bi�n Kinh [800 l��ng]/#wlls_want2go(37)", "T��ng D��ng [800 l��ng]/#wlls_want2go(78)", "D��ng Ch�u [800 l��ng]/#wlls_want2go(80)", "L�m An [800 l��ng]/#wlls_want2go(176)", "��u c�ng kh�ng mu�n �i!/OnCancel")
end

tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "Ph��ng T��ng Ph� " },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "Th�nh �� Ph� " },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "Bi�n Kinh Ph� " },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "T��ng D��ng Ph� " },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "D��ng Ch�u Ph� " },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "��i L�" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "L�m An Ph� " }
}

function wlls_want2go(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end
	if(GetCash() < 800) then
		Say("Xa phu: T� bang h�i ��n c�c ��i th�nh th� c�n c�n 800 l��ng, kh�ng mang theo l� ph� sao?",0)
	else
		local count = getn(tbCP_STATION[stationname]) - 1
		local randnum = random(count)
		Msg2Player("Ng�i y�n ch�a? Ch�ng ta �i "..tbCP_STATION[stationname][count+1])
		NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
		SetFightState(0)
		SetPunish(1)
		DisabledUseTownP(0)
		SetRevPos(GetPlayerRev())
		Pay(800)
	end
end
