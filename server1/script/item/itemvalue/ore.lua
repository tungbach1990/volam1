-- ���ܣ���ɫװ��ϵͳ - ��ʯ�ļ�ֵ������
-- Fanghao Wu 2005.1.15

IncludeLib( "FILESYS" );
Include( "\\script\\item\\item_header.lua" );

FILE_ORE_VAL = "itemvalue\\ore.txt";

loadItemTabFiles( FILE_ORE_VAL );

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
	local strOreValPath = makeItemFilePath( nItemVer, FILE_ORE_VAL );
	local nSearchRow = TabFile_Search( strOreValPath, "LEVEL", nLevel );
	if( nSearchRow >= 2 ) then
		nItemVal = tonumber( TabFile_GetCell( strOreValPath, nSearchRow, "VALUE", 0 ) );
	end
	return nItemVal;
end