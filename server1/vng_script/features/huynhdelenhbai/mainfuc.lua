Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\vng_script\\features\\huynhdelenhbai\\lenhbai_def.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")

tbHuynhdelenhbai = tbHuynhdelenhbai or {};
function tbHuynhdelenhbai:GiveNameTaskEvent(nEventId)	
	local szMsg = ""
	if(self.TASK_ID_MAP and self.TASK_ID_MAP[nEventId]) then
		for i,v in self.TASK_ID_MAP[nEventId] do
				--print("--------TASK_ID_MAP nEventId:  "..nEventId)
				--print("--------TASK_ID_MAP i:  "..i)				
			local nNum = tbVNG_BitTask_Lib:getBitTask(v)
			local szNameTask = self.TASK_NAME_NPC[nEventId][i]
			local szActive = tbVNG_BitTask_Lib:isMaxBitTaskValue(v) ~= 1 and "red" or "yellow"
			--print("--------TASK_ID_MAP nNum:  "..nNum)
			--print("--------TASK_ID_MAP szNameTask:  "..szNameTask)
			--print("--------TASK_ID_MAP szActive:  "..szActive)
			szMsg = szMsg..format("<color=%s>%s:%d<color>\n",szActive,szNameTask,nNum)
		end
	end
	if(self.TASK_INFOR_ABOUNT[nEventId]) then
		local tbQuest = self.TASK_INFOR_ABOUNT[nEventId][1]
		local szActive = ""
		local nNum = 0
		local szNameTask = ""
		if nEventId == 1 then			
			szActive = GetCash() < tbQuest.nRequires and "red" or "yellow"				
			nNum = GetCash()	
			local szNameTask = self.TASK_NAME_TASK[nEventId]
		elseif nEventId == 2 then
			local nRand =  random(0,1)
			szActive = nRand ~= 1 and "red" or "yellow"	
			nNum =  nRand
			szNameTask = self.TASK_NAME_TASK[nEventId]
		elseif nEventId == 3 or nEventId == 4 then
			local nCount = CalcItemCount(3, tbQuest.tbProp[1], tbQuest.tbProp[2], tbQuest.tbProp[3], -1) 	
			szActive = nCount < tbQuest.nRequires  and "red" or "yellow"
			nNum = nCount	
			szNameTask = self.TASK_NAME_TASK[nEventId]	
		elseif nEventId == 5 then
			szActive = GetLastFactionNumber()  < 0  and "red" or "yellow"
			nNum = GetLastFactionNumber()	
			szNameTask = self.TASK_NAME_TASK[nEventId]	
		end			
		if nEventId > 11 then
			for i,v in self.TASK_INFOR_ABOUNT[nEventId] do
				nNum = tbVNG_BitTask_Lib:getBitTask(v)
				--print("--------TASK_INFOR_ABOUNT i:  "..i)					
				szNameTask = self.TASK_NAME_TASK[i]	
				szActive = tbVNG_BitTask_Lib:isMaxBitTaskValue(v) ~= 1 and "red" or "yellow"				
			end		
		end
			--print("--------TASK_INFOR_ABOUNT nNum:  "..nNum)
			--print("--------TASK_INFOR_ABOUNT szNameTask:  "..szNameTask)
			--print("--------TASK_INFOR_ABOUNT szActive:  "..szActive)			
		szMsg = szMsg..format("<color=%s>%s:%d<color>\n",szActive,szNameTask,nNum)	
	end
	return szMsg
end

--K�t th�c m�i nhi�m v�
function tbHuynhdelenhbai:CheckFinishEvent(nEventId)
	--Ki�m tra id ti�u di�t qu�i
	if(self.TASK_ID_MAP and self.TASK_ID_MAP[nEventId]) then
		for _,v in self.TASK_ID_MAP[nEventId] do
			if(tbVNG_BitTask_Lib:isMaxBitTaskValue(v) ~= 1) then
				return 0
			end
		end
	end
	--Ki�m tra id c�c s� ki�n
	if(self.TASK_INFOR_ABOUNT[nEventId]) then
		local tbQuest = self.TASK_INFOR_ABOUNT[nEventId][1]
		if nEventId == 1 then
			if GetCash() < tbQuest.nRequires then
				return 0
			end
		elseif nEventId == 2 then
			local nRand =  random(0,1)
			return nRand
		elseif nEventId == 3 or nEventId == 4 then
			if CalcItemCount(3, tbQuest.tbProp[1], tbQuest.tbProp[2], tbQuest.tbProp[3], -1) < tbQuest.nRequires  then
				return 0
			end		
		elseif nEventId == 5 then
			if GetLastFactionNumber() < 0 then
				return 0
			end
		end
		if nEventId > 11 then
			for _,v in self.TASK_INFOR_ABOUNT[nEventId] do
				if(type(v) == "table" and tbVNG_BitTask_Lib:isMaxBitTaskValue(v) ~= 1) then
					return 0
				end
				if(type(v) == "number" and GetTask(mod(v,1000)) < floor(v/1000)) then
					return 0
				end			
			end		
		end
	end	
	return 1
end

--Hi�n th� c�c d�ng ch�n gamer c� th� nh�n
function tbHuynhdelenhbai:onDialogNpcGiveTask()
	local szMsg = "Huynh �� T��ng Ph�ng l�nh b�i gi�p c�c ��i hi�p nhanh ch�ng tr� th�nh cao th� �� b�n t�u giang h� ! \nPh�n th��ng khi ho�n th�nh nhi�m v�:\n"
	local tbOpt = {}
	local nEventId = self:GetEventIdInfo(4)
	if(nEventId) then
		local tbAward = self:GetAwardInfo(nEventId)
		szMsg = szMsg..format("<color=yellow>%s:\n<color>",tbAward[1].szDlg)
		tinsert(tbOpt, {format("%s",tbAward[1].szSelect), self.onSelectOptGiveTask, {self,nEventId}})	
	else
		szMsg = szMsg.."<color=red>Hi�n t�i kh�ng c� nhi�m v� �� nh�n, h�y luy�n t�p th�m<color>"		
	end
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szMsg, tbOpt)
end

function tbHuynhdelenhbai:onSelectOptGiveTask(nEventId)
	local tbAward = self:GetAwardInfo(nEventId)
	if(not tbAward) then
		return 0
	end
	local tbBitTSK = {nTaskID = tbAward[1].nTaskIDStart, nStartBit = tbAward[1].nBitStart, nBitCount = 2, nMaxValue = 3}
	tbVNG_BitTask_Lib:addTask(tbBitTSK,1)
	tbVNG_BitTask_Lib:addTask(self.TASK_INFOR_HD_LB,nEventId -  tbVNG_BitTask_Lib:getBitTask(self.TASK_INFOR_HD_LB))
	Msg2Player("Ch�c m�ng ��i hi�p nh�n ���c "..tbAward[1].szSelect)
	tbLog:PlayerActionLog(self.EVENT_LOG_TITLE,"NhanNhiemVu","["..tbAward[1].szSelect.."]")
end

--Hi�n th� c�c d�ng ch�n game �� nh�n
function tbHuynhdelenhbai:onDialogNpcGiveAward()
	local szMsg = "Ho�n th�nh nhi�m v� c� th� nh�n th��ng:\n"
	local tbOpt = {}
	local nEventId = self:GetEventIdInfo(1)
	if(nEventId) then
		local tbAward = self:GetAwardInfo(nEventId)
		szMsg = szMsg..format("<color=yellow>%s\n<color>",tbAward[1].szDlg)
		szMsg = szMsg.."\n"..tbHuynhdelenhbai:GiveNameTaskEvent(nEventId)
		tinsert(tbOpt, {format("Ho�n th�nh %s",tbAward[1].szSelect), self.onSelectOptGiveAward, {self,nEventId}})
	else
		szMsg = szMsg.."<color=red>Hi�n t�i kh�ng c� nhi�m v� �� ho�n th�nh<color>"	
	end
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szMsg, tbOpt)
end

--Ph�n th��ng h� tr� t�n th�
function tbHuynhdelenhbai:onSelectOptGiveAward(nEventId)	
	local tbAward = self:GetAwardInfo(nEventId)
	if(not tbAward) then
		return 0
	end
	if(self:CheckFinishEvent(nEventId) ~= 1) then
		Msg2Player("��i hi�p ch�a ho�n th�nh nhi�m v�, kh�ng th� nh�n th��ng")
		return 0
	end
	if PlayerFunLib:CheckFreeBagCellWH(2,10,1,"default") ~= 1 then
		return
	end
	if VngPlayerFunLib:VnCheckInCity("Ho�n th�nh nhi�m v�, h�y quay v� Th�nh th� ho�c th�n trang �� nh�n th��ng.") ~= 1 then		
		return 0
	end
	--qu� level nhi�m v� kh�ng th� nh�n th��ng
	local nPlayerLevel = GetLevel()
	if(nPlayerLevel < tbAward[1].nMinLevel or nPlayerLevel > tbAward[1].nMaxLevel) then
		Talk(1,"","��i hi�p �� v��t qu� level nh�n th��ng c�a nhi�m v� n�y, h�y h�y v� nh�n nhi�m v� m�i.")
		return 0
	end
	
	local tbBitTSK = {nTaskID = tbAward[1].nTaskIDStart, nStartBit = tbAward[1].nBitStart, nBitCount = 2, nMaxValue = 3}
	tbVNG_BitTask_Lib:addTask(tbBitTSK,1)
	SetTask(self.TASK_ID_RESET_01,0)
	SetTask(self.TASK_ID_RESET_02,0)
	tbAwardTemplet:Give(self.tbAward_List[nEventId],1,{self.EVENT_LOG_TITLE,"Phanthuonghoanthanhnhiemvu_"..nEventId})
	tbLog:PlayerActionLog(self.EVENT_LOG_TITLE,"HoanThanhNhiemVu","["..tbAward[1].szSelect.."]")
end

function tbHuynhdelenhbai:LoadFile()
	self.nMaxEventId = 0
	tbHuynhdelenhbai.tbAllAwards = {}
	if TabFile_Load(self.szPathFile, self.szPathFile) == 0 then
		return 0
	end
	local nCount = TabFile_GetRowCount(self.szPathFile)
	for i = 2, nCount do
		local tbItem = {}
		local nEventId	= tonumber(TabFile_GetCell(self.szPathFile, i, "nEventId")) or 0
		tbItem.nEventId	= nEventId
		tbItem.nMinLevel	= tonumber(TabFile_GetCell(self.szPathFile, i, "nMinLevel")) or 0
		tbItem.nMaxLevel	= tonumber(TabFile_GetCell(self.szPathFile, i, "nMaxLevel")) or 0
		tbItem.nTransLife	= tonumber(TabFile_GetCell(self.szPathFile, i, "nTranslife")) or 0
		tbItem.szMapList	= TabFile_GetCell(self.szPathFile, i, "szMapList") or ""
		tbItem.szSelect	= TabFile_GetCell(self.szPathFile, i, "szSelect") or ""
		tbItem.szDlg	= TabFile_GetCell(self.szPathFile, i, "szDlg") or ""
		tbItem.nTaskIDStart	= tonumber(TabFile_GetCell(self.szPathFile, i, "nTaskIDStart")) or 0
		tbItem.nBitStart	= tonumber(TabFile_GetCell(self.szPathFile, i, "nBitStart")) or 0
		self.nMaxEventId = (self.nMaxEventId >nEventId) and self.nMaxEventId or nEventId
		self.tbAllAwards[nEventId] = self.tbAllAwards[nEventId] or {}
		tinsert(self.tbAllAwards[nEventId],tbItem)
	end
end

--Kh�i t�o nhi�m v� Huynh �� T��ng Ph�ng l�nh b�i -- Thanhld 20150506
tbHuynhdelenhbai:LoadFile();