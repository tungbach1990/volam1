Include("\\script\\event\\qingren_jieri\\200902\\head.lua");

-- �Ƿ��ڻʱ��
function valentine2009_isCarryon()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (VALENTINE2009_START <= nDate and nDate <= VALENTINE2009_END) then
		return 1;
	else
		return 0;
	end
end

-- ����汾����
function valentine2009_resetEdition()
	
	if tonumber(GetTask(VALENTINE2009_EDITION)) ~= VALENTINE2009_START then
		SetTask(VALENTINE2009_EDITION, VALENTINE2009_START);
		SetTask(VALENTINE2009_DATE, 0);
		SetTask(VALENTINE2009_DRAW_NUM, 0);
		SetTask(VALENTINE2009_USE_NUM, 0);
		SetTask(VALENTINE2009_EXPERIENCE, 0);
	end
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if tonumber(GetTask(VALENTINE2009_DATE)) ~= nDate then
		SetTask(VALENTINE2009_DATE, nDate);
		SetTask(VALENTINE2009_DRAW_NUM, 0);
		SetTask(VALENTINE2009_USE_NUM, 0);
	end
	
end

-- ȡ��
function valentine2009_OnCancel()
	
end

-- ����������Ϣ
function valentine2009_giveErrorMsg(szMsg)
	Say(szMsg, 1, VALENTINE2009_TALK_ERROR_ANSWER.."/valentine2009_OnCancel");
end
	
-- ������
function valentine2009_main(nItemIndex, szDescLink)
	
	valentine2009_resetEdition();
	szDescLink = szDescLink or "<npc>"
	nItemIndex = nItemIndex or -1
	
	local btns =
	{
		"<dec>"..szDescLink..VALENTINE2009_TALK_MAIN[1],	
		VALENTINE2009_TALK_MAIN[2]..format("/#valentine2009_OnDraw(0,%d)", nItemIndex),
		VALENTINE2009_TALK_MAIN[3]..format("/#valentine2009_OnDraw(1,%d)", nItemIndex),
		VALENTINE2009_TALK_MAIN[4].."/valentine2009_OnCancel",
	}
	CreateTaskSay(btns);
end

-- ��ȡ
function valentine2009_OnDraw(nSex, nItemIndex)
	
	-- �Ա𲻷���
	if GetSex()~= nSex then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_SEX);
		return
	end
	
	-- �ȼ�������Ҫ��
	if GetLevel() < VALENTINE2009_LEVEL_LIMIT then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_LEVEL);
		return
	end
	
	-- û�и��ѹ�
	if IsCharged() ~= 1 then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_PAY);
		return
	end
	
	-- ����������ȡ����
	local nDrawNum = GetTask(VALENTINE2009_DRAW_NUM);
	if (nDrawNum >= VALENTINE2009_MAX_DRAW_NUM) then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_MAXNUM);
		return
	end
	
	-- ���ڻ����
	if valentine2009_isCarryon() ~= 1 then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_DATE);
		return
	end

	-- ���ڻʱ��
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	if (nTime < VALENTINE2009_START_TIME or VALENTINE2009_END_TIME < nTime) then
		valentine2009_giveErrorMsg(VALENTINE2009_TALK_ERROR_TIME);
		return
	end
	
	-- ����
	local tb_Draw_Goods = nil
	nItemIndex = nItemIndex or -1
	
	if nSex == 0 then	-- ���� ��ȡ��������
		tb_Draw_Goods = 
		{
			{
			{szName=VALENTINE2009_TALK_GOODS[1], tbProp=VALENTINE2009_ITEM_ZHONGZI, nExpiredTime = VALENTINE2009_ITEM_END},
			}
		}
	elseif nSex == 1 then	-- Ů�� ��ȡ����ˮ
		tb_Draw_Goods = 
		{
			{
			{szName=VALENTINE2009_TALK_GOODS[2], tbProp=VALENTINE2009_ITEM_TIANXIAN, nExpiredTime = VALENTINE2009_ITEM_END},
			}
		}
	end
	
	if nItemIndex > 0 and tbItemJingnianshijian then
		if tbItemJingnianshijian:CheckItem(nItemIndex) ~= 1 then
			return 
		end
	end
	
	tbAwardTemplet:GiveAwardByList(tb_Draw_Goods, "2009 valentine give reward");
	SetTask(VALENTINE2009_DRAW_NUM, nDrawNum + 1);
	
	if nItemIndex > 0 and  tbItemJingnianshijian then
		 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
	end
	
end
