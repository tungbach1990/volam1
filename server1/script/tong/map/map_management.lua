-- IB����ͼ����

IncludeLib("TONG");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\tong\\addtongnpc.lua");


TONGMAP_PRICE_ITEM		=	{ 4, 1290, 1, -1, "Thanh ��ng ��nh" };
TONGMAP_CREATE_PRICE	=	4;
TONGMAP_CHANGE_PRICE	=	10;
TONGMAP_RECHARGE_PRICE	=	1;

TONGMAP_CREATE_WEEK		=	2;

DAY_SECOND_SUM			=	60 * 60 * 24;						-- 1�������
WEEK_SECOND_SUM			=	DAY_SECOND_SUM * 7;					-- 1�ܵ�����


-- ����ͼ����
function tongmap_management()
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		CreateTaskSay({"<dec><npc>Ch� c� bang ch� m�i c� th� x�y d�ng khu v�c cho bang", "���c!/cancel"});
		return
	end
	local aryTalk  = {};
	if (TONG_GetTongMap(nTongID) == 0) then
		tinsert(aryTalk, "<dec><npc>B�t k� bang h�i n�o ��u c� th� x�y d�ng khu v�c ri�ng. X�y d�ng khu v�c ri�ng c�n c� <color=yellow>4 Thanh ��ng ��nh<color>, th�i gian s� d�ng l� <color=yellow>2 tu�n<color>. Thanh ��ng ��nh c� th� k�o d�i th�i gian s� d�ng khu v�c bang h�i, m�i Thanh ��ng ��nh c� t�c d�ng k�o d�i th�i gian s� d�ng 1 tu�n.");
		tinsert(aryTalk, "V�o xem th�/tongmap_preview_1");
		tinsert(aryTalk, "X�y d�ng khu v�c bang h�i/tongmap_create_1");
	else
		tinsert(aryTalk, "<dec><npc>Khu v�c bang h�i c�a b�n c� th�i h�n s� d�ng l� <color=yellow>"..tongmap_get_expire_date(nTongID).."<color>");
--		tinsert(aryTalk, "Ǩ�ư���ͼ/tongmap_change_1");
		tinsert(aryTalk, "K�o d�i th�i gian s� d�ng khu v�c bang h�i./tongmap_recharge_1");
	end
	tinsert(aryTalk, "H�y b� /cancel");
	CreateTaskSay(aryTalk);
end
		
-- Ԥ������ͼ
function tongmap_preview_1()
	local aryTalk  =
	{
		"<dec><npc>L�a ch�n khu v�c mu�n xem",
	};
	for nMapCopyId, szMapCopyName in aDynMapCopyName do
		tinsert(aryTalk, szMapCopyName.."/#tongmap_preview_2("..nMapCopyId..")");
	end
	tinsert(aryTalk, "H�y b� /cancel");
	CreateTaskSay(aryTalk);
end
function tongmap_preview_2(nMapCopyId)
	local pos = GetMapEnterPos(nMapCopyId);
	NewWorld(nMapCopyId, pos.x, pos.y);
end

-- ��������ͼ
function tongmap_create_1()
	local aryTalk  =
	{
		"<dec><npc>H�y l�a ch�n khu v�c mu�n x�y d�ng<enter>X�y d�ng khu v�c bang h�i c�n c�"..TONGMAP_CREATE_PRICE.."c�i"..TONGMAP_PRICE_ITEM[5]..", c� th� s� d�ng trong 2 tu�n. :",
	};
	for nMapCopyId, szMapCopyName in aDynMapCopyName do
		tinsert(aryTalk, szMapCopyName.."/#tongmap_create_2("..nMapCopyId..")");
	end
	tinsert(aryTalk, "H�y b� /cancel");
	CreateTaskSay(aryTalk);
end
function tongmap_create_2(nMapCopyId)
	local aryTalk  = 
	{
		"<dec><npc>Ng��i x�c ��nh mu�n x�y d�ng  "..aDynMapCopyName[nMapCopyId].." Ch�n khu v�c n�y? <enter>X�y d�ng khu v�c bang h�i c�n c�"..TONGMAP_CREATE_PRICE.."c�i"..TONGMAP_PRICE_ITEM[5].." c� th� s� d�ng trong  2 tu�n.",
		"X�c nh�n/#tongmap_create_3("..nMapCopyId..")",
		"H�y b� /cancel",
	};
	CreateTaskSay(aryTalk);
end
function tongmap_create_3(nMapCopyId)
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	if (TONG_GetTongMap(nTongID) ~= 0) then
		CreateTaskSay({"<dec><npc>Qu� bang �� c� khu v�c bang h�i r�i.", "���c!/cancel"});
		return
	end
	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) < TONGMAP_CREATE_PRICE) then
		CreateTaskSay({"<dec><npc>X�y d�ng khu v�c bang h�i c�n 4 Thanh ��ng ��nh!", "���c!/cancel"});
		return
	end
	-- ��Ǯ
	if (ConsumeEquiproomItem(TONGMAP_CREATE_PRICE, TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) ~= 1) then
		WriteLog("[ERR] L�i x�y ra khi tr� chi ph� x�y d�ng bang h�i!\t"..GetAccount().."("..GetName()..")");
		return
	end
	-- ������ͼ
	TONG_ApplyCreatMap(nTongID, nMapCopyId);
	-- ������Ч����
	local szExpireDate = tongmap_add_expire_date(nTongID, TONGMAP_CREATE_WEEK);
	CreateTaskSay({"<dec><npc>X�y d�ng th�nh c�ng khu v�c bang h�i, c� hi�u l�c ��n <color=yellow>"..szExpireDate.."<color>", "Ti�p t�c gia h�n/tongmap_recharge_1", "R�i kh�i/cancel"});
end

---- Ǩ�ư���ͼ
--function tongmap_change_1()
--	local aryTalk  =
--	{
--		"<dec><npc>��ѡ��ҪǨ�Ƶ��ĸ���ͼ���۸� "..TONGMAP_CHANGE_PRICE.."��"..TONGMAP_PRICE_ITEM[5].."����",
--	};
--	for nMapCopyId, szMapCopyName in aDynMapCopyName do
--		tinsert(aryTalk, szMapCopyName.."/#tongmap_change_2("..nMapCopyId..")");
--	end
--	tinsert(aryTalk, "ȡ��/cancel");
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_2(nMapCopyId)
--	local aryTalk  = 
--	{
--		"<dec><npc>��ȷ��ҪǨ�Ƶ� "..aDynMapCopyName[nMapCopyId].." �����ͼ���۸� "..TONGMAP_CHANGE_PRICE.."��"..TONGMAP_PRICE_ITEM[5].."����",
--		"ȷ��/#tongmap_change_3("..nMapCopyId..")",
--		"ȡ��/cancel",
--	};
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_3(nMapCopyId)
--	local _, nTongID = GetTongName();
--	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
--		return
--	end
--	if (TONG_GetTongMap(nTongID) == 0) then
--		CreateTaskSay({"<dec><npc>��ﻹû�а���ͼ��", "�õ�/cancel"});
--		return
--	end
--	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) < TONGMAP_CHANGE_PRICE) then
--		CreateTaskSay({"<dec><npc>�㲻��ǮǨ�ư���ͼ����ͬѧ��", "�õ�/cancel"});
--		return
--	end
--	-- ��Ǯ
--	if (ConsumeEquiproomItem(TONGMAP_CHANGE_PRICE, TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) ~= 1) then
--		WriteLog("[ERR] �쳣��Ǩ�ư���ͼ�۷�ʧ�ܣ�\t"..GetAccount().."("..GetName()..")");
--		return
--	end
--	-- Ǩ�Ƶ�ͼ
--	TONG_ApplyChangeMap(nTongID, nMapCopyId);
--end

-- ��ֵ����ͼ
function tongmap_recharge_1()
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	GiveItemUI("Gia h�n khu v�c bang h�i", "H�y ��a v�o "..TONGMAP_PRICE_ITEM[5]..","..TONGMAP_RECHARGE_PRICE.."c�i"..TONGMAP_PRICE_ITEM[5].."C� th� gia h�n s� d�ng th�m 1 tu�n. \n".."C� th�i h�n s� d�ng ��n "..tongmap_get_expire_date(nTongID), "tongmap_recharge_2", "cancel");
end
function tongmap_recharge_2(nItemCount)
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	local aryTongMapItem = {};
	for i = 1, nItemCount do
		local nItemIdx = GetGiveItemUnit(i);
		local nItemGenre, nItemDetailType, nItemParticular = GetItemProp(nItemIdx);
		if (nItemGenre == TONGMAP_PRICE_ITEM[1] and nItemDetailType == TONGMAP_PRICE_ITEM[2]) then
			tinsert(aryTongMapItem, nItemIdx);
		end
	end
	local nRechargeWeek = floor(getn(aryTongMapItem) / TONGMAP_RECHARGE_PRICE);
	if (nRechargeWeek <= 0) then
		local aryTalk =
		{
			"<dec><npc>C�n ph�i ��a v�o t�i thi�u "..TONGMAP_RECHARGE_PRICE.."c�i"..TONGMAP_PRICE_ITEM[5]..".",
			"M� l�i/#tongmap_recharge_1()",
			"Kh�ng c�n/cancel",
		}
		CreateTaskSay(aryTalk);
		return
	end
	-- ��Ǯ
	for i = 1, nRechargeWeek * TONGMAP_RECHARGE_PRICE do
		if (RemoveItemByIndex(aryTongMapItem[i]) ~= 1) then
			WriteLog("[ERR] L�i x�y ra khi kh�u tr� chi ph� gia h�n khu v�c bang h�i!\t"..GetAccount().."("..GetName()..")");
			return
		end
	end
	-- ������Ч����
	local szExpireDate = tongmap_add_expire_date(nTongID, nRechargeWeek);
	CreateTaskSay({"<dec><npc>Gia h�n th�nh c�ng th�m <color=yellow>"..nRechargeWeek.."<color> tu�n, c� hi�u l�c ��n <color=yellow>"..szExpireDate.."<color>", "Ti�p t�c gia h�n/tongmap_recharge_1", "R�i kh�i/cancel"});
end

-- ���Ӱ���ͼ��Ч���ڣ���λΪ�ܣ�
function tongmap_add_expire_date(nTongID, nRechargeWeek)
	local nExpireTime = TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	if (nExpireFmtDate < nNowFmtDate) then
		nExpireTime = nNowTime + nRechargeWeek * WEEK_SECOND_SUM;
	else
		nExpireTime = nExpireTime + nRechargeWeek * WEEK_SECOND_SUM;
	end
	TONG_ApplySetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME, nExpireTime);
	return FormatTime2String("%Y-%m-%d", nExpireTime - DAY_SECOND_SUM);
end

-- ������ͼ�Ƿ��ѹ���Ч����
function tongmap_check_expire(nTongID)
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	local nExpireTime = TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	if (nNowFmtDate >= nExpireFmtDate) then
		return 2;			-- �ѹ���
	else
		local nRemindTime = nExpireTime - DAY_SECOND_SUM * 1;			-- 1������ʾ��������
		local nRemindFmtDate = tonumber(FormatTime2String("%Y%m%d", nRemindTime));
		if (nNowFmtDate >= nRemindFmtDate) then
			return 1;		-- ��������
		else
			return 0;		-- ����
		end
	end
end

-- ��ȡ����ͼ��Ч����
function tongmap_get_expire_date(nTongID)
	return FormatTime2String("%Y-%m-%d", TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME) - DAY_SECOND_SUM);
end

function cancel()
end