Include("\\script\\lib\\composeex.lua")
Include("\\script\\global\\itemset.lua")
Include("\\script\\item\\class\\virtualitem.lua")
Include("\\script\\lib\\awardtemplet.lua")

Event201010 = {}

Event201010.END_DATE = 20101111

Event201010.tbBuyItem =
{
	["Lam B�ng Tinh"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("Ho�t ��ng th�ng 10 \t��i %s", "Lam B�ng Tinh"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = 
				{
					{szName = "Huy�n Tinh Kho�ng Th�ch", tbProp = {6,1,147,4,0,0}, nCount = 1},
					{szName = "Lam Th�ch", tbProp = {6,1,30056,1,0,0}, nCount = 1},
				},
				tbProduct = {szName = "Lam B�ng Tinh", tbProp = {6,1,30059,1,0,0}, nExpiredTime = 20101118},
			},
			pCompos = nil;
		},
	
	["Ho�ng B�ng Tinh"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("Ho�t ��ng th�ng 10 \t��i %s", "Ho�ng B�ng Tinh"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = 
				{
					{szName = "Huy�n Tinh Kho�ng Th�ch", tbProp = {6,1,147,3,0,0}, nCount = 1},
					{szName = "Lam Th�ch", tbProp = {6,1,30057,1,0,0}, nCount = 1},
				},
				tbProduct = {szName = "Ho�ng B�ng Tinh", tbProp = {6,1,30060,1,0,0}, nExpiredTime = 20101118},
			},
			pCompos = nil;
		},	
		
	["T� B�ng Tinh"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("Ho�t ��ng th�ng 10 \t��i %s", "T� B�ng Tinh"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = 
				{
					{szName = "Huy�n Tinh Kho�ng Th�ch", tbProp = {6,1,147,2,0,0}, nCount = 1},
					{szName = "T� Th�ch", tbProp = {6,1,30058,1,0,0}, nCount = 1},
				},
				tbProduct = {szName = "T� B�ng Tinh", tbProp = {6,1,30061,1,0,0}, nExpiredTime = 20101118},
			},
			pCompos = nil;
		},		
		
	["Ho�ng Th�ch"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("Ho�t ��ng th�ng 10 \tMua %s", "Ho�ng Th�ch"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = {{nJxb = 5e4, nCount=1}},
				tbProduct = {szName = "Ho�ng Th�ch", tbProp = {6,1,30057,1,0,0}, nExpiredTime = 20101111},
			},
			pCompos = nil;
		},
}

function Event201010:IsActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.END_DATE) then
		return 0;
	end
	return 1;
end

function Event201010:ShowDialog()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "��i hi�p mua g�?";
	if (now < self.END_DATE) then
		tinsert(tbSay, format("��i [%s]/#Event201010:BuyItem('%s')","Lam B�ng Tinh","Lam B�ng Tinh"));
		tinsert(tbSay, format("��i [%s]/#Event201010:BuyItem('%s')","Ho�ng B�ng Tinh","Ho�ng B�ng Tinh"));
		tinsert(tbSay, format("��i [%s]/#Event201010:BuyItem('%s')","T� B�ng Tinh","T� B�ng Tinh"));
	end
	
	tinsert(tbSay, "R�i kh�i/OnExit");
	CreateTaskSay(tbSay);
end

function Event201010:BuyHoangThach()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "��i hi�p c�n ��i g�?!";
	if (now < self.END_DATE) then
		tinsert(tbSay, format("Mua [%s]/#Event201010:BuyItem('%s')","Ho�ng Th�ch","Ho�ng Th�ch"));
	end
	
	tinsert(tbSay, "R�i kh�i/OnExit");
	CreateTaskSay(tbSay);
end

function Event201010:BuyItem(szItem)
	local tbItem = self.tbBuyItem[szItem];
	if (tbItem) then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("Mua [%s]", szItem));
		end
			tbItem.pCompos:ComposeDailog(1);
	end
end

 function Event201010:BuyLamThach()
 	if (Event201010:IsActive() ~= 1) then
 		Talk(1,"", "Ho�t ��ng th�ng 10 �� k�t th�c!")
 		return
 	end
 	AskClientForNumber("GetLamThach",1,50,"<#>Nh�p s� l��ng c�n mua")
 end
 
 function GetLamThach(nCount)
 	if CalcFreeItemCellCount() < 1 then
		Say("Kh�ng �� 1 � tr�ng trong h�nh trang c�a ��i hi�p!",0)
		return
	end
	
 	local nSum = nCount * 50
 	if (GetEnergy() < nSum) then
 		Talk(1,"", "��i hi�p kh�ng �� tinh l�c, xin ki�m tra l�i")
 		return
 	end 
 	
 	ReduceEnergy(nSum)
	tbAwardTemplet:GiveAwardByList({tbProp={6,1,30056,1,0,0}, nExpiredTime=20101111, nCount = nCount} , "Event th�ng 10 - Mua Lam Th�ch");
 end