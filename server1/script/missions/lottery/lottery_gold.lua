-- ���˲�Ʊ����
-- Fanghao Wu
-- 2004.11.13

Include( "\\script\\global\\lottery_gold.lua" )

function main()
	if( SubWorldID2Idx( 80 ) >= 0 ) then	-- �����ݵ�ͼ�ķ������ſɽ���
		onLotteryGold_UpdateIssue();
--		local nWeekDay = tonumber( date( "%w" ) );
--		if( nWeekDay == 1 ) then
--			Lottery_StartNewIssue( LOTTERY_GOLD_TYPENAME );
--		end
	end
end