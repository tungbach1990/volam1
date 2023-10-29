Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

Include("\\vng_script\\features\\nhiemvu_rua_pk\\head.lua")

function tbVngRuaPK:main()	
	local OldPlayerIdx = PlayerIndex
	DynamicExecuteByPlayer(PlayerIndex, "\\vng_script\\vng_lib\\reset_daily_task.lua", "tbCheckTaskDaily2ReSet:OnLogin", 0)
	PlayerIndex = OldPlayerIdx
	local szMsg = format("<npc>\n<color=yellow>Nh�n ng��i ��ng ��ng s�t kh� t�m ta c� vi�c g�?.<color>\n\n")
	if tbVNG_BitTask_Lib:getBitTask(self.BITTASK_QUEST_ID) > 0 then
		local nID = tbVNG_BitTask_Lib:getBitTask(self.BITTASK_QUEST_ID)
		szMsg = szMsg..format("Hi�n t�i ng��i �ang nh�n nhi�m v� t�m 1 c�i: <color=yellow>%s<color> v� ��y cho ta.",tbVngRuaPK.tbItemQuest[nID].szName)
	end
	local tbOpt = {}	
	tinsert(tbOpt, {format("Nh�n nhi�m v� gi�m pk"), self.AddQuestPK, {self}})
	tinsert(tbOpt, {format("Tr� nhi�m v�"), self.Complete_QuestPK_UI, {self}})	
	tinsert(tbOpt, {format("H�y nhi�m v�"), self.Cancel_QuestPK, {self}})	
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szMsg, tbOpt)
end
--nhan nhiem vu
function tbVngRuaPK:AddQuestPK()	
	if GetLevel() < 50 then 
		Talk(1,"","Ch� m�i ra giang h�  �� t�p th�i s�t nh�n. Ta s� �i b�o quan ngay l�p t�c.")
		return
	end
	if GetPK() <= 0  then
		Talk(1,"","Ng��i l� ng��i t�t, kh�ng c�n ph�i g�p ta. C� th� m� ph�t huy.")
		return
	end
	local nCurTime = GetCurServerTime()
	local nLastTime = GetTask(self.TASK_TIME)
	if (nCurTime - nLastTime) <  self.WAIT_TIME then
		local nWaitM = (floor((self.WAIT_TIME -(nCurTime - nLastTime))/60))
		local nWaitS = mod(self.WAIT_TIME -(nCurTime - nLastTime),60)		
		Talk(1,"",format("Sau khi h�y 15 ph�t ng��i m�i c� th� nh�n nhi�m v� ti�p ���c. C�n ph�i ��i <color=yellow>%dph:%ds<color> n�a",nWaitM,nWaitS))
		return
	end		
	if  tbVNG_BitTask_Lib:getBitTask(self.BITTASK_NUM_QUEST) >= 20 then
		Talk(1,"","M�i ng�y ng��i ch� nh�n ���c 20 nhi�m v�. H�m n�y �� nh�n r�i.")
		return
	end	
	if  tbVNG_BitTask_Lib:getBitTask(self.BITTASK_QUEST_ID) > 0 then
		Talk(1,"","Ch�ng ph�i ng��i �ang c� nhi�m v� r�i �� sao.")
		return
	end
	local nQuestID = random(1,20)
	local tbQuestInfo = self.tbItemQuest[nQuestID]
	local szQuestName = tbQuestInfo.szName	
	tbVNG_BitTask_Lib:setBitTask(self.BITTASK_QUEST_ID, nQuestID)
	tbVNG_BitTask_Lib:addTask(self.BITTASK_NUM_QUEST, 1)
	Talk(1,"",format("Nh�n ���c nhi�m v� �i t�m 1 c�i: <color=yellow>%s<color> v� ��y cho ta.",szQuestName))
	return
end
--Hoan thanh nhiem vu
function tbVngRuaPK:Complete_QuestPK_UI()
	local nQuestID = tbVNG_BitTask_Lib:getBitTask(self.BITTASK_QUEST_ID)
	if not nQuestID or nQuestID <= 0 then
		Talk(1,"",format("Hi�n t�i ng��i kh�ng c� nhi�m v�."))
		return
	end	
	local strDesc = "V�t ph�m ta y�u c�u, ng��i �� ki�m ���c ch�a? ��u ��a ta xem."	
	g_GiveItemUI("N�p v�t ph�m", strDesc, {self.Complete_QuestPK, {self}}, nil, 1)
end
function tbVngRuaPK:Complete_QuestPK(nCount)
	if (nCount ~= 1) then 
		Talk(1, "", "M�i l�n ch� c� th� b� v�o ���c m�t v�t ph�m!!!")
		return
	end
	local nQuestID = tbVNG_BitTask_Lib:getBitTask(self.BITTASK_QUEST_ID)
	if not nQuestID or nQuestID <= 0 then
		Talk(1,"",format("Hi�n t�i ng��i kh�ng c� nhi�m v�."))
		return
	end
	
	local tbQuestInfo = self.tbItemQuest[nQuestID]
	local nItemIndex = GetGiveItemUnit(nCount)	
	local tbProp = self:Pack(GetItemProp(nItemIndex))
	local tbPropNeed = tbQuestInfo.tbProp
	if self:Check_ItemComplete_QuestPK(tbProp,tbPropNeed) ~= 1 then		
		return Talk(1,"",format("V�t ph�m ng��i b� v�o kh�ng ��ng y�u c�u, khi n�o t�m ���c r�i quay l�i."))
	end
	local CurPKval = GetPK()
	if CurPKval > 0 then
		tbVNG_BitTask_Lib:setBitTask(self.BITTASK_QUEST_ID, 0)	 		
		SetTask(self.TASK_TIME,0)
		RemoveItemByIndex(nItemIndex)
		SetPK(CurPKval-1)
		Msg2Player("Ho�n th�nh nhi�m v� v� gi�m ���c 1�i�m pk.")
		return Talk(1,"",format("Ho�n th�nh nhi�m v� v� gi�m ���c 1 �i�m pk."))
	end	
end
function tbVngRuaPK:Check_ItemComplete_QuestPK(tbPropHave,tbPropNeed)
	local nCheck = 1
	for i=1, 4 do		
		if tbPropHave[i] ~= tbPropNeed[i] then
			nCheck = 0
			break
		end	
	end
	return nCheck
end
--Huy nhiem vu
function tbVngRuaPK:Cancel_QuestPK()
	local nQuestID = tbVNG_BitTask_Lib:getBitTask(self.BITTASK_QUEST_ID)
	if not nQuestID or nQuestID <= 0 then
		Talk(1,"",format("Hi�n t�i ng��i kh�ng c� nhi�m v�."))
		return
	end
	tbVNG_BitTask_Lib:setBitTask(self.BITTASK_QUEST_ID, 0)	 
	 local nCurTime = GetCurServerTime()
	SetTask(self.TASK_TIME,nCurTime)
	Msg2Player("Ng��i �� h�y nhi�m v� l�n n�y, 15 ph�t sau m�i nh�n l�i ���c ti�p.")
end

function tbVngRuaPK:Pack(...)
	return arg
end
EventSys:GetType("AddNpcOption"):Reg("T�nh T�m ��i S�","Nhi�m v� gi�m PK", tbVngRuaPK.main,{tbVngRuaPK})


