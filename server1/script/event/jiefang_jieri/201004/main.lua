Include("\\script\\lib\\composeex.lua")
Include("\\script\\global\\itemset.lua")
Include("\\script\\item\\class\\virtualitem.lua")

if (FreedomEvent2010 == nil) then
	FreedomEvent2010 = {}
end

FreedomEvent2010.START_DATE = 20100426
FreedomEvent2010.END_DATE = 20100607
FreedomEvent2010.END_DATE1 = 20100531

FreedomEvent2010.tbBuyItem = 
{
	["H�t Thi�n Tu�"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho�t ��ng ��m m�m h�nh ph�c \t Mua %s", "H�t Thi�n Tu�"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = {{nJxb = 1000000, nCount=1}},
			tbProduct = {szName = "H�t Thi�n Tu�", tbProp = {6,1,2294,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["T�i Ph�n B�n"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho�t ��ng ��m m�m h�nh ph�c \t Mua %s", "T�i Ph�n B�n"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 150000, nCount=1}},
			tbProduct = {szName = "T�i Ph�n B�n", tbProp = {6,1,2295,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["Th�ng N��c"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho�t ��ng ��m m�m h�nh ph�c \t Mua %s", "Th�ng N��c"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 150000, nCount=1}},
			tbProduct = {szName = "Th�ng N��c", tbProp = {6,1,2296,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["Thu�c Tr� S�u"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho�t ��ng ��m m�m h�nh ph�c \t Mua %s", "Thu�c Tr� S�u"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 150000, nCount=1}},
			tbProduct = {szName = "Thu�c Tr� S�u", tbProp = {6,1,2297,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["Cu�n V�i H�o H�ng"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho�t ��ng t�m �o chi�n s� \t Mua%s", "Cu�n V�i H�o H�ng"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = {{nJxb = 40000, nCount=1}},
			tbProduct = {szName = "Cu�n V�i H�o H�ng", tbProp = {6,1,2302,1,0,0}, nExpiredTime = 20100531},
		},
		pCompos = nil;
	},
	["Chi�c M� Chi�n S�"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho�t ��ng t�m �o chi�n s�\t��i %s", "Chi�c M� Chi�n S�"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "H�p Kim Ch�", tbProp = {6,1,2300,1,0,0}, nCount = 2},
				{szName = "Cu�n V�i", tbProp = {6,1,2301,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "Chi�c M� Chi�n S�", tbProp = {6,1,2304,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["��i Gi�y B� ��i"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho�t ��ng t�m �o chi�n s�\t��i %s", "��i Gi�y B� ��i"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "H�p Kim Ch�", tbProp = {6,1,2300,1,0,0}, nCount = 2},
				{szName = "Cu�n V�i H�o H�ng", tbProp = {6,1,2302,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "��i Gi�y B� ��i", tbProp = {6,1,2305,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["T�m �o Chi�n S�"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho�t ��ng t�m �o chi�n s�\t��i %s", "T�m �o Chi�n S�"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "H�p Kim Ch�", tbProp = {6,1,2300,1,0,0}, nCount = 2},
				{szName = "Cu�n V�i Th��ng H�ng", tbProp = {6,1,2303,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "T�m �o Chi�n S�", tbProp = {6,1,2306,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["Chi�c v�ng Tr��ng S�n 1"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho�t ��ng t�m �o chi�n s�\t��i %s", "Chi�c v�ng Tr��ng S�n"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "Huy�n Tinh Kho�ng Th�ch (c�p 5) ", tbProp = {6,1,147,5,0,0}, nCount = 5},
				tbVirtualItemClass:new(tbCrystalSet, 1, "Th�y Tinh"),
				{szName = "Ba l� Con C�c", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "Chi�c v�ng Tr��ng S�n", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["Chi�c v�ng Tr��ng S�n 2"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho�t ��ng t�m �o chi�n s�\t��i %s", "Chi�c v�ng Tr��ng S�n"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "Huy�n Tinh Kho�ng Th�ch (c�p 6) ", tbProp = {6,1,147,6,0,0}, nCount = 3},
				tbVirtualItemClass:new(tbCrystalSet, 1, "Th�y Tinh"),
				{szName = "Ba l� Con C�c", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "Chi�c v�ng Tr��ng S�n", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["Chi�c v�ng Tr��ng S�n 3"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho�t ��ng t�m �o chi�n s�\t��i %s", "Chi�c v�ng Tr��ng S�n"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "Huy�n Tinh Kho�ng Th�ch (c�p 7) ", tbProp = {6,1,147,7,0,0}, nCount = 2},
				tbVirtualItemClass:new(tbCrystalSet, 1, "Th�y Tinh"),
				{szName = "Ba l� Con C�c", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "Chi�c v�ng Tr��ng S�n", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["Chi�c v�ng Tr��ng S�n 4"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("Ho�t ��ng t�m �o chi�n s�\t��i %s", "Chi�c v�ng Tr��ng S�n"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			tbMaterial = 
			{
				{szName = "Huy�n Tinh Kho�ng Th�ch (c�p 8) ", tbProp = {6,1,147,8,0,0}, nCount = 1},
				tbVirtualItemClass:new(tbCrystalSet, 1, "Th�y Tinh"),
				{szName = "Ba l� Con C�c", tbProp = {6,1,2308,1,0,0}, nCount = 1},
			},
			tbProduct = {szName = "Chi�c v�ng Tr��ng S�n", tbProp = {6,1,2307,1,0,0}, nExpiredTime = 20100607},
		},
		pCompos = nil;
	},
	["Nh�t K� C�n Kh�n Ph�"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("B� long\t��i %s", "Nh�t K� C�n Kh�n Ph�"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = 
			{
				{szName = "Ng� H�nh K� Th�ch", tbProp = {6,1,2125,-1,-1,0}, nCount = 300},
			},
			tbProduct = 
			{
				szName = "Nh�t K� C�n Kh�n Ph�",
				[1]	= {szName = "Nh�t K� C�n Kh�n Ph�", tbProp = {6,1,2126,1,0,0}, nExpiredTime = 30*24*60}, --change item expired time to 30days - Modified by DinhHQ - 20110428
				[2] = 
				{
					pFun = function (self, nCount, szLogTilte)
						szAllNews = format("Cao th� <color=yellow>%s<color> �� nh�n ���c <color=green>%d<color> [<color=yellow>%s<color>], giang h� t� ��y d�y s�ng tr� l�i", GetName(), 1, "Nh�t K� C�n Kh�n Ph�");
						LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szAllNews , "", "")
					end
				},
			},
		},
		pCompos = nil;
	},
	["M�t n� qu� �nh"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("B� long\t��i %s", "M�t n� qu� �nh"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = 
			{
				{szName = "Ng� H�nh K� Th�ch", tbProp = {6,1,2125,-1,-1,0}, nCount = 3},
			},
			tbProduct = {szName = "M�t n� qu� �nh", tbProp = {0,11,455,1,0,0}, nExpiredTime = 10080},
		},
		pCompos = nil;
	},
	["M�t n� c�u m�nh"] =  
	{
		tbFormula = 
		{
			szComposeTitle = format("B� long\t��i %s", "M�t n� c�u m�nh"),
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 1,
			tbMaterial = 
			{
				{szName = "Ng� H�nh K� Th�ch", tbProp = {6,1,2125,-1,-1,0}, nCount = 5},
			},
			tbProduct = {szName = "M�t n� c�u m�nh", tbProp = {0,11,454,1,0,0}, nExpiredTime = 10080},
		},
		pCompos = nil;
	},
}

FreedomEvent2010.tbSongjinSoldier =
{
	{szName="T�i Ph�n B�n", tbProp={6,1,2295,1,0,0}, nRate=33, nExpiredTime = 20100531},
	{szName="Th�ng N��c", tbProp={6,1,2296,1,0,0}, nRate=33, nExpiredTime = 20100531},
	{szName="Thu�c Tr� S�u", tbProp={6,1,2297,1,0,0}, nRate=34, nExpiredTime = 20100531},
}

FreedomEvent2010.tbMonsterDrop =
{
	{
		{szName="T�i D�ng C�", tbProp={6,1,2299,1,0,0}, nRate=1.2, nExpiredTime = 20100531},
	},
}

FreedomEvent2010.tbSoldierToolBag =
{
	{szName="H�p Kim Ch�", tbProp={6,1,2300,1,0,0}, nRate=70, nExpiredTime = 20100531},
	{szName="Cu�n V�i", tbProp={6,1,2301,1,0,0}, nRate=30, nExpiredTime = 20100531},
}

FreedomEvent2010.tbClothExp =
{
	exp=
	{
		30,
		40,
		60,
		80,
		200,
	},
	rate=
	{
		24,
		67,
		5,
		3,
		1,
	},
}

FreedomEvent2010.tbClothAwardSpecial =
{
	{szName="Chi�c g�y Tr��ng S�n", tbProp={6,1,2298,1,0,0}, nRate=35.8, nExpiredTime = 20100607, pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Chi�c g�y Tr��ng S�n") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Chi�c g�y Tr��ng S�n")) end end},
	{szName="Th�p Tinh Luy�n(c�p 5)", tbProp={6,1,2293,5,0,0}, nRate=20, nExpiredTime = 20100607},
	{szName="T�ng m�o kim b�i", tbProp={6,1,2203,1,0,0}, nRate=3,},
	{szName="U lung kim b�i", tbProp={6,1,2204,1,0,0}, nRate=2,},
	{szName="Ma s�t kim b�i", tbProp={6,1,2205,1,0,0}, nRate=2,},
	{szName="��ch kh�i kim b�i", tbProp={6,1,2206,1,0,0}, nRate=3,},
	{szName="H�m Thi�n Kim B�i", tbProp={6,1,2237,1,0,0}, nRate=6,},
	{szName="Thi�n Quang Kim B�i", tbProp={6,1,2238,1,0,0}, nRate=4,},
	{szName="T�n B�ch H�i Kim B�i", tbProp={6,1,2239,1,0,0}, nRate=3,},
	{szName="V� Ma Kim B�i", tbProp={6,1,2240,1,0,0}, nRate=8,},
	{szName="L�ng Nh�c Kim B�i", tbProp={6,1,2241,1,0,0}, nRate=8,},
	{szName="S��ng Tinh Kim B�i", tbProp={6,1,2242,1,0,0}, nRate=4,},
	{szName="Kim Quang B�c Kinh Chi M�ng", tbProp={0,197},nQuality=1, nRate=0.1,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Kim Quang B�c Kinh Chi M�ng") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Kim Quang B�c Kinh Chi M�ng")) end end},
	{szName="Kim Quang Nh� �i�n Chi H�n", tbProp={0,202},nQuality=1, nRate=0.1,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Kim Quang Nh� �i�n Chi H�n") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Kim Quang Nh� �i�n Chi H�n")) end end},
	{szName="Th�n b� kho�ng th�ch", tbProp={6,1,398,1,0,0}, nRate=1,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Th�n b� kho�ng th�ch") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Th�n b� kho�ng th�ch")) end end},

}

FreedomEvent2010.tbClothAwardNormal =
{
	{szName="Ba l� Con C�c", tbProp={6,1,2308,1,0,0}, nRate=18, nExpiredTime = 20100607},
	{szName="Ng� H�nh K� Th�ch", tbProp={6,1,2125,1,0,0}, nRate=20},
	{szName="Chi�c g�y Tr��ng S�n", tbProp={6,1,2298,1,0,0}, nRate=10, nExpiredTime = 20100607, pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Chi�c g�y Tr��ng S�n") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Chi�c g�y Tr��ng S�n")) end end},
	{szName="Ti�n Th�o L� ��c bi�t", tbProp={6,1,1181,1,0,0}, nRate=2},
	{szName="Thi�t La H�n", tbProp={6,1,23,1,0,0}, nRate=5},
	{szName="B�n Nh��c T�m Kinh", tbProp={6,1,12,1,0,0}, nRate=2},
	{szName="Th�p Tinh Luy�n(c�p 3)", tbProp={6,1,2293,3,0,0}, nRate=8, nExpiredTime = 20100607},
	{szName="Th�p Tinh Luy�n(c�p 4)", tbProp={6,1,2293,4,0,0}, nRate=5, nExpiredTime = 20100607},
	{szName="Th�p Tinh Luy�n(c�p 5)", tbProp={6,1,2293,5,0,0}, nRate=1, nExpiredTime = 20100607},
	{szName="T�ng m�o kim b�i", tbProp={6,1,2203,1,0,0}, nRate=0.5,},
	{szName="U lung kim b�i", tbProp={6,1,2204,1,0,0}, nRate=0.3,},
	{szName="Ma s�t kim b�i", tbProp={6,1,2205,1,0,0}, nRate=0.3,},
	{szName="��ch kh�i kim b�i", tbProp={6,1,2206,1,0,0}, nRate=0.5,},
	{szName="H�m Thi�n Kim B�i", tbProp={6,1,2237,1,0,0}, nRate=1,},
	{szName="Thi�n Quang Kim B�i", tbProp={6,1,2238,1,0,0}, nRate=1,},
	{szName="T�n B�ch H�i Kim B�i", tbProp={6,1,2239,1,0,0}, nRate=0.6,},
	{szName="V� Ma Kim B�i", tbProp={6,1,2240,1,0,0}, nRate=1.2,},
	{szName="L�ng Nh�c Kim B�i", tbProp={6,1,2241,1,0,0}, nRate=1.2,},
	{szName="S��ng Tinh Kim B�i", tbProp={6,1,2242,1,0,0}, nRate=0.8,},
	{szName="Khi�u chi�n L� bao", tbProp={6,1,2006,1,0,0}, nRate=11.26},
	{szName="Kim Quang B�c Kinh Chi M�ng", tbProp={0,197},nQuality=1, nRate=0.02,pFun=function() LG_ApplyDoScript(1, "", "", "\\\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Kim Quang B�c Kinh Chi M�ng") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Kim Quang B�c Kinh Chi M�ng")) end end},
	{szName="Kim Quang Nh� �i�n Chi H�n", tbProp={0,202},nQuality=1, nRate=0.02,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Kim Quang Nh� �i�n Chi H�n") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Kim Quang Nh� �i�n Chi H�n")) end end},
	{szName="Th�n b� kho�ng th�ch", tbProp={6,1,398,1,0,0}, nRate=0.3,pFun=function() LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Th�n b� kho�ng th�ch") , "", "") local szTong, nTongId = GetTongName() if(szTong ~= nil and szTong ~= "") then Msg2Tong(nTongId, format("Ch�c m�ng <color=yellow>%s<color> �� nh�n ���c <color=yellow>%s<color>",GetName(),"Th�n b� kho�ng th�ch")) end end},
	{szName="Huy�n Tinh Kho�ng Th�ch (c�p 6) ", tbProp={6,1,147,6,0,0}, nRate=5},
	{szName="Huy�n Tinh Kho�ng Th�ch (c�p 7) ", tbProp={6,1,147,7,0,0}, nRate=3},
	{szName="Huy�n Tinh Kho�ng Th�ch (c�p 8) ", tbProp={6,1,147,8,0,0}, nRate=2},
}

function FreedomEvent2010:IsActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.END_DATE or now < self.START_DATE) then
		return 0;
	end
	return 1;
end

function FreedomEvent2010:IsActive1()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.END_DATE1 or now < self.START_DATE) then
		return 0;
	end
	return 1;
end

function FreedomEvent2010:LingFanSoldierItemDlg()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "Ch�o m�ng ng�y ��t n��c ���c gi�i ph�ng!";
	if (now < self.END_DATE1) then
		tinsert(tbSay, format("Mua [%s]/#FreedomEvent2010:BuyItem('%s')","Cu�n V�i H�o H�ng","Cu�n V�i H�o H�ng"));
	end
	tinsert(tbSay, format("��i [%s]/#FreedomEvent2010:BuyCotDlg()","Chi�c v�ng Tr��ng S�n"));
	
	tinsert(tbSay, "R�i kh�i/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:LingFanPlantItemDlg()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "Ch�o m�ng ng�y ��t n��c ���c gi�i ph�ng!";
	if (now < self.END_DATE1) then
		tinsert(tbSay, format("Mua [%s]/#FreedomEvent2010:BuyItem('%s')","H�t Thi�n Tu�","H�t Thi�n Tu�"));
		tinsert(tbSay, format("Mua [%s]/#FreedomEvent2010:BuyItem('%s')","T�i Ph�n B�n","T�i Ph�n B�n"));
		tinsert(tbSay, format("Mua [%s]/#FreedomEvent2010:BuyItem('%s')","Th�ng N��c","Th�ng N��c"));
		tinsert(tbSay, format("Mua [%s]/#FreedomEvent2010:BuyItem('%s')","Thu�c Tr� S�u","Thu�c Tr� S�u"));
	end
	
	tinsert(tbSay, "R�i kh�i/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:LiGuanEventItemDlg()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "Ch�o m�ng ng�y ��t n��c ���c gi�i ph�ng!";
	if (now < self.END_DATE1) then
		tinsert(tbSay, format("��i [%s]/#FreedomEvent2010:BuyItem('%s')","Chi�c M� Chi�n S�","Chi�c M� Chi�n S�"));
		tinsert(tbSay, format("��i [%s]/#FreedomEvent2010:BuyItem('%s')","��i Gi�y B� ��i","��i Gi�y B� ��i"));
		tinsert(tbSay, format("��i [%s]/#FreedomEvent2010:BuyItem('%s')","T�m �o Chi�n S�","T�m �o Chi�n S�"));
	end
	
	tinsert(tbSay, "R�i kh�i/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:BuyCotDlg()
	local tbSay = {};
	tbSay[1] = "C� th� s� d�ng 4 c�ch �� ��i <enter>5huy�n tinh kho�ng th�ch(c�p5)+1th�y tinh+1Ba l� Con C�c<enter>3huy�n tinh kho�ng th�ch(c�p6)+1th�y tinh+1Ba l� Con C�c<enter>2huy�n tinh kho�ng th�ch(c�p7)+1th�y tinh+1Ba l� Con C�c<enter>1huy�n tinh kho�ng th�ch(c�p8)+1th�y tinh+1Ba l� Con C�c";
	tinsert(tbSay, format("C�ch ��i 1/#FreedomEvent2010:BuyItem('%s')","Chi�c v�ng Tr��ng S�n 1"));
	tinsert(tbSay, format("C�ch ��i 2/#FreedomEvent2010:BuyItem('%s')","Chi�c v�ng Tr��ng S�n 2"));
	tinsert(tbSay, format("C�ch ��i 3/#FreedomEvent2010:BuyItem('%s')","Chi�c v�ng Tr��ng S�n 3"));
	tinsert(tbSay, format("C�ch ��i 4/#FreedomEvent2010:BuyItem('%s')","Chi�c v�ng Tr��ng S�n 4"));
	tinsert(tbSay, "R�i kh�i/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:LongerEventItemDlg()
	local tbSay = {};
	tbSay[1] = "<#><npc>B� Long: ��i hi�p c� th�y ta d� th��ng kh�ng. � nh�ng vi�n �� n�y ��p qu�, ��i hi�p mu�n ��i l�y v�t ph�m g� trong kho b�o v�t c�a gia ��nh ta";
	tinsert(tbSay, format("��i [%s]/#FreedomEvent2010:BuyItem('%s')","Nh�t K� C�n Kh�n Ph�","Nh�t K� C�n Kh�n Ph�"));
	tinsert(tbSay, format("��i [%s]/#FreedomEvent2010:BuyItem('%s')","M�t n� qu� �nh","M�t n� qu� �nh"));
	tinsert(tbSay, format("��i [%s]/#FreedomEvent2010:BuyItem('%s')","M�t n� c�u m�nh","M�t n� c�u m�nh"));
	tinsert(tbSay, "R�i kh�i/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomEvent2010:BuyItem(szItem)
	local tbItem = self.tbBuyItem[szItem];
	if (tbItem) then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("Mua [%s]", szItem));
		end
			tbItem.pCompos:ComposeDailog(1);
	end
end
