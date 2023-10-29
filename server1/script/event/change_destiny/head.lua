-- �������� ͷ�ļ�
Include("\\script\\task\\metempsychosis\\task_func.lua");

tbChangeDestiny = 
{
	bDeBug		= 0,							-- �Ƿ�DeBug�汾
	nStartDate	= 20090828,						-- ���ʼ����
	nCloseDate	= 20091011, 					-- ���������
	nNpcResIdx	= 1446,							-- �NPC��ģ��ID
	
	nLimit_DayGive = 6,							-- һ������Ͻ�6��
	nLimit_TotalGive = 180,						-- �ܹ���Ҫ�Ͻ�180��
	nLimit_AddSkill = 1,						-- ����ܵ����������
	nLimit_TransTimes = 1,						-- �ڼ���ת��
	nLimit_TransLowerBound = 160,				-- ת���ȼ��½�
	nLimit_TransUpperBound = 179,				-- ת���ȼ��Ͻ�
	nLimit_NieShiChen = 1038,					-- �߼�������߱����ID
	
	tbItem_ShenLongZhenDan = {6,1,2113},		-- ��ũ�浤
	tbItem_GaiMingJue = 	 {6,1,2114},		-- ���������
	
	tbNpcPos = 
	{
		{11,  3134, 4985},						-- �ɶ�
		{1,   1621, 3144},						-- ����
		{37,  1817, 3084},						-- �꾩
		{176, 1495, 2971},						-- �ٰ�
		{162, 1581, 3235},						-- ����
		{78,  1519, 3214},						-- ����
		{80,  1723, 2973},						-- ����
	},
	
	nStep_free = 0,								-- ������
	nStep_accepted = 1,							-- �Ѿ���������
	nStep_completed = 2,						-- �Ѿ��������
	nStep_partiallyCompleted_1 = 3,
	nStep_partiallyCompleted_2 = 4,
	nStep_partiallyCompleted_3 = 5,

	
	nMissionID_Battle = 0,						-- ����:�ν�ս��
	nMissionID_NieShiChen = 1,					-- ����:��߱��
	nMissionID_WaterThief = 2,					-- ����:ˮ��
	nMissionID_Killer = 3,						-- ����:ɱ��
	
	tbMissionInfo = 
	{
		[0] = {3,	"Trong m�t tr�n T�ng Kim cao c�p thu ���c 3000 �i�m t�ch l�y",				"��i hi�p �� nh�n nhi�m v� 3000 �i�m t�ch l�y T�ng Kim � Th�n N�ng L�o Gia",	},
		[1] = {1,	"� nhi�m v� v��t �i cao c�p �� ��nh b�i Nhi�p Th� Tr�n",						"��i hi�p �� nh�n nhi�m v� ��nh b�i Nhi�p Th� Tr�n � Th�n N�ng L�o Gia",			},
		[2] = {2,	"�� ��nh b�i Th�y T�c ��u L�nh � Phong L�ng ��.",							"��i hi�p �� nh�n nhi�m v� ��nh b�i Th�y T�c ��u L�nh � Th�n N�ng L�o Gia.",		},
		[3] = {3,	"Nhi�m v� ��nh b�i 4 l�n s�t th� c�p 90 (Nhi�m v� n�y nh�n Nhi�p Th� Tr�n)",	"��i hi�p �� nh�n nhi�m v� ��nh b�i t� ��i s�t th� � Th�n N�ng L�o Gia",		},
	},
	
	nPlayerTask	= {2622, 2623, 2624, 2626, 2627, 2628},	-- ��������
	
	nTask_ZhenDan_GiveDate		= 1,			-- �ϴ��Ͻ��浤����
	nTask_ZhenDan_GiveCount		= 2,			-- �ϴ��Ͻ��浤�ۻ�����
	nTask_ZhenDan_TotalCount	= 3,			-- �ܹ��Ͻ��浤����
	nTask_GaiMing_HasReceive	= 4,			-- �Ƿ���ȡ��������
	nTask_GaiMing_HasUsed	 	= 5,			-- �Ƿ�ʹ�ù�������
	nTask_MissionStart			= 6,			-- ����λ��ʼ�Ǻ�
	nTask_Step_Battle			= 6,			-- ������ɲ��裨�ν�ս����
	nTask_Date_Battle			= 7,			-- ����������ڣ��ν�ս����
	nTask_Step_NieShiChen		= 8,			-- ������ɲ��裨��߱����
	nTask_Date_NieShiChen		= 9,			-- ����������ڣ���߱����
	nTask_Step_WaterThief 		= 10,			-- ������ɲ��裨ˮ����
	nTask_Date_WaterThief		= 11,			-- ����������ڣ�ˮ����
	nTask_Step_Killer			= 12,			-- ������ɲ��裨ɱ�֣�
	nTask_Date_Killer			= 13,			-- ����������ڣ�ɱ�֣�
	
	tbTask = 
	{
		{1, 0,  24},							-- nTask_ZhenDan_GiveDate
		{1, 24, 8 },							-- nTask_ZhenDan_GiveCount
		{2, 0,  16},							-- nTask_ZhenDan_TotalCount
		{2, 16, 8 },							-- nTask_GaiMing_HasReceive
		{2, 24, 8 },							-- nTask_GaiMing_HasUsed
		{3, 0, 	8 },							-- nTask_Step_Battle
		{3, 8, 	24},							-- nTask_Date_Battle
		{4, 0, 	8 },							-- nTask_Step_NieShiChen
		{4, 8, 	24},							-- nTask_Date_NieShiChen
		{5, 0,  8 },							-- nTask_Step_WaterThief
		{5, 8, 	24},							-- nTask_Date_WaterThief
		{6, 0,  8 },							-- nTask_Step_Killer
		{6, 8, 	24},							-- nTask_Date_Killer
	},
	-- ����������ձ� 1:���������ֵ 2:��ʼ��Bitλ(0-31) 3:Ҫ���õ�Bit����(1-32)
}


-- ��Ƿ����
function tbChangeDestiny:isCarryOn()
	
	if self.bDeBug == 1 then
		return 1;
	end
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if nDate < self.nStartDate or nDate > self.nCloseDate then
		 return 0;
	else	
		 return 1;
	end
end

-- ����ܷ����
function tbChangeDestiny:canJoin()
	
	if self.bDeBug == 1 then
		return 1;
	end
	
	if ST_IsTransLife() ~= 1 then
		return 0;
	end
	
	local nTransLevel = zhuansheng_get_gre(self.nLimit_TransTimes);
	if nTransLevel < self.nLimit_TransLowerBound or nTransLevel > self.nLimit_TransUpperBound then
		return 0;
	end
	
	return 1;
end

-- �����������
function tbChangeDestiny:setTask(nTaskIdx, nValue)
	local tbTaskInfo = self.tbTask[nTaskIdx];
	return SetBitTask(self.nPlayerTask[tbTaskInfo[1]], tbTaskInfo[2], tbTaskInfo[3], nValue)
end

-- ��ȡ�������
function tbChangeDestiny:getTask(nTaskIdx)
	local tbTaskInfo = self.tbTask[nTaskIdx];
	return GetBitTask(self.nPlayerTask[tbTaskInfo[1]], tbTaskInfo[2], tbTaskInfo[3])	
end

-- ��ȡ����������Ϣ
function tbChangeDestiny:getMissionInfo(nMissionID)
	
	local nMissionID_Step = self.nTask_MissionStart + nMissionID * 2;
	local nMissionID_Date = nMissionID_Step + 1;
	
	local nMissionStep = self:getTask(nMissionID_Step);
	local nMissionDate = self:getTask(nMissionID_Date);
	
	return nMissionStep, nMissionDate;
end

-- ��������������Ϣ
function tbChangeDestiny:setMissionInfo(nMissionID, nMissionStep, nMissionDate)
	
	local nMissionID_Step = self.nTask_MissionStart + nMissionID * 2;
	local nMissionID_Date = nMissionID_Step + 1;
	
	self:setTask(nMissionID_Step, nMissionStep);
	self:setTask(nMissionID_Date, nMissionDate);
	
end