--����ѩ��(564)������ÿ��21��05����227,1504,3144
function main()
	mapindex = SubWorldID2Idx(227)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 564
	bosslvl = 95
	posx = 1504*32
	posy = 3144*32
	AddNpcEx(bossid,bosslvl,3,mapindex,posx,posy,1, "Ho�n Nhan Tuy�t Y", 1)
	AddGlobalNews("Nghe n�i Th�t c�ng ch�a c�a Kim qu�c Ho�n Nhan Tuy�t Y �� truy �u�i theo �oan M�c Du� ��n M� Cung � sa m�c ��n Ho�ng c�a n��c T�y H� (188, 196) . ")
end; 