Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\EventThangLong1000\\head.lua")

tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="Long ��u", tbProp={6, 1, 30045, 1}, nCount = 1},
			{szName="Long Th�n", tbProp={6, 1, 30046, 1}, nCount = 1},
			{szName="Long V�", tbProp={6, 1, 30047, 1}, nCount = 1},
			{szName="Th�ng Thi�n L�nh(Ti�u)", tbProp={6, 1, 30049, 1}, nCount = 1},
			
		},
		tbProduct =
		{
			{szName="Ti�u Thi�n Ni�n Th�ng Long",  tbProp={6, 1, 30052, 1, 0, 0}, nExpiredTime = 20101025,nCount = 1 },
		},	
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="Long ��u", tbProp={6, 1, 30045, 1}, nCount = 1},
			{szName="Long Th�n", tbProp={6, 1, 30046, 1}, nCount = 1},
			{szName="Long V�", tbProp={6, 1, 30047, 1}, nCount = 1},
			{szName="Th�ng Thi�n L�nh(Trung)", tbProp={6, 1, 30050, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="Trung Thi�n Ni�n Th�ng Long",  tbProp={6, 1, 30053, 1, 0, 0}, nExpiredTime = 20101025, nCount = 1},
		},	
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="Long ��u", tbProp={6, 1, 30045, 1}, nCount = 1},
			{szName="Long Th�n", tbProp={6, 1, 30046, 1}, nCount = 1},
			{szName="Long V�", tbProp={6, 1, 30047, 1}, nCount = 1},
			{szName="Th�ng Thi�n L�nh(��i)", tbProp={6, 1, 30051, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="��i Thi�n Ni�n Th�ng Long",  tbProp={6, 1, 30054, 1, 0, 0}, nExpiredTime = 20101025, nCount = 1},
		},	
	},
}


function Event1000_ExChangeItem_main()
	
	local tbOpp = {}
	local str = "<#> ��i hi�p mu�n ��i ph�n th��ng n�o ?";
	tinsert(tbOpp,"Ti�u Thi�n Ni�n Th�ng Long/#SelectExChangeItem(1)");
	tinsert(tbOpp,"Trung Thi�n Ni�n Th�ng Long/#SelectExChangeItem(2)");
	tinsert(tbOpp,"��i Thi�n Ni�n Th�ng Long/#SelectExChangeItem(3)");
	tinsert(tbOpp, "<#>Tho�t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

 function SelectExChangeItem(nSelect)
 	SetTask(Task_nSelect_Exchange, nSelect)
 	AskClientForNumber("DoExChangeItem",1,50,"<#>Nh�p s� l��ng c�n ��i")
 	
 end


function DoExChangeItem(nCount)
	local nSelect = GetTask(Task_nSelect_Exchange)
	if (CheckMaterial(nSelect, nCount)~=1) then
		Talk(1, "", "Kh�ng �� nguy�n li�u ��i v�t ph�m, xin ��i hi�p ki�m tra l�i");
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Talk(1, "", "H�nh trang kh�ng �� 5 � tr�ng.");
		return
	end
	ConsumeMaterial(nSelect, nCount)--tr� nguy�n li�u trong h�nh trang ng��i ch�i
	AddItemExchange(nSelect, nCount)
end

function ConsumeMaterial(nSelect, nCount)
	local tbMaterial = tbFormulaList[nSelect].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount * nCount
		if ConsumeEquiproomItem(numItem, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
			WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N�m Th�ng Long"..GetAccount().."\t"..GetName().."\t".."��i v�t ph�m th�t b�i !")	
			return
		end
	end
end


function CheckMaterial(nSelect, nCount)
	local tbMaterial = tbFormulaList[nSelect].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount * nCount
		local nCurCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
		if (nCurCount < numItem) then
			return 0
		end
	end
	return 1
end

function AddItemExchange(nSelect, nCount)
	local tbProduct = tbFormulaList[nSelect].tbProduct
	for i = 1, nCount do
		tbAwardTemplet:GiveAwardByList(tbProduct, "Event 1000 N�m Th�ng Long,Gh�p V�t Ph�m");
	end
end


function OnCancel()
end 