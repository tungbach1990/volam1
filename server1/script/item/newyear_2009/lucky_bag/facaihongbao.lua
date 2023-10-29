Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\newyear_2009\\head.lua");

tb_facaihongbao_award	=
{
	{szName="1 danh v�ng", 			nRepute = 1, 		nRate = 1},
	{szName="2 danh v�ng", 			nRepute = 2, 		nRate = 2},
	{szName="3 danh v�ng", 			nRepute = 3, 		nRate = 3},
	{szName="10 danh v�ng",			nRepute = 10, 		nRate = 3.07},
	{szName="50 danh v�ng",		 	nRepute = 50, 		nRate = 1},
	{szName="��nh Qu�c � Sa Ph�t Qu�n", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.2},
	{szName="��nh Qu�c Thanh Sa Tr��ng Sam", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.5},
	{szName="��nh Qu�c Ng�n T�m Y�u ��i", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 1},
	{szName="��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.8},
	{szName="��nh Qu�c T� ��ng H� uy�n", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 1.5},
	{szName="An Bang B�ng Tinh Th�ch H�ng Li�n",	tbProp={0, 164},	nQuality = 1,	nRate = 0.03},
	{szName="An Bang K� Huy�t Th�ch Gi�i Ch� ",	tbProp={0, 167},	nQuality = 1,	nRate = 0.08},
	{szName="An Bang C�c Hoa Th�ch Ch� ho�n",	tbProp={0, 165},	nQuality = 1,	nRate = 0.08},
	{szName="An Bang �i�n Ho�ng Th�ch Ng�c B�i",	tbProp={0, 166},	nQuality = 1,	nRate = 0.1},
	{szName="��ng S�t Ph� Th�y Ng�c H�ng Khuy�n",	tbProp={0, 146},	nQuality = 1,	nRate = 0.05},
	{szName="��ng s�t b�ch kim t� ph�ng gi�i",	tbProp={0, 145},	nQuality = 1,	nRate = 0.05},
	{szName="��ng s�t b�ch kim �i�u long gi�i",	tbProp={0, 143},	nQuality = 1,	nRate = 0.05},
	{szName="��ng s�t b�ch ng�c c�n long b�i",	tbProp={0, 144},	nQuality = 1,	nRate = 0.05},
	{szName="Huy�n Tinh Kho�ng Th�ch c�p 6",		tbProp={6, 1, 147, 6, 0, 0},		nRate = 8},
	{szName="Huy�n Tinh Kho�ng Th�ch c�p 7",		tbProp={6, 1, 147, 7, 0, 0},		nRate = 2},
	{szName="Huy�n Tinh Kho�ng Th�ch c�p 8",		tbProp={6, 1, 147, 8, 0, 0},		nRate = 0.5},
	{szName="V� L�m M�t T�ch", 		tbProp={6, 1, 26, 1, 0, 0},	 		nRate = 0.5},
	{szName="T�y T�y Kinh", 			tbProp={6, 1, 22, 1, 0, 0}, 		nRate = 0.5},
	{szName="Th�n b� kho�ng th�ch",			tbProp={6, 1, 398, 1, 0, 0},		nRate = 0.02},
	{szName="N�n C�t T��ng",			tbProp={6, 1, 1915, 1, 0, 0},		nRate = 15,		nExpiredTime = newyear0901_lazhu_expiredtime},
	{szName="N�n Nh� �",			tbProp={6, 1, 1916, 1, 0, 0},		nRate = 7,		nExpiredTime = newyear0901_lazhu_expiredtime},
	{szName="M�ng C�u", 			tbProp={6, 1, 1886, 1, 0, 0},		nRate = 12, 	nExpiredTime = newyear0901_item_expiredtime},
	{szName="D�a", 			tbProp={6, 1, 1887, 1, 0, 0},		nRate = 7, 		nExpiredTime = newyear0901_item_expiredtime},
	{szName="�u ��", 			tbProp={6, 1, 1888, 1, 0, 0},		nRate = 7, 		nExpiredTime = newyear0901_item_expiredtime},
	{szName="Xo�i", 			tbProp={6, 1, 1889, 1, 0, 0},		nRate = 7, 		nExpiredTime = newyear0901_item_expiredtime},
	{szName="Sung", 			tbProp={6, 1, 1890, 1, 0, 0},		nRate = 17,		nExpiredTime = newyear0901_item_expiredtime},
	{szName="B�nh ch�ng th��ng h�ng", 		tbProp={6, 1, 1894, 1, 0, 0},		nRate = 0.3,	nExpiredTime = newyear0901_item_expiredtime},
	{szName="M�nh ��i Nh�n Th�n Ch�y (1/9) /9)",	tbProp={4, 594, 1, 1, 0, 0},	nRate = 0.01},
	{szName="M�nh ��i Nh�n Th�n Ch�y (2/9) /9)",	tbProp={4, 595, 1, 1, 0, 0},	nRate = 0.01},
	{szName="M�nh ��i Nh�n Th�n Ch�y (4/9) /9)",	tbProp={4, 597, 1, 1, 0, 0},	nRate = 0.01},
	{szName="M�nh ��i Nh�n Th�n Ch�y (6/9) /9)",	tbProp={4, 599, 1, 1, 0, 0},	nRate = 0.01},
	{szName="M�nh ��i Nh�n Th�n Ch�y (8/9) /9)",	tbProp={4, 601, 1, 1, 0, 0},	nRate = 0.01},
	{szName="M�nh B�ng h�n ��n ch� phi �ao (1/9)",		tbProp={4, 980, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh B�ng h�n ��n ch� phi �ao (3/9)",		tbProp={4, 982, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh B�ng h�n ��n ch� phi �ao (4/9)",		tbProp={4, 983, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh B�ng h�n ��n ch� phi �ao (7/9)",		tbProp={4, 986, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh B�ng h�n ��n ch� phi �ao (8/9)",		tbProp={4, 987, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (1/9) /9)",		tbProp={4, 585, 1, 1, 0, 0},	nRate = 0.03},
	{szName="M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (4/9) /9)",		tbProp={4, 588, 1, 1, 0, 0},	nRate = 0.03},
	{szName="M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (5/9) /9)",		tbProp={4, 589, 1, 1, 0, 0},	nRate = 0.03},
	{szName="M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (7/9) /9)",		tbProp={4, 591, 1, 1, 0, 0},	nRate = 0.03},
	{szName="M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (9/9) /9)",		tbProp={4, 593, 1, 1, 0, 0},	nRate = 0.03},
	{szName="M�nh U Minh Th��ng (1/9) /9)",	tbProp={4, 684, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh U Minh Th��ng (3/9) /9)",	tbProp={4, 686, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh U Minh Th��ng (5/9) /9)",	tbProp={4, 688, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh U Minh Th��ng (6/9) /9)",	tbProp={4, 689, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh U Minh Th��ng (8/9) /9)",	tbProp={4, 691, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh Thi�n Ni�n H�n Thi�t (1/9) /9)",		tbProp={4, 702, 1, 1, 0, 0},	nRate = 0.03},
	{szName="M�nh Thi�n Ni�n H�n Thi�t (4/9) /9)",		tbProp={4, 705, 1, 1, 0, 0},	nRate = 0.03},
	{szName="M�nh Thi�n Ni�n H�n Thi�t (5/9) /9)",		tbProp={4, 706, 1, 1, 0, 0},	nRate = 0.03},
	{szName="M�nh Thi�n Ni�n H�n Thi�t (7/9) /9)",		tbProp={4, 708, 1, 1, 0, 0},	nRate = 0.03},
	{szName="M�nh Thi�n Ni�n H�n Thi�t (8/9) /9)",		tbProp={4, 709, 1, 1, 0, 0},	nRate = 0.03},
	{szName="M�nh T�y T��ng Ng�c Kh�u (2/6) /6)",		tbProp={4, 802, 1, 1, 0, 0},	nRate = 0.04},
	{szName="M�nh T�y T��ng Ng�c Kh�u (3/6) /6)",		tbProp={4, 803, 1, 1, 0, 0},	nRate = 0.04},
	{szName="M�nh T�y T��ng Ng�c Kh�u (4/6) /6)",		tbProp={4, 804, 1, 1, 0, 0},	nRate = 0.04},
	{szName="M�nh T�y T��ng Ng�c Kh�u (5/6) /6)",		tbProp={4, 805, 1, 1, 0, 0},	nRate = 0.04},
	{szName="M�nh T� Ho�ng Ph�ng Ngh�a �ao (2/9) /9)",		tbProp={4, 631, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh T� Ho�ng Ph�ng Ngh�a �ao (5/9) /9)",		tbProp={4, 634, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh T� Ho�ng Ph�ng Ngh�a �ao (7/9) /9)",		tbProp={4, 636, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh T� Ho�ng Ph�ng Ngh�a �ao (8/9) /9)",		tbProp={4, 637, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh T� Ho�ng Ph�ng Ngh�a �ao (9/9) /9)",		tbProp={4, 638, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh U Lung Kim X� Ph�t ��i (1/6) /6)",		tbProp={4, 825, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh U Lung Kim X� Ph�t ��i (2/6) /6)",		tbProp={4, 826, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh U Lung Kim X� Ph�t ��i (4/6) /6)",		tbProp={4, 828, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh U Lung Kim X� Ph�t ��i (6/6) /6)",		tbProp={4, 830, 1, 1, 0, 0},	nRate = 0.05},
	{szName="M�nh ��ng C�u Kh�ng Long H� Uy�n (2/6) /6)",		tbProp={4, 856, 1, 1, 0, 0},	nRate = 0.02},
	{szName="M�nh ��ng C�u Kh�ng Long H� Uy�n (3/6) /6)",		tbProp={4, 857, 1, 1, 0, 0},	nRate = 0.02},
	{szName="M�nh ��ng C�u Kh�ng Long H� Uy�n (4/6) /6)",		tbProp={4, 858, 1, 1, 0, 0},	nRate = 0.02},
	{szName="M�nh ��ng C�u Kh�ng Long H� Uy�n (5/6) /6)",		tbProp={4, 859, 1, 1, 0, 0},	nRate = 0.02},
	{szName="M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (1/6) /6)",	tbProp={4, 879, 1, 1, 0, 0},	nRate = 0.02},
	{szName="M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (2/6) /6)",	tbProp={4, 880, 1, 1, 0, 0},	nRate = 0.02},
	{szName="M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (4/6) /6)",	tbProp={4, 882, 1, 1, 0, 0},	nRate = 0.02},
	{szName="M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (6/6) /6)",	tbProp={4, 884, 1, 1, 0, 0},	nRate = 0.02},
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
		Say("��i hi�p v�n ch�a �� c�p 50 ho�c v�n ch�a n�p th�, v� v�y kh�ng th� s� d�ng Ph�t T�i H�ng Bao.", 0);
		return 1;
	end
	
	local subworld, x, y	= GetWorldPos();
	if (tb_openhongbao_mapid[subworld] == nil) then
		Say("Ph�t t�i h�ng bao ch� s� d�ng ���c � th�nh th� v� th�n tr�n.", 0);
		return 1;
	end
	
	if (CalcFreeItemCellCount() < 20) then
		Say("H�nh trang c�a ��i hi�p kh�ng ��, xin h�y �� tr�ng 20 � nh�!", 0);
		return 1;
	end
	
	if (300 + GetTask(newyear0901_TSK_GetExp_Hongbao) <= GetTask(newyear0901_TSK_GetExpUpLimit))	then
		SetTask(newyear0901_TSK_GetExp_Hongbao, 300 + GetTask(newyear0901_TSK_GetExp_Hongbao));
		AddOwnExp(3000000);
		tbAwardTemplet:GiveAwardByList(tb_facaihongbao_award, "Ph�t T�i H�ng Bao");
		
		
    	subworld = SubWorldID2Idx(subworld);
    	local n_tree_idx		= random(1, 2);
    	local n_itemid 			= tb_tree_itemid[n_tree_idx];
    	local nItemIdx 			= DropItem(subworld, x * 32, y * 32, -1, 6, 1, n_itemid, 1, 0, 0, 0);
	else
		Say("��i hi�p �� ��t ��n gi�i h�n kinh nghi�m cao nh�t, v� v�y kh�ng th� s� d�ng Ph�t T�i H�ng Bao.", 0);
		return 1;
	end
end
