-- ���ܣ���ɫװ��ϵͳ - ʹ����/�����κϳ�������ʯ
-- Fanghao Wu 2005.1.15

Include( "\\script\\item\\compound\\compound_header.lua" );

-- [�ϳ�]����
COMPOUND_COST = 1000;


-- ��ȡ[�ϳ�]�������������ڴ��ݸ�ITEM_CalcItemValue������Ʒ��ֵ����
function getCompoundParam()
	return "XUANJING_COMPOUND";
end

-- У��ԭ���Ƿ����[�ϳ�]����ͬʱ�洢һЩԭ�����ݣ�
function verifySrcItems( arynNecessaryItemIdx, arynAlternativeItemIdx )
	return RESULT_SUCCEED;
end

-- ����Ŀ����Ʒ��Ϣ
function genDesItemsInfo( arynNecessaryItemIdx )
	local aryDesItemInfo = {};
	local nLatestItemVer = ITEM_GetLatestItemVersion();
	for i = 1, 10 do
		aryDesItemInfo[i] = { nLatestItemVer, 0, 0, 6, 1, 147, i, 0, 0, nil, nil, getCompoundParam() };
	end
	return aryDesItemInfo;
end

-- ���ѡ��Ŀ����Ʒ��ɾ��ԭ�ϵ���β����
function finalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal )
	return defFinalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal );
end