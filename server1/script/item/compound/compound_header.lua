-- ���ܣ�װ��[�ϳ�]�ű�ͷ�ļ����˴�[�ϳ�]��ָԭ�����������졢��Ƕ��������ز�����
-- ˵�������ļ��ṩ��[�ϳ�]������һ�����̿�ܼ�������ع��ܺ������������������[�ϳ�]�����ű��ļ�����ʹ��
--       �������ļ����[�ϳ�]���ܣ���Ҫʵ�����¼���������ȫ�ֱ�����
--       initData() ����ѡ��	��ʼ������
--       getCompoundParam()		��ȡ[�ϳ�]�������������ڴ��ݸ�ITEM_CalcItemValue������Ʒ��ֵ����
--       verifySrcItems( arynNecessaryItemIdx, arynAlternativeItemIdx )	У��ԭ���Ƿ����[�ϳ�]����ͬʱ�洢һЩԭ�����ݣ�
--       genDesItemsInfo( arynNecessaryItemIdx )	����Ŀ����Ʒ��Ϣ
--       	��Ʒ��Ϣ�ṹ��{ nItemVer, nRandSeed, nQuality, nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck, {arynMagicLevel}, {arynMagicID}, strCompoundParam }
--       function finalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal )	���ѡ��Ŀ����Ʒ��ɾ��ԭ�ϵ���β����
--       COMPOUND_COST			[�ϳ�]����
--       * �����[�ϳ�]���̿�ܲ����ã��򲻰�����ͷ�ļ����Լ���дCompound�ӿں�������
-- Fanghao Wu 2005.1.15


IncludeLib( "ITEM" );
Include( "\\script\\item\\itemvalue\\itemvalue_header.lua" );


-- ��Ҫ��¼Log����Ʒ
ITEM_TO_LOG =
{
	{ 4, 238, 1, "Lam Th�y Tinh" },
	{ 4, 239, 1, "T� Th�y Tinh" },
	{ 4, 240, 1, "L�c Th�y Tinh" },
	{ 6, 1, 122, "Ph�c Duy�n L� (Ti�u) " },
	{ 6, 1, 123, "Ph�c Duy�n L� (Trung) " },
	{ 6, 1, 124, "Ph�c Duy�n L� (��i) " },
	{ 6, 1, 398, "Th�n b� kho�ng th�ch" },
}


-- ���¸��������ֵ����ͳ�����GameDataDef.h��FOUNDRY_RESULT_TYPEö��ֵһһ��Ӧ
RESULT_UNKNOWN			=	-1;						-- δ֪����
RESULT_SUCCEED			=	0;						-- [�ϳ�]�ɹ�
RESULT_FAIL				=	1;						-- [�ϳ�]ʧ��
RESULT_NO_MONEY			=	2;						-- ��Ǯ����
RESULT_LEVEL_FULL		=	3;						-- ԭ���Ѵﵽ��ߵȼ�
RESULT_LACK_RESOURCE	=	4;			 			-- ԭ�ϲ���
RESULT_LEVEL_ERROR		=	5;						-- ԭ�ϵȼ�����
RESULT_MAGIC_ERROR		=	6;						-- ԭ��ħ��ֵ����
RESULT_SERIES_ERROR		=	7;						-- ԭ�����д���
RESULT_RULE_ERROR		=	8;						-- ԭ�ϲ����Ϲ���


GLBID_LAST_CMP_DATE		=	32;						-- ȫ�ֱ���ID of ���һ��[�ϳ�]������
GLBID_COMMON_VAL_SUM	=	33;						-- ȫ�ֱ���ID of ��ͨ��Ʒ��ֵ������ֵ
GLBID_GOLD_VAL_SUM		=	34;						-- ȫ�ֱ���ID of �ƽ�װ����ֵ������ֵ

SUM_UNIT				=	10000000;					-- �洢��GlobalValue�ĵ�λ��ǧ��
COMMON_SUM_BASE_VAL		=	100000000 / SUM_UNIT;		-- ��Ҫ������ͨ��Ʒ��ֵ������ֵ����ͼ�ֵ��
COMMON_SUM_MAX_VAL		=	200000000000 / SUM_UNIT;	-- ÿ������[�ϳ�]����ͨ��Ʒ��ֵ������ֵ�����ֵ�������ֵ��������������κ�[�ϳ�]����
GOLD_SUM_BASE_VAL		=	1000000000 / SUM_UNIT;		-- ��Ҫ����ƽ�װ����ֵ������ֵ����ͼ�ֵ��
GOLD_SUM_MAX_VAL		=	200000000000 / SUM_UNIT;	-- ÿ������[�ϳ�]�Ļƽ�װ����ֵ������ֵ�����ֵ�������ֵ��������������κ�[�ϳ�]����


-- ���ܣ���������ʵĽӿں�����ʵ��ĳһ[�ϳ�]����
-- ������arynNecessaryItemIdx		����ԭ�ϵ���Ʒ��������
--       arynAlternativeItemIdx		��ѡԭ�ϵ���Ʒ��������
--       bPreview					Ԥ��
-- ���أ����ɵ���Ʒ����, [�ϳ�]���
function Compound( arynNecessaryItemIdx, arynAlternativeItemIdx, bPreview )
	if( isCompoundableToday() ~= 1 ) then
		Say( "Th� r�n th�n b�: H�m nay l�o phu �� qu� m�t m�i, ng�y mai hi�p s� h�y ��n ��c trang b�!", 0 );
		return -1, RESULT_FAIL;
	end
	-- ��ʼ������
	if( initData ~= nil ) then
		initData();
	end
	-- У��ԭ���Ƿ����[�ϳ�]����ͬʱ�洢һЩԭ�����ݣ�
	local nResult = verifySrcItems( arynNecessaryItemIdx, arynAlternativeItemIdx );
	if( nResult ~= RESULT_SUCCEED ) then
		return -1, nResult;
	end
	-- ֧��[�ϳ�]����
	if( COMPOUND_COST == nil or Pay( COMPOUND_COST ) ~= 1 ) then
		return -1, RESULT_NO_MONEY;
	end
	-- ��������ԭ�ϼ�ֵ���ܺ�
	local nNecItemValSum = sumItemsVal( arynNecessaryItemIdx );
	local nAltItemValSum = sumItemsVal( arynAlternativeItemIdx );
	local dAltItemFinalVal = nAltItemValSum;
	if( sumMainItemVal ~= nil ) then
		nMainItemValSum = sumMainItemVal( arynNecessaryItemIdx );
		dAltItemFinalVal = calcAltItemFinalVal( nMainItemValSum, nAltItemValSum );
	end
	local nSrcItemValSum = nNecItemValSum + dAltItemFinalVal;
--	Msg2Player( "<color=yellow>-----------------------------------" );
--	Msg2Player( "<color=gold>TotalSrcSum: "..nNecItemValSum.."+"..dAltItemFinalVal.."="..nSrcItemValSum );
--	Msg2Player( "<color=yellow>-----------------------------------" );
	-- ����Ŀ����Ʒ��Ϣ
	local aryDesItemInfo = genDesItemsInfo( arynNecessaryItemIdx );
	-- ����ÿ��Ŀ����Ʒ�ļ�ֵ��
	local arydDesItemVal = {};
	local nDesItemCount = getn( aryDesItemInfo );
	for i = 1, nDesItemCount do
		arydDesItemVal[i] = funitem_calcItemValue(aryDesItemInfo[i]);
--Msg2Player( "<color=green>DesValue"..i..": "..arydDesItemVal[i] );
	end
--	Msg2Player( "<color=yellow>-----------------------------------" );
	
	if( bPreview == 1 ) then	-- Ԥ��[�ϳ�]�ĳɹ���
		if( previewProb ~= nil ) then
			previewProb( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal );
		end
		return -1, RESULT_SUCCEED;
	else						-- ����[�ϳ�]����
		-- ���ѡ��Ŀ����Ʒ��ɾ��ԭ�ϵ���β����
		nResultDesItemIdx, nResult = finalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal );
		-- ����������Ʒ������[�ϳ�]���
		return nResultDesItemIdx, nResult;
	end
end

-- һ�����β�������������ѡ��Ŀ����Ʒ��ɾ��ԭ�ϵ���β������
function defFinalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal, funcTransItemVal )
	if (funcTransItemVal == nil) then
		funcTransItemVal = TransItemVal;
	end
	local nSelDesItemIdx, arydDesItemProb, dDesItemProbSum = funcTransItemVal( nSrcItemValSum, arydDesItemVal );
	if( nSelDesItemIdx > 0 ) then
		-- �ۻ�ÿ��[�ϳ�]����Ʒ��ֵ������ֵ
		local nDesItemValCut = floor( arydDesItemVal[nSelDesItemIdx] / SUM_UNIT );
		if( aryDesItemInfo[nSelDesItemIdx][3] == 1 ) then
			if( nDesItemValCut >= GOLD_SUM_BASE_VAL ) then
				local nGoldEqVal = GetGlbValue( GLBID_GOLD_VAL_SUM );
				SetGlbValue( GLBID_GOLD_VAL_SUM, nGoldEqVal + nDesItemValCut );
				if( nGoldEqVal + nDesItemValCut >= GOLD_SUM_MAX_VAL ) then
					local strMsg = format( " [C�nh b�o]%s T�ng gi� tr� trang b� Ho�ng Kim [gh�p]h�m nay (%0.2fE) , �� v��t qu� m�c c�nh b�o t�ng gi� tr� (%0.2fE) , c� th� xu�t hi�n hi�n t��ng qu�t v�t ph�m, h�y li�n h� kh�n v�i b� ph�n nghi�n c�u!!!  ", date( "%Y-%m-%d %H:%M:%S" ), ( nGoldEqVal + nDesItemValCut ) * SUM_UNIT / 100000000, GOLD_SUM_MAX_VAL * SUM_UNIT / 100000000 );
					print( strMsg );
					WriteLog( strMsg );
				end
			end
		else
			if( nDesItemValCut >= COMMON_SUM_BASE_VAL ) then
				local nCommonItemVal = GetGlbValue( GLBID_COMMON_VAL_SUM );
				SetGlbValue( GLBID_COMMON_VAL_SUM, nCommonItemVal + nDesItemValCut );
				if( nCommonItemVal + nDesItemValCut >= COMMON_SUM_MAX_VAL ) then
				local strMsg = format( " [C�nh b�o]%s T�ng gi� tr� v�t ph�m t��ng quan c�a Trang b� Huy�n Tinh [gh�p]h�m nay (%0.2fE) , �� v��t qu� m�c c�nh b�o t�ng gi� tr� (%0.2fE) , c� th� xu�t hi�n hi�n t��ng qu�t v�t ph�m, h�y li�n h� kh�n v�i b� ph�n nghi�n c�u!!!  ", date( "%Y-%m-%d %H:%M:%S" ), ( nCommonItemVal + nDesItemValCut ) * SUM_UNIT / 100000000, COMMON_SUM_MAX_VAL * SUM_UNIT / 100000000 );
					print( strMsg );
					WriteLog( strMsg );
				end
			end
		end
		writeCompoundLog( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo[nSelDesItemIdx], arydDesItemVal[nSelDesItemIdx], arydDesItemProb[nSelDesItemIdx] );
		removeItems( arynNecessaryItemIdx );
		removeItems( arynAlternativeItemIdx );
		local nResultDesItemIdx = addItemByInfo( aryDesItemInfo[nSelDesItemIdx] );
		if( nResultDesItemIdx > 0 ) then
			return nResultDesItemIdx, RESULT_SUCCEED;
		else	-- ������Ʒʧ�ܵ��쳣Ҳ�������ʧ�ܣ��������¼
			return -1, RESULT_FAIL;
		end
	else
		writeCompoundLog( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, nil, 0, 1 - dDesItemProbSum );
		removeItems( arynNecessaryItemIdx );
		removeItems( arynAlternativeItemIdx );
		return -1, RESULT_FAIL;
	end
end

-- ������Ʒ�����ֵ���ܺ�
function sumItemsVal( arynItemIdx )
	local nItemCount = getn( arynItemIdx );
	local nItemValSum = 0;
	local nCurItemVal;
--	Msg2Player( "<color=yellow>-----------------------------------" );
	for i = 1, nItemCount do
		nCurItemVal = ITEM_CalcItemValue( arynItemIdx[i], getCompoundParam() );
--		Msg2Player( "<color=yellow>Value"..i..": "..nCurItemVal );
		nItemValSum = nItemValSum + nCurItemVal;
	end	
--	Msg2Player( "<color=gold>ValueSum: "..nItemValSum );
	return nItemValSum;
end

-- ���������ɾ��ָ����Ʒ�����е�������Ʒ
function removeItems( arynItemIdx )
	local nItemCount = getn( arynItemIdx );
	for i = 1, nItemCount do
		if( arynItemIdx[i] ~= nil ) then
			RemoveItemByIndex( arynItemIdx[i] );
		end
	end
end

-- ���������ָ����Ʒ��Ϣ����Ʒ
function addItemByInfo( iteminfo )
	local nItemIdx;
	if( iteminfo[10] ~= nil ) then
		nItemIdx = AddItemEx( iteminfo[1], iteminfo[2], iteminfo[3], iteminfo[4], iteminfo[5], iteminfo[6], iteminfo[7], iteminfo[8], iteminfo[9], iteminfo[10][1], iteminfo[10][2], iteminfo[10][3], iteminfo[10][4], iteminfo[10][5], iteminfo[10][6] );
	else
		nItemIdx = AddItemEx( iteminfo[1], iteminfo[2], iteminfo[3], iteminfo[4], iteminfo[5], iteminfo[6], iteminfo[7], iteminfo[8], iteminfo[9], 0 );
	end
	if( nItemIdx > 0 ) then
		WriteCompoundLog( format( "DES_RANDSEED:\t%0.0f\tDES_GEN_TIME:\t%0.0f\r\n", ITEM_GetItemRandSeed( nItemIdx ), GetItemGenTime( nItemIdx ) ) );
	else
		WriteCompoundLog( format( "ADD_ITEM_BY_INFO FAILED:\t{%d,%d,%d,%d,%d,%d,%d,%d,%d}\r\n", iteminfo[1], iteminfo[2], iteminfo[3], iteminfo[4], iteminfo[5], iteminfo[6], iteminfo[7], iteminfo[8], iteminfo[9] ) );
	end
	return nItemIdx;
end

-- д[�ϳ�]��־
function writeCompoundLog( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, desItemInfo, dDesItemVal, dDesProb )
	local arystrSrc = { "", "" };
	local arynItemIdx = { arynNecessaryItemIdx, arynAlternativeItemIdx };
	for i = 1, 2 do
		for j = 1, getn( arynItemIdx[i] ) do
			local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( arynItemIdx[i][j] );
			local nQuality = GetItemQuality( arynItemIdx[i][j] );
			local arynMagLvl = GetItemAllParams( arynItemIdx[i][j] );
			local nStackCount = GetItemStackCount( arynItemIdx[i][j] );
			arystrSrc[i] = arystrSrc[i]..format( "{%d, %d, %d, %d, %d, %d, %d, <%d, %d, %d, %d, %d, %d>}#%d\t", nQuality, nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck, arynMagLvl[1], arynMagLvl[2], arynMagLvl[3], arynMagLvl[4], arynMagLvl[5], arynMagLvl[6], nStackCount );
		end
	end
	local strDes = "";
	local strResult = "";
	if( desItemInfo ~= nil ) then
		strResult = "SUCCEED";
		if( desItemInfo[10] ~= nil ) then
			strDes = format( "{%d,%d,%d,%d,%d,%d,%d,<%d,%d,%d,%d,%d,%d>}", desItemInfo[3], desItemInfo[4], desItemInfo[5], desItemInfo[6], desItemInfo[7], desItemInfo[8], desItemInfo[9], desItemInfo[10][1], desItemInfo[10][2], desItemInfo[10][3], desItemInfo[10][4], desItemInfo[10][5], desItemInfo[10][6] );
		else
			strDes = format( "{%d,%d,%d,%d,%d,%d,%d,<%d,%d,%d,%d,%d,%d>}", desItemInfo[3], desItemInfo[4], desItemInfo[5], desItemInfo[6], desItemInfo[7], desItemInfo[8], desItemInfo[9], 0, 0, 0, 0, 0, 0 );
		end
	else
		strResult = "FAIL";
		strDes = "NONE";
	end
	WriteCompoundLog( format( "[%s]\t%s\t%s(%s)", getCompoundParam(), strResult, GetAccount( PlayerIndex ), GetName( PlayerIndex ) ) );
	WriteCompoundLog( format( "SRC:\t%s", arystrSrc[1] ) );
	WriteCompoundLog( format( "SRC_EX:\t%s", arystrSrc[2] ) );
	WriteCompoundLog( format( "DES:\t%s", strDes ) );
	WriteCompoundLog( format( "SRC_VAL_SUM:\t%0.0f\tDES_VAL:\t%0.0f\tDES_PROB:\t%0.2f%%", nSrcItemValSum, dDesItemVal, dDesProb*100 ) );
end

-- �ж��Ƿ���Խ���[�ϳ�]������û���ﵱ��[�ϳ�]��ֵ��������
function isCompoundableToday()
	local nLastDate = GetGlbValue( GLBID_LAST_CMP_DATE );
	local nTodayString = tonumber( date( "%y%m%d" ) );
	if( nLastDate ~= nTodayString ) then
		SetGlbValue( GLBID_LAST_CMP_DATE, nTodayString );
		SetGlbValue( GLBID_COMMON_VAL_SUM, 0 );
		SetGlbValue( GLBID_GOLD_VAL_SUM, 0 );
	else
		local nCommonItemVal = GetGlbValue( GLBID_COMMON_VAL_SUM );
		local nGoldEqVal = GetGlbValue( GLBID_GOLD_VAL_SUM );
		if( nCommonItemVal >= COMMON_SUM_MAX_VAL or nGoldEqVal >= GOLD_SUM_MAX_VAL ) then
			return 0;
		end
	end
	return 1;
end

-- �����ѡ��Ʒ����[�ϳ�]�ؼ���Ʒ���Ƽ�Ȩ��ļ�ֵ��
function calcAltItemFinalVal( nMainItemValSum, nAltItemValSum )
	local dAltItemFinalVal = 0;
	local arySegmentScale = { { 0, 1 }, { 0.5, 0.9 }, { 1, 0.8 }, { 1.5, 0.7 }, { 2, 0.6 } };
	local nSegmentCount = getn( arySegmentScale );
	for i = nSegmentCount, 1, -1 do
		local nSegmentDiff = nAltItemValSum - nMainItemValSum * arySegmentScale[i][1];
		if( nSegmentDiff > 0 ) then
			dAltItemFinalVal = dAltItemFinalVal + nSegmentDiff * arySegmentScale[i][2];
			nAltItemValSum = nAltItemValSum - nSegmentDiff;
		end
	end
	return dAltItemFinalVal;
end

function funitem_calcItemValue(aryDesItemInfo)
	return ITEM_CalcItemValue(aryDesItemInfo[1], aryDesItemInfo[3], aryDesItemInfo[4], aryDesItemInfo[5], aryDesItemInfo[6], aryDesItemInfo[7], aryDesItemInfo[8], aryDesItemInfo[9], aryDesItemInfo[10], aryDesItemInfo[11])
end