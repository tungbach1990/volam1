-- ���˲�Ʊ
-- Fanghao Wu
-- 2004.11.13

LOTTERY_GOLD_TYPENAME = "lottery_gold";	-- ��Ʊ������Ӧ\settings\lotterys.txt��LOTTERY_NAME
EXTPOINT_LOTTERY_GOLD = 3;				-- ��ȡ��Ʊ�жϵ���չ��ı��
MONTH_CARD_EXTPOINT_COST = 2;			-- ��һ���¿��ȼ۵���չ����
WEEK_CARD_EXTPOINT_COST = 1;			-- ��һ���ܿ��ȼ۵���չ����
MONTH_CARD_LOTTERY_ID_COUNT = 10;		-- �¿���ȡ�Ĳ�Ʊ�����ĺ�����
WEEK_CARD_LOTTERY_ID_COUNT = 5;			-- �ܿ���ȡ�Ĳ�Ʊ�����ĺ�����


--	��Ʒ���ø�ʽΪ��	 {
--						"��Ʒ����",
--						{
--							{ ��ѡ��Ʒ1����, { ��ѡ��Ʒ1���� }, ��ѡ��Ʒ1����, ��ѡ��Ʒ1���и��� },
--							...
--						}
--					 }
--	��1�� ��2004.11.22 - 2004.11.28��--------------------------------------------------------
--	FIRST_PRIZE_AWARD = {
--							"����֮����ʯ����1��",
--							{ { "����֮����ʯ����", { 4, 2549, 0, 164 }, 1, 1 }, }
--						};
--	SECOND_PRIZE_AWARD = {
--							"�������ؼ���1��",
--							{ { "�����ؼ�", { 6, 1, 26, 1, 0, 0, 0 }, 1, 1 }, }
--						 };
--	OTHER_PRIZE_AWARD1 = {
--							"�ɲ�¶10��",
--							{ { "�ɲ�¶", { 6, 1, 71, 1, 0, 0, 0 }, 10, 1 }, }
--						 };
--	OTHER_PRIZE_AWARD2 = {
--							"�ɲ�¶2��",
--							{ { "�ɲ�¶", { 6, 1, 71, 1, 0, 0, 0 }, 2, 1 }, }
--						 };
--	��2�� ��2004.11.28 - 2004.12.05��--------------------------------------------------------
--	FIRST_PRIZE_AWARD = {
--							"����ϵ�лƽ�װ�����1��",
--							{
--								{ "����֮��ɴ����", { 0, 159 }, 1, 1 },
--								{ "����֮��ɰ����", { 0, 160 }, 1, 1 },
--								{ "����֮�����ѥ", { 0, 161 }, 1, 1 },
--								{ "����֮���ٻ���", { 0, 162 }, 1, 1 },
--								{ "����֮��������", { 0, 163 }, 1, 1 },
--							}
--						};
--	SECOND_PRIZE_AWARD = {
--							"�������ؼ���1��",
--							{
--								{ "�����ؼ�", { 6, 1, 26, 1, 0, 0, 0 }, 1, 1 },
--							}
--						 };
--	OTHER_PRIZE_AWARD1 = {
--							"ˮ�����ɺ챦ʯ1��",
--							{
--								{ "��ˮ��", { 4, 238, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ "��ˮ��", { 4, 239, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ "��ˮ��", { 4, 240, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ "�ɺ챦ʯ", { 4, 353, 1, 1, 0, 0, 0 }, 1, 1 },
--							}			
--						 };
--	OTHER_PRIZE_AWARD2 = {
--							"�ɲ�¶2��",
--							{
--								{ "�ɲ�¶", { 6, 1, 71, 1, 0, 0, 0 }, 2, 1 },
--							}
--						 };
--	��3�� ��2004.12.05 - 2004.12.12��--------------------------------------------------------
--	FIRST_PRIZE_AWARD = {
--							"��ҵ֮��������ǹ1��",
--							{
--								{ "��ҵ֮��������ǹ", { 0, 21 }, 1, 1 },
--							}
--						};
--	SECOND_PRIZE_AWARD = {
--							"��������ƽ�װ��1��",
--							{
--								{ "����֮��ɴ����", { 0, 159 }, 1, 10 },
--								{ "����֮��ɰ����", { 0, 160 }, 1, 8 },
--								{ "����֮�����ѥ", { 0, 161 }, 1, 14 },
--								{ "����֮���ٻ���", { 0, 162 }, 1, 12 },
--								{ "����֮��������", { 0, 163 }, 1, 14 },
--								{ "����֮����ʯ����", { 0, 164 }, 1, 8 },
--								{ "����֮�ջ�ʯָ��", { 0, 165 }, 1, 12 },
--								{ "����֮���ʯ����", { 0, 166 }, 1, 12 },
--								{ "����֮��Ѫʯ��ָ", { 0, 167 }, 1, 10 },
--							}
--					 };
--	OTHER_PRIZE_AWARD1 = {
--							"ˮ�����ɺ챦ʯ1��",
--							{
--								{ "��ˮ��", { 4, 238, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ "��ˮ��", { 4, 239, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ "��ˮ��", { 4, 240, 1, 1, 0, 0, 0 }, 1, 1 },
--								{ "�ɺ챦ʯ", { 4, 353, 1, 1, 0, 0, 0 }, 1, 1 },
--							}			
--						 };
--	OTHER_PRIZE_AWARD2 = {
--								"�ɲ�¶2��",
--							{
--								{ "�ɲ�¶", { 6, 1, 71, 1, 0, 0, 0 }, 2, 1 },
--							}
--						 };


--	��5�� ��2004.12.27 - 2005.01.02��--------------------------------------------------------
--FIRST_PRIZE_AWARD = {
--						"�����ɴ�ƽ�װ�����һ��",
--						{
--							{ "ħ��֮��������Ȧ", { 0, 107 }, 1, 1 },
--							{ "����֮�����", { 0, 122 }, 1, 1 },
--							{ "����֮ϴ�����", { 0, 39 }, 1, 1 },
--							{ "����֮����Ǭ����", { 0, 144 }, 1, 1 },
--							{ "ͬ��֮����ؤ��", { 0, 92 }, 1, 1 },
--							{ "����֮ī������", { 0, 60 }, 1, 1 },
--						}
--					};
--SECOND_PRIZE_AWARD = {
--						"�������ؼ���1��",
--						{
--							{ "�����ؼ�", { 6, 1, 26, 1, 0, 0, 0 }, 1, 1 },
--						}
--					 };
--OTHER_PRIZE_AWARD1 = {
--						"ˮ�����ɺ챦ʯ1��",
--						{
--							{ "��ˮ��", { 4, 238, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ "��ˮ��", { 4, 239, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ "��ˮ��", { 4, 240, 1, 1, 0, 0, 0 }, 1, 1 },
--							{ "�ɺ챦ʯ", { 4, 353, 1, 1, 0, 0, 0 }, 1, 1 },
--						}			
--					 };
--OTHER_PRIZE_AWARD2 = {
--						"�ɲ�¶3��",
--						{
--							{ "�ɲ�¶", { 6, 1, 71, 1, 0, 0, 0 }, 3, 1 },
--						}
--					 };
					 

--��6��(2005.01.02 - 2005.01.09)
FIRST_PRIZE_AWARD = {
						"����֮����ʯ����1��",
						{ 
							{ "����֮����ʯ����", { 0, 164 }, 1, 1 }, 
						}
					};
SECOND_PRIZE_AWARD = {
						"��ϴ�辭��1��",
						{
							{ "ϴ�辭", { 6, 1, 22, 1, 0, 0, 0 }, 1, 1 },
						}
					 };
OTHER_PRIZE_AWARD1 = {
						"��׾���3��",
						{
							{ "��׾���", { 6, 1, 130, 1, 0, 0, 0 }, 3, 1 },
						}			
					 };
OTHER_PRIZE_AWARD2 = {
						"��׾���1��",
						{
							{ "��׾���", { 6, 1, 130, 1, 0, 0, 0 }, 1, 1 },
						}
					 };

-- ���˲�Ʊ�˵���
function onLotteryGold()
	Say( "��٣����ã�Ϊ�˻ر����������ǵĴ���֧�֣�������2004��11��22�����Ƴ����˲�Ʊ���ͨ��ÿ�����յĿ�����������������ͳ��ĸ��ַ��Ʒ��������в�����ĵط������Բ��ı��˵��й������˲�Ʊ����ϸ���͡�", 5, "��ȡ���˲�Ʊ/onLotteryGold_Gain", "���˲�Ʊ�ҽ�/onLotteryGold_Prize", "��ѯ�н�����/onLotteryGold_QueryPrize", "�������˲�Ʊ/onLotteryGold_About", "��ֻ�������/onCancel" );
end

-- �����ݵ���ٵĶԻ�
function onLotteryGoldEx()
	Say( "��٣����ã�Ϊ�˻ر����������ǵĴ���֧�֣�������2004��11��22�����Ƴ����˲�Ʊ���ͨ��ÿ�����յĿ�����������������ͳ��ĸ��ַ��Ʒ���˻ֻ������<color=red>����<color>����ٴ����С�",0);
end

-- ��ȡ���˲�Ʊ
function onLotteryGold_Gain()

	Say( "��٣����ڲ�Ʊ�Ժ��У�����ʱ����������ע��", 1, "��֪���ˣ�лл/main" );
	do return end
	
	local nWeekDay = tonumber( date( "%w" ) );
	local nHour = tonumber( date( "%H" ) );
	if( nWeekDay == 0 and nHour >= 8 and nHour < 11 ) then
		Say( "��٣��ܱ�Ǹ��ÿ����8��00��11��00�ڼ����俨�޷���ȡ��Ʊ���ϸ����鿴���������˲�Ʊ������л������", 1, "��֪���ˣ�лл/onLotteryGold" );
		do return end
	end
	local nEPValue = GetExtPoint( EXTPOINT_LOTTERY_GOLD );
	local nMonthCardCount = 0;
	local nWeekCardCount = 0;
	local nMonthLotteryCount = 0;
	local nWeekLotteryCount = 0;
	local szSayContent = "";
	
	if( nEPValue >= WEEK_CARD_EXTPOINT_COST ) then
		nMonthCardCount = floor( nEPValue / MONTH_CARD_EXTPOINT_COST );
		nWeekCardCount = floor( mod( nEPValue, MONTH_CARD_EXTPOINT_COST ) / WEEK_CARD_EXTPOINT_COST );
		szSayContent = "<#>��٣���������ȡ";
		if( nMonthCardCount > 0 ) then
			szSayContent = szSayContent.." <color=yellow>"..nMonthCardCount.."<#><color> ��10����������Ʊ";
		end
		if( nWeekCardCount > 0 ) then
			if( nMonthCardCount > 0 ) then
				szSayContent = szSayContent.."<#>��";
			end
			szSayContent = szSayContent.." <color=yellow>"..nWeekCardCount.."<#><color> ��5����������Ʊ";
		end
		szSayContent = szSayContent.."<#>������������ı�����ȷ�����㹻�Ŀռ���ò�Ʊ����Ҫ�ñ��˼��˱���Ŷ��";
		if( nMonthCardCount + nWeekCardCount > 10 ) then
			Say( szSayContent, 4, "���������ģ���ȫ����Ʊһ�����˰�/onLotteryGold_Gain_All", "�����ռ䲻�Ǻܹ�������ֻ��10�Ų�Ʊ��/onLotteryGold_Gain_10", "�����ռ䲻�Ǻܹ�������ֻ��1�Ų�Ʊ��/onLotteryGold_Gain_1", "��������һ�±�����/onCancel" );
		else
			Say( szSayContent, 3, "���������ģ���ȫ����Ʊһ�����˰�/onLotteryGold_Gain_All", "�����ռ䲻�Ǻܹ�������ֻ��1�Ų�Ʊ��/onLotteryGold_Gain_1", "��������һ�±�����/onCancel" );
		end
	else
		Say( "��٣��Բ�����������δ�俨����������ȡ�˱��ڵ����˲�Ʊ�����������Գ俨�û����ر���Ŷ�����п��ܻ����˵Ļ�ûƽ�װ��������ϸ���ǿ����", 0 );
	end
end

-- ��ȡ���˲�Ʊ-ȷ����ȡȫ����Ʊ
function onLotteryGold_Gain_All()
	onLotteryGold_Gain_Count( 0 );
end

-- ��ȡ���˲�Ʊ-ȷ����ȡ10�Ų�Ʊ
function onLotteryGold_Gain_10()
	onLotteryGold_Gain_Count( 10 );
end

-- ��ȡ���˲�Ʊ-ȷ����ȡ1�Ų�Ʊ
function onLotteryGold_Gain_1()
	onLotteryGold_Gain_Count( 1 );
end

-- ��ȡ���˲�Ʊ-ȷ����ȡָ����Ŀ�Ĳ�Ʊ��0��ʾ��ȡȫ����
function onLotteryGold_Gain_Count( nLotteryCount )
	local nEPValue = GetExtPoint( EXTPOINT_LOTTERY_GOLD );
	local nMonthCardCount = 0;
	local nWeekCardCount = 0;
	local nMonthLotteryCount = 0;
	local nWeekLotteryCount = 0;
	
	if( nEPValue >= WEEK_CARD_EXTPOINT_COST ) then
		nMonthCardCount = floor( nEPValue / MONTH_CARD_EXTPOINT_COST );
		nWeekCardCount = floor( mod( nEPValue, MONTH_CARD_EXTPOINT_COST ) / WEEK_CARD_EXTPOINT_COST );
		if( nLotteryCount == 0 ) then
			nLotteryCount = nMonthCardCount + nWeekCardCount;
		end
		for i = 1, nMonthCardCount do
			if( i > nLotteryCount ) then
				break;
			end
			if( Lottery_GenerateItem( LOTTERY_GOLD_TYPENAME, MONTH_CARD_LOTTERY_ID_COUNT ) == 1 ) then
				nMonthLotteryCount = nMonthLotteryCount + 1;
				PayExtPoint( EXTPOINT_LOTTERY_GOLD, MONTH_CARD_EXTPOINT_COST );
			end
		end
		for i = 1, nWeekCardCount do
			if( ( nMonthLotteryCount + i ) > nLotteryCount ) then
				break;
			end
			if( Lottery_GenerateItem( LOTTERY_GOLD_TYPENAME, WEEK_CARD_LOTTERY_ID_COUNT ) == 1 ) then
				nWeekLotteryCount = nWeekLotteryCount + 1;
				PayExtPoint( EXTPOINT_LOTTERY_GOLD, WEEK_CARD_EXTPOINT_COST );
			end
		end
		
		if( ( nMonthLotteryCount + nWeekLotteryCount ) > 0 ) then
			szSayContent = "<#>��٣����Ѿ���ȡ��";
			if( nMonthLotteryCount > 0 ) then
				szSayContent = szSayContent.." <color=yellow>"..nMonthLotteryCount.."<#><color> ��10����������Ʊ";
			end
			if( nWeekLotteryCount > 0 ) then
				if( nMonthLotteryCount > 0 ) then
					szSayContent = szSayContent.."<#>��";
				end
				szSayContent = szSayContent.." <color=yellow>"..nWeekLotteryCount.."<#><color> ��5����������Ʊ";
			end
			szSayContent = szSayContent.."<#>�����ڱ���ʱ�䱾�����糿11��00���������糿11��00֮�����ҽ��ɡ�";
			if( ( nMonthLotteryCount + nWeekLotteryCount ) < ( nMonthCardCount + nWeekCardCount ) ) then
				szSayContent = szSayContent.."<#>�����м��Ų�Ʊ�����������Ҫ�����ڱ�����8��00ǰ������Ŷ��";
			end
			Say( szSayContent, 0 );
			
			Msg2Player( "<#>�������"..(nMonthLotteryCount+nWeekLotteryCount).."<#>�����˲�Ʊ" );
			WriteLog( format( "[%s] %s(%s) ��ȡ�� %d��10�����Ʊ %d��5�����Ʊ\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nMonthLotteryCount, nWeekLotteryCount ) );
		else
			Say( "��٣����˲�Ʊ��ʱ�޷���ȡ�����Ժ����ԣ�лл��", 0 );
		end
	end
end

-- ���˲�Ʊ�ҽ�
function onLotteryGold_Prize()

	Say("��٣���һ�ڲ�Ʊû�з���Ŷ������ķ���ʱ�仹���������⡣",0)
	do return end
	
	local nPrizeIssueID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
	if( nPrizeIssueID > 0 ) then
		Say( "<#><color=yellow>��"..format( "%03d", nPrizeIssueID ).."<#>�����˲�Ʊ��Ʒ<color>��\nһ�Ƚ���"..FIRST_PRIZE_AWARD[1].."<#>\n���Ƚ���"..SECOND_PRIZE_AWARD[1].."<#>\n�����[����Ʊ]"..OTHER_PRIZE_AWARD1[1].."<#> [С��Ʊ]"..OTHER_PRIZE_AWARD2[1].."<#>\n<color=red>ע�����ڽ�Ʒ�����϶࣬�ڶҽ�ǰ��ע����������ȷ�����㹻�Ŀռ���ý�Ʒ�����鲻Ҫһ�ζһ������Ʊ��<color>", 2, "û���⣬�������㹻�Ŀռ�/onLotteryGold_Prize_Check", "��������һ�±�����/onCancel"  );
	else
		Say( "���˲�Ʊ��δ���������ڱ���������11��00�������ɣ�лл��", 1, "��֪���ˣ�лл/onLotteryGold" );		
	end
end

-- ���˲�Ʊ�ҽ�-��Ʊ�ҽ�����
function onLotteryGold_Prize_Check()
	
	local nPrizeIssueID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
	GiveItemUI( "��"..format( "%03d", nPrizeIssueID ).."�����˲�Ʊ�ҽ�", "��٣��뽫����ҽ�ʱ��Ĳ�Ʊ�ŵ��˽����У����ǽ�������õĽ�Ʒ�Զ�����������Ʒ��������Ʊ�ѹ��ڣ����޷��һ���<color=white>ע�����ڽ�Ʒ�����϶࣬��Ҫһ�ζһ������Ʊ���Է������ռ䲻�㣬��Ʒ���䡣<color>", "onLotteryGold_Prize_Confirm", "onCancel" );
end

-- ���˲�Ʊ�ҽ�-��Ʊ�ҽ����桰ȷ�����ص�����
function onLotteryGold_Prize_Confirm( nCount )
	local nLotteryItemIndex, nLotteryIDCount, nPrize1Count, nPrize2Count, nPrize1TotalCount, nPrize2TotalCount, nOtherPrizeTotalCount;
	local nLotteryItemCount = 0;
	local nPrize1TotalCount = 0;
	local nPrize2TotalCount = 0;
	local nOtherPrizeTotalCount = 0;
	local szHeOrShe;
	
	if( GetSex() == 1 ) then
		szHeOrShe = "��";
	else
		szHeOrShe = "��";
	end
	
	for i = 1, nCount do
		local nLotteryItemIndex = GetGiveItemUnit( i );
		local nLotteryIssueID = GetItemParam( nLotteryItemIndex, 1 );
		local nLotteryIDCount, nPrize1Count, nPrize2Count = Lottery_CheckPrize( LOTTERY_GOLD_TYPENAME, nLotteryItemIndex );
		local nRandAwardIdx;
		
		if( nLotteryIDCount > 0 ) then
			nLotteryItemCount = nLotteryItemCount + 1;
			if( RemoveItemByIndex( nLotteryItemIndex ) == 1 ) then
				if( nPrize1Count > 0 or nPrize2Count > 0 ) then
					for j = 1, nPrize1Count do
						local aryProbability = {};
						for k = 1, getn( FIRST_PRIZE_AWARD[2] ) do
							aryProbability[k] = FIRST_PRIZE_AWARD[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for k = 1, FIRST_PRIZE_AWARD[2][nRandAwardIdx][3] do
							addAward( FIRST_PRIZE_AWARD[2][nRandAwardIdx][2] );
						end
						Lottery_WriteLog( LOTTERY_GOLD_TYPENAME, format( "[%s] %s(%s) ��ȡ�˵�%d�ڵ�һ�Ƚ���Ʒ %d��%s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, FIRST_PRIZE_AWARD[2][nRandAwardIdx][3], FIRST_PRIZE_AWARD[2][nRandAwardIdx][1] ) );
						Msg2Player( "<#>�������"..FIRST_PRIZE_AWARD[2][nRandAwardIdx][3].."<#>��"..FIRST_PRIZE_AWARD[2][nRandAwardIdx][1] );
						AddGlobalNews( "<#>�غ���Ϣ��"..GetName().."<#>�����ݵ���ٴ�����ȡ�ĵ�"..format("%03d", nLotteryIssueID).."<#>�����˲�Ʊ�е�һ�Ƚ������"..FIRST_PRIZE_AWARD[2][nRandAwardIdx][1]..FIRST_PRIZE_AWARD[2][nRandAwardIdx][3].."<#>��������������ף��"..szHeOrShe.."<#>�������ڴ����Ĳ��룬лл��");
					end
					for j = 1, nPrize2Count do
						local aryProbability = {};
						for k = 1, getn( SECOND_PRIZE_AWARD[2] ) do
							aryProbability[k] = SECOND_PRIZE_AWARD[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for k = 1, SECOND_PRIZE_AWARD[2][nRandAwardIdx][3] do
							addAward( SECOND_PRIZE_AWARD[2][nRandAwardIdx][2] );
						end
						Lottery_WriteLog( LOTTERY_GOLD_TYPENAME, format( "[%s] %s(%s) ��ȡ�˵�%d�ڵĶ��Ƚ���Ʒ %d��%s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, SECOND_PRIZE_AWARD[2][nRandAwardIdx][3], SECOND_PRIZE_AWARD[2][nRandAwardIdx][1] ) );
						Msg2Player( "<#>�������"..SECOND_PRIZE_AWARD[2][nRandAwardIdx][3].."<#>��"..SECOND_PRIZE_AWARD[2][nRandAwardIdx][1] );
						AddGlobalNews( format( "�غ���Ϣ��%s�����ݵ���ٴ�����ȡ�ĵ�%03d�����˲�Ʊ�еö��Ƚ������%s%d��������������ף��%s�������ڴ����Ĳ��룬лл��", GetName(), nLotteryIssueID, SECOND_PRIZE_AWARD[2][nRandAwardIdx][1], SECOND_PRIZE_AWARD[2][nRandAwardIdx][3], szHeOrShe ) );
					end
					nPrize1TotalCount = nPrize1TotalCount + nPrize1Count;
					nPrize2TotalCount = nPrize2TotalCount + nPrize2Count;
				else
					if( nLotteryIDCount == 10 ) then
						local aryProbability = {};
						for k = 1, getn( OTHER_PRIZE_AWARD1[2] ) do
							aryProbability[k] = OTHER_PRIZE_AWARD1[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for j = 1, OTHER_PRIZE_AWARD1[2][nRandAwardIdx][3] do
							addAward( OTHER_PRIZE_AWARD1[2][nRandAwardIdx][2] );
						end
						WriteLog( format( "[%s] %s(%s) ��ȡ�˵�%d�ڵ����Ƚ�����Ʊ��Ʒ %d��%s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, OTHER_PRIZE_AWARD1[2][nRandAwardIdx][3], OTHER_PRIZE_AWARD1[2][nRandAwardIdx][1] ) );
						Msg2Player( "<#>�������"..OTHER_PRIZE_AWARD1[2][nRandAwardIdx][3].."<#>��"..OTHER_PRIZE_AWARD1[2][nRandAwardIdx][1] );
					else
						local aryProbability = {};
						for k = 1, getn( OTHER_PRIZE_AWARD2[2] ) do
							aryProbability[k] = OTHER_PRIZE_AWARD2[2][k][4];
						end
						nRandAwardIdx = randByProbability( aryProbability );
						for j = 1, OTHER_PRIZE_AWARD2[2][nRandAwardIdx][3] do
							addAward( OTHER_PRIZE_AWARD2[2][nRandAwardIdx][2] );
						end
						WriteLog( format( "[%s] %s(%s) ��ȡ�˵�%d�ڵ����Ƚ�С��Ʊ��Ʒ %d��%s\r\n", date("%Y-%m-%d %H:%M:%S"), GetAccount(), GetName(), nLotteryIssueID, OTHER_PRIZE_AWARD2[2][nRandAwardIdx][3], OTHER_PRIZE_AWARD2[2][nRandAwardIdx][1] ) );
						Msg2Player( "<#>�������"..OTHER_PRIZE_AWARD2[2][nRandAwardIdx][3].."<#>��"..OTHER_PRIZE_AWARD2[2][nRandAwardIdx][1] );
					end
					nOtherPrizeTotalCount = nOtherPrizeTotalCount + 1;
				end
			end
		end
	end
	if( nLotteryItemCount > 0 ) then
		local szPrizeResultContent = "��٣���ϲ���������һ��Ĳ�Ʊ�п�����<color=yellow>"
		if( nPrize1TotalCount > 0 ) then
			szPrizeResultContent = szPrizeResultContent.."<#> һ�Ƚ�"..nPrize1TotalCount.."<#>��";
		end
		if( nPrize2TotalCount > 0 ) then
			szPrizeResultContent = szPrizeResultContent.."<#> ���Ƚ�"..nPrize2TotalCount.."<#>��";
		end
		if( nOtherPrizeTotalCount > 0 ) then
			szPrizeResultContent = szPrizeResultContent.."<#> ���"..nOtherPrizeTotalCount.."<#>��";
		end
		szPrizeResultContent = szPrizeResultContent.."<color>"
		Say( szPrizeResultContent, 0 );
	else
		Say( "���������õ�����Ч�ҽ����ڵ����˲�Ʊ", 3, "�ղŸ���ˣ������·Ű�/onLotteryGold_Prize", "���뿴һ���н���Ʊ����/onLotteryGold_QueryPrize", "��û��Ҫ�ҵĲ�Ʊ�ˣ��´�������/onCancel" );
	end
end

-- ��ѯ�����н�����
function onLotteryGold_QueryPrize()
	

	Say("��٣���һ�ڲ�Ʊû�з���Ŷ������ķ���ʱ�仹���������⡣",0)
	do return end
	
	local szResultPrize1, szResultPrize2;
	local nPrizeIssueID, nPrize1Count, nPrize2Count;
	local aryaryszPrize1ID = {};
	local aryaryszPrize2ID = {};
	
	nPrizeIssueID, aryaryszPrize1ID, aryaryszPrize2ID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
	nPrize1Count = getn( aryaryszPrize1ID );
	nPrize2Count = getn( aryaryszPrize2ID );
	if( nPrizeIssueID > 0 ) then
		for i = 1, nPrize1Count do
			if( aryaryszPrize1ID[i] == nil or tonumber( aryaryszPrize1ID[i] ) < 0 ) then
				aryaryszPrize1ID[i] = " (��) ";
			end
		end
		for i = 1, nPrize2Count do
			if( aryaryszPrize2ID[i] == nil or tonumber( aryaryszPrize2ID[i] ) < 0 ) then
				aryaryszPrize2ID[i] = " (��) ";
			end
		end
		szResultPrize1 = "<#>����(<color=red>��"..format( "%03d", nPrizeIssueID ).."<#><color>)�����˲�Ʊ�в���Ϣ\n";
		szResultPrize1 = szResultPrize1.."<#><color=yellow>һ�Ƚ�<color>���˺��룺\n<color=yellow>";
		for i = 1, nPrize1Count do
			szResultPrize1 = szResultPrize1..aryaryszPrize1ID[i].." ";
		end
		szResultPrize2 = "<#>����(<color=red>��"..format( "%03d", nPrizeIssueID ).."<#><color>)�����˲�Ʊ�в���Ϣ\n";
		szResultPrize2 = szResultPrize2.."<#><color=yellow>���Ƚ�<color>���˺��룺\n<color=yellow>";
		for i = 1, nPrize2Count do
			szResultPrize2 = szResultPrize2..aryaryszPrize2ID[i].." ";
			if( mod( i, 7 ) == 0 ) then
				szResultPrize2 = szResultPrize2.."\n";
			end
		end
		Talk( 2, "onLoteryGold", szResultPrize1, szResultPrize2 );
	else
		Say( "���˲�Ʊ��δ����������<color=yellow>������11��00<color>��������ѯ��лл��", 1, "��֪���ˣ�лл/onLotteryGold" );
	end
end

-- �������˲�Ʊ
function onLotteryGold_About()
	Talk( 3, "", "��٣����˲�Ʊ������Ʊ�ķ�ʽ���͸�����ÿ��ֵһ��30Ԫ��ֵ�����1����Ʊ��Ʊ�ڰ���<color=yellow>10<color>��������롣ÿ��ֵһ��10Ԫ��ֵ�����1����Ʊ��Ʊ�ڰ���<color=yellow>5<color>��������롣", "��٣�����俨��ȡ��Ʊ��ʱ��Ϊ��ÿ�ڲ�Ʊ�ڸò�Ʊ���е�<color=yellow>�����糿11��00���������糿8��00<color>��ȡ��<color=red>��ÿ���յ��糿8��00��11��00,����Ŀ�������ȡ��Ʊ��<color>", "��٣��������糿11��00���ǽ����浱���н����룬���ڻ�ò�Ʊ��ɸ���Ʊ��Ķҽ�ʱ����Լ�������������һ���Ʒ��" );
end

-- ���ڲ�Ʊ������������һ�ڲ�Ʊ��SystemTaskÿ�춨ʱ���ã�
function onLotteryGold_UpdateIssue()
	
	do return end;
	
	local nLotteryLatestIssueID = Lottery_UpdateIssue( LOTTERY_GOLD_TYPENAME );
	if( nLotteryLatestIssueID > 0 ) then
		local nPrizeIssueID, nPrize1Count, nPrize2Count;
		local aryszPrize1ID = {};
		local aryszPrize2ID = {};
		
		nPrizeIssueID, aryaryszPrize1ID, aryaryszPrize2ID = Lottery_GetLatestPrizeInfo( LOTTERY_GOLD_TYPENAME );
		nPrize1Count = getn( aryaryszPrize1ID );
		nPrize2Count = getn( aryaryszPrize2ID );
		if( nPrizeIssueID > 0 ) then
			for i = 1, nPrize1Count do
				if( aryaryszPrize1ID[i] == nil or tonumber( aryaryszPrize1ID[i] ) < 0 ) then
					aryaryszPrize1ID[i] = " (��) ";
				end
			end
			for i = 1, nPrize2Count do
				if( aryaryszPrize2ID[i] == nil or tonumber( aryaryszPrize2ID[i] ) < 0 ) then
					aryaryszPrize2ID[i] = " (��) ";
				end
			end
			local szNewsContent = "<#>���⣡���⣡��"..format( "%03d", nPrizeIssueID ).."<#>�����˲�Ʊ��������һ�Ƚ����˺����� ";
			for i = 1, nPrize1Count do
				szNewsContent = szNewsContent..aryaryszPrize1ID[i].." ";
			end
			szNewsContent = szNewsContent.."<#>�����Ƚ����˺����� ";
			for i = 1, nPrize2Count do
				szNewsContent = szNewsContent..aryaryszPrize2ID[i].." ";
			end
			szNewsContent = szNewsContent.."<#>������һ�Ƚ���������� "..FIRST_PRIZE_AWARD[1].."<#> �� ���Ƚ����������  "..SECOND_PRIZE_AWARD[1].."<#> �� ��ҸϽ����һ���Լ��Ĳ�Ʊ������ʱ��������ٴ���ȡ��Ʒ��";
			AddGlobalCountNews( szNewsContent, 3 );
		end
	end
end

-- ȡ��
function onCancel()
end

-- �������ɸ�ָ�����ʵ�ѡ�����ѡ��ĳһ��
function randByProbability( aryProbability )
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = mod( random( nSum ) + random( 191 ), nSum ) + 1;
	for i = nArgCount, 1, -1 do
		nSum = nSum - aryProbability[i];
		if( nRandNum > nSum ) then
			return i;
		end
	end
end

-- �������ָ�������Ľ�Ʒ
function addAward( aryAwardParam )
	local nAwardParamCount = getn( aryAwardParam );
	if( nAwardParamCount == 2 ) then
		return AddGoldItem( aryAwardParam[1], aryAwardParam[2] );
	elseif( nAwardParamCount == 4 ) then
		return AddVerGoldItem( aryAwardParam[1], aryAwardParam[2], aryAwardParam[3], aryAwardParam[4] );
	elseif( nAwardParamCount == 7 ) then
		return AddItem( aryAwardParam[1], aryAwardParam[2],aryAwardParam[3], aryAwardParam[4], aryAwardParam[5], aryAwardParam[6], aryAwardParam[7] );
	end
	return 0;
end