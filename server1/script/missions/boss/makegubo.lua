--�Ű�(566)������ÿ��17��05����225,1546,3278
function main()
	mapindex = SubWorldID2Idx(225)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 566
	bosslvl = 95
	posx = 1546*32
	posy = 3278*32
	AddNpcEx(bossid,bosslvl,0,mapindex,posx,posy,1, "C� B�ch", 1)
	AddGlobalNews("Nghe n�i Thi�n V��ng Bang ch� T� s� C� B�ch v� c�c ��u m�c c�a Thi�n Nh�n Gi�o �� xu�t hi�n t�i M� Cung sa m�c (193, 204) ��n Ho�ng. ")
end; 