-- ���ܣ���ɫװ��ϵͳ - ʹ����/��װ���Ϳ�ʯ����տ׵���ɫװ��
-- Fanghao Wu 2005.1.15

Include( "\\script\\item\\compound\\compound_header.lua" );

-- [�ϳ�]����
COMPOUND_COST = 10000;


-- ��ʼ����ֵ
function initData()
	g_nEquipVer = 0;
	g_nEquipRandSeed = 0;
	g_nEquipGenre = 0;
	g_nEquipDetailType = 0;
	g_nEquipParticualr = 0;
	g_nEquipLevel = 0;
	g_nEquipSeries = 0;
	g_nEquipLuck = 0;
end

-- ��ȡ[�ϳ�]�������������ڴ��ݸ�ITEM_CalcItemValue������Ʒ��ֵ����
function getCompoundParam()
	return "EQUIP_COMPOUND";
end

-- У��ԭ���Ƿ����[�ϳ�]����ͬʱ�洢һЩԭ�����ݣ�
function verifySrcItems( arynNecessaryItemIdx, arynAlternativeItemIdx )
	local nNecessaryItemCount = getn( arynNecessaryItemIdx );
	for i = 1, nNecessaryItemCount do
		local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( arynNecessaryItemIdx[i] );
		if( nGenre == 0 ) then
			g_nEquipVer = ITEM_GetItemVersion( arynNecessaryItemIdx[i] );
			g_nEquipRandSeed = ITEM_GetItemRandSeed( arynNecessaryItemIdx[i] );
			g_nEquipGenre = nGenre;
			g_nEquipDetailType = nDetailType;
			g_nEquipParticualr = nParticular;
			g_nEquipLevel = nLevel;
			g_nEquipSeries = nSeries;
			g_nEquipLuck = nLuck;
			return RESULT_SUCCEED;
		end
	end
	return RESULT_LACK_RESOURCE;
end

-- ����Ŀ����Ʒ��Ϣ
function genDesItemsInfo( arynNecessaryItemIdx )
	local aryDesItemInfo = {};
	for i = 1, 5 do
		local arynMagLvl = { 0, 0, 0, 0, 0, 0 };
		for j = 1, i do
			arynMagLvl[j] = -1;
		end
		aryDesItemInfo[i] = { g_nEquipVer, g_nEquipRandSeed, 2, g_nEquipGenre, g_nEquipDetailType, g_nEquipParticualr, g_nEquipLevel, g_nEquipSeries, g_nEquipLuck, arynMagLvl, nil,getCompoundParam() };
	end
	return aryDesItemInfo;
end

-- ���ѡ��Ŀ����Ʒ��ɾ��ԭ�ϵ���β����
function finalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal )
	return defFinalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal );
end