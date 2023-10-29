Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\pay.lua")

tbCaiPiao = {}

tbCaiPiao.nMinNumber = 1
tbCaiPiao.nMaxNumber = 1e6

tbCaiPiao.tbTempCallBack = {}
tbCaiPiao.szRemoteScript = "\\script\\event\\other\\caipiao\\head_gc.lua"

--�����������

tbCaiPiao.TSKG_ID = 4

TaskManager:AddUseGroup(tbCaiPiao.TSKG_ID)

tbCaiPiao.TSK_IS_GET_AWARD = 1
tbCaiPiao.TSK_USE_CAILU	= 2
tbCaiPiao.TSK_USE_CAILU_DATE	= 3
tbCaiPiao.TSK_USE_GENGYIN	= 4
tbCaiPiao.TSK_USE_GENGYIN_DATE	= 5

--�������
tbCaiPiao.tbTicket = {szName="Canh D�n H�ng Bao", tbProp={6, 1, 2250, 1, 0, 0}, nExpiredTime = 20100322}


function tbCaiPiao:CommonLimit()
	if tonumber(GetLocalDate("%Y%m%d")) < 20100224 then
		Talk(1, "", "T�nh n�ng n�y t�m th�i ��ng")
		return 
	end
	
	local nMinLevel	= 50
	if GetLevel() < nMinLevel then
		Talk(1, "", format("C�p %d tr� l�n m�i c� th� s� d�ng ��o c� n�y", nMinLevel))
		return
	end
	
	if IsCharged() ~= 1 then
		Talk(1, "", "N�p th� m�i c� th� s� d�ng ��o c� n�y")
		return
	end
	return 1
end

function tbCaiPiao:UseCailuLimit()
	local nMaxCount = 10
	
	if self:CommonLimit() ~= 1 then
		return
	end
	
	
	
	local nCurDate		= tonumber(GetLocalDate("%Y%m%d")) 
	
	if TaskManager:GetTask(self.TSKG_ID, self.TSK_USE_CAILU_DATE) ~= nCurDate then
		TaskManager:SetTask(self.TSKG_ID, self.TSK_USE_CAILU_DATE, nCurDate)
		TaskManager:SetTask(self.TSKG_ID, self.TSK_USE_CAILU, 0)
	end
	
	if TaskManager:GetTask(self.TSKG_ID, self.TSK_USE_CAILU) >= nMaxCount then
		Talk(1, "", format("M�i ng�y ch� ���c d�ng  %d ��o c� n�y", nMaxCount))
		return 
	end
	return 1
end

function tbCaiPiao:UseGengYinLimit()
	local nMaxCount = 20
	
	if self:CommonLimit() ~= 1 then
		return
	end
	local nHM		= tonumber(GetLocalDate("%H%M"))
	local nDay		= tonumber(GetLocalDate("%w"))
	if not (0800 <= nHM and nHM < 2100 and (nDay == 5 or nDay == 6 or nDay == 0)) then -- 2100ǰ
		Talk(1, "", "Hi�n t�i kh�ng th� ch�n s�")
		return
	end
	
	local nCurDate	= tonumber(GetLocalDate("%Y%m%d")) 
	if TaskManager:GetTask(self.TSKG_ID, self.TSK_USE_GENGYIN_DATE) ~= nCurDate then
		TaskManager:SetTask(self.TSKG_ID, self.TSK_USE_GENGYIN_DATE, nCurDate)
		TaskManager:SetTask(self.TSKG_ID, self.TSK_USE_GENGYIN, 0)
	end
	
	if TaskManager:GetTask(self.TSKG_ID, self.TSK_USE_GENGYIN) >= nMaxCount then
		Talk(1, "", format("M�i ng�y ch� ���c d�ng  %d ��o c� n�y", nMaxCount))
		return 
	end
	
	return 1
end


function tbCaiPiao:OpenInputUI()
	local nRandomNumber = random(self.nMinNumber, self.nMaxNumber)
	local szTitle = "Nh�p m�t s� b�t k�"
	local pData = {self.ApplyWager, {self}}
	g_AskClientNumberEx(1, self.nMaxNumber, szTitle, pData)
end

function tbCaiPiao:ApplyWager(nCount)	
	
	if self:UseGengYinLimit() ~= 1 then
		return
	end
	
	--ɾ������
	local tbProp = self.tbTicket.tbProp
	if ConsumeEquiproomItem(1, tbProp[1], tbProp[2], tbProp[3], -1) ~= 1 then
		Msg2Player("��o c� kh�ng t�n t�i")
		return
	end
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, GetName())
	ObjBuffer:PushObject(handle, nCount)
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_Wager", handle, "tbCaiPiao_Wager_CallBack")
	OB_Release(handle)
	TaskManager:AddTask(self.TSKG_ID, self.TSK_USE_GENGYIN, 1)
	return 1
end

function tbCaiPiao:WagerCallBack(nResult)
	local szMsg		= ""
	if nResult <= -1 then
		szMsg		= "Hi�n t�i kh�ng th� ch�n s�"
	elseif nResult == 0 then
		szMsg		= "Nh�p s� sai quy c�ch"
	else
		szMsg		= format("��i hi�p �� ch�n <color=yellow>%d<color>", nResult)
	end
	Msg2Player(szMsg)
	Talk(1, "", szMsg)
	if nResult > 0 then
		tbAwardTemplet:GiveAwardByList({nExp = 3e6}, "use gengyinhongbao")		
	else
		tbAwardTemplet:GiveAwardByList(self.tbTicket, "Wager Fail")
		TaskManager:AddTask(self.TSKG_ID, self.TSK_USE_GENGYIN, -1)
	end
end

--function tbCaiPiao:PersonQuery()
--	local handle = OB_Create()
--	ObjBuffer:PushObject(handle, GetName())	
--	self:RemoteExecute(PlayerIndex, "tbCaiPiao_PersonQuery", handle, "tbCaiPiao_PersonQuery_CallBack")
--	OB_Release(handle)
--end





function tbCaiPiao:QueryResult(nWeekDay)
	nWeekDay = nWeekDay or self:GetCurAwardWeekDay()
	
	if not nWeekDay or nWeekDay <=0 then
		Talk(1, "", "Hi�n t�i v�n ch�a c� k�t qu�")
		return 0
	end
	
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nWeekDay)
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_GetResultData", handle, "tbCaiPiao_QueryResult")
	OB_Release(handle)
end

--function tbCaiPiao:ShowPersonInfo(tbNumberList)
--	if not tbNumberList or getn(tbNumberList) == 0 then
--		return Talk(1, "","�㻹û��Ͷע��")
--	end
--	local szMsg = "��Ͷע�ˣ�"
--	for nNumber, bFlag in tbNumberList do
--		if type(nNumber) == "number" and bFlag == 1 then
--			szMsg = format("%s%d ", szMsg, nNumber)
--		end
--		
--	end
--	Msg2Player(szMsg)
--	
--end

function tbCaiPiao:BagFreeCellLimit(nType)
	local nWidth	= 1
	local nHeight	= 1
	local nCount	= 1
	
	if nType == 0 then
		nWidth = 2
		nHeight = 3
	end
	
	--�жϱ����ռ�
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Talk(1, "", format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nCount, nWidth, nHeight))
		return 0
	end
	return 1
end


function tbCaiPiao:AwardFun(nType)
	
	if nType == 0 then
		return self.GetAwardWeek
	else
		return self.GetAwardToday
	end
end

--����
function tbCaiPiao:GetAward(tbData)
	if not tbData or getn(tbData) ~= 4 or not tbData[1] then
		Talk(1, "", "Hi�n t�i v�n ch�a c� k�t qu� m�")
		return 0
	end
	local nType			= tbData[1]
	local nResultNumber = tbData[2]
	local szPlayerName	= tbData[3]
	local nWeekDay		= tbData[4]
	
	
	if self:BagFreeCellLimit(nType) ~= 1 then
		return 0
	end
	
	
	if GetName() ~= szPlayerName then
		Talk(1,"", "��i hi�p kh�ng �� �i�u ki�n l�nh th��ng")
		return 0
	end 
	
	--�����ȡ��������ȡ
	if TaskManager:GetTask(self.TSKG_ID, self.TSK_IS_GET_AWARD) == nWeekDay then
		Talk(1,"", "��i hi�p �� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	
	
	local pFun = self:AwardFun(nType)
	if pFun then
		pFun(self)
		TaskManager:SetTask(self.TSKG_ID, self.TSK_IS_GET_AWARD, nWeekDay)
	end
	
end

function tbCaiPiao:GetAwardToday()
	local tbAward = 
	{
		{nExp = 100000000},
		{szName="Nh�t K� C�n Kh�n Ph�", tbProp={6, 1, 2126, 1, 0, 0}},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "cailuhongbao")
end

function tbCaiPiao:GetAwardWeek()
	local tbAward = 
	{
		{nExp = 200000000},
		{szName="[C�c ph�m] H�ng �nh Tr�m Vi�n V�n T�y", nQuality=1, tbProp={0, 536}},
		{szName="[C�c ph�m] H�ng �nh Ki�m Qua T�y Ph��ng", nQuality=1, tbProp={0, 537}},
		{szName="[C�c ph�m] H�ng �nh M�c T�c T��ng Vong", nQuality=1, tbProp={0, 538}},
		{szName="[C�c ph�m]H�ng �nh H�ng T� Chi�u", nQuality=1, tbProp={0, 539}},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "cailuhongbao")
end



function tbCaiPiao:GetCurAwardWeekDay()
	local nHM = tonumber(GetLocalDate("%H%M"))
	local nWeek = tonumber(GetLocalDate("%W"))
	local nTime = GetCurServerTime()
	
	local nDay = tonumber(GetLocalDate("%w"))
	
	if nDay == 1 and (0000 <= nHM and nHM < 2000) then --����ͻ�����⣬��λ�����꣬��ʱ������
		nWeek = nWeek - 1
		return nWeek*10
	elseif nDay == 0 and (0000 <= nHM and nHM < 2000) then
		return nWeek*10+6
	elseif nDay == 6 and (0000 <= nHM and nHM < 2000) then
		return nWeek*10 + 5
	elseif (nDay == 0 or nDay == 5 or nDay == 6) and (2110 <= nHM and nHM <= 2400) then
		return nWeek*10 + nDay
	else
		return 
	end
end

function tbCaiPiao:ApplyGetAward(nWeekDay)
	nWeekDay = nWeekDay or self:GetCurAwardWeekDay()
	
	if not nWeekDay or nWeekDay <=0 then
		Talk(1, "", "Kh�ng ph�i l� th�i gian l�nh th��ng.")
		return 0
	end
	
	
	
	--�����ȡ��������ȡ
	if TaskManager:GetTask(self.TSKG_ID, self.TSK_IS_GET_AWARD) == nWeekDay then
		Talk(1,"", "��i hi�p �� nh�n ph�n th��ng n�y r�i.")
		return 0
	end
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nWeekDay)	
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_GetResultData", handle, "tbCaiPiao_GetResultData_CallBack")
	OB_Release(handle)
end

function tbCaiPiao:RemoteExecute(nPlayerIndex, szFun, handle, szCallBack)
	
	self.tbTempCallBack[nPlayerIndex] = lib:DoFunByPlayer(nPlayerIndex, GetName)
	RemoteExecute(self.szRemoteScript, szFun, handle, szCallBack, nPlayerIndex)
end


function tbCaiPiao:ShowResult(tbData)
	if not tbData or getn(tbData) ~= 4 or not tbData[1] then
		Talk(1, "", "Hi�n t�i v�n ch�a c� k�t qu�")
		return 0
	end
	local nType			= tbData[1]
	local nResultNumber = tbData[2]
	local szPlayerName	= tbData[3]
	local nWeekDay		= tbData[4]
	
	local szMsg = ""
	
	if nResultNumber == 0 and szPlayerName and szPlayerName ~= "" then
		szMsg = format("��t n�y kh�ng c� ng��i tr�ng th��ng, ng�u nhi�n ch�n m�t ng��i tr�ng th��ng l� <color=yellow>%s<color>", szPlayerName)
	elseif nResultNumber > 0 and szPlayerName and szPlayerName ~= "" then
		szMsg = format("S� tr�ng th��ng <color=yellow>%s<color>", nResultNumber)
		szMsg = szMsg.."<enter>"..format("Nh�n v�t tr�ng th��ng <color=yellow>%s<color>", szPlayerName)
	else
		szMsg = "Hi�n t�i v�n ch�a c� k�t qu�"
	end
	Talk(1, "", szMsg)
end




--relay �ص�

local _CheckPlayer = function(nPlayerIndex)
	if nPlayerIndex <= 0 then
		return 
	end
	local szOldName = tbCaiPiao.tbTempCallBack[nPlayerIndex]
	local szCurName = lib:DoFunByPlayer(nPlayerIndex, GetName)
	if szOldName ~= nil and szCurName ~= nil and szOldName == szCurName then
		tbCaiPiao.tbTempCallBack[nPlayerIndex] = nil
		return 1
	end
end



function tbCaiPiao_Wager_CallBack(nParam, ResultHandle)
	if %_CheckPlayer(nParam) ~= 1 then
		return 
	end
	local nResult	= ObjBuffer:PopObject(ResultHandle)
	
	
	lib:DoFunByPlayer(nParam, tbCaiPiao.WagerCallBack, tbCaiPiao, nResult)
end

function tbCaiPiao_GetResultData_CallBack(nParam, ResultHandle)
	if %_CheckPlayer(nParam) ~= 1 then
		return 
	end
	local tbResultData = ObjBuffer:PopObject(ResultHandle)
	
	
	lib:DoFunByPlayer(nParam, tbCaiPiao.GetAward, tbCaiPiao, tbResultData)
end

--function tbCaiPiao_PersonQuery_CallBack(nParam, ResultHandle)
--	if %_CheckPlayer(nParam) ~= 1 then
--		return 
--	end
--	
--	local tbNumberList = ObjBuffer:PopObject(ResultHandle)
--	lib:DoFunByPlayer(nParam, tbCaiPiao.ShowPersonInfo, tbCaiPiao, tbNumberList)
--end


function Msg2PlayerFromGC(nParam, ResultHandle)
	if %_CheckPlayer(nParam) ~= 1 then
		return 
	end	
	local szMsg = ObjBuffer:PopObject(ResultHandle)
	lib:DoFunByPlayer(nParam, Msg2Player, szMsg)
end

function tbCaiPiao_QueryResult(nParam, ResultHandle)
	if %_CheckPlayer(nParam) ~= 1 then
		return 
	end	
	
	local tbData		= ObjBuffer:PopObject(ResultHandle)
	

	lib:DoFunByPlayer(nParam, tbCaiPiao.ShowResult, tbCaiPiao, tbData)
end




