Include( "\\script\\lib\\string.lua" );
Include("\\script\\misc\\itemexchangevalue\\jinglianshixiang.lua")

function main( nItemIdx )
	return BaoxiangCompose(nItemIdx);
end

function GetDesc( nItemIdx )
	local nCount = GetItemMagicLevel(nItemIdx, 1);
	local strDesc = "";
	strDesc = format("<color=yellow>H�n th�ch n�y c� ch�a: <color=green>%d<color> tinh l�c<color>", nCount);
	return strDesc;
end
