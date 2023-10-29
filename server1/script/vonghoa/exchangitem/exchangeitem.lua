Include("\\script\\task\\system\\task_string.lua");

tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="Hoa C�c V�ng", tbProp={6, 1, 1064, 1}, nCount = 1},
			{szName="Hoa C�c Tr�ng", tbProp={6, 1, 1065, 1}, nCount = 1},
			{szName="Hoa C�c T�m", tbProp={6, 1, 1066, 1}, nCount = 1},
			
		},
		tbProduct =
		{
			{szName="V�ng Hoa Qu�c Kh�nh",  tbProp={6, 1, 30033, 1, 0, 0}, nExpiredTime = 20100920},
		},	
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="Hoa C�c V�ng", tbProp={6, 1, 1064, 1}, nCount = 1},
			{szName="Hoa C�c Tr�ng", tbProp={6, 1, 1065, 1}, nCount = 1},
			{szName="Hoa C�c T�m", tbProp={6, 1, 1066, 1}, nCount = 1},
			{szName="Hoa H�ng", tbProp={6, 1, 1438, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="V�ng Hoa ��c L�p",  tbProp={6, 1, 30034, 1, 0, 0}, nExpiredTime = 20100920},
		},	
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="Hoa C�c V�ng", tbProp={6, 1, 1064, 1}, nCount = 1},
			{szName="Hoa C�c Tr�ng", tbProp={6, 1, 1065, 1}, nCount = 1},
			{szName="Hoa C�c T�m", tbProp={6, 1, 1066, 1}, nCount = 1},
			{szName="Hoa H�ng", tbProp={6, 1, 1438, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="V�ng Hoa T� Do",  tbProp={6, 1, 30035, 1, 0, 0}, nExpiredTime = 20100920},
		},	
	},
}


function ExChangeItem_main()
	
	local tbOpp = {}
	local str = "<#> ��i hi�p mu�n ��i ph�n th��ng n�o ?";
	tinsert(tbOpp,"Ta mu�n ��i V�ng Hoa Qu�c Kh�nh(1 Hoa C�c V�ng + 1 Hoa C�c Tr�ng + 1 Hoa C�c T�m + 2 V�n)/#DoExChangeItem(1)");
	tinsert(tbOpp,"Ta mu�n ��i V�ng Hoa ��c L�p(1 Hoa C�c V�ng + 1 Hoa C�c Tr�ng + 1 Hoa C�c T�m + 1 Hoa H�ng ��)/#DoExChangeItem(2)");
	tinsert(tbOpp,"Ta mu�n ��i V�ng Hoa T� Do((1 Hoa C�c V�ng + 1 Hoa C�c Tr�ng + 1 Hoa C�c T�m + 1 Hoa H�ng ��)/#DoExChangeItem(3)");
	tinsert(tbOpp, "<#>Tho�t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end



function DoExChangeItem(numIndexExchange)
	if (CheckMaterial(numIndexExchange)~=1) then
		Talk(1, "", "Kh�ng �� nguy�n li�u ��i v�t ph�m, xin ��i hi�p ki�m tra l�i");
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Talk(1, "", "H�nh trang kh�ng �� 5 � tr�ng.");
		return
	end
	if (numIndexExchange == 1) then
		if (GetCash() < 20000 ) then
			Talk(1, "", "��i V�ng Hoa Qu�c Kh�nh c�n 2 v�n l��ng !");
			return
		end
		if Pay(20000) ~= 1 then
			Msg2Player("Tr� ng�n l��ng th�t b�i !")
			return
		end
	end
	
	
	ConsumeMaterial(numIndexExchange)--tr� nguy�n li�u trong h�nh trang ng��i ch�i
	AddItemExchange(numIndexExchange)
end

function ConsumeMaterial(numtbMaterial)
	local tbMaterial = tbFormulaList[numtbMaterial].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount
		if ConsumeEquiproomItem(numItem, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
			WriteLog(date("%Y%m%d %H%M%S").."\t".."��i V�ng Hoa"..GetAccount().."\t"..GetName().."\t".."��i v�t ph�m th�t b�i !")	
			return
		end
	end
end


function CheckMaterial(numtbMaterial)
	local tbMaterial = tbFormulaList[numtbMaterial].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount
		local nCurCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
		if (nCurCount < numItem) then
			return 0
		end
	end
	return 1
end

function AddItemExchange(numtbMaterial)
	local tbProduct = tbFormulaList[numtbMaterial].tbProduct
	for i=1,getn(tbProduct) do
		local tbItem = tbProduct[i]
		local tbProp = tbItem.tbProp
		local nExpiredTime = tbItem.nExpiredTime
		local nIndex = AddItem(tbProp[1], tbProp[2], tbProp[3], tbProp[4],tbProp[5],tbProp[6])
		ITEM_SetExpiredTime(nIndex, 20100919);
		SyncItem(nIndex)
		local strItem = GetItemName(nIndex)
		Msg2Player("B�n nh�n ���c "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."��i V�ng Hoa"..GetAccount().."\t"..GetName().."\t".."��i v�t ph�m  "..strItem)
	end
end


function OnCancel()
end 