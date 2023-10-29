-- ���ܣ��°׽�װ��ϵͳ - ����ļ�ֵ������
-- baiyun 2012.03.16

IncludeLib( "FILESYS" );
Include( "\\script\\item\\item_header.lua" );

FANTASYGOLD_VALUE_FILE = "itemvalue\\FantasyGold.txt";

loadItemTabFiles( FANTASYGOLD_VALUE_FILE );

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
	local strOreValPath = makeItemFilePath( nItemVer, FANTASYGOLD_VALUE_FILE );
	local nSearchRow = TabFile_Search( strOreValPath, "LEVEL", nLevel );
	if( nSearchRow >= 2 ) then
		nItemVal = tonumber( TabFile_GetCell( strOreValPath, nSearchRow, "VALUE", 0 ) );
	end
	return nItemVal;
end


--�ṩ���ű�ʹ�ÿ�ݻ�ȡ�ȼ���Ӧ�ļ�ֵ��
function CalcFantasyGoldValueByLevel(nLevel)
	local nItemVersion = ITEM_GetLatestItemVersion();
	local nItemValue = 0;
	local strValueFilePath = makeItemFilePath(nItemVersion, FANTASYGOLD_VALUE_FILE);
	local nSearchRow = TabFile_Search(strValueFilePath, "LEVEL", nLevel);
	if( nSearchRow >= 2 ) then
		nItemValue = tonumber(TabFile_GetCell(strValueFilePath, nSearchRow, "VALUE", 0));
	end
	return nItemValue;
end

