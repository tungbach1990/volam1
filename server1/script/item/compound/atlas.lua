-- ���ܣ���ɫװ��ϵͳ - ʹ�ûƽ�ͼ�׺�ԭ�Ϻϳɻƽ�װ��
-- Fanghao Wu 2005.1.15

IncludeLib( "FILESYS" );
Include( "\\script\\item\\item_header.lua" );
Include( "\\script\\item\\compound\\compound_header.lua" );
Include( "\\script\\task\\system\\task_string.lua" );

FILE_ATLAS_COMPOUND = "atlas_compound.txt";

-- [�ϳ�]����
COMPOUND_COST = 100000;


function makeItemKey( nGenre, nDetailType, nParticular,nNoSign )
	return format( "%d,%d,%d,%d", nGenre, nDetailType, nParticular,nNoSign );
end

function initAtlasConfig()
	g_aryAtlasConfig = {};
	
	local nLatestItemVer = ITEM_GetLatestItemVersion();
	for i = 0, nLatestItemVer do
		local strFullPath = makeItemFilePath( i, FILE_ATLAS_COMPOUND );
		TabFile_Load( strFullPath, strFullPath );
		
		g_aryAtlasConfig[i+1] = {};
		
		local nRowCount = TabFile_GetRowCount( strFullPath );
		for j = 2, nRowCount do
			local nAtlasGenre = tonumber( TabFile_GetCell( strFullPath, j, "ATLAS_GENRE", -1 ) );
			local nAtlasDetailType = tonumber( TabFile_GetCell( strFullPath, j, "ATLAS_DETAILTYPE", -1 ) );
			local nAtlasParticular = tonumber( TabFile_GetCell( strFullPath, j, "ATLAS_PARTICULAR", -1 ) );
			local nAtlasPiece = tonumber( TabFile_GetCell( strFullPath, j, "DES_PIECE", -1 ) );
			local szAtlasKey = makeItemKey(nAtlasGenre, nAtlasDetailType, nAtlasParticular,nAtlasPiece);
			if ( g_aryAtlasConfig[i+1][szAtlasKey] == nil ) then
				g_aryAtlasConfig[i+1][szAtlasKey] = {};
			end
			
			local nAtlasKeyIdx = getn( g_aryAtlasConfig[i+1][szAtlasKey] ) + 1;
			g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx] = {};
			g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_aryMaterial = {};
			g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_DesItem = {};
			for k = 1, 6 do
				g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_aryMaterial[k] = {};
				g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_aryMaterial[k].m_nGenre = tonumber( TabFile_GetCell( strFullPath, j, k.."_GENRE", -1 ) );
				g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_aryMaterial[k].m_nDetailType = tonumber( TabFile_GetCell( strFullPath, j, k.."_DETAILTYPE", -1 ) );
				g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_aryMaterial[k].m_nParticular = tonumber( TabFile_GetCell( strFullPath, j, k.."_PARTICULAR", -1 ) );
				g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_aryMaterial[k].m_nLevel = tonumber( TabFile_GetCell( strFullPath, j, k.."_LEVEL", -1 ) );
				g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_aryMaterial[k].m_nSeries = tonumber( TabFile_GetCell( strFullPath, j, k.."_SERIES" , -1 ) );
				g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_aryMaterial[k].m_nMagicID = tonumber( TabFile_GetCell( strFullPath, j, k.."_MAGIC_ID", -1 ) );
			end
			
			local nquality = tonumber( TabFile_GetCell( strFullPath, j, "DES_QUALITY", -1 ) );
			g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_DesItem.m_nQuality = nquality;
			g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_DesItem.m_nGenre = tonumber( TabFile_GetCell( strFullPath, j, "DES_GENRE", -1 ) );
			local nsum = 0
			if nquality == 1 then
				nsum = 1
			end
			g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_DesItem.m_nDetailType = tonumber( TabFile_GetCell( strFullPath, j, "DES_DETAILTYPE", -1 ) ) - nsum;
			g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_DesItem.m_nParticular = tonumber( TabFile_GetCell( strFullPath, j, "DES_PARTICULAR", -1 ) );
			g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_DesItem.m_nLevel = tonumber( TabFile_GetCell( strFullPath, j, "DES_LEVEL", -1 ) );
			g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_DesItem.m_nSeries = tonumber( TabFile_GetCell( strFullPath, j, "DES_SERIES", -1 ) );
			g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_DesItem.m_nPiece = tonumber( TabFile_GetCell( strFullPath, j, "DES_PIECE", -1 ) );
			g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_DesItem.m_nPiecesum = tonumber( TabFile_GetCell( strFullPath, j, "DES_PIECESUM", -1 ) );
			g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_DesItem.m_szMaterialName = TabFile_GetCell( strFullPath, j, "ATLAS_NAME", "" );
			g_aryAtlasConfig[i+1][szAtlasKey][nAtlasKeyIdx].m_DesItem.m_nValues = tonumber(TabFile_GetCell( strFullPath, j, "DES_VALUES", -1 ));
		end
	end
end

initAtlasConfig();

-- ��ʼ������
function initData()
	g_nAtlasVer = -1;
	g_MatchedAtlasConfig = nil;
end

-- ��ȡ[�ϳ�]�������������ڴ��ݸ�ITEM_CalcItemValue������Ʒ��ֵ����
function getCompoundParam()
	return "ATLAS";
end

--��ѯ�ƽ���Ҫ��Ƭ����
function QueryPiece()
	GiveItemUI("Xem s� l��ng m�nh Ho�ng Kim.","H�y ��t v�o �� ph� Ho�ng Kim c�n xem!","getQueryPiece","OnCancel",1)
end
function getQueryPiece(nCount)
	local arytalk = 
	{
		"Th� r�n: Ch� c� th� ��t v�o �� ph� ho�ng kim, v�t ph�m ng��i ��t v�o kh�ng ��ng!",
		"��t v�o �� ph� Ho�ng Kim/QueryPiece",
		"Tho�t ra/OnCancel",
		"Th� r�n: �� ph� Ho�ng Kim <color=yellow>%s<color> c� th� ph�n th�nh <color=yellow>%s<color> m�nh.",
		"Th� r�n: V�t ph�m ��t v�o kh�ng ��ng ho�c �� ph� n�y t�m th�i ch�a c� m�nh n�o.",
	}
	if nCount ~= 1 then
		Say(arytalk[1],2,arytalk[2],arytalk[3])
		return
	end
	local nCurItemIdx = GetGiveItemUnit(1);
	local nCurItemName = GetItemName(nCurItemIdx);
	local nCurItemQuality = GetItemQuality(nCurItemIdx);
	local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
	local nCurItemValue = 0;
	if nCurItemQuality ~= 0 then
		Say(arytalk[1],2,arytalk[2],arytalk[3])
		return		
	end
	local szItemKey = format("%d,%d,%d,1",tbCurItemProp[1],tbCurItemProp[2],tbCurItemProp[3])
	local nCurItemVer = ITEM_GetItemVersion( nCurItemIdx );
	if( nCurItemVer+1 <= getn(g_aryAtlasConfig) and g_aryAtlasConfig[nCurItemVer+1][szItemKey] ~= nil ) then
		local nsum = g_aryAtlasConfig[nCurItemVer+1][szItemKey][1].m_DesItem.m_nPiecesum
		if nsum > 0 then
			local szname = g_aryAtlasConfig[nCurItemVer+1][szItemKey][1].m_DesItem.m_szMaterialName
			Say(format(arytalk[4],szname,nsum),0)
			return
		end
	end
	Say(arytalk[5],0)
	
end

-- У��ԭ���Ƿ����[�ϳ�]����ͬʱ�洢һЩԭ�����ݣ�
function verifySrcItems( arynNecessaryItemIdx, arynAlternativeItemIdx )
	-- �ݲ����Żƽ�ͼ���ں�
	--do return RESULT_LACK_RESOURCE; end
	
	
	--��������Ʒ--��Ƭ�ı�־��.
	local TBCOMPOUND_NOSIGNITEM =
	{
		["4,1317,1"] = 1,	--"��ʯ��Ƭ1"
		["4,1318,1"] = 2,	--"��ʯ��Ƭ2"
		["4,1319,1"] = 3,	--"��ʯ��Ƭ3"
		["4,1320,1"] = 4,	--"��ʯ��Ƭ4"
		["4,1321,1"] = 5,	--"��ʯ��Ƭ5"
		["4,1322,1"] = 6,	--"��ʯ��Ƭ6"
		["4,1323,1"] = 7,	--"��ʯ��Ƭ7"
		["4,1324,1"] = 8,	--"��ʯ��Ƭ8"
		["4,1325,1"] = 9,	--"��ʯ��Ƭ9"
	}
	local arytalk = "Th� r�n: Ta c�n <color=yellow>m�nh thi�n th�ch<color> m�i c� th� h�p th�nh m�nh Ho�ng Kim. <color=yellow>M�nh thi�n th�ch<color> kh�c nhau s� ch� t�o ra m�nh Ho�ng Kim kh�c nhau, h�y ��t <color=yellow>m�nh thi�n th�ch<color> v�o!"
	
	local nAlternativeCount = getn( arynAlternativeItemIdx );
	local bNoSign = 0
	local nNoSign = 0
	for i = 1, nAlternativeCount do
		local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( arynAlternativeItemIdx[i] );
		local bIsAtlas = 0;
		local szItem =  format("%s,%s,%s",nGenre,nDetailType,nParticular)
		if TBCOMPOUND_NOSIGNITEM[szItem] ~= nil then
			bNoSign = bNoSign + 1
			nNoSign = TBCOMPOUND_NOSIGNITEM[szItem]
		end
	end	
	
	--���´������ȥ�������ɽ���ֱ�Ӻϳɻƽ�Ҳ�ɺϳ���Ƭ������ֽ�ʯ�����Ƭ�����ŷֽ�ʯ��ͻƽ�װ��
	if(bNoSign ~= 1) then 
		Say(arytalk,0)
		return RESULT_LACK_RESOURCE;
	end
	--
	
	
	local nNecessaryItemCount = getn( arynNecessaryItemIdx );
	local aryMaterialsInfo = {};
	local nMaterialCount = 0;
	local bXuanjing = 0;
	local szAtlasKey = nil;
	for i = 1, nNecessaryItemCount do
		local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( arynNecessaryItemIdx[i] );
		local bIsAtlas = 0;
		if( szAtlasKey == nil ) then
			local nCurItemVer = ITEM_GetItemVersion( arynNecessaryItemIdx[i] );
			local szCurItemKey = makeItemKey(nGenre, nDetailType, nParticular,nNoSign);
			if( nCurItemVer+1 <= getn(g_aryAtlasConfig) and g_aryAtlasConfig[nCurItemVer+1][szCurItemKey] ~= nil ) then
				g_nAtlasVer = nCurItemVer;
				szAtlasKey = szCurItemKey;
				bIsAtlas = 1;
			end
		end
		if( bIsAtlas ~= 1 ) then
			if( nGenre == 6 and nDetailType == 1 and nParticular == 147 ) then
				if( bXuanjing == 1 ) then
					return RESULT_RULE_ERROR;
				end
				bXuanjing = 1;
			else
				nMaterialCount = nMaterialCount + 1;
				aryMaterialsInfo[nMaterialCount] = {};
				aryMaterialsInfo[nMaterialCount].m_nGenre = nGenre;
				aryMaterialsInfo[nMaterialCount].m_nDetailType = nDetailType;
				aryMaterialsInfo[nMaterialCount].m_nParticular = nParticular;
				aryMaterialsInfo[nMaterialCount].m_nLevel = nLevel;
				aryMaterialsInfo[nMaterialCount].m_nSeries = nSeries;
				aryMaterialsInfo[nMaterialCount].m_nLuck = nLuck;
				aryMaterialsInfo[nMaterialCount].m_nMagicID = GetItemParam( arynNecessaryItemIdx[i], 1 );
			end
		end
	end
	--print(szAtlasKey)
	if( g_nAtlasVer < 0 or szAtlasKey == nil or bXuanjing == 0 ) then
		return RESULT_LACK_RESOURCE;
	end
	if( verifyAtlasMaterials( g_nAtlasVer, szAtlasKey, aryMaterialsInfo ) ~= 1 ) then
		return RESULT_LACK_RESOURCE;
	end
	return RESULT_SUCCEED;
end

-- �ж�ԭ���Ƿ���ϻƽ�ͼ�׵�Ҫ��
function verifyAtlasMaterials( nAtlasVer, szAtlasKey, aryMaterialsInfo )
	local nMaterialCount = getn( aryMaterialsInfo );
	if g_aryAtlasConfig[nAtlasVer+1][szAtlasKey] == nil then
		return 0
	end
	for nAtlasKeyIdx, rCurAtlasKeyConfig in g_aryAtlasConfig[nAtlasVer+1][szAtlasKey] do
		local nReqItemCount = 0;
		local nMatchCount = 0;
		local nGenre, nDetailType, nParticular, nLevel, nSeries, nMagicID;
		for i = 1, 6 do
			nGenre = rCurAtlasKeyConfig.m_aryMaterial[i].m_nGenre;
			if( nGenre >= 0 ) then
				local bExist = 0;
				nReqItemCount = nReqItemCount + 1;
				nDetailType = rCurAtlasKeyConfig.m_aryMaterial[i].m_nDetailType;
				nParticular = rCurAtlasKeyConfig.m_aryMaterial[i].m_nParticular;
				nLevel = rCurAtlasKeyConfig.m_aryMaterial[i].m_nLevel;
				nSeries = rCurAtlasKeyConfig.m_aryMaterial[i].m_nSeries;
				nMagicID = rCurAtlasKeyConfig.m_aryMaterial[i].m_nMagicID;
				for j = 1, nMaterialCount do
					if(	aryMaterialsInfo[j].m_nGenre == nGenre and
						( nDetailType < 0 or aryMaterialsInfo[j].m_nDetailType == nDetailType ) and
						( nParticular < 0 or aryMaterialsInfo[j].m_nParticular == nParticular ) and
						( nLevel < 0 or aryMaterialsInfo[j].m_nLevel >= nLevel ) and
						( nSeries < 0 or aryMaterialsInfo[j].m_nSeries == nSeries ) and
						( nMagicID < 0 or aryMaterialsInfo[j].m_nMagicID == nMagicID ) ) then
						bExist = 1;
						nMatchCount = nMatchCount + 1;
						break;
					end
				end
				if( bExist ~= 1 ) then
					break;
				end
			end
		end
		if( nReqItemCount == nMatchCount and nReqItemCount == nMaterialCount ) then
			g_MatchedAtlasConfig = rCurAtlasKeyConfig;
			return 1;
		end
	end
	return 0;
end

-- ����Ŀ����Ʒ��Ϣ
function genDesItemsInfo( arynNecessaryItemIdx )
	local aryDesItemInfo = {};
	local nQuality = g_MatchedAtlasConfig.m_DesItem.m_nQuality
	local nGenre = g_MatchedAtlasConfig.m_DesItem.m_nGenre;
	local nDetailType = g_MatchedAtlasConfig.m_DesItem.m_nDetailType;
	local nParticular = g_MatchedAtlasConfig.m_DesItem.m_nParticular;
	local nLevel = g_MatchedAtlasConfig.m_DesItem.m_nLevel;
	local nSeries = g_MatchedAtlasConfig.m_DesItem.m_nSeries;
	local nValues = g_MatchedAtlasConfig.m_DesItem.m_nValues
	aryDesItemInfo[1] = {g_nAtlasVer, 0, nQuality, nGenre, nDetailType, nParticular, nLevel, nSeries, 0, nil, nil, getCompoundParam(),nValues};
	return aryDesItemInfo;
end

-- ���ѡ��Ŀ����Ʒ��ɾ��ԭ�ϵ���β����
function finalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal )
	return defFinalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal, transItemVal_Atlas );
end

-- Ԥ��[�ϳ�]�ĳɹ���
function previewProb( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal )
	do return end
	local nSelDesItemIdx, arydDesItemProb, dDesItemProbSum = transItemVal_Atlas( nSrcItemValSum, arydDesItemVal );
	CreateTaskSay( { format( "T� l� h�p th�nh th�nh c�ng c�a b� trang b� Ho�ng Kim l�n n�y l�\n<color=yellow>%05.2f%%", dDesItemProbSum * 100 ), "X�c nh�n/onCancel" } );
end

-- ��Ʒ��ֵ������ת�ƺ��� for Atlas
function transItemVal_Atlas( dSrcItemVal, arydDesItemVal )
	if( dSrcItemVal <= 0 or getn( arydDesItemVal ) ~= 1 ) then
		return 0, nil, 0;
	end
	
	local arydDesItemProb = {};
	local nSelDesItemIdx = -1;
	
	arydDesItemProb[1] = dSrcItemVal / arydDesItemVal[1];
	if( arydDesItemProb[1] > 1 ) then
		arydDesItemProb[1] = 1;
	end
	
	if( arydDesItemProb[1] > 0 and random() <= arydDesItemProb[1] ) then
		nSelDesItemIdx = 1;
	end
	
	return nSelDesItemIdx, arydDesItemProb, arydDesItemProb[1];
end

function onCancel()
end

function pack(...)
	return arg
end

function funitem_calcItemValue(aryDesItemInfo)
	local arydDesItemVal = 0
	if aryDesItemInfo[3] == 1 then
			arydDesItemVal = ITEM_CalcItemValue(aryDesItemInfo[1], aryDesItemInfo[3], aryDesItemInfo[4], aryDesItemInfo[5], aryDesItemInfo[6], aryDesItemInfo[7], aryDesItemInfo[8], aryDesItemInfo[9], aryDesItemInfo[10], aryDesItemInfo[11]);
	else
			arydDesItemVal = aryDesItemInfo[13]
	end
	if arydDesItemVal <= 0 then
			Say("Th� r�n th�n b�: Xin l�i! Ta ch�a ngh� ra c�ch ch� t�o �� Ho�ng Kim ng��i c�n.",0)
			return -1;
	end
	return arydDesItemVal
end