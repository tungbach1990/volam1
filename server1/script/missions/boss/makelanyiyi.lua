--蓝伊伊(582)，生于每天21：31，在181,1636,3073
function main()
	mapindex = SubWorldID2Idx(181)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 582
	bosslvl = 95
	posx = 1636*32
	posy = 3073*32
	AddNpc(bossid,bosslvl,mapindex,posx,posy,1, "Lam Y Y", 1)
	AddGlobalNews("Nghe n鉯 Ng� чc Gi竜 Ch� H綾 Di謓 Lang Qu﹏ v� n� Lam Y Y 產ng luy謓 c玭g trong (204, 191) Lng Th駓 ng. ")
end; 