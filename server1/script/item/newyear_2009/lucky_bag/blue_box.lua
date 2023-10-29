Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\newyear_2009\\head.lua");

tb_bluebox_item	=
{
	[1]	= {szName="Ph�c",	tbProp={6, 1, 1912, 1, 0, 0},	nRate = 50,	nExpiredTime = newyear0901_item_expiredtime},
	[2]	= {szName="Th�",	tbProp={6, 1, 1914, 1, 0, 0},	nRate = 50, nExpiredTime = newyear0901_item_expiredtime},
};

function main()
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= newyear0901_item_expiredtime) then
		Msg2Player("V�t ph�m n�y �� qu� h�n.");
		return 0;
	end
	
	if (CalcFreeItemCellCount() < 6) then
		Msg2Player("H�nh trang c�a ��i hi�p kh�ng �� ch� tr�ng!");
		return 1;
	end
	tbAwardTemplet:GiveAwardByList(tb_bluebox_item, "Lam B�o R��ng");
end

function IsPickable( nItemIndex, nPlayerIndex )
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate > newyear0901_item_expiredtime) then
		return 0;
	end
	if( IsMyItem( nItemIndex ) ) then
		if (ITEM_GetExpiredTime(nItemIndex) == 0) then
			ITEM_SetExpiredTime(nItemIndex, newyear0901_item_expiredtime);
			SyncItem(nItemIndex);
		end
		return 1;
	end
end