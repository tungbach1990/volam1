--�ϲ���(583)������ÿ��22��31����204,1626,3379
function main()
	mapindex = SubWorldID2Idx(204)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 583
	bosslvl = 95
	posx = 1626*32
	posy = 3379*32
	AddNpc(bossid,bosslvl,mapindex,posx,posy,1, "M�nh Th��ng L��ng", 1)
	AddGlobalNews("C� ng��i nh�n th�y C�i bang Ch�p ph�p ch��ng l�o M�nh Th��ng L��ng t�i Phi thi�n ��ng (202, 210) �ang truy s�t ph�n �� M�nh Vi�n T�i ")
end; 