Include("\\script\\lib\\composeex.lua")

if not tbVngUpgradeABDQ then
	tbVngUpgradeABDQ ={}	
	tbVngUpgradeABDQ = tbActivityCompose:new()	
end


tbVngUpgradeABDQ.EVENT_LOG_TITLE = "LOGEVENT_FEATURE_CTC_CheTaoABDQ"

--nRoomType : 10 - Room UI bo item vao
tbVngUpgradeABDQ.nRoomType = 10 

tbVngUpgradeABDQ.tbGoldIndexMaterial = {
	[1] = {164,165,166,167,210,211,212,213},
	[2] = {159,160,161,162,163},
}
tbVngUpgradeABDQ.tbEquip_Release = {
	[1] = {
		{szName=" �� ph� Ho�ng Kim - An Bang C�c Hoa Th�ch Ch� ho�n",tbProp={0,165},nCount=1,nQuality = 1,},
		{szName=" �� ph� Ho�ng Kim - An Bang �i�n Ho�ng Th�ch Ng�c B�i",tbProp={0,166},nCount=1,nQuality = 1,},
		{szName=" �� ph� Ho�ng Kim - An Bang K� Huy�t Th�ch Gi�i Ch� ",tbProp={0,167},nCount=1,nQuality = 1,},
		{szName=" �� ph� Ho�ng Kim - An Bang B�ng Tinh Th�ch H�ng Li�n",tbProp={0,164},nCount=1,nQuality = 1,},
	},
	[2] = {	
		{szName=" �� ph� Ho�ng Kim - ��nh Qu�c Ng�n T�m Y�u ��i",tbProp={0,163},nCount=1,nQuality = 1,},
		{szName=" �� ph� Ho�ng Kim - ��nh Qu�c T� ��ng H� uy�n",tbProp={0,162},nCount=1,nQuality = 1,},
		{szName=" �� ph� Ho�ng Kim - ��nh Qu�c � Sa Ph�t Qu�n",tbProp={0,160},nCount=1,nQuality = 1,},
		{szName=" �� ph� Ho�ng Kim - ��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",tbProp={0,161},nQuality = 1,},
		{szName=" �� ph� Ho�ng Kim - ��nh Qu�c Thanh Sa Tr��ng Sam",tbProp={0,159},nCount=1,nQuality = 1,},
	},
	[3] = {
		{szName="[C�c ph�m] ��nh Qu�c Ng�n T�m Y�u ��i",tbProp={0,407},nCount=1,nQuality = 1,},
		{szName="[C�c ph�m] ��nh Qu�c T� ��ng H� Uy�n",tbProp={0,406},nCount=1,nQuality = 1,},	
		{szName="[C�c ph�m] ��nh Qu�c Thanh Sa Ph�t Qu�n",tbProp={0,404},nCount=1,nQuality = 1,},
		{szName="[C�c ph�m] ��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",tbProp={0,405},nCount=1,nQuality = 1,},	
		{szName="[C�c ph�m] ��nh Qu�c Thanh Sa Tr��ng Sam",tbProp={0,403},nCount=1,nQuality = 1,},	
	},
	[4] = {
		{szName="[Ho�n M�] An Bang B�ng Tinh Th�ch H�ng Li�n",tbProp={0,210},nCount=1,nQuality = 1,},
		{szName="[Ho�n M�] An Bang �i�n Ho�ng Th�ch Ng�c B�i",tbProp={0,212},nCount=1,nQuality = 1,},
		{szName="[Ho�n M�] An Bang K� Huy�t Th�ch Gi�i Ch�",tbProp={0,213},nCount=1,nQuality = 1,},
		{szName="[Ho�n M�] An Bang C�c Hoa Th�ch Ch� Ho�n",tbProp={0,211},nCount=1,nQuality = 1,},
	},
}

tbVngUpgradeABDQ.tbEquip_Upgrade = {
	[165] ={szName="[Ho�n M�] An Bang C�c Hoa Th�ch Ch� Ho�n",tbProp={0,211},nCount=1,nQuality = 1,},
	[166] ={szName="[Ho�n M�] An Bang �i�n Ho�ng Th�ch Ng�c B�i",tbProp={0,212},nCount=1,nQuality = 1,},
	[167] ={szName="[Ho�n M�] An Bang K� Huy�t Th�ch Gi�i Ch�",tbProp={0,213},nCount=1,nQuality = 1,},
	[164] = {szName="[Ho�n M�] An Bang B�ng Tinh Th�ch H�ng Li�n",tbProp={0,210},nCount=1,nQuality = 1,},
	
	[163] ={szName="[C�c ph�m] ��nh Qu�c Ng�n T�m Y�u ��i",tbProp={0,407},nCount=1,nQuality = 1,},
	[162] ={szName="[C�c ph�m] ��nh Qu�c T� ��ng H� Uy�n",tbProp={0,406},nCount=1,nQuality = 1,},	
	[160] ={szName="[C�c ph�m] ��nh Qu�c Thanh Sa Ph�t Qu�n",tbProp={0,404},nCount=1,nQuality = 1,},
	[161] ={szName="[C�c ph�m] ��nh Qu�c X�ch Quy�n Nhuy�n Ngoa",tbProp={0,405},nCount=1,nQuality = 1,},	
	[159] ={szName="[C�c ph�m] ��nh Qu�c Thanh Sa Tr��ng Sam",tbProp={0,403},nCount=1,nQuality = 1,},	
}
--nguyen lieu nhan duoc khi phan giai
tbAward_ReleaseEquip = {
	[1] = { --phan thuong trang bi thuong
			{szName = "An Bang H�n Th�ch", tbProp = {6,1,30562}, nCount = 10, nRate=50,},
			{szName = "An Bang H�n Th�ch", tbProp = {6,1,30562}, nCount = 15, nRate=40,},
			{szName = "An Bang H�n Th�ch", tbProp = {6,1,30562}, nCount = 20, nRate=10,},
	},
	[2] = { --phan thuong trang bi an bang hoan my
		{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nCount = 10,nRate=50,},
		{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nCount = 15,nRate=40,},
		{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nCount = 20,nRate=10,},
	},
	[3] = { --phan thuong trang bi an bang hoan my
		{szName = "��nh Qu�c H�n Th�ch", tbProp = {6,1,30563}, nCount = 30,nRate=100,},
	},
	[4] = { --phan thuong trang bi an bang hoan my
		{szName = "An Bang H�n Th�ch", tbProp = {6,1,30562}, nCount = 30, nRate=100,},
	},
}
