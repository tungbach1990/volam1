Include("\\script\\activitysys\\config\\41\\head.lua")
Include("\\script\\activitysys\\config\\41\\variables.lua")
Include("\\script\\activitysys\\config\\41\\data.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("TITLE")

local szRemoteScript = "\\script\\event\\2012april_zhushuai\\event.lua"
pActivity.tbStartDay = {2012,3,29,10,0} -- ��2012/3/1 10��00 Ϊ���ĵ���ʼʱ��
pActivity.nTempTime = 7 * 24 * 60 * 60		-- ÿ������һ��

function pActivity:InitAddNpc()
	tbNpc = %tbActivityNpc
	tbPos = %tbActivityNpcPos
	for i=1, getn(tbNpc) do
		local tbNpcPos = tbPos[i]
		for j=1,getn(tbPos[i]) do
			local nMapId, nPosX, nPosY = unpack(tbNpcPos[j])
			basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
		end
	end
	
	self:InitHandInCompose()
	self:InitUpdateCompose()
end

function pActivity:GetCurrentDateTime()
	local nCurrDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCurrTime = tonumber(GetLocalDate("%H%M"))
	return nCurrDate, nCurrTime
end

-- �������һ�ε�¼ʱ�䣬�������е�¼���򲻸ı䣬
-- ���򣬽����һ�ε�¼ʱ���Ϊ���������8��
function pActivity:UpdateLastLoginTime()
do return end
	local nLastDate = self:GetTask(%TSK_LAST_ONLINEDATE)
	local nLastTime = self:GetTask(%TSK_LAST_ONLINETIME)
	local nCurrDate, nCurrTime = self:GetCurrentDateTime()
	
	-- ��������û������
	if nLastDate ~= nCurrDate then
		nLastDate = nCurrDate
		nLastTime = %NUM_ONLINE_START_TIME
	end
	
	if nLastTime < %NUM_ONLINE_START_TIME then
		nLastTime = %NUM_ONLINE_START_TIME
	end
	
	self:SetTask(%TSK_LAST_ONLINEDATE, nLastDate)
	self:SetTask(%TSK_LAST_ONLINETIME, nLastTime)
end

function pActivity:GetOnLineAward()
	local nDate = self:GetTask(%TSK_LAST_ONLINEDATE)
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nHour = 0
	local nCurrentOnLineTime = 0
	local nLastOnLineTime = 0
	local nCount = 0
	if nDate == nNowDate then
		nLastOnLineTime = self:GetTask(%TSK_LAST_ONLINETIME)
		nCurrentOnLineTime = GetGameTime()	
		nHour = floor((nCurrentOnLineTime - nLastOnLineTime) / 60 / 60)
		nCurrentOnLineTime = nLastOnLineTime + nHour * 60 * 60
	else
		local nCurrentH = tonumber(GetLocalDate("%H"))
		local nCurrentM = tonumber(GetLocalDate("%M"))
		local nCurrentS = tonumber(GetLocalDate("%S"))
		nHour = nCurrentH 
		nCurrentOnLineTime = GetGameTime() - nCurrentM * 60 - nCurrentS		
	end
	nCount = nHour	
	if nCount <= 0 then
		Msg2Player("Kho�ng c�ch nh�n l�n tr��c, th�i gian tr�n m�ng c�a ng��i ch�a �� 1 gi�, kh�ng th� nh�n")
		return 
	end
	local nMaxCount = %MAX_DAILY_LOGIN_MEDAL -  PlayerFunLib:GetTaskDailyCount(%TSK_DAILY_LOGIN_MEDAL)
	nMaxCount = min(nMaxCount, nCount)
	if nMaxCount <= 0 then
		Msg2Player("H�m nay ng��i kh�ng th� nh�n n�a, ng�y mai h�y quay l�i.")
		return 
	end
	
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
		
	self:SetTask(%TSK_LAST_ONLINETIME,nCurrentOnLineTime)
	self:SetTask(%TSK_LAST_ONLINEDATE,nNowDate)

	PlayerFunLib:GetItem(%ITEM_MEDAL_1,nMaxCount*3, %EVENT_LOG_TITLE, "NhanHuyHieuCap1TaiNPCThoMay")
	PlayerFunLib:AddTaskDaily(%TSK_DAILY_LOGIN_MEDAL, nMaxCount)	
end

-- ��ҵ�¼
--Change online award - Modified By DinhHQ - 20120330
function pActivity:PlayerOnLogin()
--	self:UpdateLastLoginTime()
--	local nCurrDate, nCurrTime = self:GetCurrentDateTime()
--	
--	self:SetTask(%TSK_LAST_ONLINEDATE, nCurrDate)
--	self:SetTask(%TSK_LAST_ONLINETIME, nCurrTime)
	local nDate = self:GetTask(%TSK_LAST_ONLINEDATE)	
	local nNowDate = tonumber(GetLocalDate("%Y%m%d"))
	local nCount = 0	
	if nDate ~= nNowDate then
		nCurrentOnLineTime = GetGameTime()		
		self:SetTask(%TSK_LAST_ONLINETIME,nCurrentOnLineTime)
		self:SetTask(%TSK_LAST_ONLINEDATE,nNowDate)		
	end
end

function pActivity:GetDateFromBuffer(ResultHandle, nCount)
	local tbResult = {}
	for i=1,nCount do
		tbResult[i] = ObjBuffer:PopObject(ResultHandle)
--		print("i = " .. i .. " tbResult[i] = " .. tbResult[i])
	end
	return unpack(tbResult)
end


-- ����relay���ص���Ϣ�жϵ�ǰ����ǲ�����˧
function pActivity:IsZhuShuai(ResultHandle)
	local nResult = 1
	local szName, nMark, szPlayerName, nParam = self:GetDateFromBuffer(ResultHandle, 4)
	local nPlayerIndex = SearchPlayer(szPlayerName)
	
--	print("--------------------------------")
--	if szName then
--	print("szName = " .. szName)
--	else
--		print("the rank name is nil")
--	end
--	print("nMark = " .. nMark)
--	print("szPlayerName = " .. szPlayerName)
--	print("--------------------------------")
	if nPlayerIndex <= 0 then
		return 0, 0, nParam
	end
	
	if not szName or szName ~= szPlayerName then
		nResult = 0
	end
	return nPlayerIndex, nResult, nParam
end

-- ��鵱ǰ����ǲ��ǵ�һ��˧
-- ��Ҫ��relay����
function pActivity:CheckPerson(szFun, nParam)
	nParam = nParam or 0
	local obj = ObjBuffer:New()
	obj:Push(GetName())
	obj:Push(nParam)
	DynamicExecute("\\script\\activitysys\\config\\41\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbZhuShuai:g2s_PreZhuShuai", obj.m_Handle, szFun, 0)
	obj:Destroy()
end

-- �������˧��ѡ����ȡ��һ��˧�Ի�
function pActivity:GetTitle_1()
	self:IsClearMark()
	self:CheckPerson("pActivity:GetTitle_2")
end

-- �����ȡ����˧����relay������Ϣ�����ж�
function pActivity:GetTitle_2(nParam, ResultHandle)
	local nPlayerIndex,nResult,_ = self:IsZhuShuai(ResultHandle)
	if nPlayerIndex <= 0 then
		return
	end
	local szMsg = format("Ng��i kh�ng ph�i ch� so�i c�a tu�n n�y, kh�ng th� nh�n %s n�y","danh hi�u")
	if nResult == 0 then
		CallPlayerFunction(nPlayerIndex, Say, szMsg)
		return 
	end
	CallPlayerFunction(nPlayerIndex, self.GetTitle, self)
end

-- ��óƺ�
function pActivity:GetTitle()
	local n_title = 246
	local nDay = 6
	local nHour = GetLocalDate("%H")
	local nMinute = GetLocalDate("%M")
	local nTime = ((24-nHour) * 60 - nMinute) + nDay * 24 * 60 + 10 * 60 -- ��
	nTime = nTime * 60 -- ��
	nTime	= mod(FormatTime2Number(GetCurServerTime()+nTime), 100000000)--nMon * 1000000 + nDay * 10000	-- 
	local TSK_ACTIVE_TITTLE = 1122

	Title_AddTitle(n_title, 2, nTime)
	Title_ActiveTitle(n_title)
	SetTask(TSK_ACTIVE_TITTLE, n_title)	-- �����´�����֮��������ƺ�

	%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, "NhanDanhHieuChuSoai")
	self:AddTaskDaily(%TSK_DAILY_GET_TITLE, 1)
	Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c danh hi�u �� Nh�t Ch� So�i")
end

function pActivity:GetZhuShuaiAward_1()
	self:IsClearMark()
	self:CheckPerson("pActivity:GetZhuShuaiAward_2")
end

function pActivity:GetZhuShuaiAward_2(nParam, ResultHandle)
	local nExp = 50000000
	local nPlayerIndex,nResult,_ = self:IsZhuShuai(ResultHandle)
	if nResult == 0 then
		CallPlayerFunction(nPlayerIndex,Say,format("Ng��i kh�ng ph�i ch� so�i c�a tu�n n�y, kh�ng th� nh�n %s n�y","Ph�n th��ng"))
		return 
	end
	CallPlayerFunction(nPlayerIndex, PlayerFunLib.AddExp, PlayerFunLib, nExp, 1, %EVENT_LOG_TITLE, "NhanPhanThuongChuSoai")
	CallPlayerFunction(nPlayerIndex, self.AddTaskDaily, self, %TSK_DAILY_EXP_AWARD, 1)
end

function pActivity:ActiveFunction_1(nType)
	self:IsClearMark()
	self:CheckPerson("pActivity:ActiveFunction_2", nType)
end

function pActivity:DoActiveFunction(nParam)
	local nJxb = 10000000
	if GetCash() < nJxb then
		Msg2Player(format("K�ch ho�t t�nh n�ng n�y c�n ph�i c� %d ng�n l��ng, h�y chu�n b� k� r�i quay l�i",nJxb))
		return
	end
	Pay(nJxb)
	self:AddTaskDaily(%TSK_TB_DAILY_ACTIVE[nParam], 1)
	self:AddTaskDaily(%TSK_DAILY_ACTIVE, 1)
	%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, %tbActivLog[nParam])
	Msg2Player("Ng��i �� k�ch ho�t t�nh n�ng n�y th�nh c�ng")
end

function pActivity:ActiveFunction_2(nParam, ResultHandle)
	local nPlayerIndex, nResult, nParam = self:IsZhuShuai(ResultHandle)
	if nResult ~= 1 then
		CallPlayerFunction(nPlayerIndex,Say,"Ng��i kh�ng ph�i ch� so�i c�a tu�n n�y, kh�ng th� k�ch ho�t t�nh n�ng n�y")
		return
	end
	CallPlayerFunction(nPlayerIndex, self.DoActiveFunction, self, nParam)
end

function pActivity:UpdateNextClearTime()
	local nCurrTime = GetCurrentTime()
--	print("nCurrTime = " .. nCurrTime)
	local nTime = Tm2Time(unpack(self.tbStartDay))
--	print("nStartTime = " .. nTime)
	-- �����´θ���ʱ��
	-- ���㵱ǰʱ���2012/3/1 10:00 ���˼��ܣ����ݲ�ֵ�������´θ���������ʱ��
	local nCount = floor( (nCurrTime - nTime)/self.nTempTime) + 1
--	print("nCount = " .. nCount)
	nNextSortTime = nTime + nCount * self.nTempTime
	if nNextSortTime <= nCurrTime then
		nNextSortTime = nNextSortTime + self.nTempTime
	end
--	print("nNextSortTime = " .. nNextSortTime)
	self:SetTask(%TSK_NEXT_CLEAR_TIME, nNextSortTime)
	return nNextSortTime
end

-- �ж��Ƿ���Ҫ��ջ��֣������Ҫ�����
function pActivity:IsClearMark()
	local nNextSortTime = self:GetTask(%TSK_NEXT_CLEAR_TIME)
	
	if nNextSortTime == 0 then
		nNextSortTime = self:UpdateNextClearTime()
	end
	
	local nCurrTime = GetCurrentTime()
--	print("nCurrTime = " .. nCurrTime)
--	print("nNextSortTime = " .. nNextSortTime)
	-- ��ǰ��ʱ��С���´θ���ʱ�䣬�򲻴���
	if nCurrTime <= nNextSortTime then
		return 0
	end
	-- ��յ�ǰ����,�����´�������ݵ�ʱ��
	self:SetTask(%TSK_MARK,0)
	self:UpdateNextClearTime()
	return 1
end

function pActivity:QueryMark_1()
	self:IsClearMark()
	local obj = ObjBuffer:New()
	obj:Push(GetName())
	DynamicExecute("\\script\\activitysys\\config\\41\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbZhuShuai:g2s_NowZhuShuai", obj.m_Handle, "pActivity:QueryMark_2", 0)
	obj:Destroy()
	
end

function pActivity:QueryMark_2(nParam, ResultHandle)
	local szName, nMaxMark, szPlayerName = self:GetDateFromBuffer(ResultHandle, 3)
	local nPlayerIndex = SearchPlayer(szPlayerName)
	if nPlayerIndex <= 0 then
		return
	end
	
	CallPlayerFunction(nPlayerIndex, self.IsClearMark, self)
	local nPlayerMark = CallPlayerFunction(nPlayerIndex, self.GetTask, self, %TSK_MARK)
	CallPlayerFunction(nPlayerIndex, Say, format("T�ch l�y danh hi�u hi�n t�i c�a c�c h� l� %d, �i�m t�ch l�y cao nh�t hi�n t�i l� %d", nPlayerMark, nMaxMark))
end

function pActivity:HandInMedal(nType, nCount)
	self:IsClearMark()
	
	for k=1,nCount do
		local nRate = random(1, 100)
		local nTotalRate = 0
		tbHandInMedal = %tbHandInMedal[nType]
		local tbMark = tbHandInMedal.tbMark
		for i=1,getn(tbMark)do
			nTotalRate = nTotalRate + tbMark[i].nRate
			if nRate <= nTotalRate then
				self:AddTask(%TSK_MARK, tbMark[i].nMark)
				Msg2Player(format("Danh hi�u v� t�ch l�y c�a ng��i �� t�ng l�n %d",tbMark[i].nMark))
				break
			end
		end
		PlayerFunLib:AddExp(tbHandInMedal.nExp_tl, 1, %EVENT_LOG_TITLE,format("HandIn_Medal_%d",nType))
	end
	
	self:UpdateMaxMark()
	self:AddTaskDaily(%TSK_DAILY_MEDAL, nCount)
	
	local nHandinCount = self:GetTaskDaily(%TSK_DAILY_MEDAL)
	if nHandinCount == %MAX_DAILY_HANDIN_MEDAL then
		%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, "Nop100HuyHieuMoiNgay")
	end
end

-- ��relay���������µ�ǰ����߻������
function pActivity:UpdateMaxMark()
	local szName = GetName()
	local nMark = self:GetTask(%TSK_MARK)
	local obj = ObjBuffer:New()
	obj:Push(szName)
	obj:Push(nMark)
	RemoteExecute(%szRemoteScript, "tbZhuShuai:s2g_AddDate", obj.m_Handle)
	obj:Destroy()
end

function pActivity:PlayerSignUp(nType)
	self:SetTask(%TSK_TB_NOW_DAILY_ACTIVE[nType], 0)
	
	if PlayerFunLib:CheckTotalLevel(150,"",">=") ~= 1 then
		return
	end
	local bResult = 1
	if nType == NUM_SONGJIN and self:CheckSongJinTime() == 0 then
		bResult = 0
	end
	-- ��һ�������ģ�����21:00���ν��ܼ���˽���
	if bResult == 0 then
		return
	end
	
	local nCount = self:GetTaskDaily(%TSK_TB_DAILY_ACTIVE[nType])
	if nCount > 0 then
		self:AddTaskDaily(%TSK_TB_NOW_DAILY_ACTIVE[nType], 1)
		self:AddTaskDaily(%TSK_TB_DAILY_ACTIVE[nType], -1)
	end
end

function pActivity:DoubleExp_YDBZ(nPoint)
	local nTask = %TSK_TB_NOW_DAILY_ACTIVE[%NUM_YDBZ]
	if self:GetTaskDaily(nTask) == 1 then
		nPoint = nPoint * 2
	end
	return nPoint
end

function pActivity:DoubleExp_ChuangGuan(nPoint)
	local nTask = %TSK_TB_NOW_DAILY_ACTIVE[%NUM_CHUANGGUAN]
	if self:GetTaskDaily(nTask) == 1 then
		nPoint = nPoint * 2
	end
	return nPoint
end

function pActivity:CheckSongJinTime()
	local nWeekDay = tonumber(GetLocalDate("%w"))
	local nHour = tonumber(GetLocalDate("%H"))
	local tbWeek = {1,2,4,6}
	local tbFuncHour = {20,21}
	local nAvai = 1
	for i=1, getn(tbWeek) do
		if nWeekDay == tbWeek[i] and (nHour == tbFuncHour[1] or nHour == tbFuncHour[2]) then
			nAvai = 0
		end
	end
	return nAvai
end

function pActivity:DoubleExp_Songjin(nPoint)
	local nTask = %TSK_TB_NOW_DAILY_ACTIVE[%NUM_SONGJIN]
	
	local nAvai = 1
	if self:GetTaskDaily(nTask) == 1 and self:CheckSongJinTime() == 1 then
		nPoint = nPoint * 2
	end
	return nPoint
end

function pActivity:ResetTSKNowActive(nType)
	self:SetTask(%TSK_TB_NOW_DAILY_ACTIVE[nType], 0)
end

pActivity.nPak = curpack()