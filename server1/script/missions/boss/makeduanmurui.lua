--��ľ�(565)������ÿ��22��05����227,1630,3276
function main()
	mapindex = SubWorldID2Idx(227)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 565
	bosslvl = 95
	posx = 1630*32
	posy = 3276*32
	AddNpcEx(bossid,bosslvl,3,mapindex,posx,posy,1, "�oan M�c Du� ", 1)
	AddGlobalNews("C� ng��i nh�n th�y �oan M�c Du� �� xu�t hi�n b� �n � m� cung (203, 204) sa m�c ��n Ho�ng. ")
end; 