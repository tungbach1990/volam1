-- Ѱ���� ͷ�ļ�
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\awardtemplet.lua")

function OnTime()
	return tbBeatTiger:OnTime();
end

tbBeatTiger = 
{
	nStartDate = 20100426,				-- ��ʼ���ڣ�ǰ����
	nCloseDate = 20100531, 				-- �������ڣ���գ�
	nFlowerDisappearDate = 20100607,	-- ������ʧ���ڣ�������
	
	nTaskGroupId = 9,					-- ���������
	nCurrentVersion = 1,				-- �汾��
	nTaskID_UseCount = 1,				-- �������:ʹ�ûƽ�������
	
	nLimit_Level = 50,					-- �ȼ�����
	nLimit_UseCount = 70,				-- �ƽ���ʹ�ô�������
	nLimit_ExpAward = 20000000,			-- ���齱��
	nLimit_AwardTime = 300,				-- �콱ʱ������
	
	nNpc_Talk_ID = 309,					-- ����ģ��ID
	nNpc_Talk_Pos = {37, 1576, 3255},	-- ����λ��
	nNpc_Tiger_ID = 1549,				-- �ϻ�ID
	nNpc_Tiger_Level = 90,				-- �ϻ��ȼ�
	nNpc_Tiger_Pos = {37, 1570, 3269},	-- �ϻ�λ��
	
	nValue_NpcIndex_Talk = nil,			-- �����NpcIndex
	nValue_NpcIndex_Tiger = nil,		-- �ϻ���NpcIndex
	
	nValue_tbPlayerInfo = 				-- ��Ҵ����
	{
		-- ��һ��
		[1] = 
		{
			nStartTime =  801,
			nCloseTime = 1502,
			tbPlayer = {},
		},
		
		-- �ڶ���
		[2] = 
		{
			nStartTime = 1600,
			nCloseTime = 2400,
			tbPlayer = {},
		},
	},
}

tbBeatTiger.tbTaskGroup = TaskManager:Create(tbBeatTiger.nTaskGroupId, tbBeatTiger.nCurrentVersion);

-- ��Ƿ����
function tbBeatTiger:IsCarryOn()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if nDate < self.nStartDate or nDate >= self.nCloseDate then
		 return 0;
	else	
		 return 1;
	end
end

-- ��û����
function tbBeatTiger:GetFieldId()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return 0;
	end
	
	local nTime = tonumber(GetLocalDate("%H%M"));
	for i = 1, getn(self.nValue_tbPlayerInfo) do
		if self.nValue_tbPlayerInfo[i].nStartTime < nTime and nTime < self.nValue_tbPlayerInfo[i].nCloseTime then
			return i;
		end
	end
	
	return 0;
end

-- ����Npc
function tbBeatTiger:AddNpc()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return
	end
	
	self.nValue_NpcIndex_Talk = AddNpc(self.nNpc_Talk_ID, 1, SubWorldID2Idx(self.nNpc_Talk_Pos[1]), self.nNpc_Talk_Pos[2]*32, self.nNpc_Talk_Pos[3]*32, 0, "L�u H��ng");
	SetNpcScript(self.nValue_NpcIndex_Talk, "\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\npc_talk.lua");
	
	self.nValue_NpcIndex_Tiger = AddNpc(self.nNpc_Tiger_ID, self.nNpc_Tiger_Level, SubWorldID2Idx(self.nNpc_Tiger_Pos[1]), self.nNpc_Tiger_Pos[2]*32, self.nNpc_Tiger_Pos[3]*32, 0, "S�t Huy�t L�o H�", 1);
	SetNpcDeathScript(self.nValue_NpcIndex_Tiger, "\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\npc_tiger.lua");
	
	-- ��ʱ������Ϊ�¸�����
	local nMin = tonumber(GetLocalDate("%M"));
	local nSec = tonumber(GetLocalDate("%S"));
	local nLastHour =  (60 - nMin - 1) * 60 + (60 - nSec) + 5*60;	-- �Ӻ�5����
	AddTimer(nLastHour * 18, "OnTime", 0);
end

-- ��ʱ��
function tbBeatTiger:OnTime()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		
		if self.nValue_NpcIndex_Talk ~= nil then
			DelNpc(self.nValue_NpcIndex_Talk);
			self.nValue_NpcIndex_Talk = nil;
		end
		
		if self.nValue_NpcIndex_Tiger ~= nil then
			DelNpc(self.nValue_NpcIndex_Tiger);
			self.nValue_NpcIndex_Tiger = nil;
		end		

		return 0, 0;
	end
	
	return 60*60*18, 0;
end

