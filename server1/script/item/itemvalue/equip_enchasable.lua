-- ���ܣ���ɫװ��ϵͳ - ��ɫװ���ļ�ֵ������
-- Fanghao Wu 2005.1.15

IncludeLib( "FILESYS" );
Include( "\\script\\item\\item_header.lua" );
Include( "\\script\\item\\itemvalue\\magicattriblevel.lua" );

FILE_EQUIP_SOCKET_VAL = "itemvalue\\equip_enchasable_socket.txt";
FILE_EQUIP_LEVEL_VAL = "itemvalue\\equip_enchasable_level.txt";
FILE_EQUIP_TYPE_VAL = "itemvalue\\equip_enchasable_type.txt";

loadItemTabFiles( FILE_EQUIP_SOCKET_VAL );
loadItemTabFiles( FILE_EQUIP_LEVEL_VAL );
loadItemTabFiles( FILE_EQUIP_TYPE_VAL );

-- ���ܣ���������ʵĽӿں���������ָ����Ʒ��Ϣ�ļ�ֵ��
-- ������nItemVer ��Ʒ�汾��
--       nQuality ��ƷƷ��
--       nGenre, nDetailType, nParticular ��Ʒ���
--       nLevel ��Ʒ����
--       nSeries ��Ʒ����
--       nLuck ��Ʒ���ɲ���������ֵ
--       arynMagLvl ��ƷMagicLevel����
--       aryMagic ��ƷMagicID����
--       strParam [�ϳ�]��������
-- ���أ���ֵ����������󷵻�0��
function CalcItemValue( nItemVer, nQuality, nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck, arynMagLvl, aryMagic, strParam )
	local nValue_Socket = calcItemValue_Socket( nItemVer, arynMagLvl );
--	print( "SocketVal:"..nValue_Socket );
	local nValue_Level = calcItemValue_Level( nItemVer, nLevel, arynMagLvl );
--	print( "LevelVal:"..nValue_Level );
	local nValue_Type = calcItemValue_Type( nItemVer, nGenre, nDetailType, nParticular );
--	print( "TypeVal:"..nValue_Type );
	local nValue_Magic = calcMagicArrayValue( nItemVer, arynMagLvl, nDetailType, nParticular, nSeries );
--	print( "MagicVal:"..nValue_Magic );
	return nValue_Socket + nValue_Level * nValue_Type * nValue_Magic;
end

-- ����տ׵ļ�ֵ��
function calcItemValue_Socket( nItemVer, arynMagLvl )
	local nValue_Socket = 0;
	local nSocketCount = 0;
	for i = 1, 6 do
		if( arynMagLvl[i] == -1 ) then
			nSocketCount = nSocketCount + 1;
		elseif( arynMagLvl[i] == 0 ) then
			break;
		end
	end
	local strSocketValPath = makeItemFilePath( nItemVer, FILE_EQUIP_SOCKET_VAL );
	local nSearchRow = TabFile_Search( strSocketValPath, "SOCKET_COUNT", nSocketCount );
	if( nSearchRow >= 2 ) then
		nValue_Socket = tonumber( TabFile_GetCell( strSocketValPath, nSearchRow, "VALUE", 0 ) );
	end
	return nValue_Socket;
end

-- ����װ������ļ�ֵ����Ȩ%
function calcItemValue_Level( nItemVer, nLevel, arynMagLvl )
	local nValue_Level = 1;
	local strLevelValPath = makeItemFilePath( nItemVer, FILE_EQUIP_LEVEL_VAL );
	local nSearchRow = TabFile_Search( strLevelValPath, "LEVEL", nLevel );
	if( nSearchRow >= 2 ) then
		local strValueColumn= "VALUE%_1";
		for i = 1, 6 do
			if( arynMagLvl[i] <= 0 ) then
				break;
			end
			local nMagicID = getMagAttrLvlType( nItemVer, arynMagLvl[i] );
			if( nMagicID >=168 and nMagicID <= 172 ) then	-- �ڹ�ϵ�˺�
				strValueColumn= "VALUE%_2";
				break;
			end
		end
		nValue_Level = tonumber( TabFile_GetCell( strLevelValPath, nSearchRow, strValueColumn, 100 ) ) / 100;
	end
	return nValue_Level;
end

-- ����װ�����͵ļ�ֵ����Ȩ%
function calcItemValue_Type( nItemVer, nGenre, nDetailType, nParticular )
	local nValue_Type = 1;
	local strTypeValPath = makeItemFilePath( nItemVer, FILE_EQUIP_TYPE_VAL );
	local nRowCount = TabFile_GetRowCount( strTypeValPath );
	for i = 2, nRowCount do
		local nCurGenre = tonumber( TabFile_GetCell( strTypeValPath, i, "GENRE", -1 ) );
		local nCurDetailType = tonumber( TabFile_GetCell( strTypeValPath, i, "DETAILTYPE", -1 ) );
		local nCurParticular = tonumber( TabFile_GetCell( strTypeValPath, i, "PARTICULAR", -1 ) );
		if(	( nCurParticular < 0 or nParticular == nCurParticular ) and
			( nCurDetailType < 0 or nDetailType == nCurDetailType ) and
			( nCurGenre < 0 or nGenre == nCurGenre ) ) then
			nValue_Type = tonumber( TabFile_GetCell( strTypeValPath, i, "VALUE%", 100 ) ) / 100;
			break;
		end
	end
	return nValue_Type;
end