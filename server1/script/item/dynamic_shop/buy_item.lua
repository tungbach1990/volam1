-- �ͻ��˿ͻ��˹�����
Include("\\script\\lib\\common.lua");


local tbProcessRequest =
{
	
};



-- �ͻ��˹���
function BuyItem(nShopIdx, nSelItemIndex, nCurrencyType, nScale)

	local tbProcesser = %tbProcessRequest[nShopIdx];
	if (tbProcesser == nil) then
		print("Error: DynamicShop Client BuyItem Process!");
		return
	end
	
	-- ��������������
	DynamicExecute(tbProcesser[1], tbProcesser[2], PlayerIndex, nShopIdx, nSelItemIndex, nCurrencyType, nScale);
end

