Include("\\vng_script\\activitysys\\config\\1031\\variables.lua")

tbAward_HopLDKeoQuan = {
	{szName="L�ng ��n k�o qu�n", tbProp={6,1,30308,1,0,0},nCount=1,nExpiredTime=DATE_END}
}

tbAward_HopLDBuomBuom = {
	{szName="L�ng ��n b��m b��m", tbProp={6,1,30307,1,0,0},nCount=5,nExpiredTime=DATE_END}
}

tbAward_ThaHoaDang = {
			{szName = "�i�m Kinh Nghi�m", nExp=200000,nRate=95},
			{szName = "Tinh H�ng B�o Th�ch", tbProp = {4, 353, 1, 1, 0, 0},nCount=1,nRate=1},
			{szName="Thi�t La H�n L� Bao",tbProp={6,1,1665,1,0,0},nCount=1,nRate=1,nExpiredTime=7*24*60},
			{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=1,nRate=1,nExpiredTime=7*24*60},
			{szName="Thi�n C� L�nh",tbProp={6,1,4625,1,0,0},nCount=1,nRate=1,nExpiredTime=7*24*60},
			{szName="C�u Thi�n Linh D��c",tbProp={6,1,4632,1,0,0},nCount=1,nRate=1,nExpiredTime=7*24*60},
}
tbAwardExpLDKQ = {
	{szName = "�i�m Kinh Nghi�m", nExp=50000,},
}
tbAward_Question = {	
			{szName="L�ng ��n �ng", tbProp={6,1,30309,1,0,0},nCount=1,nExpiredTime=DATE_END},
			{szName="L�ng ��n tr�n", tbProp={6,1,30310,1,0,0},nCount=1,nExpiredTime=DATE_END},
			{szName="L�ng ��n ng�i sao", tbProp={6,1,30311,1,0,0},nCount=1,nExpiredTime=DATE_END},	
}

tbAward_DebBu_HHD = {
	{szName="Hoa h�ng ��", tbProp={6,1,30299,1,0,0},nCount=250,nExpiredTime=DATE_END,nBindState=-2},
}

tbAward_Use_MinhNguyet = {
			{szName = "�i�m Kinh Nghi�m", nExp=15000,},
}

tbAward_Use_VienNguyet ={	
		{szName = "�i�m Kinh Nghi�m", nExp=20000,nRate=50},
		{szName = "�i�m Kinh Nghi�m", nExp=25000,nRate=30},
		{szName = "�i�m Kinh Nghi�m", nExp=30000,nRate=19},
		{szName="B�nh Trung Thu Ho�ng Nguy�t", tbProp={6,1,30306,1,0,0},nCount=1,nRate=1,nExpiredTime=DATE_END},
}

--phan thuong moc  
tbAward_Limit_VienNguyet = {
	["500"]= {{szName = "�i�m Kinh Nghi�m", nExp=10000000,},},
	["1000"]= {{szName = "�i�m Kinh Nghi�m", nExp=15000000,},},	
}

tbAward_Limit_HoangNguyet = {
	["500"]= {{szName = "�i�m Kinh Nghi�m", nExp=30000000,},},
	["1000"]= {
						{szName = "�i�m Kinh Nghi�m", nExp=40000000,nRate=97.5},
						{szName="Ph�ng Nguy�t Qu� Dung",tbProp={6,1,127,1,0,0},nCount=1,nRate=1,nExpiredTime=30*24*60},
						{szName="C�ng Nguy�t Ph� Dung",tbProp={6,1,128,1,0,0},nCount=1,nRate=1,nExpiredTime=30*24*60},
						{szName="[Ho�n M�] An Bang B�ng Tinh Th�ch H�ng Li�n",tbProp={0,210},nCount=1,nRate=0.5,nQuality = 1,},
					},	
}

--Phan thuong server All
tbAward_Use_HoangNguyet = {	
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
	{szName=" �� ph� Ho�ng Kim - An Bang B�ng Tinh Th�ch H�ng Li�n",tbProp={0,164},nCount=1,nRate=0.01,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - An Bang C�c Hoa Th�ch Ch� ho�n",tbProp={0,165},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - An Bang �i�n Ho�ng Th�ch Ng�c B�i",tbProp={0,166},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - An Bang K� Huy�t Th�ch Gi�i Ch� ",tbProp={0,167},nCount=1,nRate=0.1,nQuality = 1,},
	{szName="Thi�n Ni�n Linh D��c",tbProp={6,1,4631,1,0,0},nCount=1,nRate=1,nExpiredTime=7*24*60},
	{szName="C�u Thi�n Linh D��c",tbProp={6,1,4632,1,0,0},nCount=1,nRate=0.5,nExpiredTime=7*24*60},
	{szName="L�ng ��n k�o qu�n",tbProp={6,1,30308,1,0,0},nCount=1,nRate=1,nExpiredTime=DATE_END},
	{szName="Ng�c L�c B�o",tbProp={6,1,30566,1,0,0},nCount=5,nRate=5},
	{szName="Ng�c L�c B�o",tbProp={6,1,30566,1,0,0},nCount=6,nRate=4},
	{szName="Ng�c L�c B�o",tbProp={6,1,30566,1,0,0},nCount=7,nRate=3},
	{szName="Ng�c L�c B�o",tbProp={6,1,30566,1,0,0},nCount=8,nRate=2},
	{szName="H�ng �nh Th�m Vi�n Uy�n",tbProp={0,204},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="H�ng �nh Ki�m B�i",tbProp={0,205},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="H�ng �nh M�c T�c",tbProp={0,206},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="H�ng �nh T� Chi�u",tbProp={0,207},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="C� t��i",tbProp={6,1,30567,1,0,0},nCount=1,nRate=0.004},
	{szName="B�y ng�a",tbProp={6,1,30569,1,0,0},nCount=1,nRate=0.004},
	{szName="D�y th�ng",tbProp={6,1,30570,1,0,0},nCount=1,nRate=0.004},
	{szName="Y�n c��ng",tbProp={6,1,30571,1,0,0},nCount=1,nRate=0.004},
	{szName="Roi ng�a",tbProp={6,1,30572,1,0,0},nCount=1,nRate=0.004},
	{szName = "�i�m Kinh Nghi�m", nExp=70000,nRate=35},
	{szName = "�i�m Kinh Nghi�m", nExp=100000,nRate=25},
	{szName = "�i�m Kinh Nghi�m", nExp=150000,nRate=10},
	{szName = "�i�m Kinh Nghi�m", nExp=200000,nRate=4},
	{szName = "�i�m Kinh Nghi�m", nExp=300000,nRate=2.586},
}
