-- ������Ҽ���,�����û��ľ��顢�۳������й�ʱ�䡢���Ӹ�Ե
-- ����ÿ5��������һ�Σ�����ʱ��ÿ�����1����ԵһСʱ����һ��
IncludeLib("PARTNER");
IncludeLib("TONG");
Include( "\\script\\global\\fuyuan.lua" );
Include( "\\script\\global\\baijuwanhead.lua" );

-- 2008ʥ��������йܻ�ú�ɫ��е�ͷ�ļ�
--Include("\\script\\item\\shengdan_jieri\\200811\\red_box.lua");

-- 2006 �����ڻͷ�ļ�
Include("\\script\\event\\nationalday_2006\\main.lua");


Include("\\script\\event\\funv_jieri\\200903\\tuoguan.lua")

Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");

--tinhpn 20100805: VLMC
Include("\\script\\bonusvlmc\\head.lua");

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")


BAIJU_DOUBLEEXP_TIME = 051008
-- ����Ĺ��ⲿ�������õĽű�

-- �õ���ʱ��������
function gettimercount()
	return 4
end

-- �õ���ʱ���ĺ���
function gettimername(index)
	if (index == 0) then
		return "addofflineexp"
	elseif (index == 1) then
		return "reduceofflinetime"
	elseif (index == 2) then
		return "addoofflinefuyuna"
	elseif (index == 3) then
		return "addofflineskillexp"
	end
	return ""
end

-- �õ�ִ��ʱ������֡����
function gettimerinterval(index)
	if (index == 0) then
		return AEXP_INTERVAL 	    --�Ӿ��飺5����
	elseif (index == 1) then
		return 60 * FRAME2TIME		--��ʱ�䣺ÿ����
	elseif (index == 2) then
		return 60 * 60 * FRAME2TIME	--�츣Դ��1Сʱ
	elseif (index == 3) then
		return AEXP_INTERVAL 	    --�Ӽ��������ȣ�5����
	end
	return AEXP_INTERVAL
end

-- ��ȡ��ʱ��ѡ�0��ʾ��0���ڿ�ʼִ�У�1��ʾ��1���ڿ�ʼִ��
function gettimeroption(index)
	if (index == 0) then
		return 1 	                --�Ӿ��飺5�����Ժ�
	elseif (index == 1) then
		return 1		            --��ʱ�䣺1�����Ժ�
	elseif (index == 2) then
		return 0	                --�츣Դ��������ȡ
	elseif (index == 3) then
		return 1 	                --�Ӽ��������ȣ�5����
	end
	return 0
end

-- ��ȡ��ʱ�������֡����
function gettimeoutinterval()
	return 60 * FRAME2TIME  -- �Ƿ�ʱ�ļ����ʱ��Ϊ60s
end

function IsTimeValid()
	if IsIPBonus() == 1 then
		IpBonus_Close()
	end;
	
	--tinhpn 20100817: Online Award
	if (OnlineAward_StartDate()==1 and OnlineAward_Check_TransferLife() ~= 0) then
		OnlineAward_SummaryOnlineTime()
	end	
	
	if GetSkillState(451) > 0 and GetTask(TSK_Active_x2EXP) ~= 1 then
			RemoveSkillState(451)
	end
	local szHour = date("%H");
	local nDay = tonumber(date("%y%m%d"))
	local nHour = tonumber(szHour);
	-- if (nHour >= 18 and nHour < 24) then
	-- 	return 0
	-- else
	-- 	return 1
	-- end
	if (nDay < BAIJU_DOUBLEEXP_TIME) then
		return 2
	else
	 	return 1
	end
end;


-- ���ܴ�׵ľ����Ƿ�˫��
function skillBaijuEffect()
	local nHour = tonumber(GetLocalDate("%H"));  -- ��ȡСʱ
	return 1;
end;

--���ݼ���õ�����
function getofflinevalue(nLevel, bPartner)

local nHour = tonumber(GetLocalDate("%H"));  -- ��ȡСʱ

	nExp = 0;
	-- һСʱ�һ����飺e={3.5w+floor[(lv-50)/5]*0.5w}*1.2
	if (nLevel == 50) then 	-- 50
		nExp = 700; -- ÿ���ӻ�õľ���ֵ
	elseif (nLevel < 100) then 	-- 51~99
		nExp = 700 + floor((nLevel - 50)/5)*100; -- ÿ���ӻ�õľ���ֵ
	else -- 100����100������
		nExp = 1700; -- ÿ���ӻ�õľ���ֵ[700 + floor((100 - 50)/5)*100]
	end
	
	if (bPartner and nLevel < 50) then
		nExp = 175;	--�����ͬ�飬50���»�þ���Ϊ50����þ����1/4
	end
	
	if (GetProductRegion() ~= "vn") then

		-- ����� 2006 �������賿 0 �㵽���� 6 �� 2 ��
		if isSpringTime()==1 and nHour>=0 and nHour<18 then
			nExp = nExp * 2;
		end;
		
		if (IsTimeValid() == 2) then
			nExp = nExp * AEXP_FREQ * 12;  -- ÿ��0��00-12��00 �׾��辭�鷭��
		else
			nExp = nExp * AEXP_FREQ * 6; -- (5)���ӻ�õľ���ֵ(�һ��������6��)
		end
		
	else
		nExp = nExp * AEXP_FREQ * 7; -- (5)���ӻ�õľ���ֵ()
	end
	--�Ƿ��д󻹵�Ч�������о���ӳ�
	if (IsDaHuanDanValid() == 1) then
		--����󻹵�����ӳ�
		return nExp, GetTask(1741)
	end

	return nExp
end;

--���Ӿ���
function addofflineexp()
	if (IsTimeValid() == 0) then
		return 
	end
	local nSpecialD = 0;
	if (GetTask(AEXP_TIANXING_TIME_TASKID) > 0) then
		nSpecialD = 5;
	elseif (GetTask(AEXP_SPECIAL_TIME_TASKID) > 0) then
		if (GetProductRegion() == "vn" and GetLevel() >= 130) then
			nSpecialD	= 4;
		else
			nSpecialD = 2;
		end
	elseif (GetTask(AEXP_TASKID) > 0) then
		if (GetProductRegion() == "vn" and GetLevel() >= 130) then
			nSpecialD	= 2.5;
		else
			nSpecialD = 1.5;
		end
	elseif (GetTask(AEXP_SMALL_TIME_TASKID) > 0) then
		if (GetProductRegion() == "vn" and GetLevel() >= 130) then
			nSpecialD	= 1.5;
		else
			nSpecialD = 1;
		end
	else
		nSpecialD = 0.5*0.5;		-- UNDONE by zbl	ΪʲôҪ���0.25?
	end;
	--getredbox(nSpecialD);	-- ʥ���ڻ�����йܻ�ú�ɫ���
	tbFunv0903:GetItemByTuoGuan(nSpecialD)
	-- ������Ҿ���
	local nPlayerLevel = GetLevel();
	if (nPlayerLevel >= AEXP_NEEDLEVEL) then
		local nExp, nAddExp = getofflinevalue(nPlayerLevel);
		nExp = floor(nSpecialD * nExp);
		local nEnExp = CalcEnhanceExp(nExp) -- ���㾭��ӳ�
		if (GetNpcExpRate() > 100) then
			nEnExp = floor((nEnExp * 100) / GetNpcExpRate());
		end
		if (nAddExp and nSpecialD ~= 0.5) then
			nEnExp = nEnExp + nAddExp
		end
		AddOwnExp(nEnExp); -- �Ӿ���
	end
	
	-- ����ͬ�龭��
	local nPartnerIdx, bPartnerCallOut = PARTNER_GetCurPartner();
	if (nPartnerIdx > 0 and bPartnerCallOut == 1) then
		local nPartnerLevel = PARTNER_GetLevel(nPartnerIdx);
		if (nPartnerLevel >= AEXP_NEEDLEVEL_PARTNER) then
			local nExp = 0;
			nExp = getofflinevalue(nPartnerLevel,1);
			nExp = floor(nSpecialD * nExp);
			PARTNER_AddExp(nPartnerIdx, nExp); -- �Ӿ���
		end
	end
	
	
end

--����������Ҫ�����йܾ��飬д���
function getAddExpValue(nExp)
	return 0
end;

--����ʱ��
function reduceofflinetime()
	if (IsTimeValid() == 0) then
		return 
	end
	local nInterval = 60 * FRAME2TIME;	
	local nAexp_OwnExp_id;
	local nAexp_Skill_id;
	
	local tbAexpTask_Exp = {AEXP_SMALL_TIME_TASKID, AEXP_TASKID, AEXP_SPECIAL_TIME_TASKID, AEXP_TIANXING_TIME_TASKID};
	local tbAexpTask_Skill = {AEXP_SMALL_SKILL_TASKID, AEXP_SKILL_TIME_TASKID, AEXP_SPECIAL_SKILL_TASKID};
	for i = 1, getn(tbAexpTask_Exp) do
		if (GetTask(tbAexpTask_Exp[i]) > 0) then
			nAexp_OwnExp_id = tbAexpTask_Exp[i];
		end
	end
	for i = 1, getn(tbAexpTask_Skill) do
		if (GetTask(tbAexpTask_Skill[i]) > 0) then
			nAexp_Skill_id = tbAexpTask_Skill[i];
		end;
	end;
	
	if (GetTask(AEXP_SKILL_ID_TASKID) == 0) then
		nAexp_Skill_id = nil;
	end;
	
	local arynOfflineTimeTaskID = { nAexp_OwnExp_id, nAexp_Skill_id };
	
	for i = 1, getn(arynOfflineTimeTaskID) do
		local nSpareTime = GetTask(arynOfflineTimeTaskID[i]);
		if (nSpareTime < nInterval) then
			nSpareTime = 0;
		else
			nSpareTime = nSpareTime - nInterval;
		end
		SetTask(arynOfflineTimeTaskID[i], nSpareTime);
	end
	reduceAddExpTime();
end
function reduceAddExpTime()
return 0
end

--���Ӹ�Ե
function addoofflinefuyuna()
	if (IsTimeValid() == 0) then
		return 
	end
	
	nRet = FuYuan_Gain();
	-- return nRet
end

--���Ӽ���������
function addofflineskillexp()
	if (IsTimeValid() == 0 or (GetTask(AEXP_SKILL_TIME_TASKID) <= 0 and GetTask(AEXP_SPECIAL_SKILL_TASKID) <= 0 and GetTask(AEXP_SMALL_SKILL_TASKID) <= 0)) then
		return 
	end
	
	local nSpecialD = 1;																--���ܰ׾� 1��
	if (GetTask(AEXP_SPECIAL_SKILL_TASKID) > 0) then		--��Ч���ܰ׾� 2��
		nSpecialD = 2;
	elseif (GetTask(AEXP_SKILL_TIME_TASKID) > 0) then		--���ܴ�׾� ��1.5
		nSpecialD = 1.5
	end;
	
	local nSkillID = GetTask(AEXP_SKILL_ID_TASKID);
	local nSkillLevel = GetCurrentMagicLevel(nSkillID, 0);
	local bUp = 0;
	if (nSkillLevel >= 1 and nSkillLevel <= getn(ARY_UPGRADE_SKILL_EXP_PERCENT)) then
		if (nSkillID >= ARY_120SKILLID[1] and nSkillID <= ARY_120SKILLID[10]) then
		--���Ϊ120���ܣ���һ�����Ϊ��ֵ
			bUp = AddSkillExp(nSkillID, floor(nSpecialD * AEXP_120SKILL_UPGRADE_EXP), 1);
		else
			local fAddSkillExpPercent = floor(nSpecialD * ARY_UPGRADE_SKILL_EXP_PERCENT[nSkillLevel] * 10000 * skillBaijuEffect());
			bUp = AddSkillExp(nSkillID, fAddSkillExpPercent, 1, 1);
		end;
		if (bUp == 1 and GetCurrentMagicLevel(nSkillID, 0) > getn(ARY_UPGRADE_SKILL_EXP_PERCENT)) then
			autosetupgradeskill();
		end
	else
		autosetupgradeskill();
	end
end

function IsDaHuanDanValid()
	if (GetTask(1742) > 0) then
			return 1
	end
end