--������(582)������ÿ��21��31����181,1636,3073
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
	AddGlobalNews("Nghe n�i Ng� ��c Gi�o Ch� H�c Di�n Lang Qu�n v� n� Lam Y Y �ang luy�n c�ng trong (204, 191) L��ng Th�y ��ng. ")
end; 