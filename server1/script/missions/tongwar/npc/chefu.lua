
function main(sel)
--	DisabledUseTownP(0)	--�ָ���ʹ�ûسǷ�
	Say("Nh�ng ng��i xa phu chi�n tr��ng ch�ng t�i v�o sinh ra t�, ki�m ti�n b�ng sinh m�ng m�nh! Xin gi�p cho v�i l��ng b�c!",
		8, "Ph��ng T��ng Ph� /#cp_station(1)", "Th�nh �� Ph� /#cp_station(11)", "��i L�/#cp_station(162)", "Bi�n Kinh Ph� /#cp_station(37)", "T��ng D��ng Ph� /#cp_station(78)", "D��ng Ch�u Ph� /#cp_station(80)", "L�m An Ph� /#cp_station(176)", "��u c�ng kh�ng mu�n �i!/OnCancel")
end;

tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "Ph��ng T��ng Ph� " },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "Th�nh �� Ph� " },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "Bi�n Kinh Ph� " },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "T��ng D��ng Ph� " },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "D��ng Ch�u Ph� " },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "��i L�" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "L�m An Ph� " }
}


function cp_station(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end
	local count = getn(tbCP_STATION[stationname]) - 1
	local randnum = random(count)
	SetLogoutRV(0)
	Msg2Player("Ng�i y�n ch�a? Ch�ng ta �i "..tbCP_STATION[stationname][count+1])
	NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
end

function OnCancel()
end