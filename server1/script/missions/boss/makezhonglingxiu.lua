--������(567)������ÿ��00��05����224,1889,2973
function main()
	mapindex = SubWorldID2Idx(224)
	if (mapindex < 0 ) then
		return
	end;
	bossid = 567
	bosslvl = 95
	posx = 1889*32
	posy = 2973*32
	AddNpcEx(bossid,bosslvl,2,mapindex,posx,posy,1, "Chung Linh T� ", 1)
	AddGlobalNews("C� ng��i nh�n th�y Th�y Y�n m�n L� Hoa s� gi� Chung Linh T� t�i sa m�c ��n Ho�ng (236, 185) gi�t ch�t v� s� ng��i c�a Thi�n Nh�n Gi�o. ")
end; 