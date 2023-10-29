--------------------------------------------------------------------
-- ʹ��ս�ӽṹ����¼ͳ����Ϣ 
-- ÿ��ͳ��Ϊһ��ս�ӣ�ÿ��ͳ�Ƽ�¼��ս�ӳ�Ա�����������
-- ������֯��
--	.��������(LeagueType)��ȫ��Ψһ��ʶ��ע�ⲻҪ����
--	.��������(LeagueName)������ͳ�����Ͷ���("goodssale" - ��Ʒ����ͳ��)
--	.���ų�Ա(LeagueMember)��ͳ����ϸ��Ŀ
--------------------------------------------------------------------

IncludeLib("LEAGUE")
IncludeLib("STATINFO")
Include( "\\script\\missions\\statinfo\\head.lua")

-----------------------------------------------------------------------------
-- ��ʱ��Ӧ����
function OnTimer()
	print("OnTime: update_goods_stat")
	update_goods_stat(0)
end

-----------------------------------------------------------------------------
-- ս�Ӵ����ص�����
function on_create_stat_league(nLeagueType, szLeagueName, szMemberName, bSucceed)
	if (bSucceed == 0) then
		WriteLog("[stat_error]createstatleague fail: "..szLeagueName);
		return 0;
	end
	
	-- ��ͳ��һ��
	update_goods_stat(0)
	return 1;
end

-----------------------------------------------------------------------------
-- ս�ӳ�Ա��ӻ�����(���۵���Ʒ)
function on_add_stat_item(nLeagueType, szLeagueName, szMemberName, bSucceed)
	if (bSucceed == 0) then
		WriteLog("[stat_error]createstatitem fail: "..szLeagueName.." ItemName: "..szMemberName);
		return 0;
	end
	
	local nLeagueID = LG_GetLeagueObj(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE);
	if (nLeagueID == 0) then
		WriteLog("[stat_error]createstatitem error: "..szLeagueName.." ItemName: "..szMemberName);
		return 0;
	end
	
	update_goods_stat_item(nLeagueID, szMemberName, 0);
	
	return 1;
end

-----------------------------------------------------------------------------
-- ����ͳ��ս��
function create_stat_league()
		local nLeagueID = LG_CreateLeagueObj();
		
		LG_SetLeagueInfo(nLeagueID, LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE);
		LG_ApplyAddLeague(nLeagueID, 
							"\\script\\missions\\statinfo\\timer_goodssale.lua", 
							"on_create_stat_league");
		
		LG_FreeLeagueObj(nLeagueID);
end

-----------------------------------------------------------------------------
-- ���ͳ����Ŀ
function add_stat_item(nLeagueID, szItemName)
		local nMemberID = LGM_CreateMemberObj();
		LGM_SetMemberInfo(nMemberID, szItemName, 0, 
							LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE);
		LGM_ApplyAddMember(nMemberID, 
							"\\script\\missions\\statinfo\\timer_goodssale.lua", 
							"on_add_stat_item");
		
		LGM_FreeMemberObj(nMemberID);
end

-----------------------------------------------------------------------------
-- ����ĳ��������Ʒ��ͳ�Ƽ�����ս��
function update_goods_stat_item(nLeagueID, szItemName, bCheckItem)
	
	local nNumber = STAT_GetGoodsSaleNum(szItemName, 
											CURRENCYTYPE_COIN, 
											STATDATA_LATECACHE);
	if (nNumber == 0) then
		return 0; -- ����û�����ݣ��������ɻ����league��item
	end

	-- ���item�Ƿ����league��
	if (bCheckItem == 1) then
		local nMemberID = LG_GetMemberObj(nLeagueID, szItemName);
		if (nMemberID == 0) then
			add_stat_item(nLeagueID, szItemName); -- ���item��league
			return 0;
		end
	end	

	---------------------------------------
	-- �����������(��¼���ܼ��������졢����)��Ȼ���������
	LG_ApplyAppendMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, 
								szItemName, 
								LG_STATITEM_TASKID_TOTAL, nNumber);
	
	---------------------------------------
	-- ��¼����ͳ������ -- start
	local nCurDate = tonumber(date("%Y%m%d")); -- 20060121
	local nStatDate = LG_GetLeagueTask(nLeagueID, LG_STAT_TASKID_CURDATE)
	if (nCurDate == nStatDate) then
		LG_ApplyAppendMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, 
								szItemName, 
								LG_STATITEM_TASKID_TODAY, nNumber);
	else
		LG_ApplySetLeagueTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, 
								LG_STAT_TASKID_CURDATE, nCurDate);
		LG_ApplySetMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, 
								szItemName, 
								LG_STATITEM_TASKID_TODAY, nNumber);	
	end
	-- ��¼����ͳ������ -- end
	
	---------------------------------------
	-- ��¼����ͳ������ -- start
	local nCurYearMonth = tonumber(date("%y%m")) -- 601
	LG_ApplyAppendMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, 
								szItemName, 
								nCurYearMonth, nNumber);
	-- ��¼����ͳ������ -- end

	STAT_CleanGoodsSaleNum(szItemName, CURRENCYTYPE_COIN, STATDATA_LATECACHE);
	return 1;
end

-----------------------------------------------------------------------------
-- ������Ʒ���۵�ͳ������
function update_goods_stat(nCurPos)
	local i = nCurPos;
	local nGoodsCount = STAT_GetGoodsCount();
	-- û����ͳ�Ƶ�������Ʒ
	if (nCurPos >= nGoodsCount) then
		return 0;
	end
	
	local nLeagueID = LG_GetLeagueObj(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE);
	-- ս��δ���ڣ��ȴ���
	if (nLeagueID == 0) then
		create_stat_league();
		return 1;
	end
	
	local szItemName = "";
	for i = nCurPos, nGoodsCount-1 do
		szItemName = STAT_GetGoodsName(i);
		update_goods_stat_item(nLeagueID, szItemName, 1);
	end
end
