Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\awardtemplet.lua")
local nDistance = 20 * 20

function AnnounceLuckyAward(strAwardName)		
	local strMsg = format("T� ��i c�a <color=yellow>%s<color> �� ti�u di�t th�nh c�ng boss %s, gi�nh ���c ph�n th��ng ��c bi�t l� <color=yellow>%s<color>", GetName(), "Ho�ng Nhan Qu�ng D��ng", strAwardName)
	Msg2Team(strMsg)			
	Msg2SubWorld(strMsg)
	AddGlobalNews(strMsg)	
end

function OnDeath(nNpcIndex,nBelongerIndex)
	local szName = GetNpcName(nNpcIndex)
	local nX, nY, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	if (szName ~= "Ho�ng Nhan Qu�ng D��ng" or nMapId ~= 947) then
		return
	end
	--�i�u ch�nh ph�n th��ng r�i ra t� boss Ho�ng Nhan Qu�ng - Modified By ThanhLD - 20140422
	local tbAwardForNew = 
	{		
			[1] = {{szName="X�ch L�n L�nh",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.4},},
			[2] = {{szName="M�nh X�ch L�n",tbProp={6,1,3391,1,0,0},nCount=1,nRate=3},},
			[3] = {{szName="X�ch L�n Kim B�i",tbProp={6,1,3392,1,0,0},nCount=1,nRate=4},},
			[4] = {{szName="X�ch L�n Tr�o",tbProp={6,1,3394,1,0,0},nCount=1,nRate=7},},
			[5] = {{szName="X�ch L�n Gi�c",tbProp={6,1,3395,1,0,0},nCount=1,nRate=4},},
			[6] = {{szName="X�ch L�n T�nh",tbProp={6,1,3396,1,0,0},nCount=1,nRate=2.5},},
			[7] = {{szName="B�ch H� Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={2,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�ch H� Ph�t Qu�n") end},},
			[8] = {{szName="B�ch H� Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.3,tbParam={6,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�ch H� Kim Kh�i ") end},},
			[9] = {{szName="B�ch H� Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={5,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�ch H� Y�u ��i ") end},},
			[10] = {{szName="B�ch H� H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={1,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�ch H� H�ng Li�n ") end},},
			[11] = {{szName="B�ch H� Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={9,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�ch H� Ng�c B�i ") end},},
			[12] = {{szName="B�ch H� H�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={8,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�ch H� H�i ") end},},
			[13] = {{szName="B�ch H� H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={4,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�ch H� H� Uy�n ") end},},
			[14] = {{szName="B�ch H� Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={3,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�ch H� Th��ng Gi�i Ch� ") end},},
			[15] = {{szName="B�ch H� H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={10,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�ch H� H� Gi�i Ch� ") end},},
			[16] = {{szName="B�ch H� Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.2,tbParam={7,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B�ch H� Kh� Gi�i ") end},},
			[17] = {{szName="X�ch L�n Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={2,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("X�ch L�n Ph�t Qu�n ") end},},
			[18] = {{szName="X�ch L�n Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={6,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("X�ch L�n Kim Kh�i ") end},},
			[19] = {{szName="X�ch L�n Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={5,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("X�ch L�n Y�u ��i ") end},},
			[20] = {{szName="X�ch L�n H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={1,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("X�ch L�n H�ng Li�n ") end},},
			[21] = {{szName="X�ch L�n Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={9,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("X�ch L�n Ng�c B�i ") end},},
			[22] = {{szName="X�ch L�n H�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={8,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("X�ch L�n H�i  ") end},},
			[23] = {{szName="X�ch L�n H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={4,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("X�ch L�n H� Uy�n ") end},},
			[24] = {{szName="X�ch L�n Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={3,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("X�ch L�n Th��ng Gi�i Ch� ") end},},
			[25] = {{szName="X�ch L�n H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={10,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("X�ch L�n H� Gi�i Ch�") end},},
			[26] = {{szName="X�ch L�n Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.03,tbParam={7,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("X�ch L�n Kh� Gi�i ") end},},
			[27] = {{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.6,nExpiredTime=43200},},
			[28] = {{szName="C�ng Hi�n L� bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			[29] = {{szName="Ki�n Thi�t L� Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			[30] = {{szName="Chi�n B� L� Bao",tbProp={6,1,30218,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			[31] = {{szName="Bao D��c ho�n ",tbProp={6,1,910,1,0,0},nCount=1,nRate=15,nExpiredTime=20160},},
			[32] = {{szName="B�ch H� Tr�ng Luy�n Ng�c",tbProp={6,1,3187,1,0,0},nCount=1,nRate=3},},
			[33] = {{szName="M�c B�c Truy�n T�ng L�nh",tbProp={6,1,1448,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},},
			[34] = {{szName="V� L�m M�t T�ch",tbProp={6,1,26,1,0,0},nCount=1,nRate=5},},
			[35] = {{szName="T�y T�y Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=5},},
			[36] = {{szName="Thi�n Linh ��n",tbProp={6,1,3022,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
			[37] = {{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
			[38] = {{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
			[39] = {{szName="Qu� Ho�ng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			
	}
		
	local tbAwardForOld = 
	{
		{szName = "Ch� T�n B� B�o", tbProp = {6,1,2375,1,0,0}, nRate = 50},
		{szName = "V� L�m M�t T�ch", tbProp = {6,1,26,1,0,0}, nRate = 10},
		{szName = "T�y T�y Kinh", tbProp = {6,1,22,1,0,0}, nRate = 10},
		{szName = "T� M�ng L�nh", tbProp = {6,1,2350,1,0,0}, nRate = 0.5},
		{szName = "Huy�n Vi�n L�nh", tbProp = {6, 1, 2351, 1, 0, 0}, nRate = 10},
		{szName = "Th��ng Lang L�nh", tbProp = {6,1,2352,1,0,0}, nRate = 9.5},
		{szName = "Ti�n Th�o L� ��c bi�t", tbProp = {6,1,1181,1,0,0}, nRate = 10},		
	}
	--local nBelongerIndex = GetPlayerIndex(nNpcIndex)
	--DynamicExecuteByPlayer(nBelongerIndex, "\\script\\lib\\awardtemplet.lua", "tbAwardTemplet:GiveAwardByList", tbAwardForOld, "ɱ������ؾ��Ĳ�boss���չ�����ý���", 10)
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAwardForNew, "Boss t�ng 4 Thi�n Tr� M�t C�nh r�i ra", 1)
	local nOldPlayer = PlayerIndex
	local tbExpAward = {szName = "�i�m Kinh Nghi�m", nExp = 20e6}
	local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex) 
	if GetTeamSize() <= 1 then
		tbAwardTemplet:Give(tbExpAward, 1, {"ThienTriMatCanh", "KillBossExp"})
	else
		local nTeamSize = GetTeamSize()
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			local nX, nY, nMapIndex = GetPos()
			if PlayerIndex > 0 and GetLife(0) > 0 and CheckDistance(nNpcX, nNpcY, nX, nY) == 1 then
				tbAwardTemplet:Give(tbExpAward, 1, {"ThienTriMatCanh", "KillBossExp"})
			end
		end
	end
	PlayerIndex = nOldPlayer
end

function GetPlayerIndex(nNpcIndex)
	local nPlayerIndex = PlayerIndex
	local nTeamSize = CallPlayerFunction(nPlayerIndex, GetTeamSize)
	if nTeamSize == 0 then
		return nPlayerIndex
	else
		local tbTeamIndex = {}
		local nPlayerNum = 0
		local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex)
		for i=1,nTeamSize do
			local nTeamMember = CallPlayerFunction(nPlayerIndex, GetTeamMember, i)
			local nX, nY, nMapIndex = CallPlayerFunction(nTeamMember, GetPos)
			if (nMapIndex >= 0 and nMapIndex == nNpcMapIdx) then			 
				if CheckDistance(nNpcX, nNpcY, nX, nY) == 1 then
					nPlayerNum = nPlayerNum + 1
					tbTeamIndex[nPlayerNum] = nTeamMember
				end		
			end
		end
		if nPlayerNum > 1 then
			local nRandomIdx = random(1, nPlayerNum)
			return tbTeamIndex[nRandomIdx]
		else
			return tbTeamIndex[1]
		end
	end
end

function CheckDistance(nX1, nY1, nX2, nY2)
	local nTempDis = ((nX1 - nX2)/32)^2 + ((nY1 - nY2)/32)^2
	if nTempDis <= %nDistance then
		return 1
	end
end