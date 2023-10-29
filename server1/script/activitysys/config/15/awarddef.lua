Include("\\script\\activitysys\\config\\15\\head.lua")
Include("\\script\\activitysys\\config\\15\\variables.lua")

local tbAward = {}
pActivity.tbAward = tbAward

-- bBroadcast: ��Ļ�м��ɫ�������ֵ������Ӹñ��ֵ���򲻻������Ļ�м��ɫ������
-- A����
tbAward["award_a"] = nil

-- B����
tbAward["award_b"] = 
{
	-- {szName="B�ch H� B�o Th�ch",tbProp={6,1,3184,1,0,0},nCount=1,nRate=0.15},
	-- {szName="B�ch H� Thi�n Th�ch",tbProp={6,1,3185,1,0,0},nCount=1,nRate=0.08},
	-- {szName="B�ch H� Th�n Th�ch",tbProp={6,1,3186,1,0,0},nCount=1,nRate=0.04,bBroadcast=1},
	-- {szName="B�ch H� L�nh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.06,bBroadcast=1},
	-- {szName="B�ch H� Kim B�i",tbProp={6,1,3183,1,0,0},nCount=1,nRate=0.05,bBroadcast=1},
	-- {szName="Huy�n Tinh Kho�ng Th�ch ",tbProp={6,1,147,9,0,0},nCount=1,nRate=0.05},
	-- {szName="T� M�ng Th�ch",tbProp={6,1,3000,1,0,0},nCount=1,nRate=0.2},
	-- {szName="Kim � Kim B�i",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.1},
	-- {szName="B�o R��ng Kim � Kh�i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.03,bBroadcast=1},
	-- {szName="B�o R��ng Kim � Y ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B�o R��ng Kim � H�i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B�o R��ng Kim � Y�u ��i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B�o R��ng Kim � H� Uy�n( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B�o R��ng Kim � H�ng Li�n( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.03,bBroadcast=1},
	-- {szName="B�o R��ng Kim � B�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.03,bBroadcast=1},
	-- {szName="B�o R��ng Kim � Th��ng Gi�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.02,bBroadcast=1},
	-- {szName="B�o R��ng Kim � H� Gi�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.02,bBroadcast=1},
	-- {szName="B�o R��ng Kim � V� Kh�( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B�ch H� Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={2,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B�ch H� Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.003,bBroadcast=1},
	-- {szName="B�ch H� H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B�ch H� H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B�ch H� Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={9,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B�ch H� H�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B�ch H� Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B�ch H� Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B�ch H� H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.01,bBroadcast=1},
	-- {szName="B�ch H� Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},bBroadcast=1,nRate=0.002},
	-- {szName="Ng� H�nh K� Th�ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=15},
	-- {szName="Anh H�ng Thi�p",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	-- {szName="Qu� Ho�ng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
	-- {szName="S�t Th� Gi�n l� h�p",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	-- {szName="�� Ph� B�ch H� Kh�i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.2},
	-- {szName="�� Ph� B�ch H� Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.05},
	-- {szName="�� Ph� B�ch H� H�i",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.2},
	-- {szName="�� Ph� B�ch H� Y�u ��i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.2},
	-- {szName="�� Ph� B�ch H� H� Uy�n",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.2},
	-- {szName="�� Ph� B�ch H� H�ng Li�n",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.2},
	-- {szName="�� Ph� B�ch H� B�i",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.2},
	-- {szName="�� Ph� B�ch H� Th��ng Gi�i",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.2},
	-- {szName="B�ch H� �� Ph� H� Gi�i",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.2},
	-- {szName="�� Ph� B�ch H� V� Kh�",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.05},
	-- {szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nRate=20, nBindState=-2},
	-- {szName="Ch�n Nguy�n ��n (��i)",tbProp={6,1,30229,1,0,0},nCount=1,nRate=7, nBindState=-2},
	-- {szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=4,nRate=20},
	-- {szName="B�ch ni�n th�t tinh th�o",tbProp={6,1,1674,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	-- {szName="Thi�n ni�n th�t tinh th�o",tbProp={6,1,1675,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	-- {szName="V�n Ni�n Ng� Th�i Hoa",tbProp={6,1,2265,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200},
	-- {szName="Nh�t K� C�n Kh�n Ph�",tbProp={6,1,2126,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
	-- {szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200,bBroadcast=1},
	-- {szName = "�i�m Kinh Nghi�m", nExp=6000000,nRate=21.325},
	-- {szName = "�i�m Kinh Nghi�m", nExp=8000000,nRate=6},
	-- {szName = "�i�m Kinh Nghi�m", nExp=10000000,nRate=4},
	-- {szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=1},
}

-- C����
tbAward["award_c"] = 
{
	-- {szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200,bBroadcast=1},
	-- {szName="�� Ph� B�ch H� Kh�i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.05},
	-- {szName="�� Ph� B�ch H� Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.05},
	-- {szName="�� Ph� B�ch H� H�i",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.05},
	-- {szName="�� Ph� B�ch H� Y�u ��i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.05},
	-- {szName="�� Ph� B�ch H� H� Uy�n",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.05},
	-- {szName="�� Ph� B�ch H� H�ng Li�n",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.05},
	-- {szName="�� Ph� B�ch H� B�i",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.05},
	-- {szName="�� Ph� B�ch H� Th��ng Gi�i",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.05},
	-- {szName="B�ch H� �� Ph� H� Gi�i",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.05},
	-- {szName="�� Ph� B�ch H� V� Kh�",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.03},
	-- {szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=50},
	-- {szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=18},
	-- {szName = "�i�m Kinh Nghi�m", nExp=100000000,nRate=9.5},
	-- {szName = "�i�m Kinh Nghi�m", nExp=200000000,nRate=4},
	-- {szName = "�i�m Kinh Nghi�m", nExp=500000000,nRate=2},
	-- {szName="B�o R��ng Kim � Kh�i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=1,bBroadcast=1},
	-- {szName="B�o R��ng Kim � Y ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B�o R��ng Kim � H�i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B�o R��ng Kim � Y�u ��i ( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B�o R��ng Kim � H� Uy�n( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B�o R��ng Kim � H�ng Li�n( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B�o R��ng Kim � B�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=1,bBroadcast=1},
	-- {szName="B�o R��ng Kim � Th��ng Gi�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B�o R��ng Kim � H� Gi�i( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=1,bBroadcast=1},
	-- {szName="B�o R��ng Kim � V� Kh�( l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.5,bBroadcast=1},
	-- {szName="B�ch H� B�o Th�ch",tbProp={6,1,3184,1,0,0},nCount=1,nRate=3},
	-- {szName="B�ch H� Thi�n Th�ch",tbProp={6,1,3185,1,0,0},nCount=1,nRate=2},
	-- {szName="B�ch H� Th�n Th�ch",tbProp={6,1,3186,1,0,0},nCount=1,nRate=1,bBroadcast=1},
	-- {szName="B�ch H� L�nh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.02,bBroadcast=1},
}

-- D����
tbAward["award_d"] = nil

tbAward["award_special"] = 
{
	-- [200]={szName = "�i�m Kinh Nghi�m", nExp=300000000,},
	-- [400]={szName = "�i�m Kinh Nghi�m", nExp=600000000,},
	-- [800]={szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=400,nBindState=-2},
	-- [1200]={szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=1000},
	-- [1600]={szName="B�ch H� Th�n Th�ch",tbProp={6,1,3186,1,0,0},nCount=1,bBroadcast=1},
	-- [2000]={szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount = 1,bBroadcast=1,nExpiredTime=43200},	
}