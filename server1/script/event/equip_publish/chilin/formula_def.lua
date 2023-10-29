
Include("\\script\\event\\equip_publish\\chilin\\item_def.lua")

tbFormulaList = {}

tbFormulaList[ITEMPART.helm] = 
{
	nHeight = 2,
	nWidth = 2,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 40}},
		tbEquip = {szName = "Trang b� B�ch H� Kh�i", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.helm],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "X�ch L�n Kh�i",
		[1] = {szDesc = "Quy�n Thi�u L�m", szName="X�ch L�n Di L�c T�ng M�o",tbProp={0,2516},nQuality=1,},
		[2] = {szDesc = "C�n Thi�u L�m", szName="X�ch L�n Gi�ng Ma T�ng M�o",tbProp={0,2526},nQuality=1,},
		[3] = {szDesc = "Thi�u L�m �ao", szName="X�ch L�n Y�t �� T�ng M�o",tbProp={0,2536},nQuality=1,},
		[4] = {szDesc = "Ch�y Thi�n V��ng", szName="X�ch L�n Th��ng Th�ng Kh�i",tbProp={0,2546},nQuality=1,},
		[5] = {szDesc = "Th��ng Thi�n V��ng", szName="X�ch L�n V� ��ch Kh�i",tbProp={0,2556},nQuality=1,},
		[6] = {szDesc = "�ao Thi�n V��ng", szName="X�ch L�n L�i ��nh Kh�i",tbProp={0,2566},nQuality=1,},
		[7] = {szDesc = "Nga My Ki�m", szName="X�ch L�n Tuy�t �nh Ph�t ��i",tbProp={0,2576},nQuality=1,},
		[8] = {szDesc = "Nga My Ch��ng", szName="X�ch L�n V�n Anh Ph�t ��i",tbProp={0,2586},nQuality=1,},
		[9] = {szDesc = "Th�y Y�n ��n �ao", szName="X�ch L�n Minh Nguy�t Tr�m",tbProp={0,2596},nQuality=1,},
		[10] = {szDesc = "Th�y Y�n n�i", szName="X�ch L�n Ph� Dung Tr�m",tbProp={0,2606},nQuality=1,},
		[11] = {szDesc = "Ng� ��c ch��ng", szName="X�ch L�n La S�t ��u Ho�n",tbProp={0,2616},nQuality=1,},
		[12] = {szDesc = "Ng� ��c �ao", szName="X�ch L�n Tu La ��u Ho�n",tbProp={0,2626},nQuality=1,},
		[13] = {szDesc = "���ng M�n phi �ao", szName="X�ch L�n C� Tinh Qu�n",tbProp={0,2636},nQuality=1,},
		[14] = {szDesc = "���ng M�n N�", szName="X�ch L�n Th��ng Lan Qu�n",tbProp={0,2646},nQuality=1,},
		[15] = {szDesc = "���ng M�n Phi Ti�u", szName="X�ch L�n T� Th�n Ph�t Qu�n",tbProp={0,2656},nQuality=1,},
		[16] = {szDesc = "C�i Bang ch��ng", szName="X�ch L�n Th�a Long ��u Ho�n",tbProp={0,2666},nQuality=1,},
		[17] = {szDesc = "C�i Bang c�n", szName="X�ch L�n Gi�ng Long ��u Ho�n",tbProp={0,2676},nQuality=1,},
		[18] = {szDesc = "Thi�n Nh�n chi�n", szName="X�ch L�n Nhi�n Kh�n Kh�i",tbProp={0,2686},nQuality=1,},
		[19] = {szDesc = "Thi�n Nh�n ma", szName="X�ch L�n To�i Tinh Qu�n Mi�n",tbProp={0,2696},nQuality=1,},
		[20] = {szDesc = "V� �ang kh�", szName="X�ch L�n Tr��ng Sinh Qu�n",tbProp={0,2706},nQuality=1,},
		[21] = {szDesc = "V� �ang ki�m", szName="X�ch L�n Nh� C� Qu�n",tbProp={0,2716},nQuality=1,},
		[22] = {szDesc = "�ao C�n L�n", szName="X�ch L�n C�n Vi�n ��o Qu�n",tbProp={0,2726},nQuality=1,},
		[23] = {szDesc = "Ki�m C�n L�n", szName="X�ch L�n Tr��ng Kh�ng ��o Qu�n",tbProp={0,2736},nQuality=1,},
	},
}
tbFormulaList[ITEMPART.armor] = 
{
	nHeight = 3,
	nWidth = 2,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 100}},
		tbEquip = {szName = "Trang b� B�ch H� Y", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.armor],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang B� X�ch L�n Y",
		[1] = {szDesc = "Quy�n Thi�u L�m", szName="X�ch L�n Di L�c C� Sa",tbProp={0,2520},nQuality=1,},
		[2] = {szDesc = "C�n Thi�u L�m", szName="X�ch L�n Gi�ng Ma C� Sa",tbProp={0,2530},nQuality=1,},
		[3] = {szDesc = "Thi�u L�m �ao", szName="X�ch L�n Y�t �� C� Sa",tbProp={0,2540},nQuality=1,},
		[4] = {szDesc = "Ch�y Thi�n V��ng", szName="X�ch L�n Th��ng Th�ng Kh�i",tbProp={0,2550},nQuality=1,},
		[5] = {szDesc = "Th��ng Thi�n V��ng", szName="X�ch L�n V� ��ch Kh�i",tbProp={0,2560},nQuality=1,},
		[6] = {szDesc = "�ao Thi�n V��ng", szName="X�ch L�n L�i ��nh Kh�i",tbProp={0,2570},nQuality=1,},
		[7] = {szDesc = "Nga My Ki�m", szName="X�ch L�n Tuy�t �nh Sa Y",tbProp={0,2580},nQuality=1,},
		[8] = {szDesc = "Nga My Ch��ng", szName="X�ch L�n V�n Anh Sam",tbProp={0,2590},nQuality=1,},
		[9] = {szDesc = "Th�y Y�n ��n �ao", szName="X�ch L�n Minh Nguy�t Sam",tbProp={0,2600},nQuality=1,},
		[10] = {szDesc = "Th�y Y�n n�i", szName="X�ch L�n Ph� Dung Sam",tbProp={0,2610},nQuality=1,},
		[11] = {szDesc = "Ng� ��c ch��ng", szName="X�ch L�n La S�t B� Trang",tbProp={0,2620},nQuality=1,},
		[12] = {szDesc = "Ng� ��c �ao", szName="X�ch L�n Tu La H� Gi�p",tbProp={0,2630},nQuality=1,},
		[13] = {szDesc = "���ng M�n phi �ao", szName="X�ch L�n C� Tinh Gi�p",tbProp={0,2640},nQuality=1,},
		[14] = {szDesc = "���ng M�n N�", szName="X�ch L�n Th��ng Lan Gi�p",tbProp={0,2650},nQuality=1,},
		[15] = {szDesc = "���ng M�n Phi Ti�u", szName="X�ch L�n T� Th�n Gi�p Y",tbProp={0,2660},nQuality=1,},
		[16] = {szDesc = "C�i Bang ch��ng", szName="X�ch L�n Th�a Long C�i Y",tbProp={0,2670},nQuality=1,},
		[17] = {szDesc = "C�i Bang c�n", szName="X�ch L�n Gi�ng Long C�i Y",tbProp={0,2680},nQuality=1,},
		[18] = {szDesc = "Thi�n Nh�n chi�n", szName="X�ch L�n Nhi�n Kh�n Gi�p Y",tbProp={0,2690},nQuality=1,},
		[19] = {szDesc = "Thi�n Nh�n ma", szName="X�ch L�n To�i Tinh Gi�p Y",tbProp={0,2700},nQuality=1,},
		[20] = {szDesc = "V� �ang kh�", szName="X�ch L�n Tr��ng Sinh ��o B�o",tbProp={0,2710},nQuality=1,},
		[21] = {szDesc = "V� �ang ki�m", szName="X�ch L�n Nh� C� ��o B�o",tbProp={0,2720},nQuality=1,},
		[22] = {szDesc = "�ao C�n L�n", szName="X�ch L�n C�n Vi�n ��o B�o",tbProp={0,2730},nQuality=1,},
		[23] = {szDesc = "Ki�m C�n L�n", szName="X�ch L�n Tr��ng Kh�ng ��o B�o",tbProp={0,2740},nQuality=1,},
	},
}
tbFormulaList[ITEMPART.boots] = 
{
	nHeight = 2,
	nWidth = 2,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 50}},
		tbEquip = {szName = "Trang b� B�ch H� H�i", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.boots],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang B� X�ch L�n H�i",
		[1] = {szDesc = "Quy�n Thi�u L�m", szName="X�ch L�n Di L�c T�ng H�i",tbProp={0,2522},nQuality=1,},
		[2] = {szDesc = "C�n Thi�u L�m", szName="X�ch L�n Gi�ng Ma T�ng H�i",tbProp={0,2532},nQuality=1,},
		[3] = {szDesc = "Thi�u L�m �ao", szName="X�ch L�n Y�t �� T�ng H�i",tbProp={0,2542},nQuality=1,},
		[4] = {szDesc = "Ch�y Thi�n V��ng", szName="X�ch L�n Th��ng Th�ng Ngoa",tbProp={0,2552},nQuality=1,},
		[5] = {szDesc = "Th��ng Thi�n V��ng", szName="X�ch L�n V� ��ch Ngoa",tbProp={0,2562},nQuality=1,},
		[6] = {szDesc = "�ao Thi�n V��ng", szName="X�ch L�n L�i ��nh Ngoa",tbProp={0,2572},nQuality=1,},
		[7] = {szDesc = "Nga My Ki�m", szName="X�ch L�n Tuy�t �nh Ngoa",tbProp={0,2582},nQuality=1,},
		[8] = {szDesc = "Nga My Ch��ng", szName="X�ch L�n V�n Anh Ngoa",tbProp={0,2592},nQuality=1,},
		[9] = {szDesc = "Th�y Y�n ��n �ao", szName="X�ch L�n Minh Nguy�t Ngoa",tbProp={0,2602},nQuality=1,},
		[10] = {szDesc = "Th�y Y�n n�i", szName="X�ch L�n Ph� Dung Ngoa",tbProp={0,2612},nQuality=1,},
		[11] = {szDesc = "Ng� ��c ch��ng", szName="X�ch L�n La S�t Ngoa",tbProp={0,2622},nQuality=1,},
		[12] = {szDesc = "Ng� ��c �ao", szName="X�ch L�n Tu La Ngoa",tbProp={0,2632},nQuality=1,},
		[13] = {szDesc = "���ng M�n phi �ao", szName="X�ch L�n C� Tinh L�",tbProp={0,2642},nQuality=1,},
		[14] = {szDesc = "���ng M�n N�", szName="X�ch L�n Th��ng Lan L�",tbProp={0,2652},nQuality=1,},
		[15] = {szDesc = "���ng M�n Phi Ti�u", szName="X�ch L�n T� Th�n L�",tbProp={0,2662},nQuality=1,},
		[16] = {szDesc = "C�i Bang ch��ng", szName="X�ch L�n Th�a Long Ngoa",tbProp={0,2672},nQuality=1,},
		[17] = {szDesc = "C�i Bang c�n", szName="X�ch L�n Gi�ng Long Ngoa",tbProp={0,2682},nQuality=1,},
		[18] = {szDesc = "Thi�n Nh�n chi�n", szName="X�ch L�n Nhi�n Kh�n Ngoa",tbProp={0,2692},nQuality=1,},
		[19] = {szDesc = "Thi�n Nh�n ma", szName="X�ch L�n To�i Tinh Ngoa",tbProp={0,2702},nQuality=1,},
		[20] = {szDesc = "V� �ang kh�", szName="X�ch L�n Tr��ng Sinh L�",tbProp={0,2712},nQuality=1,},
		[21] = {szDesc = "V� �ang ki�m", szName="X�ch L�n Nh� C� L�",tbProp={0,2722},nQuality=1,},
		[22] = {szDesc = "�ao C�n L�n", szName="X�ch L�n C�n Vi�n Ngoa",tbProp={0,2732},nQuality=1,},
		[23] = {szDesc = "Ki�m C�n L�n", szName="X�ch L�n Tr��ng Kh�ng Ngoa",tbProp={0,2742},nQuality=1,},
	},
}

tbFormulaList[ITEMPART.belt] = 
{
	nHeight = 1,
	nWidth = 2,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 40}},
		tbEquip = {szName = "Trang b� B�ch H�  Y�u ��i", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.belt],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang B� X�ch L�n Y�u ��i",
		[1] = {szDesc = "Quy�n Thi�u L�m", szName="X�ch L�n Di L�c Y�u ��i",tbProp={0,2519},nQuality=1,},
		[2] = {szDesc = "C�n Thi�u L�m", szName="X�ch L�n Gi�ng Ma Y�u ��i",tbProp={0,2529},nQuality=1,},
		[3] = {szDesc = "Thi�u L�m �ao", szName="X�ch L�n Y�t �� Y�u ��i",tbProp={0,2539},nQuality=1,},
		[4] = {szDesc = "Ch�y Thi�n V��ng", szName="X�ch L�n Th��ng Th�ng Y�u ��i",tbProp={0,2549},nQuality=1,},
		[5] = {szDesc = "Th��ng Thi�n V��ng", szName="X�ch L�n V� ��ch Y�u ��i",tbProp={0,2559},nQuality=1,},
		[6] = {szDesc = "�ao Thi�n V��ng", szName="X�ch L�n L�i ��nh Y�u ��i",tbProp={0,2569},nQuality=1,},
		[7] = {szDesc = "Nga My Ki�m", szName="X�ch L�n Tuy�t �nh Th�c Y�u",tbProp={0,2579},nQuality=1,},
		[8] = {szDesc = "Nga My Ch��ng", szName="X�ch L�n V�n Anh Th�c Y�u",tbProp={0,2589},nQuality=1,},
		[9] = {szDesc = "Th�y Y�n ��n �ao", szName="X�ch L�n Minh Nguy�t Ti ��i",tbProp={0,2599},nQuality=1,},
		[10] = {szDesc = "Th�y Y�n n�i", szName="X�ch L�n Ph� Dung Y�u ��i",tbProp={0,2609},nQuality=1,},
		[11] = {szDesc = "Ng� ��c ch��ng", szName="X�ch L�n La S�t Y�u ��i",tbProp={0,2619},nQuality=1,},
		[12] = {szDesc = "Ng� ��c �ao", szName="X�ch L�n Tu La Y�u ��i",tbProp={0,2629},nQuality=1,},
		[13] = {szDesc = "���ng M�n phi �ao", szName="X�ch L�n C� Tinh Tri�n Y�u",tbProp={0,2639},nQuality=1,},
		[14] = {szDesc = "���ng M�n N�", szName="X�ch L�n Th��ng Lan Th�c Y�u",tbProp={0,2649},nQuality=1,},
		[15] = {szDesc = "���ng M�n Phi Ti�u", szName="X�ch L�n T� Th�n Th�c Y�u",tbProp={0,2659},nQuality=1,},
		[16] = {szDesc = "C�i Bang ch��ng", szName="X�ch L�n Th�a Long Th�c Y�u",tbProp={0,2669},nQuality=1,},
		[17] = {szDesc = "C�i Bang c�n", szName="X�ch L�n Gi�ng Long Th�c Y�u",tbProp={0,2679},nQuality=1,},
		[18] = {szDesc = "Thi�n Nh�n chi�n", szName="X�ch L�n Nhi�n Kh�n Y�u ��i",tbProp={0,2689},nQuality=1,},
		[19] = {szDesc = "Thi�n Nh�n ma", szName="X�ch L�n To�i Tinh Y�u ��i",tbProp={0,2699},nQuality=1,},
		[20] = {szDesc = "V� �ang kh�", szName="X�ch L�n Tr��ng Sinh Ph�p ��i",tbProp={0,2709},nQuality=1,},
		[21] = {szDesc = "V� �ang ki�m", szName="X�ch L�n Nh� C� Ph�p ��i",tbProp={0,2719},nQuality=1,},
		[22] = {szDesc = "�ao C�n L�n", szName="X�ch L�n C�n Vi�n Y�u ��i",tbProp={0,2729},nQuality=1,},
		[23] = {szDesc = "Ki�m C�n L�n", szName="X�ch L�n Tr��ng Kh�ng Y�u ��i",tbProp={0,2739},nQuality=1,},
	}
}
tbFormulaList[ITEMPART.cuff] = 
{
	nHeight = 2,
	nWidth = 1,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 50}},
		tbEquip = {szName = "Trang b� B�ch H� Uy�n", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.cuff],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang B� X�ch L�n H� Uy�n",
		[1] = {szDesc = "Quy�n Thi�u L�m", szName="X�ch L�n Di L�c H� Uy�n",tbProp={0,2518},nQuality=1,},
		[2] = {szDesc = "C�n Thi�u L�m", szName="X�ch L�n Gi�ng Ma H� Uy�n",tbProp={0,2528},nQuality=1,},
		[3] = {szDesc = "Thi�u L�m �ao", szName="X�ch L�n Y�t �� H� Uy�n",tbProp={0,2538},nQuality=1,},
		[4] = {szDesc = "Ch�y Thi�n V��ng", szName="X�ch L�n Th��ng Th�ng Th�c Uy�n",tbProp={0,2548},nQuality=1,},
		[5] = {szDesc = "Th��ng Thi�n V��ng", szName="X�ch L�n V� ��ch Th�c Uy�n",tbProp={0,2558},nQuality=1,},
		[6] = {szDesc = "�ao Thi�n V��ng", szName="X�ch L�n L�i ��nh Th�c Uy�n",tbProp={0,2568},nQuality=1,},
		[7] = {szDesc = "Nga My Ki�m", szName="X�ch L�n Tuy�t �nh H� Uy�n",tbProp={0,2578},nQuality=1,},
		[8] = {szDesc = "Nga My Ch��ng", szName="X�ch L�n V�n Anh H� Uy�n",tbProp={0,2588},nQuality=1,},
		[9] = {szDesc = "Th�y Y�n ��n �ao", szName="X�ch L�n Minh Nguy�t T�",tbProp={0,2598},nQuality=1,},
		[10] = {szDesc = "Th�y Y�n n�i", szName="X�ch L�n Ph� Dung T�",tbProp={0,2608},nQuality=1,},
		[11] = {szDesc = "Ng� ��c ch��ng", szName="X�ch L�n La S�t H� Uy�n",tbProp={0,2618},nQuality=1,},
		[12] = {szDesc = "Ng� ��c �ao", szName="X�ch L�n Tu La H� Uy�n",tbProp={0,2628},nQuality=1,},
		[13] = {szDesc = "���ng M�n phi �ao", szName="X�ch L�n C� Tinh H� Uy�n",tbProp={0,2638},nQuality=1,},
		[14] = {szDesc = "���ng M�n N�", szName="X�ch L�n Th��ng Lan H� Uy�n",tbProp={0,2648},nQuality=1,},
		[15] = {szDesc = "���ng M�n Phi Ti�u", szName="X�ch L�n T� Th�n H� Uy�n",tbProp={0,2658},nQuality=1,},
		[16] = {szDesc = "C�i Bang ch��ng", szName="X�ch L�n Th�a Long H� Uy�n",tbProp={0,2668},nQuality=1,},
		[17] = {szDesc = "C�i Bang c�n", szName="X�ch L�n Gi�ng Long H� Uy�n",tbProp={0,2678},nQuality=1,},
		[18] = {szDesc = "Thi�n Nh�n chi�n", szName="X�ch L�n Nhi�n Kh�n H� Uy�n",tbProp={0,2688},nQuality=1,},
		[19] = {szDesc = "Thi�n Nh�n ma", szName="X�ch L�n To�i Tinh H� Uy�n",tbProp={0,2698},nQuality=1,},
		[20] = {szDesc = "V� �ang kh�", szName="X�ch L�n Tr��ng Sinh T�",tbProp={0,2708},nQuality=1,},
		[21] = {szDesc = "V� �ang ki�m", szName="X�ch L�n Nh� C� T�",tbProp={0,2718},nQuality=1,},
		[22] = {szDesc = "�ao C�n L�n", szName="X�ch L�n C�n Vi�n H� Uy�n",tbProp={0,2728},nQuality=1,},
		[23] = {szDesc = "Ki�m C�n L�n", szName="X�ch L�n Tr��ng Kh�ng H� Uy�n",tbProp={0,2738},nQuality=1,},
	}
}
tbFormulaList[ITEMPART.amulet] = 
{
	nHeight = 1,
	nWidth = 2,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 40}},
		tbEquip = {szName = "Trang b� B�ch H�ng Li�n", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.amulet],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang B� X�ch L�n H�ng Li�n",
		[1] = {szDesc = "Quy�n Thi�u L�m", szName="X�ch L�n Di L�c Ch�u Li�n",tbProp={0,2515},nQuality=1,},
		[2] = {szDesc = "C�n Thi�u L�m", szName="X�ch L�n Gi�ng Ma Ph�t Ch�u",tbProp={0,2525},nQuality=1,},
		[3] = {szDesc = "Thi�u L�m �ao", szName="X�ch L�n Y�t �� H�ng Li�n",tbProp={0,2535},nQuality=1,},
		[4] = {szDesc = "Ch�y Thi�n V��ng", szName="X�ch L�n Th��ng Th�ng Li�n",tbProp={0,2545},nQuality=1,},
		[5] = {szDesc = "Th��ng Thi�n V��ng", szName="X�ch L�n V� ��ch H�ng Li�n",tbProp={0,2555},nQuality=1,},
		[6] = {szDesc = "�ao Thi�n V��ng", szName="X�ch L�n L�i ��nh H�ng Li�n",tbProp={0,2565},nQuality=1,},
		[7] = {szDesc = "Nga My Ki�m", szName="X�ch L�n Tuy�t �nh Ch�u Li�n",tbProp={0,2575},nQuality=1,},
		[8] = {szDesc = "Nga My Ch��ng", szName="X�ch L�n V�n Anh Ch�u Li�n",tbProp={0,2585},nQuality=1,},
		[9] = {szDesc = "Th�y Y�n ��n �ao", szName="X�ch L�n Minh Nguy�t Ch�u Li�n",tbProp={0,2595},nQuality=1,},
		[10] = {szDesc = "Th�y Y�n n�i", szName="X�ch L�n Ph� Dung Ch�u Li�n",tbProp={0,2605},nQuality=1,},
		[11] = {szDesc = "Ng� ��c ch��ng", szName="X�ch L�n La S�t H�ng Li�n",tbProp={0,2615},nQuality=1,},
		[12] = {szDesc = "Ng� ��c �ao", szName="X�ch L�n Tu La H�ng Li�n",tbProp={0,2625},nQuality=1,},
		[13] = {szDesc = "���ng M�n phi �ao", szName="X�ch L�n C� Tinh H�ng Li�n",tbProp={0,2635},nQuality=1,},
		[14] = {szDesc = "���ng M�n N�", szName="X�ch L�n Th��ng Lan H�ng Li�n",tbProp={0,2645},nQuality=1,},
		[15] = {szDesc = "���ng M�n Phi Ti�u", szName="X�ch L�n T� Th�n Li�n",tbProp={0,2655},nQuality=1,},
		[16] = {szDesc = "C�i Bang ch��ng", szName="X�ch L�n Th�a Long H�ng Li�n",tbProp={0,2665},nQuality=1,},
		[17] = {szDesc = "C�i Bang c�n", szName="X�ch L�n Gi�ng Long H�ng Li�n",tbProp={0,2675},nQuality=1,},
		[18] = {szDesc = "Thi�n Nh�n chi�n", szName="X�ch L�n Nhi�n Kh�n H�ng Khuy�n",tbProp={0,2685},nQuality=1,},
		[19] = {szDesc = "Thi�n Nh�n ma", szName="X�ch L�n To�i Tinh H�ng Li�n",tbProp={0,2695},nQuality=1,},
		[20] = {szDesc = "V� �ang kh�", szName="X�ch L�n Tr��ng Sinh Ph�",tbProp={0,2705},nQuality=1,},
		[21] = {szDesc = "V� �ang ki�m", szName="X�ch L�n Nh� C� Ph�",tbProp={0,2715},nQuality=1,},
		[22] = {szDesc = "�ao C�n L�n", szName="X�ch L�n C�n Vi�n H�ng Li�n",tbProp={0,2725},nQuality=1,},
		[23] = {szDesc = "Ki�m C�n L�n", szName="X�ch L�n Tr��ng Kh�ng Ph�",tbProp={0,2735},nQuality=1,},
	}
}
tbFormulaList[ITEMPART.pendant] = 
{
	nHeight = 2,
	nWidth = 1,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 40}},
		tbEquip = {szName = "Trang b� B�ch H� B�i", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.pendant],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang B� X�ch L�n B�i",
		[1] = {szDesc = "Quy�n Thi�u L�m", szName="X�ch L�n Di L�c Y�u Tr�y",tbProp={0,2523},nQuality=1,},
		[2] = {szDesc = "C�n Thi�u L�m", szName="X�ch L�n Gi�ng Ma Y�u Tr�y",tbProp={0,2533},nQuality=1,},
		[3] = {szDesc = "Thi�u L�m �ao", szName="X�ch L�n Y�t �� Y�u Tr�y",tbProp={0,2543},nQuality=1,},
		[4] = {szDesc = "Ch�y Thi�n V��ng", szName="X�ch L�n Th��ng Th�ng B�i",tbProp={0,2553},nQuality=1,},
		[5] = {szDesc = "Th��ng Thi�n V��ng", szName="X�ch L�n V� ��ch Y�u Tr�y",tbProp={0,2563},nQuality=1,},
		[6] = {szDesc = "�ao Thi�n V��ng", szName="X�ch L�n L�i ��nh Y�u Tr�y",tbProp={0,2573},nQuality=1,},
		[7] = {szDesc = "Nga My Ki�m", szName="X�ch L�n Tuy�t �nh H��ng Nang",tbProp={0,2583},nQuality=1,},
		[8] = {szDesc = "Nga My Ch��ng", szName="X�ch L�n V�n Anh H��ng Nang",tbProp={0,2593},nQuality=1,},
		[9] = {szDesc = "Th�y Y�n ��n �ao", szName="X�ch L�n Minh Nguy�t H��ng Nang",tbProp={0,2603},nQuality=1,},
		[10] = {szDesc = "Th�y Y�n n�i", szName="X�ch L�n Ph� Dung H��ng Nang",tbProp={0,2613},nQuality=1,},
		[11] = {szDesc = "Ng� ��c ch��ng", szName="X�ch L�n La S�t Y�u Tr�y",tbProp={0,2623},nQuality=1,},
		[12] = {szDesc = "Ng� ��c �ao", szName="X�ch L�n Tu La Y�u Tr�y",tbProp={0,2633},nQuality=1,},
		[13] = {szDesc = "���ng M�n phi �ao", szName="X�ch L�n C� Tinh Tr�y",tbProp={0,2643},nQuality=1,},
		[14] = {szDesc = "���ng M�n N�", szName="X�ch L�n Th��ng Lan Y�u Tr�y",tbProp={0,2653},nQuality=1,},
		[15] = {szDesc = "���ng M�n Phi Ti�u", szName="X�ch L�n T� Th�n Y�u Tr�y",tbProp={0,2663},nQuality=1,},
		[16] = {szDesc = "C�i Bang ch��ng", szName="X�ch L�n Th�a Long Y�u Tr�y",tbProp={0,2673},nQuality=1,},
		[17] = {szDesc = "C�i Bang c�n", szName="X�ch L�n Gi�ng Long Y�u Tr�y",tbProp={0,2683},nQuality=1,},
		[18] = {szDesc = "Thi�n Nh�n chi�n", szName="X�ch L�n Nhi�n Kh�n B�i",tbProp={0,2693},nQuality=1,},
		[19] = {szDesc = "Thi�n Nh�n ma", szName="X�ch L�n To�i Tinh B�i",tbProp={0,2703},nQuality=1,},
		[20] = {szDesc = "V� �ang kh�", szName="X�ch L�n Tr��ng Sinh Ng�c B�i",tbProp={0,2713},nQuality=1,},
		[21] = {szDesc = "V� �ang ki�m", szName="X�ch L�n Nh� C� Ng�c B�i",tbProp={0,2723},nQuality=1,},
		[22] = {szDesc = "�ao C�n L�n", szName="X�ch L�n C�n Vi�n B�i",tbProp={0,2733},nQuality=1,},
		[23] = {szDesc = "Ki�m C�n L�n", szName="X�ch L�n Tr��ng Kh�ng B�i",tbProp={0,2743},nQuality=1,},
	}
}
tbFormulaList[ITEMPART.ring1] = 
{
	nHeight = 1,
	nWidth = 1,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 100}},
		tbEquip = {szName = "Trang b� B�ch H� Th��ng Gi�i", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.ring1],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang B� X�ch L�n Th��ng Gi�i",
		[1] = {szDesc = "Quy�n Thi�u L�m", szName="X�ch L�n Di L�c Th��ng Gi�i",tbProp={0,2517},nQuality=1,},
		[2] = {szDesc = "C�n Thi�u L�m", szName="X�ch L�n Gi�ng Ma Th��ng Gi�i",tbProp={0,2527},nQuality=1,},
		[3] = {szDesc = "Thi�u L�m �ao", szName="X�ch L�n Y�t �� Th��ng Gi�i",tbProp={0,2537},nQuality=1,},
		[4] = {szDesc = "Ch�y Thi�n V��ng", szName="X�ch L�n Th��ng Th�ng Th��ng Gi�i",tbProp={0,2547},nQuality=1,},
		[5] = {szDesc = "Th��ng Thi�n V��ng", szName="X�ch L�n V� ��ch Th��ng Gi�i",tbProp={0,2557},nQuality=1,},
		[6] = {szDesc = "�ao Thi�n V��ng", szName="X�ch L�n L�i ��nh Th��ng Gi�i",tbProp={0,2567},nQuality=1,},
		[7] = {szDesc = "Nga My Ki�m", szName="X�ch L�n Tuy�t �nh Th��ng Gi�i",tbProp={0,2577},nQuality=1,},
		[8] = {szDesc = "Nga My Ch��ng", szName="X�ch L�n V�n Anh Th��ng Gi�i",tbProp={0,2587},nQuality=1,},
		[9] = {szDesc = "Th�y Y�n ��n �ao", szName="X�ch L�n Minh Nguy�t Th��ng Gi�i",tbProp={0,2597},nQuality=1,},
		[10] = {szDesc = "Th�y Y�n n�i", szName="X�ch L�n Ph� Dung Th��ng Gi�i",tbProp={0,2607},nQuality=1,},
		[11] = {szDesc = "Ng� ��c ch��ng", szName="X�ch L�n La S�t Th��ng Gi�i",tbProp={0,2617},nQuality=1,},
		[12] = {szDesc = "Ng� ��c �ao", szName="X�ch L�n Tu La Th��ng Gi�i",tbProp={0,2627},nQuality=1,},
		[13] = {szDesc = "���ng M�n phi �ao", szName="X�ch L�n C� Tinh Th��ng Gi�i",tbProp={0,2637},nQuality=1,},
		[14] = {szDesc = "���ng M�n N�", szName="X�ch L�n Th��ng Lan Th��ng Gi�i",tbProp={0,2647},nQuality=1,},
		[15] = {szDesc = "���ng M�n Phi Ti�u", szName="X�ch L�n T� Th�n Th��ng Gi�i",tbProp={0,2657},nQuality=1,},
		[16] = {szDesc = "C�i Bang ch��ng", szName="X�ch L�n Th�a Long Th��ng Gi�i",tbProp={0,2667},nQuality=1,},
		[17] = {szDesc = "C�i Bang c�n", szName="X�ch L�n Gi�ng Long Th��ng Gi�i",tbProp={0,2677},nQuality=1,},
		[18] = {szDesc = "Thi�n Nh�n chi�n", szName="X�ch L�n Nhi�n Kh�n Th��ng Gi�i",tbProp={0,2687},nQuality=1,},
		[19] = {szDesc = "Thi�n Nh�n ma", szName="X�ch L�n To�i Tinh Th��ng Gi�i",tbProp={0,2697},nQuality=1,},
		[20] = {szDesc = "V� �ang kh�", szName="X�ch L�n Tr��ng Sinh Th��ng Gi�i",tbProp={0,2707},nQuality=1,},
		[21] = {szDesc = "V� �ang ki�m", szName="X�ch L�n Nh� C� Th��ng Gi�i",tbProp={0,2717},nQuality=1,},
		[22] = {szDesc = "�ao C�n L�n", szName="X�ch L�n C�n Vi�n Th��ng Gi�i",tbProp={0,2727},nQuality=1,},
		[23] = {szDesc = "Ki�m C�n L�n", szName="X�ch L�n Tr��ng Kh�ng Th��ng Gi�i",tbProp={0,2737},nQuality=1,},
	}
}
tbFormulaList[ITEMPART.ring2] = 
{
	nHeight = 1,
	nWidth = 1,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 100}},
		tbEquip = {szName = "Trang b� B�ch H� H� Gi�i", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.ring2],  nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang B� X�ch L�n H� Gi�i",
		[1] = {szDesc = "Quy�n Thi�u L�m", szName="X�ch L�n Di L�c H� Gi�i",tbProp={0,2524},nQuality=1,},
		[2] = {szDesc = "C�n Thi�u L�m", szName="X�ch L�n Gi�ng Ma H� Gi�i",tbProp={0,2534},nQuality=1,},
		[3] = {szDesc = "Thi�u L�m �ao", szName="X�ch L�n Y�t �� H� Gi�i",tbProp={0,2544},nQuality=1,},
		[4] = {szDesc = "Ch�y Thi�n V��ng", szName="X�ch L�n Th��ng Th�ng H� Gi�i",tbProp={0,2554},nQuality=1,},
		[5] = {szDesc = "Th��ng Thi�n V��ng", szName="X�ch L�n V� ��ch H� Gi�i",tbProp={0,2564},nQuality=1,},
		[6] = {szDesc = "�ao Thi�n V��ng", szName="X�ch L�n L�i ��nh H� Gi�i",tbProp={0,2574},nQuality=1,},
		[7] = {szDesc = "Nga My Ki�m", szName="X�ch L�n Tuy�t �nh H� Gi�i",tbProp={0,2584},nQuality=1,},
		[8] = {szDesc = "Nga My Ch��ng", szName="X�ch L�n V�n Anh H� Gi�i",tbProp={0,2594},nQuality=1,},
		[9] = {szDesc = "Th�y Y�n ��n �ao", szName="X�ch L�n Minh Nguy�t H� Gi�i",tbProp={0,2604},nQuality=1,},
		[10] = {szDesc = "Th�y Y�n n�i", szName="X�ch L�n Ph� Dung H� Gi�i",tbProp={0,2614},nQuality=1,},
		[11] = {szDesc = "Ng� ��c ch��ng", szName="X�ch L�n La S�t H� Gi�i",tbProp={0,2624},nQuality=1,},
		[12] = {szDesc = "Ng� ��c �ao", szName="X�ch L�n Tu La H� Gi�i",tbProp={0,2634},nQuality=1,},
		[13] = {szDesc = "���ng M�n phi �ao", szName="X�ch L�n C� Tinh H� Gi�i",tbProp={0,2644},nQuality=1,},
		[14] = {szDesc = "���ng M�n N�", szName="X�ch L�n Th��ng Lan H� Gi�i",tbProp={0,2654},nQuality=1,},
		[15] = {szDesc = "���ng M�n Phi Ti�u", szName="X�ch L�n T� Th�n H� Gi�i",tbProp={0,2664},nQuality=1,},
		[16] = {szDesc = "C�i Bang ch��ng", szName="X�ch L�n Th�a Long H� Gi�i",tbProp={0,2674},nQuality=1,},
		[17] = {szDesc = "C�i Bang c�n", szName="X�ch L�n Gi�ng Long H� Gi�i",tbProp={0,2684},nQuality=1,},
		[18] = {szDesc = "Thi�n Nh�n chi�n", szName="X�ch L�n Nhi�n Kh�n H� Gi�i",tbProp={0,2694},nQuality=1,},
		[19] = {szDesc = "Thi�n Nh�n ma", szName="X�ch L�n To�i Tinh H� Gi�i",tbProp={0,2704},nQuality=1,},
		[20] = {szDesc = "V� �ang kh�", szName="X�ch L�n Tr��ng Sinh H� Gi�i",tbProp={0,2714},nQuality=1,},
		[21] = {szDesc = "V� �ang ki�m", szName="X�ch L�n Nh� C� H� Gi�i",tbProp={0,2724},nQuality=1,},
		[22] = {szDesc = "�ao C�n L�n", szName="X�ch L�n C�n Vi�n H� Gi�i",tbProp={0,2734},nQuality=1,},
		[23] = {szDesc = "Ki�m C�n L�n", szName="X�ch L�n Tr��ng Kh�ng H� Gi�i",tbProp={0,2744},nQuality=1,},
	}
}
tbFormulaList[ITEMPART.weapon] = 
{
	nHeight = 4,
	nWidth = 2,
	tbMaterial = 
	{
		tbCommonMaterial = COMMON_MATERIAL,
		tbAdditivelMaterial = ADDITIVE_MATERIAL,
		tbFragment = {{szName = EQUIP_FRAGMENT.szName, tbProp = EQUIP_FRAGMENT.tbProp, nCount = 200}},
		tbEquip = {szName = "Trang b� B�ch H� V� Kh�", tbEqIndex = BAIHU_EQUIP_INDEX[ITEMPART.weapon], nCount = 1}
	},
	tbProduct = 
	{
		szName = "Trang B� X�ch L�n V� Kh�",
		[1] = {szDesc = "Quy�n Thi�u L�m", szName="X�ch L�n Di L�c Tri�n Th�",tbProp={0,2521},nQuality=1,},
		[2] = {szDesc = "C�n Thi�u L�m", szName="X�ch L�n Gi�ng Ma T�ng C�n",tbProp={0,2531},nQuality=1,},
		[3] = {szDesc = "Thi�u L�m �ao", szName="X�ch L�n Y�t �� Gi�i �ao",tbProp={0,2541},nQuality=1,},
		[4] = {szDesc = "Ch�y Thi�n V��ng", szName="X�ch L�n Th��ng Th�ng Ch�y",tbProp={0,2551},nQuality=1,},
		[5] = {szDesc = "Th��ng Thi�n V��ng", szName="X�ch L�n V� ��ch Th��ng",tbProp={0,2561},nQuality=1,},
		[6] = {szDesc = "�ao Thi�n V��ng", szName="X�ch L�n L�i ��nh B�o �ao",tbProp={0,2571},nQuality=1,},
		[7] = {szDesc = "Nga My Ki�m", szName="X�ch L�n Tuy�t �nh Tr��ng Ki�m",tbProp={0,2581},nQuality=1,},
		[8] = {szDesc = "Nga My Ch��ng", szName="X�ch L�n V�n Anh Tri�n Th�",tbProp={0,2591},nQuality=1,},
		[9] = {szDesc = "Th�y Y�n ��n �ao", szName="X�ch L�n Minh Nguy�t �ao",tbProp={0,2601},nQuality=1,},
		[10] = {szDesc = "Th�y Y�n n�i", szName="X�ch L�n Ph� Dung Song Nh�n",tbProp={0,2611},nQuality=1,},
		[11] = {szDesc = "Ng� ��c ch��ng", szName="X�ch L�n La S�t Tri�n Th�",tbProp={0,2621},nQuality=1,},
		[12] = {szDesc = "Ng� ��c �ao", szName="X�ch L�n Tu La B�o �ao",tbProp={0,2631},nQuality=1,},
		[13] = {szDesc = "���ng M�n phi �ao", szName="X�ch L�n C� Tinh Phi �ao",tbProp={0,2641},nQuality=1,},
		[14] = {szDesc = "���ng M�n N�", szName="X�ch L�n Th��ng Lan T� Ti�n",tbProp={0,2651},nQuality=1,},
		[15] = {szDesc = "���ng M�n Phi Ti�u", szName="X�ch L�n T� Th�n Phi Ti�u",tbProp={0,2661},nQuality=1,},
		[16] = {szDesc = "C�i Bang ch��ng", szName="X�ch L�n Th�a Long Tri�n Th�",tbProp={0,2671},nQuality=1,},
		[17] = {szDesc = "C�i Bang c�n", szName="X�ch L�n Gi�ng Long B�ng",tbProp={0,2681},nQuality=1,},
		[18] = {szDesc = "Thi�n Nh�n chi�n", szName="X�ch L�n Nhi�n Kh�n Th��ng",tbProp={0,2691},nQuality=1,},
		[19] = {szDesc = "Thi�n Nh�n ma", szName="X�ch L�n To�i Tinh �ao",tbProp={0,2701},nQuality=1,},
		[20] = {szDesc = "V� �ang kh�", szName="X�ch L�n Tr��ng Sinh Ki�m",tbProp={0,2711},nQuality=1,},
		[21] = {szDesc = "V� �ang ki�m", szName="X�ch L�n Nh� C� Ki�m",tbProp={0,2721},nQuality=1,},
		[22] = {szDesc = "�ao C�n L�n", szName="X�ch L�n C�n Vi�n �ao",tbProp={0,2731},nQuality=1,},
		[23] = {szDesc = "Ki�m C�n L�n", szName="X�ch L�n Tr��ng Kh�ng Ki�m",tbProp={0,2741},nQuality=1,},
	}
}