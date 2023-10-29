-- �ͻ���Э�鴦��
Include("\\script\\lib\\common.lua");


local tbProcessRequest =
{
	
};


-- ����
function NewDynamicShopItemInfo(Protoid, nDynamicShopID, nRequestPage)
	local tb = {};
	tb.nPlayerIndex = PlayerIndex;
	tb.nProtoid = Protoid;
	tb.nDynamicShopID = nDynamicShopID;
	tb.nRequestPage = nRequestPage;
	tb.nItemCount = 0;
	return tb;
end

-- �����µ���Ʒ ȫ��ʹ��Ĭ��ֵ
function CreateNewDynamicShopItem(tb)
	tb.nItemCount = tb.nItemCount + 1;
	tb[tb.nItemCount] = 
	{
		Index = 0,		-- ��ƷΨһ��ID
		Price = 0,		-- �۸�
		G = -1,
		D = -1,
		P = -1,
		Level = 1,
		Series = 0,
		Luck = 0,
	};
	return tb.nItemCount;
end

-- �������ݸ��ͻ���
function SendDynamicShopItem2Client(tb)
	local nResultHandle = OB_Create();
	OB_PushInt(nResultHandle, tb.nDynamicShopID - 1);
	OB_PushInt(nResultHandle, tb.nRequestPage);
	OB_PushInt(nResultHandle, tb.nItemCount);
		
	for i = 1,tb.nItemCount do
		OB_PushInt(nResultHandle, tb[i].Index);
		OB_PushInt(nResultHandle, tb[i].Price);
		OB_PushInt(nResultHandle, tb[i].G);
		OB_PushInt(nResultHandle, tb[i].D);
		OB_PushInt(nResultHandle, tb[i].P);
		OB_PushInt(nResultHandle, tb[i].Level);
		OB_PushInt(nResultHandle, tb[i].Series);
		OB_PushInt(nResultHandle, tb[i].Luck);
	end
		
	SendScriptData(tb.nProtoid, nResultHandle);
	OB_Release(nResultHandle);
end

-- ������Ʒ
function AddDynamicShopItem(tb, G, D, P, Price, Index)
 	local nItemIndex = CreateNewDynamicShopItem(tb);
 	tb[nItemIndex].G = G;
 	tb[nItemIndex].D = D;
 	tb[nItemIndex].P = P;
 	tb[nItemIndex].Price = Price;
 	tb[nItemIndex].Index = Index;
 	return nItemIndex;
end


-- ������Ʒ����
function RequestItemInfo(SenderPlayerIndex, Protoid, Handle)
	
	if Handle == 0 then
		return
	end
	
	local nOldIdx = PlayerIndex;
	PlayerIndex = SenderPlayerIndex;
	
	local nDynamicShopID = GetDynamicShopID();
	local nRequestPage = OB_PopInt(Handle);
	local tbProcesser = %tbProcessRequest[nDynamicShopID];
	
	if (nDynamicShopID <= 0 or type(nRequestPage) ~= "number" or tbProcesser == nil) then
		print("Error: DynamicShop Client Protocol Process!");
		print(nDynamicShopID)
		print(type(nRequestPage))
		print(tbProcesser)
		PlayerIndex = nOldIdx;
		return
	end
	
	-- ��������������
	local tbItemInfo = NewDynamicShopItemInfo(Protoid, nDynamicShopID, nRequestPage);
	tbItemInfo = DynamicExecute(tbProcesser[1], tbProcesser[2], tbItemInfo);
	SendDynamicShopItem2Client(tbItemInfo);

	PlayerIndex = nOldIdx;
end

