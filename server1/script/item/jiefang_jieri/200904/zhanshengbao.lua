-- սʤ���ű� by bel at 20090408 10��24

Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

local tb_zhanshengbao_award	=
{
	{szName="Bao g�o",	tbProp={6, 1, 2010, 1, 0, 0},	nRate = 35, nExpiredTime = jf0904_item_expiredtime},
	{szName="N��c tinh khi�t",	tbProp={6, 1, 2011, 1, 0, 0},	nRate = 50, nExpiredTime = jf0904_item_expiredtime},
	{szName="Men r��u",		tbProp={6, 1, 2012, 1, 0, 0},	nRate = 15, nExpiredTime = jf0904_item_expiredtime},
};

function main()
	if ( CalcFreeItemCellCount() < 1 ) then
		Say("H�nh trang kh�ng �� ch�, xin h�y �� tr�ng ra �t nh�t 1 �.",0);
		return 1;
	end
	
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= jf0904_item_expiredtime) then
		Msg2Player("V�t ph�m n�y �� qu� h�n.");
		return 0;
	end
	
	tbAwardTemplet:GiveAwardByList(%tb_zhanshengbao_award, "T�i m�ng chi�n th�ng");
end

function IsPickable(nItemIndex, nPlayerIndex)
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	
	if (ndate >= jf0904_item_expiredtime) then
		return 
	end
	
	ITEM_SetExpiredTime(nItemIndex, jf0904_item_expiredtime);
	SyncItem(nItemIndex);
	return 1;
end
