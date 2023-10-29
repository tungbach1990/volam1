Include("\\vng_script\\activitysys\\config\\1025\\variables.lua")

tbAward_TuiNguyenLieu = {
	{szName="���ng", tbProp={6,1,30260,1,0,0},nCount=1,nRate=25,nBindState=-2, nExpiredTime=DATE_END},
	{szName="Tr�ng", tbProp={6,1,30261,1,0,0}, nCount=1,nRate=25,nBindState=-2, nExpiredTime=DATE_END},
	{szName="B�t", tbProp={6,1,30262,1,0,0}, nCount=1,nRate=25,nBindState=-2, nExpiredTime=DATE_END},
	{szName="S�a", tbProp={6,1,30263,1,0,0}, nCount=1,nRate=25,nBindState=-2, nExpiredTime=DATE_END},
}

tbAward_BanhSinhNhat = {
	{szName="Qu� M�ng Sinh Nh�t", tbProp={6,1,30265,1,0,0},nRate=0.5,nBindState=-2,  nExpiredTime=DATE_END},
	{szName = "�i�m Kinh Nghi�m", nExp=20000,nRate=50},
	{szName = "�i�m Kinh Nghi�m", nExp=50000,nRate=30},
	{szName = "�i�m Kinh Nghi�m", nExp=100000,nRate=15},
	{szName = "�i�m Kinh Nghi�m", nExp=200000,nRate=4.5},	
}

--phan thuong su dung Tui Qua SN
tbAward_TuiQuaSinhNhat = {
	{szName="Ti�n Th�o L� ",tbProp={6,1,71,1,0,0},nCount=1,nRate=1.1,nExpiredTime=43200},
	{szName="Thi�t La H�n",tbProp={6,1,23,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="Thi�t La H�n L� Bao",tbProp={6,1,1665,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName="N�n H�nh Ph�c",tbProp={6,1,1098,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName="N�n B�t tr�n ph�c nguy�t",tbProp={6,1,1817,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	{szName=" �� ph� Ho�ng Kim - An Bang C�c Hoa Th�ch Ch� ho�n",tbProp={0,165},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - An Bang �i�n Ho�ng Th�ch Ng�c B�i",tbProp={0,166},nCount=1,nRate=0.07,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - An Bang K� Huy�t Th�ch Gi�i Ch� ",tbProp={0,167},nCount=1,nRate=0.05,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - An Bang B�ng Tinh Th�ch H�ng Li�n",tbProp={0,164},nCount=1,nRate=0.006,nQuality = 1,},
	{szName="[Ho�n M�] An Bang B�ng Tinh Th�ch H�ng Li�n",tbProp={0,210},nCount=1,nRate=0.001,nQuality = 1,},
	{szName="[Ho�n M�] An Bang �i�n Ho�ng Th�ch Ng�c B�i",tbProp={0,212},nCount=1,nRate=0.01,nQuality = 1,},
	{szName="[Ho�n M�] An Bang K� Huy�t Th�ch Gi�i Ch�",tbProp={0,213},nCount=1,nRate=0.01,nQuality = 1,},
	{szName="[Ho�n M�] An Bang C�c Hoa Th�ch Ch� Ho�n",tbProp={0,211},nCount=1,nRate=0.01,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - ��nh Qu�c Ng�n T�m Y�u ��i",tbProp={0,163},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - ��nh Qu�c T� ��ng H� uy�n",tbProp={0,162},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - ��nh Qu�c � Sa Ph�t Qu�n",tbProp={0,160},nCount=1,nRate=0.07,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - ��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",tbProp={0,161},nCount=1,nRate=0.1,nQuality = 1,},
	{szName=" �� ph� Ho�ng Kim - ��nh Qu�c Thanh Sa Tr��ng Sam",tbProp={0,159},nCount=1,nRate=0.08,nQuality = 1,},
	{szName = "�i�m Kinh Nghi�m", nExp=20000,nRate=45},
	{szName = "�i�m Kinh Nghi�m", nExp=50000,nRate=20},
	{szName = "�i�m Kinh Nghi�m", nExp=100000,nRate=17},
	{szName = "�i�m Kinh Nghi�m", nExp=200000,nRate=10},
	{szName = "�i�m Kinh Nghi�m", nExp=300000,nRate=4.793},	
}

tbAward_Limit = --Phan thuong co dinh dat moc
{
	["100"] 	= {{szName = "�i�m Kinh Nghi�m", nExp=10000000,},},
	["800"] 	= {{szName = "�i�m Kinh Nghi�m", nExp=30000000,},},
}
