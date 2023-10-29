Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\newyear_2009\\head.lua");

tb_wangshenghongbao_award	=
{
	{szName="1 danh v�ng", 			nRepute = 1, 		nRate = 25},
	{szName="2 danh v�ng", 			nRepute = 2, 		nRate = 20},
	{szName="3 danh v�ng", 			nRepute = 3, 		nRate = 15},
	{szName="10 danh v�ng",			nRepute = 10, 		nRate = 3},
	{szName="50 danh v�ng",		 	nRepute = 50, 		nRate = 0.1},
	{szName="Huy�n tinh kho�ng th�ch c�p 3", 		tbProp={6, 1, 147, 3, 0, 0}, 	nRate = 5},
	{szName="Huy�n Tinh Kho�ng Th�ch c�p 4", 		tbProp={6, 1, 147, 4, 0, 0},	nRate = 3},
	{szName="Huy�n Tinh Kho�ng Th�ch c�p 5", 		tbProp={6, 1, 147, 5, 0, 0},	nRate = 2},
	{szName="T�m T�m T��ng �nh ph� ",		tbProp={6, 1, 18,  1, 0, 0},	nRate = 3},
	{szName="Phi T�c ho�n",			tbProp={6, 0, 6,   1, 0, 0}, 	nRate = 5},
	{szName="��i L�c ho�n",			tbProp={6, 0, 3,   1, 0, 0}, 	nRate = 5},
	{szName="V� L�m M�t T�ch", 		tbProp={6, 1, 26, 1, 0, 0},	 	nRate = 0.1},
	{szName="T�y T�y Kinh", 			tbProp={6, 1, 22, 1, 0, 0}, 	nRate = 0.1},
	{szName="B�n Nh��c T�m Kinh", 		tbProp={6, 1, 12, 1, 0, 0}, 	nRate = 1},
	{szName="Thi�t La H�n", 			tbProp={6, 1, 23, 1, 0, 0}, 	nRate = 3},
	{szName="Th�n b� ��i H�ng Bao", 		tbProp={6, 1, 402,1, 0, 0}, 	nRate = 7.779},
	{szName="��nh Qu�c � Sa Ph�t Qu�n", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.008},
	{szName="��nh Qu�c Thanh Sa Tr��ng Sam", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.01},
	{szName="��nh Qu�c Ng�n T�m Y�u ��i", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 0.1},
	{szName="��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.015},
	{szName="��nh Qu�c T� ��ng H� uy�n", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 0.2},
	{szName="Nhu T�nh C�n Qu�c Ngh� Th��ng", 	tbProp={0, 190}, 	nQuality = 1,	nRate = 0.008},
	{szName="Nhu T�nh  Tu� T�m Ng�c B�i", 	tbProp={0, 193}, 	nQuality = 1,	nRate = 0.07},
	{szName="Nhu T�nh  Ph�ng Nghi Gi�i Ch� ", 	tbProp={0, 192}, 	nQuality = 1,	nRate = 0.3},
	{szName="Nhu T�nh Th�c N� H�ng Li�n", 	tbProp={0, 191}, 	nQuality = 1,	nRate = 0.4},
	{szName="Hi�p C�t T�nh � K�t", 	tbProp={0, 189}, 	nQuality = 1,	nRate = 0.01},
	{szName="Hi�p C�t Thi�t Huy�t Sam", 	tbProp={0, 186}, 	nQuality = 1,	nRate = 0.1},
	{szName="Hi�p C�t �an T�m Gi�i", 	tbProp={0, 188}, 	nQuality = 1,	nRate = 0.3},
	{szName="Hi�p C�t �a T�nh Ho�n", 	tbProp={0, 187}, 	nQuality = 1,	nRate = 0.4},
};

tb_tree_itemid	=
{
	[1]	= 1917,
	[2]	= 1918,
};

tb_openhongbao_mapid	=
{
	[11]	= 1,
	[1] 	= 1,
	[37] 	= 1,
	[176] 	= 1,
	[162] 	= 1,
	[78] 	= 1,
	[80] 	= 1,
	[174] 	= 1,
	[121] 	= 1,
	[153] 	= 1,
	[101] 	= 1,
	[99] 	= 1,
	[100] 	= 1,
	[20]	= 1,
	[53] 	= 1,
	[54] 	= 1,
	[175] 	= 1,
	[55] 	= 1,
};

function main()
	newyear0901_resettask();
	
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= newyear0901_lazhu_expiredtime) then
		Msg2Player("V�t ph�m n�y �� qu� h�n.");
		return 0;
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("��i hi�p v�n ch�a �� c�p 50 ho�c v�n ch�a n�p th�, v� v�y kh�ng th� s� d�ng Th�nh V��ng H�ng Bao.", 0);
		return 1;
	end
	
	local subworld, x, y	= GetWorldPos();
	if (tb_openhongbao_mapid[subworld] == nil) then
		Say("Th�nh V��ng H�ng Bao ch� s� d�ng t�i th�nh th� v� th�n tr�n.", 0);
		return 1;
	end
	
	if (CalcFreeItemCellCount() < 20) then
		Say("H�nh trang c�a ��i hi�p �� ��y!", 0);
		return 1;
	end
	
	if (100 + GetTask(newyear0901_TSK_GetExp_Hongbao) <= GetTask(newyear0901_TSK_GetExpUpLimit))	then
		SetTask(newyear0901_TSK_GetExp_Hongbao, 100 + GetTask(newyear0901_TSK_GetExp_Hongbao));
		AddOwnExp(1000000);
		
    	subworld = SubWorldID2Idx(subworld);
    	local n_tree_idx		= random(1, 2);
    	local n_itemid 			= tb_tree_itemid[n_tree_idx];
    	local nItemIdx 			= DropItem(subworld, x * 32, y * 32, -1, 6, 1, n_itemid, 1, 0, 0, 0);
			
		tbAwardTemplet:GiveAwardByList(tb_wangshenghongbao_award, "Th�nh V��ng H�ng Bao");	
	else
		Say("��i hi�p �� ��t ��n gi�i h�n kinh nghi�m cao nh�t, v� v�y kh�ng th� s� d�ng th�m Th�nh V��ng H�ng Bao.", 0);
		return 1;
	end
end