Include("\\vng_script\\activitysys\\config\\1030\\variables.lua")

tbAward_Use_HOP_VANNIEN_TL= {
	{szName="V�n Ni�n Tr�n L�", tbProp={6,1,30415,1,0,0},nCount=100,nExpiredTime=DATE_END},
}

tbAward_Use_BACHNIEN_TL = {
	{szName = "�i�m Kinh Nghi�m: 30000", nExp=30000,},
}

tbAward_Use_THIENNIEN_TL ={	
		{szName = "�i�m Kinh Nghi�m", nExp=30000,nRate=50},
		{szName = "�i�m Kinh Nghi�m", nExp=40000,nRate=30},
		{szName = "�i�m Kinh Nghi�m", nExp=50000,nRate=20 },		
}

--phan thuong moc
tbAward_Limit_ThienNienTL = {
	["1000"]= {{szName = "�i�m Kinh Nghi�m", nExp=20000000,},},
	["1500"]= {{szName = "�i�m Kinh Nghi�m", nExp=25000000,},},	
}

tbAward_Limit_VanNienTL = {
	["500"]= {{szName = "�i�m Kinh Nghi�m", nExp=40000000,},},
	["1000"]= {	
						{						
							{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=97.5},
							{szName="Ph�ng Nguy�t Qu� Dung",tbProp={6,1,127,1,0,0},nCount=1,nRate=1,nExpiredTime=30*24*60},
							{szName="C�ng Nguy�t Ph� Dung",tbProp={6,1,128,1,0,0},nCount=1,nRate=1,nExpiredTime=30*24*60},
							{szName="[Ho�n M�] An Bang B�ng Tinh Th�ch H�ng Li�n",tbProp={0,210},nCount=1,nRate=0.5,nQuality = 1,},											
						},
						{
							{szName="�� V� C�c",tbProp={6,1,30550,1,0,0},nCount=1,nExpiredTime=7*24*60},
						},
	},
	["2000"]= {						
						{szName = "�i�m Kinh Nghi�m", nExp=100000000,},						
						{szName="�� V� C�c",tbProp={6,1,30550,1,0,0},nCount=1,nExpiredTime=7*24*60},
					},
	["3000"]= {						
						{szName = "�i�m Kinh Nghi�m", nExp=150000000,},			
						{szName="�� V� C�c",tbProp={6,1,30550,1,0,0},nCount=1,nExpiredTime=7*24*60},
					},
}

--Phan thuong server All
tbAward_Use_VanNienTL = {	
	{szName="Ti�n Th�o L� ",tbProp={6,1,71,1,0,0},nCount=1,nRate=2,nExpiredTime=43200},
	{szName="Thi�t La H�n",tbProp={6,1,23,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="Thi�t La H�n L� Bao",tbProp={6,1,1665,1,0,0},nCount=1,nRate=0.4,nExpiredTime=43200},
	{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
	{szName="Thi�n C� L�nh",tbProp={6,1,4625,1,0,0},nCount=1,nRate=0.5,nExpiredTime=10080},
	{szName="Dao Quang L�nh",tbProp={6,1,4626,1,0,0},nCount=1,nRate=1,nExpiredTime=10080},
	{szName=" �� ph� Ho�ng Kim - ��nh Qu�c Thanh Sa Tr��ng Sam",tbProp={0,159},nCount=1,nRate=0.2,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - ��nh Qu�c � Sa Ph�t Qu�n",tbProp={0,160},nCount=1,nRate=0.08,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - ��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",tbProp={0,161},nCount=1,nRate=0.3,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - ��nh Qu�c T� ��ng H� uy�n",tbProp={0,162},nCount=1,nRate=0.3,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - ��nh Qu�c Ng�n T�m Y�u ��i",tbProp={0,163},nCount=1,nRate=0.3,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - An Bang B�ng Tinh Th�ch H�ng Li�n",tbProp={0,164},nCount=1,nRate=0.005,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - An Bang C�c Hoa Th�ch Ch� ho�n",tbProp={0,165},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - An Bang �i�n Ho�ng Th�ch Ng�c B�i",tbProp={0,166},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - An Bang K� Huy�t Th�ch Gi�i Ch� ",tbProp={0,167},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="Huy�n Kim Th�ch",tbProp={6,1,30361,1,0,0},nCount=1,nRate=3.5,nExpiredTime=DATE_END,},
	{szName="Ho�ng Kim Th�ch",tbProp={6,1,30362,1,0,0},nCount=1,nRate=0.2,nExpiredTime=DATE_END,},
	{szName="Kim Quang th�ch",tbProp={6,1,30386,1,0,0},nCount=1,nRate=3.5,nExpiredTime=DATE_END,},
	{szName="�� V� C�c",tbProp={6,1,30550,1,0,0},nCount=1,nRate=0.001,nExpiredTime=10080},
	{szName="Thi�n Ni�n Linh D��c",tbProp={6,1,4631,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
	{szName="C�u Thi�n Linh D��c",tbProp={6,1,4632,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="Ng�c L�c B�o",tbProp={6,1,30566,1,0,0},nCount=5,nRate=4},
	{szName="Ng�c L�c B�o",tbProp={6,1,30566,1,0,0},nCount=6,nRate=3},
	{szName="Ng�c L�c B�o",tbProp={6,1,30566,1,0,0},nCount=7,nRate=2},
	{szName="Ng�c L�c B�o",tbProp={6,1,30566,1,0,0},nCount=8,nRate=1},
	{szName="��ng S�t B�ch Kim �i�u Long Gi�i",tbProp={0,143},nCount=1,nRate=0.005,nQuality = 1,},
	{szName="��ng S�t B�ch Ng�c C�n Kh�n B�i",tbProp={0,144},nCount=1,nRate=0.005,nQuality = 1,},
	{szName="��ng S�t B�ch Kim T� Ph�ng Gi�i",tbProp={0,145},nCount=1,nRate=0.005,nQuality = 1,},
	{szName="��ng S�t Ph� Th�y Ng�c H�ng Khuy�n",tbProp={0,146},nCount=1,nRate=0.005,nQuality = 1,},
	{szName="H�ng �nh Th�m Vi�n Uy�n",tbProp={0,204},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="H�ng �nh Ki�m B�i",tbProp={0,205},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="H�ng �nh M�c T�c",tbProp={0,206},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="H�ng �nh T� Chi�u",tbProp={0,207},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="C� t��i",tbProp={6,1,30567,1,0,0},nCount=1,nRate=0.004},
	{szName="B�y ng�a",tbProp={6,1,30569,1,0,0},nCount=1,nRate=0.004},
	{szName="D�y th�ng",tbProp={6,1,30570,1,0,0},nCount=1,nRate=0.004},
	{szName="Y�n c��ng",tbProp={6,1,30571,1,0,0},nCount=1,nRate=0.004},
	{szName="Roi ng�a",tbProp={6,1,30572,1,0,0},nCount=1,nRate=0.004},
	{szName = "�i�m Kinh Nghi�m", nExp=70000,nRate=34},
	{szName = "�i�m Kinh Nghi�m", nExp=100000,nRate=25},
	{szName = "�i�m Kinh Nghi�m", nExp=150000,nRate=9},
	{szName = "�i�m Kinh Nghi�m", nExp=200000,nRate=4},
	{szName = "�i�m Kinh Nghi�m", nExp=300000,nRate=2.37},
}
