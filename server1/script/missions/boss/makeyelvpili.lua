--Ү�ɱ���(563)������ÿ��23��05����226,1724,3227
function main()
	mapindex = SubWorldID2Idx(226)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 563
	bosslvl = 95
	posx = 1724*32
	posy = 3227*32
	AddNpcEx(bossid,bosslvl,3,mapindex,posx,posy,1, "Gia Lu�t T� Ly", 1)
	AddGlobalNews("Nghe n�i H�u s� c�a Thi�n Nh�n Gi�o Gia Lu�t T� Ly �� xu�t hi�n � M� Cung sa m�c (215, 201) ��n Ho�ng. ")
end; 