Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

tb_chocolate_award	=
{
	{szName="1 danh v�ng", 			nRepute = 1, 		nRate = 9.8545},
	{szName="2 danh v�ng", 			nRepute = 2, 		nRate = 23},
	{szName="3 danh v�ng", 			nRepute = 3, 		nRate = 25},
	{szName="10 danh v�ng",			nRepute = 10, 		nRate = 8},
	{szName="50 danh v�ng",		 	nRepute = 50, 		nRate = 1},
	{szName="��nh Qu�c � Sa Ph�t Qu�n", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.006},
	{szName="��nh Qu�c Thanh Sa Tr��ng Sam", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.02},
	{szName="��nh Qu�c Ng�n T�m Y�u ��i", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 0.1},
	{szName="��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.04},
	{szName="��nh Qu�c T� ��ng H� uy�n", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 0.1},
	{szName="An Bang B�ng Tinh Th�ch H�ng Li�n",	tbProp={0, 164},	nQuality = 1,	nRate = 0.005},
	{szName="An Bang K� Huy�t Th�ch Gi�i Ch� ",	tbProp={0, 167},	nQuality = 1,	nRate = 0.015},
	{szName="An Bang C�c Hoa Th�ch Ch� ho�n",	tbProp={0, 165},	nQuality = 1,	nRate = 0.015},
	{szName="An Bang �i�n Ho�ng Th�ch Ng�c B�i",	tbProp={0, 166},	nQuality = 1,	nRate = 0.02},
	{szName="��ng S�t Ph� Th�y Ng�c H�ng Khuy�n",	tbProp={0, 146},	nQuality = 1,	nRate = 0.007},
	{szName="��ng s�t b�ch kim t� ph�ng gi�i",	tbProp={0, 145},	nQuality = 1,	nRate = 0.007},
	{szName="��ng s�t b�ch kim �i�u long gi�i",	tbProp={0, 143},	nQuality = 1,	nRate = 0.007},
	{szName="��ng s�t b�ch ng�c c�n long b�i",	tbProp={0, 144},	nQuality = 1,	nRate = 0.007},
	{szName="Huy�n Tinh Kho�ng Th�ch c�p 6",					tbProp={6, 1, 147, 6, 0, 0},	nRate = 1},
	{szName="Huy�n Tinh Kho�ng Th�ch c�p 7",					tbProp={6, 1, 147, 7, 0, 0},	nRate = 0.2},
	{szName="Huy�n Tinh Kho�ng Th�ch c�p 8",					tbProp={6, 1, 147, 8, 0, 0},	nRate = 0.05},
	{szName="Ti�u B�ng Tinh",						tbProp={6, 1, 1850, 1, 0, 0},	nRate = 0.07,	nExpiredTime = 20090111},
	{szName="Th�n b� kho�ng th�ch",						tbProp={6, 1, 398, 1, 0, 0},	nRate = 0.002},
	{szName="N�n Tr�ng",						tbProp={6, 1, 1851, 1, 0, 0},	nRate = 6,	nExpiredTime = 20090111},
	{szName="N�n Xanh",						tbProp={6, 1, 1852, 1, 0, 0},	nRate = 3,	nExpiredTime = 20090111},
	{szName="M�nh ��i Nh�n Th�n Ch�y (1/9) /9)",	tbProp={4, 594, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="M�nh ��i Nh�n Th�n Ch�y (3/9) /9)",	tbProp={4, 596, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="M�nh ��i Nh�n Th�n Ch�y (5/9) /9)",	tbProp={4, 598, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="M�nh ��i Nh�n Th�n Ch�y (6/9) /9)",	tbProp={4, 599, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="M�nh ��i Nh�n Th�n Ch�y (8/9) /9)",	tbProp={4, 601, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="M�nh B�ng h�n ��n ch� phi �ao (2/9)",		tbProp={4, 981, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh B�ng h�n ��n ch� phi �ao (3/9)",		tbProp={4, 982, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh B�ng h�n ��n ch� phi �ao (4/9)",		tbProp={4, 983, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh B�ng h�n ��n ch� phi �ao (7/9)",		tbProp={4, 986, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh B�ng h�n ��n ch� phi �ao (9/9)",		tbProp={4, 988, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (1/9) /9)",		tbProp={4, 585, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (4/9) /9)",		tbProp={4, 588, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (6/9) /9)",		tbProp={4, 590, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (8/9) /9)",		tbProp={4, 592, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh T� Kh�ng Gi�ng Ma Gi�i �ao (9/9) /9)",		tbProp={4, 593, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh U Minh Th��ng (2/9) /9)",	tbProp={4, 685, 1, 1, 0, 0},	nRate = 0.008},
	{szName="M�nh U Minh Th��ng (3/9) /9)",	tbProp={4, 686, 1, 1, 0, 0},	nRate = 0.008},
	{szName="M�nh U Minh Th��ng (5/9) /9)",	tbProp={4, 688, 1, 1, 0, 0},	nRate = 0.008},
	{szName="M�nh U Minh Th��ng (6/9) /9)",	tbProp={4, 689, 1, 1, 0, 0},	nRate = 0.008},
	{szName="M�nh U Minh Th��ng (9/9) /9)",	tbProp={4, 692, 1, 1, 0, 0},	nRate = 0.008},
	{szName="M�nh Thi�n Ni�n H�n Thi�t (3/9) /9)",		tbProp={4, 704, 1, 1, 0, 0},	nRate = 0.004},
	{szName="M�nh Thi�n Ni�n H�n Thi�t (4/9) /9)",		tbProp={4, 705, 1, 1, 0, 0},	nRate = 0.004},
	{szName="M�nh Thi�n Ni�n H�n Thi�t (5/9) /9)",		tbProp={4, 706, 1, 1, 0, 0},	nRate = 0.004},
	{szName="M�nh Thi�n Ni�n H�n Thi�t (7/9) /9)",		tbProp={4, 708, 1, 1, 0, 0},	nRate = 0.004},
	{szName="M�nh Thi�n Ni�n H�n Thi�t (9/9) /9)",		tbProp={4, 710, 1, 1, 0, 0},	nRate = 0.004},
	{szName="M�nh T�y T��ng Ng�c Kh�u (2/6) /6)",		tbProp={4, 802, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh T�y T��ng Ng�c Kh�u (4/6) /6)",		tbProp={4, 804, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh T�y T��ng Ng�c Kh�u (5/6) /6)",		tbProp={4, 805, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh T�y T��ng Ng�c Kh�u (6/6) /6)",		tbProp={4, 806, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M�nh T� Ho�ng Ph�ng Ngh�a �ao (1/9) /9)",		tbProp={4, 630, 1, 1, 0, 0},	nRate = 0.01},
	{szName="M�nh T� Ho�ng Ph�ng Ngh�a �ao (3/9) /9)",		tbProp={4, 632, 1, 1, 0, 0},	nRate = 0.01},
	{szName="M�nh T� Ho�ng Ph�ng Ngh�a �ao (4/9) /9)",		tbProp={4, 633, 1, 1, 0, 0},	nRate = 0.01},
	{szName="M�nh T� Ho�ng Ph�ng Ngh�a �ao (6/9) /9)",		tbProp={4, 635, 1, 1, 0, 0},	nRate = 0.01},
	{szName="M�nh U Lung Kim X� Ph�t ��i (2/6) /6)",		tbProp={4, 826, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M�nh U Lung Kim X� Ph�t ��i (3/6) /6)",		tbProp={4, 827, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M�nh U Lung Kim X� Ph�t ��i (4/6) /6)",		tbProp={4, 828, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M�nh U Lung Kim X� Ph�t ��i (6/6) /6)",		tbProp={4, 830, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M�nh ��ng C�u Kh�ng Long H� Uy�n (1/6) /6)",		tbProp={4, 855, 1, 1, 0, 0},	nRate = 0.003},
	{szName="M�nh ��ng C�u Kh�ng Long H� Uy�n (2/6) /6)",		tbProp={4, 856, 1, 1, 0, 0},	nRate = 0.003},
	{szName="M�nh ��ng C�u Kh�ng Long H� Uy�n (3/6) /6)",		tbProp={4, 857, 1, 1, 0, 0},	nRate = 0.003},
	{szName="M�nh ��ng C�u Kh�ng Long H� Uy�n (5/6) /6)",		tbProp={4, 859, 1, 1, 0, 0},	nRate = 0.003},
	{szName="M�nh Ng� Long Thi�n M�n Th�c Y�u Ho�n (1/6)",	tbProp={4, 1152, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M�nh Ng� long thi�n m�n th�c y�u ho�n (3/6)",	tbProp={4, 1154, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M�nh Ng� Long Thi�n M�n Th�c Y�u Ho�n (5/6)",	tbProp={4, 1156, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M�nh Ng� Long Thi�n M�n Th�c Y�u Ho�n (6/6)",	tbProp={4, 1157, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (1/6) /6)",	tbProp={4, 879, 1, 1, 0, 0},	nRate = 0.003},
	{szName="M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (2/6) /6)",	tbProp={4, 880, 1, 1, 0, 0},	nRate = 0.003},
	{szName="M�nh L�ng Nh�c V� C�c Huy�n Ng�c B�i (4/6) /6)",	tbProp={4, 882, 1, 1, 0, 0},	nRate = 0.003},
	{szName="L�nh b�i vinh d� H�n thi�t", 				tbProp={6, 1, 1257, 1, 0, 0},	nRate = 10},
	{szName="L�nh b�i vinh d� Thanh ��ng",				tbProp={6, 1, 1256, 1, 0, 0}, 	nRate = 1},
	{szName="L�nh b�i vinh d� B�ch Ng�n",				tbProp={6, 1, 1255, 1, 0, 0}, 	nRate = 1},
	{szName="L�nh b�i vinh d� Ho�ng Kim", 				tbProp={6, 1, 1254, 1, 0, 0}, 	nRate = 0.02},
	{szName="V� L�m M�t T�ch", 					tbProp={6, 1, 26, 1, 0, 0},	 	nRate = 0.1},
	{szName="T�y T�y Kinh", 						tbProp={6, 1, 22, 1, 0, 0}, 	nRate = 0.1},
	{szName="B�n Nh��c T�m Kinh", 					tbProp={6, 1, 12, 1, 0, 0}, 	nRate = 2},
	{szName="Thi�t La H�n", 						tbProp={6, 1, 23, 1, 0, 0}, 	nRate = 5},
	{szName="Th�n b� ��i H�ng Bao", 					tbProp={6, 1, 402,1, 0, 0}, 	nRate = 3},

};

function main(nItemIndex)
	christmas_resettask();
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "V�t ph�m n�y �� h�t h�n")
		return 0
	end
	if (CalcFreeItemCellCount() < 20) then
		Say("H�nh trang c�a ��i hi�p �� ��y!", 0);
		return 1;
	end
	if (100 + GetTask(christmas_getexp_taskid) <= GetTask(christmas_bingjing_taskid))	then
		SetTask(christmas_getexp_taskid, 100 + GetTask(christmas_getexp_taskid));
		AddOwnExp(1000000);
		tbAwardTemplet:GiveAwardByList(tb_chocolate_award, "Ho�t ��ng gi�ng sinh 2008_B�nh Kem Socola");
	else
		Say("��i hi�p �� ��n gi�i h�n kinh nghi�m cao nh�t, kh�ng th� ti�p t�c s� d�ng b�nh kem n�a.", 0);
		return 1;
	end
end