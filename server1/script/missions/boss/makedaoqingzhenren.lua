--��������(562)������ÿ��20��05����224,1596,2978
function main()
	mapindex = SubWorldID2Idx(224)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 562
	bosslvl = 95
	posx = 1596*32
	posy = 2978*32
	AddNpcEx(bossid,bosslvl,4,mapindex,posx,posy,1, "��o Thanh Ch�n Nh�n", 1)
	AddGlobalNews("Nghe n�i ��o Thanh Ch�n Nh�n � ��n Ho�ng sa m�c l� ng��i (199, 186) tr� gian di�t �c ")
end; 