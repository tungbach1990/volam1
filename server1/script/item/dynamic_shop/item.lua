
ItemClass = {}
function ItemClass:_init()
	self.szName = ""
	self.tbProp = {} --{nItemGenre, nDetailType, nParticualrType, nLevel, nSeries, nLuck}
	self.nVersion = 4--Ĭ�ϰ汾�ţ�Ŀǰ�õ���4
	self.nRandSeed = 0 --0��ʾ��ָ���������
	self.nQuality = 0 --0��ͨ 1 �ƽ�  4�׽�
	self.tbParam = {0,0,0,0,0,0}--����ħ������ or �Զ������������ѡһ�����װ�������Զ��������
	self.nUpgradeLevel = nil
	self.nCurDurability = nil 
	self.nMaxDurability = nil
	self.nExpiredTime = nil
	self.nLeftUsageTime = nil
	self.nItemLockState = nil
	self.nBindState = nil
	self.nCount = 1
end

function ItemClass:Pack(...)
	return arg
end

--���ɿ����ݵĵ���
function ItemClass:New()
	local tb = {}
	for key, value in self do
		tb[key] = value
	end
	self:_init()
	return tb
end

--���ݴ���������һ����Ʒ
function ItemClass:NewFormPureData(tbItem)
	local tb = self:New()
	for key, value in tbItem do
		if type(value) ~= "function" then
			tb[key] = value
		end
	end
	return tb
end

--������ƷIndex���ɵ�������
function ItemClass:NewFromItemIndex(nItemIndex)
	local tb = self:New()
	
	tb.szName			= GetItemName(nItemIndex)
	tb.nRandSeed		= ITEM_GetItemRandSeed(nItemIndex)
	tb.nQuality 		= GetItemQuality(nItemIndex)
	tb.nBindState		= GetItemBindState(nItemIndex)
	tb.tbParam			= GetItemAllParams(nItemIndex)
	tb.nUpgradeLevel	= GetPlatinaLevel(nItemIndex)
	tb.nExpiredTime		=  ITEM_GetExpiredTime(nItemIndex)
	tb.nLeftUsageTime	= ITEM_GetLeftUsageTime(nItemIndex)
	
	--��ʱû������
	
	if tb.nQuality == 1 then
		tb.tbProp = {0, GetGlodEqIndex(nItemIndex)}
	elseif tb.nQuality == 4 then
		tb.tbProp = {0, GetPlatinaEquipIndex(nItemIndex)}
	else
		tb.tbProp = self:Pack(GetItemProp(nItemIndex))
	end
	
		
	if IsItemStackable(nItemIndex) == 1 then --������Ʒ����������û�;�
		tb.nCount = GetItemStackCount(nItemIndex)
	else--�ǵ�����Ʒ���;�
		tb.nCurDurability = GetCurDurability(nItemIndex)
		tb.nMaxDurability = GetMaxDurability(nItemIndex)	
	end
		
	return tb
end

--��ȡ���ߵĴ����ݣ�����������
function ItemClass:GetPureData()
	local tb = {}
	for key, value in self do
		if type(value) ~= "function" then
			tb[key] = value
		end
	end
	return tb
end

function ItemClass:AddStackCount(nItemIndex, nAddCount)
	if nAddCount <= 0 then
		return 0
	end
	local nOrgStackCount = GetItemStackCount(nItemIndex)
	local nMaxStackCount = GetItemMaxStackCount(nItemIndex)
	local nStackCount = nOrgStackCount + nAddCount
	if nStackCount >= nMaxStackCount then
		nStackCount = nMaxStackCount
	end
	SetItemStackCount(nItemIndex, nStackCount)
	return nStackCount - nOrgStackCount --���������˼���������
end


function ItemClass:CreateItem(nPlayerIndex, nCopysCount, varLogTitle)
	local nItemIndex = self:GenBaseItem()
	self:SetExtProperty(nItemIndex)
	return nItemIndex
end

--���������һ������
function ItemClass:AddToPlayer(nPlayerIndex, nCopysCount, varLogTitle)
	local nCount = (self.nCount or 1) * nCopysCount
	
	for i=1, nCount do 
		local nItemIndex = self:GenBaseItem()
		if nItemIndex > 0 then
			if IsItemStackable(nItemIndex) == 1 then --���ڵ�����Ʒ,�Ż�ѭ������Ϊ ceil(topCount / MaxStackCount)
				i = i + self:AddStackCount(nCount - i)
			end
			self:SetExtProperty(nItemIndex)
			lib:DoFunByPlayer(nPlayerIndex, AddItemByIndex, nItemIndex)
		end
	end
	local szLog = ""
	self:WriteLog(varLogTitle, szLog)
end

function ItemClass:WriteLog(varLogTitle, szLog)
	
end

--����������һ����Ʒ�������ݣ�ԭʼ���ݣ�
function ItemClass:GenBaseItem()
	local nRow = 0
	if self.nQuality and (self.nQuality == 1 or tbItem.self == 4) then
		nRow = 1
	end
	local uRandSeed	= tonumber(format("%u", self.nRandSeed))
	
	local nItemGenre		= self.tbProp[1] or 0
	local nDetailType		= (self.tbProp[2] or 0) - nRow
	local nParticualrType	= self.tbProp[3] or 0
	local nLevel			= self.tbProp[4] or 0
	local nSeries			= self.tbProp[5] or random(0,4)
	local nLuck				= self.tbProp[6] or 0
	
	return NewItemEx(self.nVersion,uRandSeed,self.nQuality,
		nItemGenre, nDetailType, nParticualrType, nLevel, nSeries, nLuck, 		
		self.tbParam[1] or 0,
		self.tbParam[2] or 0,
		self.tbParam[3] or 0,
		self.tbParam[4] or 0,
		self.tbParam[5] or 0,
		self.tbParam[6] or 0,
		self.nUpgradeLevel)
end

--���ö��������
function ItemClass:SetExtProperty(nItemIndex)		
	if IsItemStackable(nItemIndex) ~= 1 then --���ڲ��ɵ��ӵĵ���
		if self.nCurDurability then --���õ�ǰ�;ö�
			SetCurDurability(nItemIndex, self.nCurDurability)
		end
		
		if self.nMaxDurability then -- ��������;ö�
			SetMaxDurability(nItemIndex, self.nMaxDurability)
		end
	end
	if self.nExpiredTime then
		ITEM_SetExpiredTime(nItemIndex, self.nExpiredTime)-- ������Ч��
	end
	
	if self.nUsageTime or self.nLeftUsageTime then
		ITEM_SetLeftUsageTime(nItemIndex, self.nUsageTime or self.nLeftUsageTime) -- ����ʹ����
	end
	
	if self.nItemLockState == 1 then --��������
		LockItem(nItemIndex);
	end
	
	if self.nBindState then
		SetItemBindState(nItemIndex, self.nBindState)--����nBindState����Ʒ
	end
end