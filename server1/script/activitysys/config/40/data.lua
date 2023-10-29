
_Message = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>Ch�c m�ng <color=yellow>%s<color=green> �� nh�n ���c v�t ph�m <color=yellow>%s<color=green> khi s� d�ng <color=yellow>Gio Hoa H�ng V�nh C�u<color>", GetName(), strItemName)
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end	

tbActivityNpc = {	
	[1] = {
		szName = "Th� Gh�p Hoa", 
		nLevel = 95,
		nNpcId = 1888,
		nIsboss = 0,
		szScriptPath = "\\script\\activitysys\\npcdailog.lua",
		},
	[2] = {
		szName = "C� Xanh", 
		nLevel = 95,
		nNpcId = 1889,
		nIsboss = 0,
		bNoRevive = 0,
		szScriptPath = "\\script\\activitysys\\config\\40\\npc_grass.lua",
		}
}

tbActivityNpcPos = {
	[1] = {
			[1] = {78,1588,3221,},
			[2] = {11,3141,5061,},
			[3] = {37,1707,3117,},
		},
	[2] = {
		{20, 3593, 6273,},
		{53, 1670, 3256,},
		{99, 1717, 3279,},
		{100, 1576, 3226,},
		{101, 1766, 3272,},
		{121, 1874, 4587,},
		{153, 1715, 3297,},
		{174, 1544, 3287,},
		},
	}
	
	
tbMonstorAward = {
	[321] = {	-- ����ɽ��
		[1]={szName="Hoa H�ng Tr�ng",tbProp={6,1,3117,1,0,0},nExpiredTime=20120401,nRate = 25.0,},
		[2]={szName="Hoa H�ng V�ng",tbProp={6,1,3119,1,0,0},nExpiredTime=20120401,nRate = 25.0,},
		[3]={szName="T�i H��ng Hoa H�ng",tbProp={6,1,3125,1,0,0},nExpiredTime=20120401,nRate = 10.0,},
		},	
	[322] = {	-- ����ɽ��
		[1]={szName="Hoa H�ng Xanh",tbProp={6,1,3118,1,0,0},nExpiredTime=20120401,nRate = 25.0,},
		[2]={szName="Hoa h�ng ��",tbProp={6,1,3120,1,0,0},nExpiredTime=20120401,nRate = 25.0,},
		[3]={szName="T�i H��ng Hoa H�ng",tbProp={6,1,3125,1,0,0},nExpiredTime=20120401,nRate = 10.0,},
		},
	[227] = {	-- ɳĮɽ��3
		[1]={szName="Hoa H�ng Tr�ng",tbProp={6,1,3117,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		[2]={szName="Hoa H�ng V�ng",tbProp={6,1,3119,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		[3]={szName="Hoa H�ng Xanh",tbProp={6,1,3118,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		},
	[340] = {	-- Ī�߿�
		[1]={szName="Hoa H�ng Xanh",tbProp={6,1,3118,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		[2]={szName="Hoa H�ng V�ng",tbProp={6,1,3119,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		[3]={szName="Hoa h�ng ��",tbProp={6,1,3120,1,0,0},nExpiredTime=20120401,nRate = 20.0,},
		},
	}	
	
tbItemAward = {
	["3Color_Rose"] = {szName = "500000 �i�m exp", nExp=500000},
	["4Color_Rose"] = {szName = "1000000 �i�m exp", nExp=1000000},
	["MeiGuiXiangDai"] = {
		[1]={szName="Hoa H�ng Xanh",tbProp={6,1,3118,1,0,0},nCount=5, nExpiredTime=20120401,nRate = 25.0,},
		[2]={szName="Hoa H�ng V�ng",tbProp={6,1,3119,1,0,0},nCount=5, nExpiredTime=20120401,nRate = 25.0,},
		[3]={szName="Hoa h�ng ��",tbProp={6,1,3120,1,0,0},nCount=5, nExpiredTime=20120401,nRate = 25.0,},
		[4]={szName="Hoa H�ng Tr�ng",tbProp={6,1,3117,1,0,0},nCount=5, nExpiredTime=20120401,nRate = 25.0,},
		},		
	}	

tbItemOtherAward = {
	["3Color_Rose"] = {
		[500] = "SuDung500LanBoHongTamSac",
		[1000] = "SuDung1000LanBoHongTamSac",
		},
	["4Color_Rose"] = {
		[500] = "SuDung500LanBoHongTuSac",
		[1000] = "SuDung1000LanBoHongTuSac",
		[1500] = "SuDung1500LanBoHongTuSac",
		},
	["Corbeil"] = {
		[100] = {
			tbAward = {nExp_tl=10000000},
			szLog = "SuDungGioHoaHongVinhCuu100Lan",
			},
		[200] = {
			tbAward = {nExp_tl=10000000},
			szLog = "SuDungGioHoaHongVinhCuu200Lan",
			},
		[300] = {
			tbAward = {nExp_tl=10000000},
			szLog = "SuDungGioHoaHongVinhCuu300Lan",
			},
		[400] = {
			tbAward = {nExp_tl=10000000},
			szLog = "SuDungGioHoaHongVinhCuu400Lan",
			},
		[500] = {
			tbAward = {nExp_tl=20000000},
			szLog = "SuDungGioHoaHongVinhCuu500Lan",
			},
		[600] = {
			tbAward = {nExp_tl=20000000},
			szLog = "SuDungGioHoaHongVinhCuu600Lan",
			},
		[700] = {
			tbAward = {nExp_tl=20000000},
			szLog = "SuDungGioHoaHongVinhCuu700Lan",
			},
		[800] = {
			tbAward = {nExp_tl=20000000},
			szLog = "SuDungGioHoaHongVinhCuu800Lan",
			},
		[900] = {
			tbAward = {nExp_tl=20000000},
			szLog = "SuDungGioHoaHongVinhCuu900Lan",
			},
		[1000] = {
			tbAward = {nExp_tl=30000000},
			szLog = "SuDungGioHoaHongVinhCuu1000Lan",
			},
		[1100] = {
			tbAward = {nExp_tl=30000000},
			szLog = "SuDungGioHoaHongVinhCuu1100Lan",
			},
		[1200] = {
			tbAward = {nExp_tl=30000000},
			szLog = "SuDungGioHoaHongVinhCuu1200Lan",
			},
		[1300] = {
			tbAward = {nExp_tl=40000000},
			szLog = "SuDungGioHoaHongVinhCuu1300Lan",
			},
		[1400] = {
			tbAward = {nExp_tl=50000000},
			szLog = "SuDungGioHoaHongVinhCuu1400Lan",
			},
		[1500] = {
			tbAward ={
					{szName="B�o R��ng Kim � Kh�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=14, CallBack = _Message},
					{szName="B�o R��ng Kim � Y",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=14, CallBack = _Message},
					{szName="B�o R��ng Kim � H�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=14, CallBack = _Message},
					{szName="B�o R��ng Kim � Y�u ��i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=11, CallBack = _Message},
					{szName="B�o R��ng Kim � H� Uy�n",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=11, CallBack = _Message},
					{szName="B�o R��ng Kim � H�ng Li�n",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=14, CallBack = _Message},
					{szName="B�o R��ng Kim � B�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=10, CallBack = _Message},
					{szName="B�o R��ng Kim � Th��ng Gi�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=5, CallBack = _Message},
					{szName="B�o R��ng Kim � H� Gi�i",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=5, CallBack = _Message},
					{szName="B�o R��ng Kim � V� Kh�",tbProp={6,1,30190,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=2, CallBack = _Message},	
			},
			szLog = "SuDungGioHoaHongVinhCuu1500LanBaoRuongKimO",
			},	
		},
	}	
	
-- ���˴��Ľ����Լ�����	
tbLuckBeltAward = {
	[1]={szName="B� H�ng Tam S�c",tbProp={6,1,3121,1,0,0},nExpiredTime=20120401,nBindState = -2,},
	[2]={szName="B� H�ng T� S�c",tbProp={6,1,3122,1,0,0},nExpiredTime=20120401,nBindState = -2,},
	[3]={szName="Gi� Hoa H�ng V�nh C�u",tbProp={6,1,3127,1,0,0},nExpiredTime=20120401,nBindState = -2,},	
	}	
tbLuckBelt = {
	[1] = {nRate = 45, szActionLog = "SuDungTuiMayManNhanBoHongTamSac",},
	[2] = {nRate = 45, szActionLog = "SuDungTuiMayManNhanBoHongTuSac",},
	[3] = {nRate = 10, szActionLog = "SuDungTuiMayManNhanGioHoaHongVinhCuu",},
	}	
