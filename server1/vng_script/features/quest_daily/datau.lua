Include("\\script\\activitysys\\npcdailog.lua")
Include("\\vng_script\\features\\quest_daily\\mainfuc.lua")
Include("\\vng_script\\vng_lib\\reset_daily_task.lua")

tbQuestDaily = tbQuestDaily or {}

function main(nItemIdx)	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)	
	--kiem tra reset daily
	tbCheckTaskDaily2ReSet:OnLogin()
	
	local nQuestID, nStateQ =  tbQuestDaily:CheckStateQuest()
	local nCheckPoint, nTotalQ = tbQuestDaily:CheckQuestPoint()	
	local nCurCount, nMaxCount= tbQuestDaily:CountTodayQuest()
	
	tbDailog.szTitleMsg =  format("<npc>Chu�i nhi�m v� <color=yellow>D� T�u<color>  nhanh ch�ng gi�p c�c nh�n s� tr� th�nh cao th� �� b�n t�u giang h�!\n S� nhi�m v� h�m nay �� nh�n: <color=yellow>%d/%d<color>.\n\n",nCurCount,nMaxCount)
	if nStateQ == 0 and nQuestID == 0 then
		tbDailog:AddOptEntry("Nh�n nhi�m v�", tbQuestDaily.GetQuestDaily, {tbQuestDaily} )
	elseif nStateQ == 1 then
		local tbQuestInfo = tbQuestDaily:GetQuestInfo(nQuestID)		
		tbDailog.szTitleMsg = tbDailog.szTitleMsg..format("Nhi�m v� hi�n t�i: %s",tbQuestInfo.szDlg)
		tbDailog:AddOptEntry("Ho�n th�nh nhi�m v�", tbQuestDaily.CompleteQuest, {tbQuestDaily, nQuestID} )
		tbDailog:AddOptEntry("H�y nhi�m v�", tbQuestDaily.CancelQuest, {tbQuestDaily, nQuestID} )
	elseif  nStateQ == 2 then
		tbDailog:AddOptEntry("Ho�n th�nh nhi�m v�", tbQuestDaily.GiveAwardQuest, {tbQuestDaily, nQuestID} ) 
	end
	if nCheckPoint > 0 then
		tbDailog:AddOptEntry(format("Nh�n th��ng m�c %d nhi�m v�",tbQuestDaily.TB_GET_POINT[nCheckPoint]), tbQuestDaily.GetAwardQuestPoint, {tbQuestDaily} )
	else
		tbDailog:AddOptEntry("Xem t�nh h�nh chu�i nhi�m v�", tbQuestDaily.ShowAllInfoQuest, {tbQuestDaily} )
	end
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tbDailog:Show()	
end
