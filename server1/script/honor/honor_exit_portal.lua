
tbHonor_Sys_2009CP_STATION = {
	[1] = { 1, {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "Ph��ng T��ng Ph� " },
	[2] = {11, {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "Th�nh �� Ph� " },
	[3] = {37, {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "Bi�n Kinh Ph� " },
	[4] = {78, {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "T��ng D��ng Ph� " },
	[5] = {80, {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "D��ng Ch�u Ph� " },
	[6] = {162, {1669, 3129}, {1696, 3280}, {1472, 3273}, "��i L�" },
	[7] = {176, {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "L�m An Ph� " }
}
            
function main()
    local nIdx = random(2, getn(tbHonor_Sys_2009CP_STATION));
    local nPox = random(2, (getn(tbHonor_Sys_2009CP_STATION[nIdx]) - 1));
    
    NewWorld(tbHonor_Sys_2009CP_STATION[nIdx][1], tbHonor_Sys_2009CP_STATION[nIdx][nPox][1], tbHonor_Sys_2009CP_STATION[nIdx][nPox][2]);
end