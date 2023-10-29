Include("\\script\\lib\\composeex.lua")
Include("\\script\\vng_event\\ngusackettinh\\head.lua")

if (not tbNSKT_ItemCompose) then
	tbNSKT_ItemCompose = {}
end

tbNSKT_ItemCompose.tbCrystalCompose = 
	{
		["K�t Tinh Tam S�c"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho�t ��ng Ng� Th�i K�t Tinh\t H�p th�nh %s", "K�t Tinh Tam S�c"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "K�t Tinh M�c", tbProp = {6,1,30070,1,0,0}, nCount = 1},
								{szName = "K�t Tinh H�a", tbProp = {6,1,30072,1,0,0}, nCount = 1},
								{szName = "K�t Tinh Th�", tbProp = {6,1,30073,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "K�t Tinh Tam S�c", tbProp = {6,1,30077,1,0,0}, nExpiredTime = tbNSKT_head.nItemExpiredTime},
					},
					pCompos = nil;
			},
		["K�t Tinh T� S�c"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho�t ��ng Ng� Th�i K�t Tinh\t H�p th�nh %s", "K�t Tinh T� S�c"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "K�t Tinh M�c", tbProp = {6,1,30070,1,0,0}, nCount = 1},
								{szName = "K�t Tinh Th�y", tbProp = {6,1,30071,1,0,0}, nCount = 1},
								{szName = "K�t Tinh H�a", tbProp = {6,1,30072,1,0,0}, nCount = 1},
								{szName = "K�t Tinh Th�", tbProp = {6,1,30073,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "K�t Tinh T� S�c", tbProp = {6,1,30076,1,0,0}, nExpiredTime = tbNSKT_head.nItemExpiredTime},
					},
					pCompos = nil;
			},
		["K�t Tinh Ng� S�c"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho�t ��ng Ng� Th�i K�t Tinh\t H�p th�nh %s", "K�t Tinh Ng� S�c"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "K�t Tinh Kim", tbProp = {6,1,30069,1,0,0}, nCount = 1},
								{szName = "K�t Tinh M�c", tbProp = {6,1,30070,1,0,0}, nCount = 1},
								{szName = "K�t Tinh Th�y", tbProp = {6,1,30071,1,0,0}, nCount = 1},
								{szName = "K�t Tinh H�a", tbProp = {6,1,30072,1,0,0}, nCount = 1},
								{szName = "K�t Tinh Th�", tbProp = {6,1,30073,1,0,0}, nCount = 1},
							},
						tbProduct = {szName = "K�t Tinh Ng� S�c", tbProp = {6,1,30075,1,0,0}, nExpiredTime = tbNSKT_head.nItemExpiredTime},
					},
					pCompos = nil;
			},
		["Phi�n V�"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho�t ��ng Ng� Th�i K�t Tinh\t ��i %s", "Phi�n V�"),
						nWidth = 2,
						nHeight = 3,
						nFreeItemCellLimit = 1,
						tbMaterial = 
							{
								{szName = "L�nh B�i Tri�u H�i", tbProp = {6,1,30074,1,0,0}, nCount = 60},								
							},
						tbProduct = {szName = "Phi�n V�", tbProp = {0,10,7,1,0,0},nCount=1,nExpiredTime=259200},
					},
					pCompos = nil;
			},
			["Phi�n V� Kh�ng H�n S� D�ng"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho�t ��ng Ng� Th�i K�t Tinh\t ��i %s", "Phi�n V� Kh�ng H�n S� D�ng"),
						nWidth = 2,
						nHeight = 3,
						nFreeItemCellLimit = 1,
						tbMaterial = 
							{
								{szName = "L�nh B�i Tri�u H�i", tbProp = {6,1,30074,1,0,0}, nCount = 200},								
							},
						tbProduct = {szName = "Phi�n V�", tbProp = {0,10,7,1,0,0},nCount=1,},
					},
					pCompos = nil;
			},
		["Ng�i Sao"] = 
			{
				tbFormula = 
					{
						szComposeTitle = format("Ho�t ��ng Ng� Th�i K�t Tinh\t ��i %s", "Ng�i Sao"),
						nWidth = 1,
						nHeight = 1,
						nFreeItemCellLimit = 0.02,
						tbMaterial = 
							{
								{szName = "Ng�i Sao May M�n", tbProp = {6,1,30078,1,0,0}, nCount = 1},
								{szName = "C�y Th�ng", tbProp = {6,1,30082,1,0,0}, nCount = 1},								
							},
						tbProduct = 
							{
								{szName="Ng�i Sao H�nh Ph�c",tbProp={6,1,30080,1,0,0},nRate=80,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
								{szName="Ng�i Sao An L�nh",tbProp={6,1,30079,1,0,0},nRate=15,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
								{szName="Ng�i Sao Tr�ng",tbProp={6,1,30081,1,0,0},nRate=5,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
							},
					},
					pCompos = nil;
			}
	}
	
function tbNSKT_ItemCompose:compose(szItemName)
	local tbItem = self.tbCrystalCompose[szItemName];
	if (tbItem) then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("H�p th�nh [%s]", szItemName));
		end
			tbItem.pCompos:ComposeDailog(1);
	end
end