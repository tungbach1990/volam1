Include("\\vng_script\\activitysys\\config\\1027\\variables.lua")

tbAward_Use_Hop_QuaGiangsSinh = {
	{szName="Hoa tuy�t", tbProp={6,1,30371,1,0,0},nCount=1,nRate=33,nExpiredTime=DATE_END},
	{szName="Chu�ng gi�ng sinh", tbProp={6,1,30373,1,0,0},nCount=1,nRate=33, nExpiredTime=DATE_END},
	{szName="Sao gi�ng sinh", tbProp={6,1,30374,1,0,0},nCount=1,nRate=34,nExpiredTime=DATE_END},	
}

--phan thuong moc  
tbAward_Limit_NguoiTuyetVang = {
	["1000"]= {{szName = "�i�m Kinh Nghi�m", nExp=15000000,},},
	["2000"]= {{szName = "�i�m Kinh Nghi�m", nExp=20000000,},},	
}

tbAward_Limit_NguoiTuyetDo = {
	["500"]= {{szName = "�i�m Kinh Nghi�m", nExp=40000000,},},
	["1000"]= {					
						{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=97.5},
						{szName="Ph�ng Nguy�t Qu� Dung",tbProp={6,1,127,1,0,0},nCount=1,nRate=1,nExpiredTime=30*24*60},
						{szName="C�ng Nguy�t Ph� Dung",tbProp={6,1,128,1,0,0},nCount=1,nRate=1,nExpiredTime=30*24*60},
						{szName="[Ho�n M�] An Bang B�ng Tinh Th�ch H�ng Li�n",tbProp={0,210},nCount=1,nRate=0.5,nQuality = 1,},
					},
}
--Phan thuong server All
tbAward_Tree ={
	[ID_THONG_TT] =  {szName = "�i�m Kinh Nghi�m", nExp=30000,},
	[ID_THONG_HK] =  {	
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
					{szName="Thi�n Ni�n Linh D��c",tbProp={6,1,4631,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
					{szName="C�u Thi�n Linh D��c",tbProp={6,1,4632,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
					{szName="��ng S�t B�ch Kim �i�u Long Gi�i",tbProp={0,143},nCount=1,nRate=0.002,nQuality = 1,},
					{szName="��ng S�t B�ch Ng�c C�n Kh�n B�i",tbProp={0,144},nCount=1,nRate=0.002,nQuality = 1,},
					{szName="��ng S�t B�ch Kim T� Ph�ng Gi�i",tbProp={0,145},nCount=1,nRate=0.002,nQuality = 1,},
					{szName="��ng S�t Ph� Th�y Ng�c H�ng Khuy�n",tbProp={0,146},nCount=1,nRate=0.002,nQuality = 1,},
					{szName="H�ng �nh Th�m Vi�n Uy�n",tbProp={0,204},nCount=1,nRate=0.001,nQuality = 1,},
					{szName="H�ng �nh Ki�m B�i",tbProp={0,205},nCount=1,nRate=0.001,nQuality = 1,},
					{szName="H�ng �nh M�c T�c",tbProp={0,206},nCount=1,nRate=0.001,nQuality = 1,},
					{szName="H�ng �nh T� Chi�u",tbProp={0,207},nCount=1,nRate=0.001,nQuality = 1,},
					{szName="C� t��i",tbProp={6,1,30567,1,0,0},nCount=1,nRate=0.002},
					{szName="B�y ng�a",tbProp={6,1,30569,1,0,0},nCount=1,nRate=0.002},
					{szName="D�y th�ng",tbProp={6,1,30570,1,0,0},nCount=1,nRate=0.002},
					{szName="Y�n c��ng",tbProp={6,1,30571,1,0,0},nCount=1,nRate=0.002},
					{szName="Roi ng�a",tbProp={6,1,30572,1,0,0},nCount=1,nRate=0.002},
					{szName = "�i�m Kinh Nghi�m", nExp=70000,nRate=37},
					{szName = "�i�m Kinh Nghi�m", nExp=100000,nRate=28},
					{szName = "�i�m Kinh Nghi�m", nExp=150000,nRate=13},
					{szName = "�i�m Kinh Nghi�m", nExp=200000,nRate=8},
					{szName = "�i�m Kinh Nghi�m", nExp=300000,nRate=5.593},		
			 },
}

local pAnnounce = function(nItemIndex)
	AddGlobalNews(format("Ch�c m�ng ��i hi�p <color=cyan>%s<color> nh�n th��ng Top 5 ng��i ��u ti�n server s� d�ng ��t m�c 1000 Ng��i tuy�t �� v� Ng��i tuy�t nh�n ���c: <color=cyan>%s<color>", GetName(), GetItemName(nItemIndex)))
end
tbAward_Top5 = {
	[1]={
				{szName="Thi�u l�m Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4552,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="���ng m�n Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4553,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="Nga my Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4554,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="V� �ang Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4555,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
				{szName="C�i bang Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4556,1,0,0},nCount=1,nRate=20,CallBack=pAnnounce},
	},
	[2]={
				{szName="Thi�n V��ng Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4547,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="Ng� ��c Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4548,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="Th�y Y�n Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4549,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="C�n l�n Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4550,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="Thi�n nh�n Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4551,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="Thi�u l�m Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4552,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="���ng m�n Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4553,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="Nga my Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4554,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="V� �ang Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4555,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
				{szName="C�i bang Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4556,1,0,0},nCount=1,nRate=10,CallBack=pAnnounce},
	},
}