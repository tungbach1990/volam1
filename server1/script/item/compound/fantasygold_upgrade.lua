-- ���ܣ���������

IncludeLib("ITEM");
Include("\\script\\item\\itemvalue\\fantasygold.lua");

RESULT_UNKNOWN = -1;				-- δ֪����
RESULT_SUCCEED = 0;				-- [�ϳ�]�ɹ�
RESULT_FAIL = 1;				-- [�ϳ�]ʧ��
RESULT_NO_MONEY = 2;				-- ��Ǯ����
RESULT_LEVEL_FULL = 3;				-- ԭ���Ѵﵽ��ߵȼ�
RESULT_LACK_RESOURCE = 4;			-- ԭ�ϲ���
RESULT_LEVEL_ERROR = 5;				-- ԭ�ϵȼ�����
RESULT_MAGIC_ERROR = 6;				-- ԭ��ħ��ֵ����
RESULT_SERIES_ERROR = 7;			-- ԭ�����д���
RESULT_RULE_ERROR = 8;				-- ԭ�ϲ����Ϲ���

-- ��ʼ������
g_nOreGenre = 0;
g_nOreDetailType = 0;
g_nOreParticular = 0;
g_nOreLevel = 0;

-- У��ԭ���Ƿ����[�ϳ�]����ͬʱ�洢һЩԭ�����ݣ�
-- �ڶ�������ֵ������Ҫ�����������𼶱�����ȡ����Ҫ���ĵĽ�����������
function verifySrcItems(arynNecessaryItemIdx)
	local nNecessaryItemCount = getn(arynNecessaryItemIdx);
	if nNecessaryItemCount ~= 3 then
		return RESULT_LACK_RESOURCE;
	end

	local nGenre, nDetailType, nParticular, nLevel, nSeries = GetItemProp(arynNecessaryItemIdx[1]);
	if( nLevel >= 10 ) then
		return RESULT_LEVEL_FULL;
	end

	g_nOreGenre = nGenre;
	g_nOreDetailType = nDetailType;
	g_nOreParticular = nParticular;
	g_nOreLevel = nLevel;

	for i = 2, 3 do
		local nGenre, nDetailType, nParticular, nLevel, nSeries = GetItemProp(arynNecessaryItemIdx[i]);
		if g_nOreGenre ~= nGenre or g_nOreDetailType ~= nDetailType or g_nOreParticular ~= nParticular then
			return RESULT_LACK_RESOURCE;
		end
		if( g_nOreLevel ~= nLevel ) then
			return RESULT_LEVEL_ERROR;
		end
	end

	local nBind = 0;
	for i = 1, nNecessaryItemCount do
		if GetItemBindState(arynNecessaryItemIdx[i]) ~= 0 then
			nBind = 1
			break;
		end
	end

	return RESULT_SUCCEED, nLevel + 1, nBind;
end

-- ���ܣ���������ʵĽӿں�����ʵ��ĳһ[�ϳ�]����
-- ������arynNecessaryItemIdx		����ԭ�ϵ���Ʒ��������
--       arynAlternativeItemIdx		��ѡԭ�ϵ���Ʒ��������
--       nExParam					��չ����
-- ���أ����ɵ���Ʒ����, [�ϳ�]���
function Compound(arynNecessaryItemIdx, arynAlternativeItemIdx, nExParam)

	-- У��ԭ���Ƿ����[�ϳ�]����ͬʱ�洢һЩԭ�����ݣ�
	local nResult, nWantLevel, nBind = verifySrcItems(arynNecessaryItemIdx);
	if( nResult ~= RESULT_SUCCEED ) then
		return -1, nResult;
	end

	-- ȡ��ҪҪ������������ļ�ֵ��
	local nItemValue = CalcFantasyGoldValueByLevel(nWantLevel);
	if nItemValue == 0 then
		return RESULT_LEVEL_ERROR;
	end
	
	-- ֧��[�ϳ�]����
	-- ����֧�� ��Ӧ�����������ֵ��*1000
	local nPay = nItemValue * 1000;
	if Pay(nPay) ~= 1 then
		return -1, RESULT_NO_MONEY;
	end

	-- ����Ŀ����Ʒ��Ϣ
	local nLatestItemVer = ITEM_GetLatestItemVersion();
	local aryDesItemInfo = {
		nLatestItemVer, 
		0, 
		0, 
		g_nOreGenre, 
		g_nOreDetailType, 
		g_nOreParticular, 
		g_nOreLevel + 1, 
		g_nOreSeries, 
		0,
	};

	-- ���ѡ��Ŀ����Ʒ��ɾ��ԭ�ϵ���β����
	-- ����������Ʒ������[�ϳ�]���
	local nResultDesItemIdx = AddItemEx(
		aryDesItemInfo[1], 
		aryDesItemInfo[2], 
		aryDesItemInfo[3], 
		aryDesItemInfo[4], 
		aryDesItemInfo[5], 
		aryDesItemInfo[6], 
		aryDesItemInfo[7], 
		aryDesItemInfo[8], 
		aryDesItemInfo[9], 
		0
	);

	if nBind == 1 then
		SetItemBindState(nResultDesItemIdx, -2);
	end

	if nResultDesItemIdx > 0 then
		local nItemCount = getn(arynNecessaryItemIdx);
		for i = 1, nItemCount do
			if arynNecessaryItemIdx[i] ~= nil then
				RemoveItemByIndex(arynNecessaryItemIdx[i]);
			end
		end
		WriteLog(format("[N�ng c�p Huy�n Kim]\tt�i kho�n:%s\tnh�n v�t:%s\tti�n v�n ti�u hao%d\tnh�n ���c m�t c�i%dc�p Huy�n Kim th�nh c�ng", GetAccount(), GetName(), nPay, nWantLevel));
		return nResultDesItemIdx, RESULT_SUCCEED;
	else
		WriteLog(format("[N�ng c�p Huy�n Kim]\tt�i kho�n:%s\tnh�n v�t:%s\tti�n v�n ti�u hao%d\tnh�n ���c m�t c�i%dc�p Huy�n Kim th�t b�i", GetAccount(), GetName(), nPay, nWantLevel));
		return -1, RESULT_FAIL;
	end
end


