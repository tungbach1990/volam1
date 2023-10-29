Include("\\script\\activitysys\\config\\28\\config.lua")
Include("\\script\\activitysys\\config\\28\\head.lua")
Include("\\script\\activitysys\\config\\28\\boss_muke.lua")

Include("\\script\\missions\\basemission\\lib.lua")

tbPoolCount = {
	[100] = {nCount = 0, szName = "Chu Ti�n tr�n", nTotal = 0, },
	[153] = {nCount = 0, szName = "Th�ch C� tr�n", nTotal = 0, },
	[174] = {nCount = 0, szName = "Long Tuy�n th�n", nTotal = 0, },
}
tbBossPos =
{
	[100] = {{1758,3011}, {1675,3053}},
	[153] = {{1723,2993}, {1722,3303}},
	[174] = {{1788,3039}, {1698,3192}},
}

--��ӻNPC
function pActivity:AddInitNpc()
	local tbFarmerPos = {
		{100,1643,3145,},
		{153,1639,3187,},
		{174,1622,3202,},
	}
	local tbFarmer = {
		szName = "L�o N�ng C�n C�", 
		szTitle = "<npc>M�a xu�n �� ��n, ta mu�n tr�ng th�m m�t �t hoa m�u � ngo�i th�n ch�ng ta",
		nLevel = 95,
		nNpcId = 246,
		nIsboss = 0,
		szScriptPath = "\\script\\activitysys\\npcdailog.lua",
	}
	for _, tbTmpPos in tbFarmerPos do
		local nMapId, nPosX, nPosY = unpack(tbTmpPos)
		%basemission_CallNpc(tbFarmer, nMapId, nPosX*32, nPosY*32)	
	end
	
	local tbEZeiPos = 	{
		[100] = {
			{1677,3028},{1670,3048},{1648,3041},{1639,3021},
		},
		[153] = {
			{1744,2949},{1734,2974},{1715,2979},{1685,2966},{1700,2936},
		},
		[174] = {
			{1788,3040},{1788,3035},
		},
	}
	local tbEZeiNpc = {
		szName = "�c T�c",
		nLevel = 95,
		nNpcId = 1606,
		nIsboss = 0,
		bNoRevive = 0,
	}
	for nTmpMapId, tbPosList in tbEZeiPos do
		for _, tbSinglePos in tbPosList do
			%basemission_CallNpc(tbEZeiNpc, nTmpMapId, tbSinglePos[1]*32, tbSinglePos[2]*32)	
		end
	end
	
	local tbFaMuZhePos = 	{
		[100] = {
			{1679,3024},{1673,3044},{1649,3039},{1638,3015},
		},
		[153] = {
			{1745,2945},{1737,2974},{1712,2979},{1691,2968},{1697,2936},
		},
		[174] = {
			{1788,3042},
		},
	}
	local tbFaMuZheNpc = {
		szName = "��i M�c Gi�",
		nLevel = 95,
		nNpcId = 1602,
		nIsboss = 0,
		bNoRevive = 0,
	}
	for nTmpMapId, tbPosList in tbFaMuZhePos do
		for _, tbSinglePos in tbPosList do
			%basemission_CallNpc(tbFaMuZheNpc, nTmpMapId, tbSinglePos[1]*32, tbSinglePos[2]*32)	
		end
	end
end

--�Ͻ�����ˮ��ľͰ
function pActivity:OnGetMuTong()
	PlayerFunLib:GetItem({tbProp={6,1,2736,1,0,0},nBindState = -2,nExpiredTime=20110405,},1,"Ti�t Tr�ng C�y 2011, nh�n ���c Th�ng G�")
	WriteLog(format("%s\tAccount:%s[Name:%s] nh�n 1 Th�ng N��c.",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName())
			);
end

--�Ͻ�����ˮ��ľͰ
function pActivity:OnGiveMuTong()
	
	local nCount = 1 
	if not nCount or 0==nCount then
		print("��a s� Th�ng N��c kh�ng ��ng")
		return
	end
	--print("OnGiveMuTong")
	--print(nCount)
	
	if not PlayerFunLib:CheckItemInBag({tbProp={6,1,2737,1,0,0},},1,"Nhanh ch�n �i l�y ��y n��c cho ta") then
		return
	end
	
	PlayerFunLib:ConsumeEquiproomItem({tbProp={6, 1, 2737, 1, 0, 0},},1)
	self:AddTaskDaily(%nTskIdx_DaylyGiveWater,nCount)
	self:GiveAward("mutong", nCount, "Giao Th�ng N��c ��y nh�n ph�n th��ng")
	
	local nTsk = self:GetTask(%nTskIdx_DaylyGiveWater)
	local nDaylyCount = nTsk - floor(nTsk/256) * 256
	WriteLog(format("%s\tAccount:%s[Name:%s] giao[%d] c�i Th�ng N��c ��y , h�m nay �� c�ng th�m [%d] c�i.",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName(),
				nCount,
				nDaylyCount)
			);
	
	--����ͳ��
	--if self:CheckTaskDaily(%nTskIdx_DaylyGiveWater,1,"","==") == 1 then
		--AddStatData("zhishujie_canyurenshu")
	--end
	--AddStatData("zhishujie_dashuicishu")
	
	--print(self:GetTask(%nTskIdx_DaylyGiveWater))
end

--�Ͻ�����ʥˮ
function pActivity:OnGiveLongYinShengShui(nCount)
	
	if not nCount or 0==nCount then
		print("��a s� Long �m Th�nh Th�y kh�ng ��ng")
		return
	end

	--print("OnGiveLongYinShengShui")
	--print(nCount)
	
	self:GiveAward("longyinshengshui", nCount, "Giao Long �m Th�nh Th�y nh�n ���c ph�n th��ng")

	if self:CheckTask(%nTskIdx_GiveLongYinShengShuiExp,%nMaxExpFromLongYinShengShui,"","<") then	
		local nAddExpBaseCount = %nPerExpFromLongYinShengShui * nCount
		local nExpCur = self:GetTask(%nTskIdx_GiveLongYinShengShuiExp)
		local nMaxExpAdd = %nMaxExpFromLongYinShengShui - nExpCur
		--������ӵľ��鳬�����ƣ��ضϴ���
		if nAddExpBaseCount > nMaxExpAdd then
			nAddExpBaseCount = nMaxExpAdd
		end
		
		local nExp = nAddExpBaseCount * %nExpBaseFromLongYinShengShui
		self:AddTask(%nTskIdx_GiveLongYinShengShuiExp, nAddExpBaseCount)
		PlayerFunLib:AddExp(nExp, 1, "Giao Long �m Th�nh Th�y nh�n ���c ph�n th��ng")
	end
	if self:CheckTask(%nTskIdx_GiveLongYinShengShuiExp,%nMaxExpFromLongYinShengShui,"",">=") then
		local szMsg = format("Ng��i giao Long �m Th�nh Th�y nh�n ���c kinh nghi�m �� ��n gi�i h�n")
		Msg2Player(szMsg)
	end
	
	--����ͳ��
	--AddStatData("zhishujie_longyinshengshuicishu")
	
	self:AddTask(%nTskIdx_LastRecordDay, nCount)
	local nTotalCount = self:GetTask(%nTskIdx_LastRecordDay)
	WriteLog(format("%s\tAccount:%s[Name:%s] giao[%d] c�i Long �m Th�nh Th�y , h�m nay �� c�ng th�m [%d] c�i.",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			nCount,
			nTotalCount)
		);
	
	--print(self:GetTask(%nTskIdx_LastRecordDay))
	--print(self:GetTask(%nTskIdx_GiveLongYinShengShuiExp))
	
	--ͳ�Ƹ���ͼ����ʥˮ�������ж��Ƿ���Ҫˢboss
	self:_AddLongYinShengShuiStat(nCount)
end


--�ж�ľͰ��״̬
function pActivity:CheckMuTong()
	local nCount1 = CalcItemCount(-1, 6, 1, 2736, -1)
	if nCount1 >= 1 then
		Msg2Player("Ng��i �� c� Th�ng G� r�i, kh�ng ���c nh�n n�a")
		return 
	end
	local nCount2 = CalcItemCount(-1, 6, 1, 2737, -1)
	if nCount2 >= 1 then
		Msg2Player("Ng��i �� c� Th�ng N��c ��y r�i , xin h�y ho�n th�nh nhi�m v� r�i h�y ��n nh�n th��ng nh�")
		return 
	end
	return 1
end

--�жϻʱ��
function pActivity:CheckActivityTime()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate < self.nStartDate/10000 then
		Msg2Player("Ho�t ��ng Ti�t Tr�ng C�y v�n ch�a b�t ��u")
		return
	elseif nDate >= self.nEndDate/10000 then
		Msg2Player("Ho�t ��ng Ti�t Tr�ng C�y �� k�t th�c")
		return
	end
	return 1
end


function pActivity:_AddLongYinShengShuiStat(nCount)
	local nMapId, nX, nY = GetWorldPos()
	if nCount ~= nil then
		%tbPoolCount[nMapId].nCount = %tbPoolCount[nMapId].nCount + nCount
		%tbPoolCount[nMapId].nTotal = %tbPoolCount[nMapId].nTotal + nCount
	end
	
	--local szMsg = format("%s\t th�ng k� Long �m Th�nh Th�y:map%d(%s)=%d"
	--	,GetLocalDate("%Y-%m-%d %H:%M:%S")
	--	,nMapId,%tbPoolCount[nMapId].szName, %tbPoolCount[nMapId].nTotal)
	--print(szMsg)
	
	if %tbPoolCount[nMapId].nCount >= %nCall_MuKe_LongYinShengShui_Count then
		self:_CallMuKeBoss(nMapId)
		%tbPoolCount[nMapId].nCount = %tbPoolCount[nMapId].nCount - %nCall_MuKe_LongYinShengShui_Count
	end
end

function pActivity:_CallMuKeBoss(nMapId)
	local szInfo = format("M�c Kh�ch xu�t hi�n t�i %s th�ng trang, h�y nhanh ch�n �i ��nh b�i h�n", %tbPoolCount[nMapId].szName)
	local nPosId = random(1,2)
	local tbNpc = {
		szName = "M�c Kh�ch", 
		nLevel = 95,
		nMapId = nMapId,
		nPosX = %tbBossPos[nMapId][nPosId][1]*32,
		nPosY = %tbBossPos[nMapId][nPosId][2]*32,
		nNpcId = 1670,
		nIsboss = 1,
		szDeathScript = "\\script\\activitysys\\config\\28\\boss_muke_death.lua",
		pCallBack = %AddOnTime,
	}
	%basemission_CallNpc(tbNpc)
	AddGlobalNews(szInfo)
	AddGlobalNews(szInfo)
	
	local szMsg = format("%s\tmap%d(%s) b�n ngo�i (%d,%d) xu�t hi�n boss [ M�c Kh�ch ], khu v�c n�y �� giao Long �m Th�nh Th�y t�ng s� l��ng l� [%d]"
		, GetLocalDate("%Y-%m-%d %H:%M:%S")
		, nMapId, %tbPoolCount[nMapId].szName, tbNpc.nPosX, tbNpc.nPosY
		, %tbPoolCount[nMapId].nTotal)
	WriteLog(szMsg)
end

--activity.lua�ṩ�İ��ղ�������ֻ֧�ֲ�����256�ı��������������£�������������ʾ
--function pActivity:_CheckDaylyTaskData(nDateIdx,nTskIdx, nValue, szFailMsg, szOption)
--	nValue = lib:NumberParamTrans(nValue)
--	local nTaskDate =  self.TaskGroup:GetTask(nDateIdx)
--	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
--	if nTaskDate ~= nCurDate then
--		self.TaskGroup:SetTask(nDateIdx, nCurDate)
--		self.TaskGroup:SetTask(nTskIdx, 0)
--	end
--	return self:CheckTask(nTskIdx, nValue, szFailMsg, szOption)
--end
--function pActivity:_AddDaylyTaskData(nDateIdx,nTskIdx, nValue)
--	nValue = lib:NumberParamTrans(nValue)
--	local nTaskDate =  self.TaskGroup:GetTask(nDateIdx)
--	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
--	if nTaskDate ~= nCurDate then
--		self.TaskGroup:SetTask(nDateIdx, nCurDate)
--		self.TaskGroup:SetTask(nTskIdx, 0)
--	end
--	return self:AddTask(nTskIdx, nValue)
--end
