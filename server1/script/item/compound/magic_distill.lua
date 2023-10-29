-- ���ܣ���ɫװ��ϵͳ - ��ȡ��ɫװ��ħ�����Ե����Կ�ʯ
-- Fanghao Wu 2005.1.15

Include( "\\script\\item\\compound\\compound_header.lua" );
Include( "\\script\\item\\itemvalue\\magicattriblevel.lua" );

-- [�ϳ�]����
COMPOUND_COST = 5000;


-- ��ʼ������
function initData()
	g_nOreSeries = 0;
	g_nDistillMagicPos = 0;
	g_nDistillMagicID = 0;
end

-- ��ȡ[�ϳ�]�������������ڴ��ݸ�ITEM_CalcItemValue������Ʒ��ֵ����
function getCompoundParam()
	return "MAGIC_DISTILL"..g_nDistillMagicPos;
end

-- У��ԭ���Ƿ����[�ϳ�]����ͬʱ�洢һЩԭ�����ݣ�
function verifySrcItems( arynNecessaryItemIdx, arynAlternativeItemIdx )
	local nNecessaryItemCount = getn( arynNecessaryItemIdx );
	local nEquipIdx = 0;
	local nEquipSeries = 0;
	for i = 1, nNecessaryItemCount do
		local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( arynNecessaryItemIdx[i] );
		if( nGenre == 0 ) then
			nEquipIdx = arynNecessaryItemIdx[i];
			nEquipSeries = nSeries;
			if( g_nDistillMagicPos > 0 ) then
				g_nDistillMagicID = GetItemMagicAttrib( nEquipIdx, g_nDistillMagicPos );
				break;
			end
		end
		if( nGenre == 6 and nDetailType == 1 and 149 <= nParticular and nParticular <= 154 ) then
			g_nDistillMagicPos = nParticular - 148;
			g_nOreSeries = nSeries;
			if( nEquipIdx > 0 ) then
				g_nDistillMagicID = GetItemMagicAttrib( nEquipIdx, g_nDistillMagicPos );
				break;
			end
		end
	end
	-- �ж��Ƿ�ȱװ����ԭ��
	if( nEquipIdx <= 0 or g_nDistillMagicPos <= 0 ) then
		return RESULT_LACK_RESOURCE;
	-- �ж��Ƿ����в�ƥ��
	elseif( mod( g_nDistillMagicPos, 2 ) == 0 and nEquipSeries ~= g_nOreSeries ) then
		return RESULT_SERIES_ERROR;
	-- �ж�װ����ȡλ�����Ƿ���ħ������
	elseif(	g_nDistillMagicID <= 0 ) then
		return RESULT_MAGIC_ERROR;
	-- �ж���ȡ��ħ�����Կɷ���������°汾��װ����
	elseif(	getn( getMagAttrLvlRange( ITEM_GetLatestItemVersion(), g_nDistillMagicID, 1 ) ) <= 0 or
			isMagicMatchSeries( ITEM_GetLatestItemVersion(), g_nDistillMagicID, g_nOreSeries ) ~= 1 ) then
		return RESULT_MAGIC_ERROR;
	end
	return RESULT_SUCCEED;
end

-- ����Ŀ����Ʒ��Ϣ
function genDesItemsInfo( arynNecessaryItemIdx )
	local aryDesItemInfo = {};
	local nLatestItemVer = ITEM_GetLatestItemVersion();
	for i = 1, 10 do
		aryDesItemInfo[i] = { nLatestItemVer, 0, 0, 6, 1, 199 + g_nDistillMagicPos, i, g_nOreSeries, 0, { g_nDistillMagicID, 0, 0, 0, 0, 0 }, nil, getCompoundParam() };
	end
	return aryDesItemInfo;
end

-- ���ѡ��Ŀ����Ʒ��ɾ��ԭ�ϵ���β����
function finalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal )
	return defFinalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal );
end

-- �����������е�[�ϳ�]�ؼ���Ʒ�ļ�ֵ���������ƿ�ѡ���ϼ�ֵ����Ȩ
function sumMainItemVal( arynNecessaryItemIdx )
	local nMainItemValSum = 0;
	for i = 1, getn( arynNecessaryItemIdx ) do
		local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( arynNecessaryItemIdx[i] );
		if( nGenre == 0 or ( nGenre == 6 and nDetailType == 1 and nParticular == 147 ) ) then
			nMainItemValSum = nMainItemValSum + ITEM_CalcItemValue( arynNecessaryItemIdx[i], getCompoundParam() );
		end
	end
	return nMainItemValSum;
end