-- ԭʼ���Կ�ʯ
-- Fanghao_Wu 2004.1.28

Include( "\\script\\lib\\string.lua" );

function main()
	Talk( 2, "", "S� d�ng kho�ng th�ch c� thu�c t�nh c� th� n�ng c�p thu�c t�nh m�u xanh t��ng �ng l�n trang b�. N�u nh� <color=yellow>kho�ng th�ch c� thu�c t�nh �n<color>, trong l�c n�ng c�p c�n ph�i ng� h�nh thu�c t�nh c�a kho�ng gi�ng ng� h�nh thu�c t�nh trang b�.", "T�i th� r�n � m�i th� tr�n ��u c� th� thao t�c ��c luy�n c�c trang b� Ho�ng Kim v� Trang b� Huy�n Tinh." );
	return 1;
end

function GetDesc( nItemIdx )
	local strDesc = "";
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( nItemIdx );
	if( mod( nParticular, 2 ) == 0 ) then
		strDesc = strDesc.."Thu�c t�nh ng� h�nh:"..toSeries( nSeries ).."\n";
	end
	return strDesc;
end