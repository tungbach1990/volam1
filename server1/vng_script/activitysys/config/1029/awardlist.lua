Include("\\vng_script\\activitysys\\config\\1029\\variables.lua")

tbAward_Code ={
	[1] = {
				{szName = "Phi V�n Th�n M�", tbProp = {0,10,8,1,0,0}, nCount = 1,nExpiredTime=7*24*60,nBindState=-2},
				{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=8,nExpiredTime=7*24*60,nBindState=-2},	
				{szName = "Qu� Hoa T�u", tbProp={6,1,125,1,0,0},nCount=8,nExpiredTime=7*24*60,nBindState=-2},
				{szName="H�p qu� offline",tbProp={6,1,30379,1,0,0},nCount=5,nExpiredTime=7*24*60,nBindState=-2},
	},
	[2] = {
				{szName = "Phi V�n Th�n M�", tbProp = {0,10,8,1,0,0}, nCount = 1,nExpiredTime=14*24*60,nBindState=-2},
				{szName="M�t n� V��ng Gi�",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=7*24*60, nBindState=-2},
				{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=15,nExpiredTime=7*24*60,nBindState=-2},	
				{szName = "Qu� Hoa T�u", tbProp={6,1,125,1,0,0},nCount=15,nExpiredTime=7*24*60,nBindState=-2},
				{szName="H�p qu� offline",tbProp={6,1,30379,1,0,0},nCount=10,nExpiredTime=7*24*60,nBindState=-2},
	},
	[3] = {
				{szName = "Phi V�n Th�n M�", tbProp = {0,10,8,1,0,0}, nCount = 1,nExpiredTime=14*24*60,nBindState=-2},
				{szName="M�t n� V��ng Gi�",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=3*24*60, nBindState=-2},
				{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=15,nExpiredTime=7*24*60,nBindState=-2},	
				{szName = "Qu� Hoa T�u", tbProp={6,1,125,1,0,0},nCount=15,nExpiredTime=7*24*60,nBindState=-2},
				{szName="H�p qu� offline",tbProp={6,1,30379,1,0,0},nCount=10,nExpiredTime=7*24*60,nBindState=-2},
	},
	[4] = {
				{szName = "Phi V�n Th�n M�", tbProp = {0,10,8,1,0,0}, nCount = 1,nExpiredTime=14*24*60,nBindState=-2},
				{szName="M�t n� V��ng Gi�",tbProp={0,11,561,1,0,0},nCount=1,nExpiredTime=3*24*60, nBindState=-2},
				{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=15,nExpiredTime=7*24*60,nBindState=-2},	
				{szName = "Qu� Hoa T�u", tbProp={6,1,125,1,0,0},nCount=15,nExpiredTime=7*24*60,nBindState=-2},
				{szName="H�p qu� offline",tbProp={6,1,30379,1,0,0},nCount=20,nExpiredTime=7*24*60,nBindState=-2},
	},
	[5] = {				
				{szName="Ti�n Th�o L� ��c bi�t",tbProp={6,1,1181,1,0,0},nCount=5,nExpiredTime=7*24*60,nBindState=-2},	
				{szName = "Qu� Hoa T�u", tbProp={6,1,125,1,0,0},nCount=5,nExpiredTime=7*24*60,nBindState=-2},
				{szName="H�p qu� offline",tbProp={6,1,30379,1,0,0},nCount=5,nExpiredTime=7*24*60,nBindState=-2},
	},
}

local pAnnounce = function(nItemIndex)
	AddGlobalNews(format("Ch�c m�ng ��i hi�p <color=cyan>%s<color> m� h�p qu� offline nh�n ���c: <color=cyan>%s<color>", GetName(), GetItemName(nItemIndex)))
end
--Phan thuong doi ruong HKMP
tbAward_Offline_Box = {
			
				{szName="Thi�t La H�n",tbProp={6,1,23,1,0,0},nCount=1,nRate=12,nExpiredTime=7*24*60,nBindState=-2,},
				{szName="Thi�t La H�n L� Bao",tbProp={6,1,1665,1,0,0},nCount=1,nRate=5,nExpiredTime=7*24*60,nBindState=-2},				
				{szName="Thi�n C� L�nh",tbProp={6,1,4625,1,0,0},nCount=1,nRate=7,nExpiredTime=7*24*60,nBindState=-2},
				{szName="Dao Quang L�nh",tbProp={6,1,4626,1,0,0},nCount=1,nRate=10,nExpiredTime=7*24*60,nBindState=-2},
				{szName="Thi�n Ni�n Linh D��c",tbProp={6,1,4631,1,0,0},nCount=1,nRate=15,nExpiredTime=7*24*60,nBindState=-2},
				{szName="C�u Thi�n Linh D��c",tbProp={6,1,4632,1,0,0},nCount=1,nRate=12,nExpiredTime=7*24*60,nBindState=-2},
				
				{szName="Thi�n V��ng Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4547,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="Ng� ��c Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4548,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="Th�y Y�n Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4549,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="C�n l�n Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4550,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="Thi�n nh�n Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4551,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
	
				{szName="Thi�u l�m Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4552,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="���ng m�n Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4553,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="Nga my Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4554,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="V� �ang Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4555,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				{szName="C�i bang Ho�ng Kim Trang B� B�o R��ng (Ng�u nhi�n)", tbProp={6,1,4556,1,0,0},nCount=1,nRate=0.007,CallBack=pAnnounce},
				
				{szName = "�i�m Kinh Nghi�m", nExp=1000000,nRate=20},
				{szName = "�i�m Kinh Nghi�m", nExp=2000000,nRate=18.93},
}


