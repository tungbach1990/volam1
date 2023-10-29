-- �������� ͷ�ļ�
--Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

tbTriumphDrum = 
{
	nStartDate = 20100426,		-- ��ʼ���ڣ�ǰ����
	nCloseDate = 20201231, 		-- �������ڣ���գ�
	
	nStartTime = 1900,			-- ��ʼʱ�䣨ǰ����
	nCloseTime = 2000,			-- ����ʱ�䣨�����
--Fix tr�ng kh�i ho�n - Modified By DinhHQ - 20111202
	--nTaskGroupId = 8,			-- ���������
	--nCurrentVersion = 1,		-- �汾��
	--nTaskID_LastAward = 1,		-- �ϴ���ȡ����
	--nTaskID_AwardCount = 2,		-- ��ȡ����
	nTaskID_DailyAwardLimit = 3084,
		
	nLimit_Level  = 80,			-- �ȼ�����
	nLimit_Money  = 3040000,	-- ��Ǯ
	nLimit_DayUse = 1,			-- ÿ������ʹ�õĸ���
	nLimit_DayAward = 120,		-- ÿ������������
	
	nNPCID		  = 1556,		-- NPCģ��ID
	nTimerOut	  = 10*18,		-- Timer ��� 10��
	nTimerCount   = 180,		-- Timer ����
	nTimerShow	  = 180,		-- Timer ��ʾ�Ĵ���
	nSercherRange = 16,			-- ������Χ
}

--tbTriumphDrum.tbTaskGroup = TaskManager:Create(tbTriumphDrum.nTaskGroupId, tbTriumphDrum.nCurrentVersion);

-- ��Ƿ����
function tbTriumphDrum:IsCarryOn()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if nDate < self.nStartDate or nDate >= self.nCloseDate then
		 return 0;
	else	
		 return 1;
	end
end

-- ȷ�����Ȩ��
function tbTriumphDrum:CheckCondition_BuyDrum()
	
	if tbTriumphDrum:IsCarryOn() ~= 1 then
		return 0;
	end
	
	if GetLevel() < self.nLimit_Level then
		return 0;
	end 
	
	local szTongName, nTongId = GetTongName();
	if nTongId == 0 then
		return 0;
	end
	
	local nFigure = GetTongFigure();
	if nFigure ~= 0 and nFigure ~= 1 then
		return 0;
	end
	
	return 1;
end

-- ��ȡ��õľ���
function tbTriumphDrum:GetExp(nCount)
	if nCount <= 0 then
		return 0;
	elseif nCount <= 10 then
		return 100000;
	elseif nCount <= 30 then
		return 250000;
	elseif nCount <= 40 then
		return 300000;
	elseif nCount <= 50 then
		return 350000;
	elseif nCount <= 60 then
		return 400000;
	else
		return 500000;
	end
end

function clone(obj)
	local otype = type(obj)
	if (otype == "number") then
		return obj
	elseif (otype == "string") then
		local ret = obj
		return ret
	elseif (otype == "nil") then
		return obj
	elseif (otype == "table") then
		local ret = {}
		for key, val in obj do
			ret[clone(key)] = clone(val)
		end
		return ret
	else
		return obj
	end
end