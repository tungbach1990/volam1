-- ���Կ�ʯ
-- Fanghao_Wu 2004.12.15

IncludeLib( "ITEM" );
IncludeLib( "FILESYS" );
Include( "\\script\\lib\\string.lua" );
Include( "\\script\\item\\item_header.lua" );

FILE_MAGIC_INDEX = "magicattriblevel_index.txt";

loadItemTabFiles( FILE_MAGIC_INDEX );

function main( nItemIdx )
	Talk( 2, "", "S� d�ng kho�ng th�ch c� thu�c t�nh c� th� n�ng c�p thu�c t�nh m�u xanh t��ng �ng l�n trang b�. N�u nh� <color=yellow>kho�ng th�ch c� thu�c t�nh �n<color>, trong l�c n�ng c�p c�n ph�i ng� h�nh thu�c t�nh c�a kho�ng gi�ng ng� h�nh thu�c t�nh trang b�.", "T�i th� r�n � m�i th� tr�n ��u c� th� thao t�c ��c luy�n c�c trang b� Ho�ng Kim v� Trang b� Huy�n Tinh." );
	return 1;
end

function GetDesc( nItemIdx )
	local strDesc = "";
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( nItemIdx );
	if( mod( nParticular, 2 ) == 1 ) then
		strDesc = strDesc.."Thu�c t�nh ng� h�nh:"..toSeries( nSeries ).."\n";
	end
	strDesc = strDesc.."<color=blue>Thu�c t�nh:"..getMagicDesc( nItemIdx ).."\n";
	strDesc = strDesc.."<color=blue>Ph�m ch�t thu�c t�nh:<color=yellow>"..nLevel.."\n";
	strDesc = strDesc.."<color=orange>Lo�i trang b� c� th� kh�m n�m:"..getMagicFitEquip( nItemIdx );
	return strDesc;
end

function getMagicDesc( nItemIdx )
	local nItemVer = ITEM_GetItemVersion( nItemIdx );
	local nMagicID = GetItemParam( nItemIdx, 1 );
	local strMagIdxPath = makeItemFilePath( nItemVer, FILE_MAGIC_INDEX );
	local nSearchRow = TabFile_Search( strMagIdxPath, "MAGIC_ID", nMagicID );
	if( nSearchRow > 1 ) then
		return TabFile_GetCell( strMagIdxPath, nSearchRow, "DESC", "" );
	else
		return "";
	end
end

function getMagicFitEquip( nItemIdx )
	local nItemVer = ITEM_GetItemVersion( nItemIdx );
	local nMagicID = GetItemParam( nItemIdx, 1 );
	local strMagIdxPath = makeItemFilePath( nItemVer, FILE_MAGIC_INDEX );
	local nSearchRow = TabFile_Search( strMagIdxPath, "MAGIC_ID", nMagicID );
	if( nSearchRow > 1 ) then
		return TabFile_GetCell( strMagIdxPath, nSearchRow, "FIT_EQUIP", "" );
	else
		return "";
	end
end