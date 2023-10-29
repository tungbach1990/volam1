
BingoMachine = {}

S2C_RESULT = 1
S2C_DATA = 2


C2S_OPERATION_ROTATE = 1
C2S_OPERATION_AWARD = 2
C2S_OPERATION_OPEN = 3
C2S_OPERATION_SHOP = 4

ROTATE_SUCCESS = 0
ROTATE_ERROR_STATUS = 1
ROTATE_ERROR_PRINING = 2

S2C_GET_AWARD_SUCCESS = 0
S2C_GET_AWARD_ERR_NO_SPACE = 1
S2C_GET_AWARD_ERR_OTHER = 2



AWARD_TYPE =
{
	[1] = "A",
	[2] = "B",
	[3] = "C",
	[4] = "D",
	[5] = "E",
}

ODDS2COIN = 
{
	[1] = {1, 2},
	[2] = {5, 10},
	[3] = {10, 20},
}

tbBingoMachineAward = { 
	[1] = {szName = "Long L�nh K�", 
		[1] = {	
			[1]={szName="Long L�nh K�",tbProp={6,1,3056,1,0,0}, nCount=1},
			[2]={szName="Long L�nh K�",tbProp={6,1,3056,1,0,0}, nCount=3},
			[3]={szName="Long L�nh K�",tbProp={6,1,3056,1,0,0}, nCount=10},
			[4]={szName="Long L�nh K�",tbProp={6,1,3056,1,0,0}, nCount=35},
			[5]={szName="Long L�nh K�",tbProp={6,1,3056,1,0,0}, nCount=120},
	  	[6]={szName="Long L�nh K�",tbProp={6,1,3056,1,0,0}, nCount=400},}, 
		[2] = {1, 3, 10, 35, 120, 400}},
	[2] = {szName = "L�n L�nh K�", 
		[1] = {	
			[1]={szName="L�n L�nh K�",tbProp={6,1,3057,1,0,0}, nCount=1},
			[2]={szName="L�n L�nh K�",tbProp={6,1,3057,1,0,0}, nCount=3},
			[3]={szName="L�n L�nh K�",tbProp={6,1,3057,1,0,0}, nCount=10},
			[4]={szName="L�n L�nh K�",tbProp={6,1,3057,1,0,0}, nCount=35},
			[5]={szName="L�n L�nh K�",tbProp={6,1,3057,1,0,0}, nCount=120},
	  	[6]={szName="L�n L�nh K�",tbProp={6,1,3057,1,0,0}, nCount=400},}, 
		[2] = {1, 3, 10, 35, 120, 400}},
	[3] ={szName = "Ph�ng L�nh K�", 
		[1] = {	
			[1]={szName="Ph�ng L�nh K�",tbProp={6,1,3058,1,0,0}, nCount=1},
			[2]={szName="Ph�ng L�nh K�",tbProp={6,1,3058,1,0,0}, nCount=3},
			[3]={szName="Ph�ng L�nh K�",tbProp={6,1,3058,1,0,0}, nCount=10},
			[4]={szName="Ph�ng L�nh K�",tbProp={6,1,3058,1,0,0}, nCount=35},
			[5]={szName="Ph�ng L�nh K�",tbProp={6,1,3058,1,0,0}, nCount=120},
	  	[6]={szName="Ph�ng L�nh K�",tbProp={6,1,3058,1,0,0}, nCount=400},}, 
		[2] = {1, 3, 10, 35, 120, 400}},
	[4] ={szName = "Quy L�nh K�", 
		[1] = {	
			[1]={szName="Quy L�nh K�",tbProp={6,1,3059,1,0,0}, nCount=1},
			[2]={szName="Quy L�nh K�",tbProp={6,1,3059,1,0,0}, nCount=3},
			[3]={szName="Quy L�nh K�",tbProp={6,1,3059,1,0,0}, nCount=10},
			[4]={szName="Quy L�nh K�",tbProp={6,1,3059,1,0,0}, nCount=35},
			[5]={szName="Quy L�nh K�",tbProp={6,1,3059,1,0,0}, nCount=120},
	  	[6]={szName="Quy L�nh K�",tbProp={6,1,3059,1,0,0}, nCount=400},}, 
		[2] = {1, 3, 10, 35, 120, 400}},
	[5] = {szName = "KindBox", 
		[1] = {	
			[1]={szName="Qu� Tr�ng B�o R��ng",tbProp={6,1,3053,1,0,0}, nCount=1, nExpiredTime = 43200},
			[2]={szName="Tinh M� B�o R��ng",tbProp={6,1,3054,1,0,0}, nCount=1, nExpiredTime = 43200},},
		[2] = {20, 80}},		
}
tbBingoMachineAwardSpace = {
	[1] = {nWidth = 1, nHeight = 1, nFreeItemCellLimit = 0.005},
	[2] = {nWidth = 1, nHeight = 1, nFreeItemCellLimit = 0.005},
	[3] = {nWidth = 1, nHeight = 1, nFreeItemCellLimit = 0.005},
	[4] = {nWidth = 1, nHeight = 1, nFreeItemCellLimit = 0.005},
  [5] = {nWidth = 1, nHeight = 1, nFreeItemCellLimit = 1}}
	
tbEquipList = 
{
	[1] = 
	{
		[1]={szName="Kim � C�m Lan T�ng M�o",tbProp={0,2056,},nQuality=1,},
		[2]={szName="Kim � Gi� Lam T�ng M�o",tbProp={0,2066,},nQuality=1,},
		[3]={szName="Kim � B�n Nh��c T�ng M�o",tbProp={0,2076,},nQuality=1,},
		[4]={szName="Kim � Ch�n Nh�c Kh�i",tbProp={0,2086,},nQuality=1,},
		[5]={szName="Kim � Chi�u ��m Kh�i",tbProp={0,2096,},nQuality=1,},
		[6]={szName="Kim � L�ch Huy�t Kh�i",tbProp={0,2106,},nQuality=1,},
		[7]={szName="Kim � V� � Ph�t ��i",tbProp={0,2116,},nQuality=1,},
		[8]={szName="Kim � Ng�ng S��ng Ph�t ��i",tbProp={0,2126,},nQuality=1,},
		[9]={szName="Kim � �inh H��ng Tr�m",tbProp={0,2136,},nQuality=1,},
		[10]={szName="Kim � Anh L�c Tr�m",tbProp={0,2146,},nQuality=1,},
		[11]={szName="Kim � U Minh Ph�t ��i",tbProp={0,2156,},nQuality=1,},
		[12]={szName="Kim � Man �� Ph�t ��i",tbProp={0,2166,},nQuality=1,},
		[13]={szName="Kim � Tuy�t T�nh Qu�n",tbProp={0,2176,},nQuality=1,},
		[14]={szName="Kim � B�ch L�c Qu�n",tbProp={0,2186,},nQuality=1,},
		[15]={szName="Kim � T�ch L�ch Ph�t Qu�n",tbProp={0,2196,},nQuality=1,},
		[16]={szName="Kim � Thi�t C�t ��u Ho�n",tbProp={0,2206,},nQuality=1,},
		[17]={szName="Kim � Long Huy�t ��u Ho�n",tbProp={0,2216,},nQuality=1,},
		[18]={szName="Kim � D�ng Phong Kh�i",tbProp={0,2226,},nQuality=1,},
		[19]={szName="Kim � �nh Huy�t Qu�n Mi�n",tbProp={0,2236,},nQuality=1,},
		[20]={szName="Kim � L�c H�p Qu�n",tbProp={0,2246,},nQuality=1,},
		[21]={szName="Kim � Th�i H�a Qu�n",tbProp={0,2256,},nQuality=1,},
		[22]={szName="Kim � Nguy�t �nh ��o Qu�n",tbProp={0,2266,},nQuality=1,},
		[23]={szName="Kim � T��ng V�n ��o Qu�n",tbProp={0,2276,},nQuality=1,},
	},
	[2] = 
	{
		[1]={szName="Kim � C�m Lan C� Sa",tbProp={0,2060,},nQuality=1,},
		[2]={szName="Kim � Gi� Lam C� Sa",tbProp={0,2070,},nQuality=1,},
		[3]={szName="Kim � B�n Nh��c C� Sa",tbProp={0,2080,},nQuality=1,},
		[4]={szName="Kim � Ch�n Nh�c Kh�i",tbProp={0,2090,},nQuality=1,},
		[5]={szName="Kim � Chi�u ��m Kh�i",tbProp={0,2100,},nQuality=1,},
		[6]={szName="Kim � L�ch Huy�t Kh�i",tbProp={0,2110,},nQuality=1,},
		[7]={szName="Kim � V� � Sa Y",tbProp={0,2120,},nQuality=1,},
		[8]={szName="Kim � Ng�ng S��ng Sam",tbProp={0,2130,},nQuality=1,},
		[9]={szName="Kim � �inh H��ng Sam",tbProp={0,2140,},nQuality=1,},
		[10]={szName="Kim � Anh L�c Sam",tbProp={0,2150,},nQuality=1,},
		[11]={szName="Kim � U Minh C�t Y",tbProp={0,2160,},nQuality=1,},
		[12]={szName="Kim � Man �� B� Trang",tbProp={0,2170,},nQuality=1,},
		[13]={szName="Kim � Tuy�t T�nh Gi�p Y",tbProp={0,2180,},nQuality=1,},
		[14]={szName="Kim � B�ch L�c Gi�p Y",tbProp={0,2190,},nQuality=1,},
		[15]={szName="Kim � T�ch L�ch Gi�p Y",tbProp={0,2200,},nQuality=1,},
		[16]={szName="Kim � Thi�t C�t C�i Y",tbProp={0,2210,},nQuality=1,},
		[17]={szName="Kim � Long Huy�t C�i Y",tbProp={0,2220,},nQuality=1,},
		[18]={szName="Kim � D�ng Phong Gi�p Y",tbProp={0,2230,},nQuality=1,},
		[19]={szName="Kim � �nh Huy�t Gi�p",tbProp={0,2240,},nQuality=1,},
		[20]={szName="Kim � L�c H�p ��o B�o",tbProp={0,2250,},nQuality=1,},
		[21]={szName="Kim � Th�i H�a ��o B�o",tbProp={0,2260,},nQuality=1,},
		[22]={szName="Kim � Nguy�t �nh ��o B�o",tbProp={0,2270,},nQuality=1,},
		[23]={szName="Kim � T��ng V�n ��o B�o",tbProp={0,2280,},nQuality=1,},
	},}
tbEquipSize = 
{
	[1] = {nWidth = 2, nHeight = 2, nFreeItemCellLimit = 1},	-- ��
	[2] = {nWidth = 2, nHeight = 3, nFreeItemCellLimit = 1},  	-- ��
}
