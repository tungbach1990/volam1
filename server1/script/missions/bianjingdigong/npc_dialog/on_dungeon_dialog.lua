--======================================================================
--Author:   Tan Qingyu
--Date:     2012-3-31 11:01:04
--Describe: �꾩�ع� ���NPC�Ի��ű�
--======================================================================

Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\bianjingdigong\\bianjingdigong_head.lua")

function main()
	local nNpcIndex = GetLastDlgNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDialog = DailogClass:new(szNpcName)
	tbDialog.szTitleMsg = "<npc>Ta ��y c� th� gi�p ng��i truy�n t�ng ��n 4 tr�n ��"
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDialog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDialog, nNpcIndex)
	tbDialog:AddOptEntry("Truy�n t�ng ��n tr�n ph�p kh�c", SendMeToAnotherPosDlg)
	tbDialog:AddOptEntry("Ra kh�i ��a Cung", SendMeOut)
	tbDialog:AddOptEntry("Ki�m tra th�i gian c�n l�i", QueryLeftTime)
	tbDialog:Show()
end

function CalTwoPointDistance(tbPos1, tbPos2)
	local nMapId1, nPosX1, nPosY1 = unpack(tbPos1)
	local nMapId2, nPosX2, nPosY2 = unpack(tbPos2)
	
	if nMapId1 ~= nMapId2 then
		return nil
	else
		return sqrt((nPosX1 - nPosX2) ^ 2 + (nPosY1 - nPosY2) ^ 2)
	end
end

function SendMeToAnotherPosDlg()
	local nNpcIndex = GetLastDlgNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDialog = DailogClass:new(szNpcName)
	tbDialog.szTitleMsg = "<npc>Xin h�y l�a ch�n �i�m truy�n t�ng"
	G_ACTIVITY:OnMessage("ClickNpc", tbDialog, nNpcIndex)
	
	local nMapXEx, nMapYEx, nSubWorldIdx = GetNpcPos(nNpcIndex)
	local tbNpcPos = {SubWorldIdx2ID(nSubWorldIdx), nMapXEx / 32, nMapYEx / 32}
	
	local szMinDistanceKey = "Thanh Long Tr�n"
	local nMinDistance = -1
	for k, v in BJDG_HEAD.tbPos do
		local nDis = CalTwoPointDistance(tbNpcPos, v)
		if nDis < nMinDistance or nMinDistance == -1 then
			nMinDistance = nDis
			szMinDistanceKey = k
		end
	end
	
	for k, v in BJDG_HEAD.tbPos do
		if k ~= szMinDistanceKey then
			tinsert(tbDialog, {k, SendMeTo, {k}})
		end
	end
	
	tinsert(tbDialog, {"K�t th�c ��i tho�i"})
	CreateNewSayEx(tbDialog.szTitleMsg, tbDialog)
end

function SendMeTo(szPos)
	NewWorld(unpack(BJDG_HEAD.tbPos[szPos]))
end

function SendMeOut()
	NewWorld(unpack(BJDG_HEAD.tbLeaveTargetPos))
end

function QueryLeftTime()
	local nLeftTime = BJDG_HEAD.nDailyLimitTime - GetTask(BJDG_HEAD.nInDungeonTimeTaskId)
	if nLeftTime <= 0 then
		nLeftTime = 0
	end
	local nLeftHours = floor(nLeftTime / 3600);
	local nLeftMinutes = floor(mod(nLeftTime, 3600) / 60);
	local nLeftSeconds = mod(nLeftTime, 60);
	
	Talk(1, "", format("H�m nay c�c h� c�n c� th� l�u l�i trong ��a Cung [%02d:%02d:%02d]", nLeftHours, nLeftMinutes, nLeftSeconds))
end
