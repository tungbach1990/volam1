IncludeLib("FILESYS")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")

tbHuoYueDu = {}
tbHuoYueDu.szFilePath = "\\settings\\huoyuedu\\huoyuedu.txt"
-- ��Ծ�ȵ����ֵ����Ҫ��\UI\UI3\uiactivityguide\activityinfo.ini�е�MaxHuoyueduֵ����һ��
tbHuoYueDu.nMaxHuoYueDu = 100	

tbHuoYueDu.TSK_TotalHuoYueDu = 2880 --��¼���ÿ�������л�����ܻ�Ծ��
tbHuoYueDu.TSK_Award = 2882 --��¼��Ծ���콱

OPENED = 1	-- ��Ծ�ȿ���״̬
CLOSED = 2  -- ��Ծ�ȹر�״̬
STATE = OPENED -- ��Ծ���Ƿ�ʼ��1Ϊ������������Ϊ�ر�

tbActivity2ID = {
	["luanzhanjiuzhou"] = 25,
	["shijiandetiaozhan"] = 3,
	["fenglingdu"] = 2,
	["songjin"] = 4,
	["yandibaozang"] = 5,
	["qichengdazhan"] = 6,
	["wulinliansai"] = 7,
	["xinshirenwu"] = 10,
	["shashourenwu"] = 11,
	["yesourenwu"] = 12,
	["huangchengsixunlianying"] = 26,
	["BOSS"] = 1,
	["huihuangzhiguo"] = 8,
	["huashandengmi"] = 9,
	["fenghuoliancheng"] = 13,
	["tianziguozhan"] = 14,
	}

function tbHuoYueDu:LoadTable(szPath)
	if (TabFile_Load(szPath, szPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return
	end
	local nRowCount = TabFile_GetRowCount(szPath)
	self.tbActivity = self.tbActivity or {}
	local number = 1
	for i=1, (nRowCount - 1) do
		self.tbActivity[i] = self.tbActivity[i] or {}
		self.tbActivity[i]["nTaskId"] = tonumber(TabFile_GetCell(szPath, i + 1, 3))
		local nColumn = 4
		local nCount = tonumber(TabFile_GetCell(szPath, i + 1, nColumn))
		self.tbActivity[i]["nCount"] = nCount
		self.tbActivity[i]["tbValue"] = self.tbActivity[i]["tbValue"] or {}
		number = number + 1
		for j=1, nCount do
			self.tbActivity[i]["tbValue"][j] = tonumber(TabFile_GetCell(szPath, i + 1, nColumn + j))
		end
	end
end

function tbHuoYueDu:AddHuoYueDu(szActivity)
	local nActivityId = tbActivity2ID[szActivity]
	if not nActivityId then
		return 
	end
	local tbActivity = self.tbActivity[nActivityId]
	local nResult = self:CheckTimes(nActivityId)
	if nResult ~= 1 then
		return
	end

	self:AddTaskDaily(nActivityId)
	local nTime = self:GetTaskDailyCount(nActivityId)
	local nAddedValue = tbActivity["tbValue"][nTime]
	
	if nAddedValue == nil or type(nAddedValue) ~= "number" or nAddedValue <= 0 then
		return
	end
	
	local nTaskValue = PlayerFunLib:GetTaskDailyCount(self.TSK_TotalHuoYueDu)
	if nAddedValue > (self.nMaxHuoYueDu - nTaskValue) then
		nAddedValue = self.nMaxHuoYueDu - nTaskValue
	end
	if nAddedValue > 0 then
		Msg2Player(format("Ch�c m�ng ng��i nh�n ���c %d �i�m n�ng ��ng",nAddedValue))
		PlayerFunLib:AddTaskDaily(self.TSK_TotalHuoYueDu, nAddedValue)
		G_ACTIVITY:OnMessage("Huoyuedu", nTaskValue + nAddedValue)
		local szLog = format("Player Get HuoYueDu, szKey:%s, nValue:%d", szActivity, nAddedValue)
		tbLog:PlayerActionLog(szLog)
	end
end

function tbHuoYueDu:AddTaskDaily(nActivityId)
	if self.tbActivity[nActivityId] == nil then
		return
	end
	PlayerFunLib:AddTaskDaily(self.tbActivity[nActivityId]["nTaskId"], 1)
end

function tbHuoYueDu:GetTaskDailyCount(nActivityId)
	if self.tbActivity[nActivityId] == nil then
		return
	end
	local nResult = PlayerFunLib:GetTaskDailyCount(self.tbActivity[nActivityId]["nTaskId"])
	return nResult
end

function tbHuoYueDu:AddHuoYueDuAll(tbPlayer, szActivity)
	for i=1,getn(tbPlayer) do
		CallPlayerFunction(tbPlayer[i], self.AddHuoYueDu, self, szActivity)
	end
end

function tbHuoYueDu:CheckTimes(nActivityId)
	if STATE ~= OPENED then
		return 
	end
	
	if self.tbActivity[nActivityId] == nil then
		return 
	end
	
	if PlayerFunLib:CheckTaskDaily(self.TSK_TotalHuoYueDu, self.nMaxHuoYueDu, "", ">=") == 1 then
		Msg2Player("�i�m n�ng ��ng c�a ng��i h�m nay �� ��y, �i�m n�ng ��ng l�n n�y kh�ng t�nh v�o trong")
		return 
	end
	
	local tbActivity = self.tbActivity[nActivityId]
	local nTaskId = self.tbActivity[nActivityId]["nTaskId"]
	local nCount = self.tbActivity[nActivityId]["nCount"]
	
	if PlayerFunLib:CheckTaskDaily(nTaskId, nCount, "", ">=") == 1 then
		return 
	end
	return 1
end

function tbHuoYueDu:ClearAll()
	for _,value in tbActivity2ID do
		local nTaskId = self.tbActivity[value]["nTaskId"]
		SetTask(nTaskId,0);
	end
	SetTask(self.TSK_Award, 0)
	SetTask(self.TSK_TotalHuoYueDu, 0)
end

tbHuoYueDu:LoadTable(tbHuoYueDu.szFilePath)

