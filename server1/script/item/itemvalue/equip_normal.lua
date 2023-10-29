-- ���ܣ���ɫװ��ϵͳ - ��/��װ���ļ�ֵ������
-- Fanghao Wu 2005.1.15

IncludeLib( "FILESYS" );
Include( "\\script\\item\\item_header.lua" );
Include( "\\script\\item\\itemvalue\\magicattriblevel.lua" );

FILE_EQUIP_MAG_VAL = "itemvalue\\equip_normal_magic.txt";

loadItemTabFiles( FILE_EQUIP_MAG_VAL );

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
	local nItemVal = 0;
	if( strParam == "XUANJING_COMPOUND" ) then
		if( nDetailType == 3 or nDetailType == 4 or nDetailType == 9 ) then
			local nMagicCount = 0;
			if( aryMagic ~= nil ) then
				for i = 1, 6 * 4, 4 do
					if( aryMagic[i] > 0 ) then
						nMagicCount = nMagicCount + 1;
					end
				end
			end
			local strMagValPath = makeItemFilePath( nItemVer, FILE_EQUIP_MAG_VAL );
			local nSearchRow = TabFile_Search( strMagValPath, "MAGIC_COUNT", nMagicCount );
			if( nSearchRow >= 2 ) then
				nItemVal = tonumber( TabFile_GetCell( strMagValPath, nSearchRow, "VALUE", 0 ) );
			end
		end
	elseif( strfind( strParam, "MAGIC_DISTILL" ) ) then
		local _, nParamEnd = strfind( strParam, "MAGIC_DISTILL" );
		local nMagicIdx = tonumber( strsub( strParam, nParamEnd + 1 ) );
		local nAryMagIdx = ( nMagicIdx - 1 ) * 4;
		local nMagAttrLvl = getMagAttrLvl( nItemVer, aryMagic[nAryMagIdx+1], aryMagic[nAryMagIdx+2], aryMagic[nAryMagIdx+3], aryMagic[nAryMagIdx+4], 0 );
		local nMagicVal = 0;
		if( nMagAttrLvl > 0 ) then
			nMagicVal = getMagAttrLvlBaseVal( nItemVer, nMagAttrLvl );
		end
		nItemVal = nMagicVal;
	end
	return nItemVal;
end