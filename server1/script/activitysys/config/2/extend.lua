

Include("\\script\\activitysys\\config\\2\\head.lua")
Include("\\script\\activitysys\\config\\2\\variables.lua")
Include("\\script\\activitysys\\config\\2\\tree_pos.lua")
Include("\\script\\activitysys\\config\\2\\fairy_pos.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\missions\\elanggu\\elangguworld.lua")
Include("\\script\\activitysys\\config\\2\\award.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\\dailogsys\\\dailogsay.lua")


pActivity.nPak = curpack()
pActivity.nRefreshTreeStartTime = 1900
pActivity.nRefreshTreeEndTime = 2400
pActivity.nRefreshCount = 60

FairyNpcID = 1327
TreeNpcID = 1499
nFariySurvivalCount = 30
szSantaName = "�ng Gi� Noel"
szSantaId = 644
tbSantaPos = 
{
	{80,1774,3034},
	{176,1449,3263},
	{78,1546,3181},
	{37,1724,3102},
	{11,3134,5058},
	{162,1580,3163},
	{1,1594,3108},
}	
tbFairyInfo = {}

pActivity.tbCampName = {
	[1] = "Doanh tr�i phe T�m",
	[2] = "Doanh tr�i phe V�ng",
}
pActivity.tbSnowmanId = {
	[1] = {1330, 1131},
	[2] = {1329, 1880},
}
pActivity.tbTransPos = {
	{1714, 3500},
	{2018, 3292},
	{1911, 3253},
	{1913, 3321},
	{1904, 3402},
	{1892, 3447},
	{1889, 3490},
	{1857, 3534},
	{1869, 3598},
	{1776, 3504},
}

function pActivity:InitAddNpc()
	self:AddSanta()
end

function pActivity:AddSanta()			
	NpcFunLib:AddDialogNpc(szSantaName, szSantaId, tbSantaPos)
end

function pActivity:GetNextTime()
	local nCurTime = GetCurServerTime()
	local szTime = tostring(self.nStartDate)
	local nYear = strsub(szTime, 1, 4)
	local nMonth = strsub(szTime, 5, 6)
	local nDay = strsub(szTime, 7, 8)
	local nHour = floor(self.nRefreshTreeStartTime/100)
	local nMinute = mod(self.nRefreshTreeStartTime,100)
	local nTagetTime = Tm2Time(nYear, nMonth, nDay, nHour, nMinute)
	local nTime = nTagetTime - nCurTime
	if nTime < 0 then
		local nHM = tonumber(GetLocalDate("%H%M"))
		if self.nRefreshTreeStartTime <= nHM and nHM < self.nRefreshTreeEndTime then
			nTime = 30 - mod(tonumber(GetLocalDate("%S")), 30) 
		else
			nTime = mod(nTime, 24 * 60 * 60) + 24 * 60 * 60
		end
	end
	return nTime
end

function pActivity:SetRefreshNpcTimer()
	if self:IsExpired() then
		return
	end
	local nMapIndex = SubWorldID2Idx(%TREE_MAPID)
	if nMapIndex < 0 then
		return
	end
	local nTime = pActivity:GetNextTime()
	AddTimer(nTime*18, "pActivity:OnTime", 0)
end

function pActivity:OnTime()
	if self:IsExpired() then
		return 0
	end
	local nHM = tonumber(GetLocalDate("%H%M"))
	if self.nRefreshTreeStartTime <= nHM and nHM < self.nRefreshTreeEndTime then
		self:CreatTree(self.nRefreshCount)
		return 30 * 18
	else
		return self:GetNextTime() * 18
	end
end

function pActivity:CreatTree(nCount)
	local nMapIndex = SubWorldID2Idx(%TREE_MAPID)
	if nMapIndex < 0 then
		return
	end
	local szNpcName = "C�y Gi�ng Sinh Nh�"
	ClearMapNpcWithName(%TREE_MAPID, szNpcName)
	for i=1, nCount do
		local j = random(1, getn(%TREE_POS))
		TREE_POS[i], TREE_POS[j] = TREE_POS[j], TREE_POS[i] 
	end
	for i=1, nCount do
		local nX, nY = %TREE_POS[i][1], %TREE_POS[i][2]
		local nNpcIndex = AddNpc(TreeNpcID, 1, nMapIndex, nX*32, nY*32, 0, szNpcName);
		SetNpcScript(nNpcIndex, "\\script\\activitysys\\config\\2\\npc_tree.lua")
	end
end

--ʥ������
function pActivity:GetFairyPos(handle)
	tbFairyInfo.nCityMapID = ObjBuffer:PopObject(handle)
	tbFairyInfo.nCityPos = ObjBuffer:PopObject(handle)
end

function pActivity:CreatFairy()	
	local nMapID = %FAIRY_MAP[tbFairyInfo.nCityMapID].mapID
	local nMapIndex = SubWorldID2Idx(nMapID)
	local szNpcName = "Tinh Linh"
	
	if nMapIndex < 0 then
		return
	end
	
	if tbFairyInfo.nNpcIndex and tbFairyInfo.nNpcIndex ~= "" and GetNpcName(tbFairyInfo.nNpcIndex) == szNpcName then
		DelNpc(tbFairyInfo.nNpcIndex)
		tbFairyInfo.nNpcIndex = nil
	end

	local nX, nY = %FAIRY_POS[tbFairyInfo.nCityMapID][tbFairyInfo.nCityPos][1],%FAIRY_POS[tbFairyInfo.nCityMapID][tbFairyInfo.nCityPos][2]
	local nNpcIndex = AddNpc(FairyNpcID, 1, nMapIndex, nX*32, nY*32, 0, szNpcName)
	SetNpcTimer(nNpcIndex, 30*60*18)

	if nNpcIndex ~= nil then
		tbFairyInfo.nNpcIndex  = nNpcIndex
	end
	SetNpcScript(nNpcIndex, "\\script\\activitysys\\config\\2\\fairy_dialogue.lua")

end

function pActivity:Limit()
	if GetLevel() < 150 and ST_GetTransLifeCount() == 0 then
		 Talk(1, "", format("��i hi�p! ��ng c�p c�a ng��i ch�a ��t ��n y�u c�u c�a ho�t ��ng."))
		 return 1
    end
	if self:GetTaskDaily(%TSK_CLICK_FAIRY) >= %MAX_CLICK_FAIRY then 
		Talk(1, "", format("��i hi�p! H�m nay ng��i �� nh�n h�t ph�n th��ng c�a Tinh Linh Th�nh ��n r�i, ng�y mai l�i ��n nh�"))
		return 1
	end
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return 1
	end
end

function pActivity:GetFairyAward(nNpcIndex)
	local szNpcName = GetNpcName(nNpcIndex)
	if szNpcName ~= "Tinh Linh" then
		Talk(1, "", format("��i hi�p! Tinh Linh Th�nh ��n �� bi�n m�t, h�y ��i m�t l�t n�a m�i xu�t hi�n."))
		return
	end
	if self:Limit() then 
		return 
	end	
	local nCount = GetNpcParam(nNpcIndex, 1)

	if nCount >= nFariySurvivalCount - 1 then
		if szNpcName == "Tinh Linh" then
			DelNpc(nNpcIndex)
		end
	end	
	tbAwardTemplet:Give(%tbFairyAwardList, 1, {EVENT_LOG_TITLE, "get Fairy award"})
	self:AddTaskDaily(%TSK_CLICK_FAIRY,1)
	SetNpcParam(nNpcIndex, 1, nCount + 1)
end

function pActivity:SB_RestoreToHuwman()
	if IsOwnFeatureChanged() ~= 1 then
		return Talk(1, "", "Ng��i v�n ch�a bi�n th�nh tr�ng th�i Ng��i Tuy�t.")
	end
	RestoreOwnFeature()
end

function pActivity:SB_GetPlayerCamp()
	local nCampFlag = self:GetTaskDaily(%TSK_CAMP_FLAG)
	local nCamp = floor(nCampFlag/10)
	local nType = mod(nCampFlag, 10)
	return nCamp, nType
end

function pActivity:SB_ChangeToSnowman()
	local nCamp, nType = self:SB_GetPlayerCamp()
	if (not nCamp) or (nCamp == 0) then
		Talk(1, "", "Ng��i v�n ch�a b� ng��i kh�c s� d�ng Tuy�t C�u n�m tr�ng, kh�ng th� bi�n th�nh Tuy�t Nh�n.")
		return
	end
	ChangeOwnFeature(0, 0, self.tbSnowmanId[nCamp][nType])
end

function pActivity:SB_AskForEnter()
	local nCamp, nType = self:SB_GetPlayerCamp()
	if (not nCamp) or  nCamp == 0 then
		Talk(1, "", "Ng��i v�n ch�a b� ng��i kh�c s� d�ng Tuy�t C�u n�m tr�ng, kh�ng th� tham gia Tuy�t Nh�n ��i Chi�n.")
		return
	end
	
	local hParam = OB_Create()
	ObjBuffer:PushObject(hParam, GetName())
	ObjBuffer:PushObject(hParam, nCamp)
	RemoteExecute("\\script\\activitysys\\config\\2\\2012christmas_day.lua",
								"SnowmanBattle:AskForEnterMap", hParam,
								"pActivity:SB_CheckCondition", nCamp)
	OB_Release(hParam)
end

function pActivity:SB_CheckCondition(nCamp, hResult)
	local szName = ObjBuffer:PopObject(hResult)
	local nStarted = ObjBuffer:PopObject(hResult)
	local nRound = ObjBuffer:PopObject(hResult)
	local nMapId = ObjBuffer:PopObject(hResult)
	local nIsFull = ObjBuffer:PopObject(hResult)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return
	end
	
	if nStarted ~= 1 then
		return CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Hi�n t�i Tuy�t Nh�n ��i Chi�n v�n ch�a b�t ��u, xin h�y ch� � th�i gian b�t ��u.")
	end
	
	if nMapId <= 0 then
		return CallPlayerFunction(nPlayerIndex, Talk, 1, "", "B�n �� ��u tr��ng v�n �ang trong giai �o�n chu�n b�, xin h�y ��i.")
	end
	
	if nIsFull == 1 then
		return CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Qu�n doanh �� �� ng��i, xin h�y th� l�i sau.")
	end

	if CallPlayerFunction(nPlayerIndex, self.GetTaskDaily, self, %TSK_ROUND) ~= nRound then
		if CallPlayerFunction(nPlayerIndex, self.GetTaskDaily, self, %TSK_COUNT) >= %MAX_COUNT then
			CallPlayerFunction(nPlayerIndex, Talk, 1, "", format("H�m nay ng��i �� tham gia Tuy�t Nh�n ��i Chi�n %d l�n r�i, kh�ng th� ti�p t�c tham gia n�a.", %MAX_COUNT))
			return
		end
		CallPlayerFunction(nPlayerIndex, self.AddTaskDaily, self, %TSK_COUNT, 1)
		CallPlayerFunction(nPlayerIndex, self.SetTaskDaily, self, %TSK_ROUND, nRound)
		CallPlayerFunction(nPlayerIndex, self.SetTask, self, %TSK_POINT, 0)
	end


	CallPlayerFunction(nPlayerIndex, self.SB_EnterMap, self, nMapId, nCamp)
end

function pActivity:SB_EnterMap(nMapId, nCamp)
	local nIdx = random(1, getn(self.tbTransPos))
	NewWorld(nMapId, self.tbTransPos[nIdx][1], self.tbTransPos[nIdx][2])
end

function pActivity:SB_GetAward(nParam, hResult)
	
	if nParam == 0 then
		
		local nCamp,nType = self:SB_GetPlayerCamp()
		local nRound = self:GetTaskDaily(%TSK_ROUND)
		local nPoint = self:GetTask(%TSK_POINT)
		if nCamp == 0 or nRound == 0 or nPoint == 0 then
			return Talk(1, "", "H�m nay ng��i v�n ch�a tham gia Tuy�t Nh�n ��i Chi�n, ho�c �� tham gia nh�ng kh�ng nh�n ���c �i�m t�ch l�y, kh�ng th� nh�n ph�n th��ng.")
		end
		
		local hParam = OB_Create()
		ObjBuffer:PushObject(hParam, GetName())
		RemoteExecute("\\script\\activitysys\\config\\2\\2012christmas_day.lua", "SnowmanBattle:GetResult", hParam, "pActivity:SB_GetAward", 1)
		OB_Release(hParam)
		return
	end
	----------------------------------------
	local szName = ObjBuffer:PopObject(hResult)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return
	end
	
	local nGameNotEnd = ObjBuffer:PopObject(hResult)
	local nGameRound =  ObjBuffer:PopObject(hResult)
	local nWinCamp =  ObjBuffer:PopObject(hResult)
	local tbCampPoint = {}
	tbCampPoint[1] = ObjBuffer:PopObject(hResult)
	tbCampPoint[2] = ObjBuffer:PopObject(hResult)

	if nGameRound == 0 then
		return CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Tuy�t Nh�n ��i Chi�n ng�y h�m nay v�n ch�a b�t ��u.")
	end
	
	if nGameNotEnd == 1 or nWinCamp == -1 then
		return CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Hi�n t�i chi�n ��u v�n �ang ti�n h�nh, th�ng b�i b�t ph�n, kh�ng th� nh�n th��ng.")
	end

	if nWinCamp == 0 then
		print("SnowmanBattle CampPoint Error!!!!")
		return
	end
	
	local nCamp,nType = CallPlayerFunction(nPlayerIndex, self.SB_GetPlayerCamp, self)
	local nRound = CallPlayerFunction(nPlayerIndex, self.GetTaskDaily, self, %TSK_ROUND)
	local nPoint = CallPlayerFunction(nPlayerIndex, self.GetTask, self, %TSK_POINT)
	
	if nRound ~= nGameRound then
		return CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Ng��i v�n ch�a tham gia tr�n chi�n ��u n�o.")
	end
	
	if nPoint == -1 then
		return CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Ng��i �� nh�n ph�n th��ng c�a 1 tr�n Tuy�t Nh�n ��i Chi�n r�i.")
	end
	
	--if not CallPlayerFunction(nPlayerIndex, PlayerFunLib.CheckFreeBagCell, PlayerFunLib, 1, "default")  then
	--	return
	--end
	
	CallPlayerFunction(nPlayerIndex, self.SetTask, self, %TSK_POINT, -1)
	
	--The point of player is in variable nPoint
	if nCamp == nWinCamp then
		 CallPlayerFunction(nPlayerIndex, Msg2Player,"Ch�c m�ng! Doanh tr�i phe c�a ng��i �� gi�nh ���c th�ng l�i, ��y l� ph�n th��ng c�a ng��i.")
		 CallPlayerFunction(nPlayerIndex, PlayerFunLib.GetItem, PlayerFunLib, %tbSB_Award["Win"], 1, %EVENT_LOG_TITLE, "WinCampAward")
	else
		 CallPlayerFunction(nPlayerIndex, Msg2Player, "M�c d� doanh tr�i phe c�a ng��i �� b� thua trong Tuy�t Nh�n ��i Chi�n, nh�ng do nh� ng��i t�ch c�c tham gia chi�n ��u, ta s� cho ng��i ph�n th��ng t��ng x�ng.")
		 CallPlayerFunction(nPlayerIndex, PlayerFunLib.GetItem, PlayerFunLib, %tbSB_Award["Lost"], 1, %EVENT_LOG_TITLE, "LostCampAward")
	end
	
end

AutoFunctions:Add(pActivity.SetRefreshNpcTimer, pActivity)
