Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")

Include("\\vng_script\\features\\quest_daily\\quest_daily_def.lua")
Include("\\vng_script\\features\\quest_daily\\lang.lua")

Include("\\script\\vng_lib\\bittask_lib.lua")


tbQuestDaily = tbQuestDaily or {}

--Nh�n nhi�m v�
function tbQuestDaily:GetQuestDaily()
	local nLevel = GetLevel()
	if nLevel < 100 then
		return Talk(1,"","��ng c�p 100 tr� l�n m�i nh�n ���c nhi�m v�, h�y c� g�ng luy�n t�p th�m.")
	end
	local nCheckPoint, nTotalQ = tbQuestDaily:CheckQuestPoint()	
	if nCheckPoint > 0 then
		return Talk(1,"",format("H�y nh�n <color=yellow>ph�n th��ng m�c %d<color> tr��c r�i l�m nhi�m v� ti�p.",self.TB_GET_POINT[nCheckPoint]))
	end
	
	local nCurCount, nMaxCount= self:CountTodayQuest()
	local nTotalQuest = tbVNG_BitTask_Lib:getBitTask(self.TASK_ID_TOTAL_QUEST) 
	local szMsg = format("T�ng s� nhi�m v� �� ho�n th�nh: <color=yellow>%d<color> l�n.\n\n",nTotalQuest)
	szMsg = szMsg..format("S� nhi�m v� h�m nay �� nh�n: <color=yellow>%d / %d<color> l�n.\n",nCurCount,nMaxCount)
	local tbOpt = {}
	if nCurCount >= nMaxCount then
		szMsg = "�� ho�n th�nh t�i �a nhi�m v� c� th� nh�n"
		 Talk(1,"",szMsg)
		 return
	end
	local nQuestID  = self:RandomQuest()
	self:OnSelectQuest(nQuestID,0)
	--local nQuestID = self:GetQuestIdInfo(self.NOT_RECIEVED_Q)
	if(nQuestID) then
		local tbQuest = self:GetQuestInfo(nQuestID)
		szMsg = szMsg..tbQuest.szDlg
		tinsert(tbOpt, {format("Bi�t r�i, ta �i l�m ngay"), self.OnSelectQuest, {self,nQuestID, 1}})	
		tinsert(tbOpt, {format("Nhi�m v� kh� qu� kh�ng nh�n"), self.CancelQuest, {self,nQuestID}})
	else		
		szMsg = szMsg..format("<color=red>H�m nay �� ho�n th�nh h�t %d nhi�m v� r�i, mai h�y ti�p t�c.<color>",nMaxCount)
	end
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szMsg, tbOpt)
end

--kiem trang trang thai nhiem vu
function tbQuestDaily:CheckStateQuest()		
	local nState = tbVNG_BitTask_Lib:getBitTask(self.TASK_INFO_QUEST)
	local nQuestID = tbVNG_BitTask_Lib:getBitTask(self.TASK_CUR_ID_QUEST)
	return nQuestID, nState 
end
--Kiem tra so lan hoan thanh nhiem vu trong ngay
function tbQuestDaily:CountTodayQuest()
	local nCurCount = tbVNG_BitTask_Lib:getBitTask(self.TASK_COUNT_DAILY_QUEST)
	local nMore = tbVNG_BitTask_Lib:getBitTask(self.TASK_MORE_QUEST)
	local nMaxCount = self.MAXCOUNT
	if nMore >= 1 and nMore <= 2 then
		nMaxCount = nMaxCount + self.MOREQUEST*nMore	
	end
	return nCurCount, nMaxCount
end
--Randoom QuestID
function tbQuestDaily:RandomQuest()
	local nCurCount, nMaxCount= self:CountTodayQuest()
	if nCurCount >= nMaxCount then
		return nil
	end
 	local nRanVar =random(10000)
	local num = 0
	local row = 0
	for row=1,getn(self.tbAllQuestInfo) do
		num = num + self.tbAllQuestInfo[row][1].nRate*100
		if nRanVar <= num then
			return row
		end
	end
 end
 
 --set task nhiem vu
 --nType: 0: settask, 1: thong bao
 function tbQuestDaily:OnSelectQuest(nQuestID, nType) 	
	local tbQuest = self:GetQuestInfo(nQuestID)
	if(not tbQuest) then
		return 0
	end	
	if nType == 1 then
		Msg2Player("Ti�p nh�n nhi�m v� th�nh c�ng.")
		Talk(1,"",MSG_RECV_QUEST..tbQuest.szDlg)
		return
	end
	tbVNG_BitTask_Lib:setBitTask( self.TASK_CUR_ID_QUEST,nQuestID)
	tbVNG_BitTask_Lib:setBitTask(self.TASK_INFO_QUEST,self.RECIEVED_Q)	
	tbVNG_BitTask_Lib:addTask(self.TASK_COUNT_DAILY_QUEST,1)	
	tbLog:PlayerActionLog(self.EVENT_LOG_TITLE,"NhanNhiemVu_ID: ","[nQuestID]")

end

--Hoan thanh nhiem vu
function tbQuestDaily:CompleteQuest(nQuestID)	
	local nCurQuestID, nStateQ =  self:CheckStateQuest()
	if not nQuestID or nCurQuestID ~= nQuestID  then
		return
	end	
	--IDQuest  1-18: kill npc, >18 find item
	if 	nQuestID >= self.TB_TYPE_ID_KILL_NPC[1] and nQuestID <= self.TB_TYPE_ID_KILL_NPC[2] then
		local nCheckFinish = self:CheckFinishQuest(nQuestID)
		if nCheckFinish ~= 1 then
			return Talk(1,"",MSG_NOTFINISH)
		end
		self:GiveAwardQuest(nQuestID)
	elseif nQuestID >= self.TB_TYPE_FIND_ITEM[1] and nQuestID <= self.TB_TYPE_FIND_ITEM[2] then
		local tbQuest = self:GetQuestInfo(nQuestID)		
		local strDesc = "H�y b� duy nh�t 1 v�t ph�m nhi�m v� c�n v�o."
		g_GiveItemUI("��ng �", strDesc, {self.CompleteQuest_Item, {self,nQuestID}}, nil, 1)
	else
		return Talk(1,"","Kh�ng t�m th�y nhi�m v� ng��i �� nh�n, xin ki�m tra l�i.")
	end		
end

function tbQuestDaily:CompleteQuest_Item(nQuestID, nCount)	
	if nCount > 1 then
		return Talk(1,"",MSG_ONE_ITEM)
	end
	local nItemIdx = GetGiveItemUnit(nCount)
	
	local nQuality = GetItemQuality(nItemIdx)
	local nGoldeEquipIdx = GetGlodEqIndex(nItemIdx)	
	--trang bi ton hai
	if (nG == 7) then 
		Talk(1,"","Trang b� t�n h�i kh�ng th� d�ng �� tr� nhi�m v� D� t�u.")
		return
	end
	if (nGoldeEquipIdx > 0) or (nQuality == 1) then 
		Talk(1,"","Trang b� Ho�ng kim kh�ng th� d�ng �� tr� nhi�m v� D� t�u.")
		return
	end
	--kiem tra dk khoa, co thoi han su dung
	if  ITEM_GetExpiredTime(nItemIdx) > 0 or GetItemBindState(nItemIdx) ~= 0 then
		Talk(1,"","Trang b� c� th�i h�n s� d�ng ho�c kh�a v�nh vi�n kh�ng th� d�ng �� tr� nhi�m v� D� t�u.")
		return
	end
	
	local nCheckFinish = 0
	for i=1,6 do		
		local nMagicID, nPoint = GetItemMagicAttrib(nItemIdx,i)		
		nCheckFinish = self:CheckFinishQuest(nQuestID,nMagicID,nPoint)	
		if nCheckFinish == 1 then
			break
		end	
	end
	if nCheckFinish ~= 1 then
		return Talk(1,"",MSG_NOTFINISH)
	end
	RemoveItemByIndex(nItemIdx)
	self:GiveAwardQuest(nQuestID)
end

--Kiem tra hoan thanh nhiem vu
function tbQuestDaily:CheckFinishQuest(nQuestID,nMagicID,nPoint)
	--trang th�i s� d�ng item ho�n th�nh nhi�m v�: state: 2 : �� ho�n th�nh nhi�m v� nh�ng ch�a nh�n th��ng
	local nCurQuestID, nStateQ =  self:CheckStateQuest()
	print("tbQuestDaily:CheckFinishQuest: nStateQ :"..nStateQ)
	if nCurQuestID == nQuestID and nStateQ == 2 then
		return 1
	end	
	--Ki�m tra id ti�u di�t qu�i
	if not nMagicID and not nPoint  then
		if(tbVNG_BitTask_Lib:isMaxBitTaskValue(self.TASK_ID_MAP_KILL_NPC) ~= 1) then
				return 0
		else
				return 1
		end
	else --kiem tra item
		local tbQuestInfo = self:GetQuestInfo(nQuestID)		
		if tbQuestInfo.nMagicID == nMagicID and nPoint >= tbQuestInfo.nPoint then	
			return 1			
		else		
			return 0			
		end
	end
end

--Hoan thanh nhiem vu nhan thuong
function tbQuestDaily:GiveAwardQuest(nQuestID)	
	self:ResetTaskWhenFinishQuest(nQuestID)
	local nExp = self:GetAwardExp()
	
	--tang tong so nhiem vu len
	tbVNG_BitTask_Lib:addTask(self.TASK_ID_TOTAL_QUEST,1)
	local nTotalQuest = tbVNG_BitTask_Lib:getBitTask(self.TASK_ID_TOTAL_QUEST) 	
	--trao thuong
	Msg2Player(format("<color=yellow>%s<color>",MSG_COMPLETE_Q))
	PlayerFunLib:AddExp(nExp,0,EVENT_LOG_TITLE,"HoanThanh_NhanExp")
	tbAwardTemplet:Give(self.tbAwardQuest_Item,1,{EVENT_LOG_TITLE,"HoanThanh_NhiemVuThu-"..nTotalQuest})
	
	G_ACTIVITY:OnMessage("HoanThanhDaTau")
end

--tinh phan thuong exp:
function tbQuestDaily:GetAwardExp()	
	local nCountQuest = tbVNG_BitTask_Lib:getBitTask(self.TASK_COUNT_DAILY_QUEST)
	--TH ngo�i 40 nhi�m v� 1 ng�y
	if nCountQuest < 0 or nCountQuest > 40 then
		WriteLog(EVENT_LOG_TITLE,"Loi so nhiem vu khong hop ly: "..nCountQuest)
		return
	end	
	--Th nh�n nhi�m v� h�m tr��c, qua h�m sau ho�n th�nh
	if nCountQuest  == 0 then
		nCountQuest = 1
	end
	local nFactor = mod(nCountQuest,10)
	local nLevel = GetLevel()
	--
	if nFactor == 0 and floor(nCountQuest/10) ~= 0 then 
		nFactor = 10 
	end
	local nExp = nFactor*(700 + nLevel*800)
	return nExp
end
--reset task finish Quest
function tbQuestDaily:ResetTaskWhenFinishQuest(nQuestID)	
	if nQuestID > self.TB_TYPE_ID_KILL_NPC[1] and nQuestID <= self.TB_TYPE_ID_KILL_NPC[2] then
		tbVNG_BitTask_Lib:setBitTask(self.TASK_ID_MAP_KILL_NPC,0)
	end
	 tbVNG_BitTask_Lib:setBitTask(self.TASK_INFO_QUEST,0)
	 tbVNG_BitTask_Lib:setBitTask(self.TASK_CUR_ID_QUEST,0)	
end
--reset task daily
function tbQuestDaily:ResetDailyTaskQuest()
	 if (tbVNG_BitTask_Lib:setBitTask(self.TASK_MORE_QUEST,0) ~= 1) or (tbVNG_BitTask_Lib:setBitTask(self.TASK_COUNT_DAILY_QUEST,0) ~= 1) then
	 	local nMoreQValue = tbVNG_BitTask_Lib:getBitTask(self.TASK_MORE_QUEST)
	 	local nCountDailyQ = tbVNG_BitTask_Lib:getBitTask(self.TASK_COUNT_DAILY_QUEST)
	 	tbLog:PlayerActionLog(self.EVENT_LOG_TITLE, "ResetDailyTaskQuest FAIL - CurMoreQValue:"..nMoreQValue.." - CurCountDailyQ:"..nCountDailyQ)
	 end	 
end

--Huy Nhiem vu
function tbQuestDaily:CancelQuest()
	local nQuestID,_ = self:CheckStateQuest()
	local tbQuest = self:GetQuestInfo(nQuestID)
	local szMsg = tbQuest.szDlg
	if not nQuestID or nQuestID < 1  then
		return Talk(1,"",MSG_NOTQUEST)
	end	
	self:ResetTaskWhenFinishQuest(nQuestID)
	Msg2Player("H�y nhi�m v� th�nh c�ng.")
	Talk(1,"",MSG_CANCEL_QUEST..szMsg)
end

--Nhan thuong moc nhiem vu
function tbQuestDaily:GetAwardQuestPoint()
	local nCheckPoint, nTotalQ = self:CheckQuestPoint()
	if nCheckPoint == 9 or nCheckPoint == 11 then
		if PlayerFunLib:CheckFreeBagCellWH(2, 3, 1, "default") ~= 1  then
			return
		end
	end
	if nCheckPoint > 0 then
		tbVNG_BitTask_Lib:setBitTask(self.TASK_ID_GET_AWARD_POINT, nCheckPoint)
		tbAwardTemplet:Give(self.tbAwardQuestLimitPoint[nCheckPoint],1,{EVENT_LOG_TITLE,"NhanPhanthuongMoc_"..self.TB_GET_POINT[nCheckPoint]})
	end
	--hoan thanh 5000 nhiem vu, reset ve 0
	if nCheckPoint >= getn(self.TB_GET_POINT) then
		tbVNG_BitTask_Lib:setBitTask(self.TASK_ID_TOTAL_QUEST, 0)
		tbVNG_BitTask_Lib:setBitTask(self.TASK_ID_GET_AWARD_POINT,0)
		Msg2Player(format("<color=yellow>Ch�c m�ng c�c h�! chu�i nhi�m v� ���c t�o m�i, h�y ti�p t�c ho�n th�nh!<color>"))
	end
end

--Tra ve so thu thu nhan moc, va tong so nhiem vu da lam
function tbQuestDaily:CheckQuestPoint()
	local nTotalQ = tbVNG_BitTask_Lib:getBitTask(self.TASK_ID_TOTAL_QUEST)	
	local nCheckRecv = tbVNG_BitTask_Lib:getBitTask(self.TASK_ID_GET_AWARD_POINT) --kiem tra moc tiep theo co du dk nhan thuong ko
	local nPoint = 0
	for i=1, getn(self.TB_GET_POINT) do
		if floor(nTotalQ/self.TB_GET_POINT[i]) >= 1 and nCheckRecv < i then
			nPoint = i	
			break		 
		end
	end
	return nPoint, nTotalQ
end

--Thong tin nhiem vu
function tbQuestDaily:GetQuestInfo(nQuestID)
	local tbQuestInfo = self.tbAllQuestInfo[nQuestID][1]
	if not nQuestID or not tbQuestInfo then
		return
	end
	return tbQuestInfo
end

--xem tinh hinh nhiem vu
function tbQuestDaily:ShowAllInfoQuest()
	local nQuestID, nStateQ =  tbQuestDaily:CheckStateQuest()
	local nCheckPoint, nTotalTodayQ = tbQuestDaily:CheckQuestPoint()
	local nCurCount, nMaxCount= self:CountTodayQuest()
	local nTotalQuest = tbVNG_BitTask_Lib:getBitTask(self.TASK_ID_TOTAL_QUEST) 
	
	local szMsg = format("T�ng s� nhi�m v� �� ho�n th�nh: <color=yellow>%d<color> l�n.\n\n",nTotalQuest)	
	szMsg = szMsg..format("S� nhi�m v� h�m nay �� nh�n: <color=yellow>%d / %d<color> l�n.\n",nCurCount,nMaxCount)
	
	local tbOpt = {}		
	if nQuestID > 0 then
		local tbQuest = self:GetQuestInfo(nQuestID)
		szMsg = szMsg..format("Nhi�m v� hi�n t�i: %s\n",tbQuest.szDlg)
	else
		szMsg = szMsg..format("Hi�n t�i kh�ng c� nhi�m v� n�o.\n")
	end
	tinsert(tbOpt, {"Ta bi�t r�i."})
	CreateNewSayEx(szMsg, tbOpt)
end

--Load du lieu quest
function tbQuestDaily:LoadFile()	
	self.tbAllQuestInfo = {}
	if TabFile_Load(self.szPathFile, self.szPathFile) == 0 then
		return 0
	end
	local nCount = TabFile_GetRowCount(self.szPathFile)	
	for i = 2, nCount do
		local tbTemp = {}
		local nQuestID	= tonumber(TabFile_GetCell(self.szPathFile, i, "nQuestID")) or 0
		tbTemp.nQuestID	= nQuestID
		tbTemp.nMagicID	= tonumber(TabFile_GetCell(self.szPathFile, i, "nMagicID")) or 0
		tbTemp.nPoint	= tonumber(TabFile_GetCell(self.szPathFile, i, "nPoint")) or 0		
		tbTemp.szMapList	= tonumber(TabFile_GetCell(self.szPathFile, i, "szMapList")) or 0
		tbTemp.nNpcID	= tonumber(TabFile_GetCell(self.szPathFile, i, "nNpcID")) or 0
		tbTemp.nRate	= tonumber(TabFile_GetCell(self.szPathFile, i, "nRate")) or 0		
		tbTemp.szDlg	= TabFile_GetCell(self.szPathFile, i, "szDlg") or ""		
		self.tbAllQuestInfo[nQuestID] = self.tbAllQuestInfo[nQuestID] or {}
		tinsert(self.tbAllQuestInfo[nQuestID],tbTemp)
	end
	
end
--Load file nhiem vu hang ngay -- Thanhld 20151101
tbQuestDaily:LoadFile()