-- ���ܣ���ɫװ��ϵͳ - �ƽ�װ���ļ�ֵ������
-- Fanghao Wu 2005.1.15

IncludeLib( "FILESYS" );
Include( "\\script\\item\\item_header.lua" );
Include( "\\script\\item\\itemvalue\\magicattriblevel.lua" );

FILE_EQUIP_GOLD_VAL = "itemvalue\\equip_gold.txt";

loadItemTabFiles( FILE_EQUIP_GOLD_VAL );

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
	local nEquipVal = 0;
	local strEquipValPath = makeItemFilePath( nItemVer, FILE_EQUIP_GOLD_VAL );
	local nSearchRow = 1;
	local MAX_LOOP = 100;
	for i = 1, MAX_LOOP do
		nSearchRow = TabFile_Search( strEquipValPath, "INDEX", nDetailType + 1, nSearchRow + 1 );
		if( nSearchRow < 2 ) then
			break;
		end
		if( nGenre == tonumber( TabFile_GetCell( strEquipValPath, nSearchRow, "GENRE", -1 ) ) ) then
			nEquipVal = tonumber( TabFile_GetCell( strEquipValPath, nSearchRow, "VALUE", 0 ) );
			break;
		end
	end
	return nEquipVal;
end