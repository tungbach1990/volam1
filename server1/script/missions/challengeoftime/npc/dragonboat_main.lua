Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\functionlib.lua")
function COT_CheckTeamRequirement()
	local oldplayer = PlayerIndex
	if (IsCaptain() ~= 1) then
		Say("Xin l�i! C�n ph�i l� ��i tr��ng m�i c� t� c�ch b�o danh tham gia 'Nhi�m v� Th�ch th�c th�i gian'",0)
		return
	end
	
	if (GetTeamSize() < 1) then
		Say("Xin l�i! ��i tham gia 'Nhi�m v� Th�ch th�c th�i gian' c�n ph�i c� �t nh�t <color=red>4<color> ng��i!",0)
		return
	end
	
	if (GetCash() < 10000) then
		Say("Tham gia nhi�m v� �Th�ch th�c th�i gian� c�n <color=red>1v�n l��ng<color>. Chu�n b� �� ti�n r�i h�y quay l�i!", 0)
		return
	end
	
	local nMatchLevel = GetMatchLevel(GetLevel())
	local nToday = tonumber(GetLocalDate("%y%m%d"));
	
	for i = 1, GetTeamSize() do 
		local nPlayerIndex = GetTeamMember(i)
		local nJoinDate = CallPlayerFunction(nPlayerIndex, GetTask, TSK_JOIN_DATE)
		local nRemainCount = CallPlayerFunction(nPlayerIndex, GetTask, TSK_REMAIN_COUNT)
		local nPlayerLevel = CallPlayerFunction(nPlayerIndex, GetLevel)
		local nTaskItem = CallPlayerFunction(nPlayerIndex, CalcItemCount, 3, 6, 1, 400, 90)
		local nFlag1 = DynamicExecuteByPlayer(nPlayerIndex,"\\script\\vng_lib\\bittask_lib.lua", "tbVNG_BitTask_Lib:getBitTask", {nTaskID = 3071,nStartBit = 25,nBitCount = 1,nMaxValue = 1})
		if nFlag1 ~= 0 then
			PlayerIndex = GetTeamMember(i)
			local szNamePlayer = GetName()
			PlayerIndex = oldplayer
			Say("Xin l�i! Trong ��i b�n c� th�nh vi�n <color=yellow>".. szNamePlayer.."<color> kh�ng th�a �i�u ki�n �� tham gia t�nh n�ng n�y")
			return
		end
		if (nJoinDate == nToday) and (nRemainCount <= 0) then
				Say("Nhi�m v� Th�ch th�c th�i gian m�i ng�y ch� ���c tham gia 1 l�n. S� l�n tha gia c�a t� b�n �� ��! Ng�y mai tr� l�i nh�!",0);
				Msg2Team("Nhi�m v� Th�ch th�c th�i gian m�i ng�y ch� ���c tham gia 1 l�n. S� l�n tha gia c�a t� b�n �� ��! Ng�y mai tr� l�i nh�!")
			return
		end
		
		if GetMatchLevel(nPlayerLevel) ~= nMatchLevel then
			if (nMatchLevel == 1) then
				Say(" Xin l�i! Trong ��i b�n c� th�nh vi�n v��t <color=red>c�p 90<color>, xin ki�m tra l�i r�i b�o danh!",0)
				Msg2Team("Trong ��i b�n c� th�nh vi�n tr�n c�p 90, xin h�y ki�m tra l�i r�i b�o danh!");
				return
			elseif (nMatchLevel == 2) then
				Say("Xin l�i! Trong ��i b�n c� th�nh vi�n ch�a ��t <color=red>c�p 90<color>, xin ki�m tra l�i r�i b�o danh!",0)
				Msg2Team("Trong ��i b�n c� th�nh vi�n ch�a ��t c�p 90, xin ki�m tra l�i r�i b�o danh!")
				return
			end
		end
		
		local bHaveItem = 0
		if nMatchLevel == 1 then
			for i=20,80,10 do
				if CallPlayerFunction(nPlayerIndex, CalcEquiproomItemCount, 6, 1, 400, i) > 0 then
					bHaveItem = 1
					break
				end
			end	
		elseif nMatchLevel == 2 then
			bHaveItem = CallPlayerFunction(nPlayerIndex, CalcEquiproomItemCount, 6, 1, 400, 90)
		end
		
		if (bHaveItem < 1 and nMatchLevel == 1) then
			Say("Nhi�p Th� Th�n: Xin l��ng th�, tham gia nhi�m v� khi�u chi�n th�i gian s� c�p m�i th�nh vi�n c�n ph�i c� m�t S�t Th� Gi�n ng� h�nh b�t k� c�p 90 tr� xu�ng, xin h�y chu�n b� r�i h�y ��n ��y g�p ta",0)
			Msg2Team("Trong t� ��i c�a ng��i c� ng��i kh�ng c� S�t Th� Gi�n ng� h�nh b�t k� c�p 90 tr� xu�ng , xin  ki�m tra l�i r�i h�y b�o danh tham gia !")
			return
		elseif (bHaveItem < 1 and nMatchLevel == 2) then
			Say("Nhi�p Th� Th�n: Xin l��ng th�, tham gia nhi�m v� khi�u chi�n th�i gian cao c�p m�i th�nh vi�n c�n ph�i c� m�t S�t Th� Gi�n ng� h�nh b�t k� c�p 90 , xin h�y chu�n b� r�i h�y ��n ��y g�p ta",0)
			Msg2Team("Trong t� ��i c�a ng��i c� ng��i kh�ng c� S�t Th� Gi�n ng� h�nh b�t k� c�p 90, xin  ki�m tra l�i r�i h�y b�o danh tham gia !")
			return
		end
	end

	return 1
	
end
function COT_GetFreeMap(nMatchLevel)
	local tbFreeMaps = {}
	local bStarted = nil
	local tbMapList = GetMatchMapList(nMatchLevel)
	
	for i = 1, getn(tbMapList) do 
		local nMapIndex = SubWorldID2Idx(tbMapList[i])
		if (nMapIndex >= 0) then
			local nState = lib:DoFunInWorld(nMapIndex, GetMissionV, VARV_STATE)
			local nMSPlayerCount = lib:DoFunInWorld(nMapIndex, GetMSPlayerCount, MISSION_MATCH, 1)
			if (nState > 0) then
			 bStarted = 1
			end
			if (nState == 1 and nMSPlayerCount == 0) then
				tinsert(tbFreeMaps, tbMapList[i])
			end
		end
	end
	
	return tbFreeMaps, bStarted
end

function want_playboat()
	local nPlayerLevel = GetLevel()
	local nMatchLevel = GetMatchLevel(nPlayerLevel)
	local tbFreeMapList, bStarted = COT_GetFreeMap(nMatchLevel)
	
	-- resolve lua error.
	if nMatchLevel == nil then
		return
	end

	local strLevel = tbLevels[nMatchLevel].szName
	
	if bStarted then
		if (getn(tbFreeMapList) == 0) then
			Say("Khu v�c n�y"..strLevel.."�� b�t ��u. Kh�ng c�n ch� n�a�.",0)
			return
		else
			Say("Khu v�c n�y"..strLevel.."giai �o�n b�o danh �ua thuy�n r�ng, v�n c�n <color=red>"..getn(tbFreeMapList).."<color> m�t b�n �� nhi�m v� c�n tr�ng, khi�u chi�n c� th�i gian c�n ph�i n�p <color=red>10 v�n<color> ng�n l��ng, ng��i mu�n nh�p h�i kh�ng?",2, "Ph�i! Ta mu�n d�n d�t ��i c�a ta tham gia./dragon_join", "Kh�ng c�n/onCancel")
			return
		end
	else
		Say("Xin l�i! Khu v�c n�y"..strLevel.."Nhi�m v� Th�ch th�c th�i gian ch�a ��n giai �o�n b�o danh. C�ch <color=red>m�i gi�<color> b�o danh 1 l�n. Xin ch� � h� th�ng th�ng b�o!",0)
		return
	end
	
end

function COT_TeamMemberJoin(nMatchLevel)
	local w,x,y = GetWorldPos();
	local nPrisonId = 208
	if w == nPrisonId then	-- �������ж��Ƿ���Խ����ͼ
		return
	end
	
	local nConsumed = 0
	if nMatchLevel == 1 then
		for i=20,80,10 do
			if(CalcEquiproomItemCount( 6, 1, 400, i ) > 0) then
				nConsumed = ConsumeEquiproomItem( 1, 6, 1, 400, i)
				if nConsumed > 0 then break end
			end
		end
	elseif nMatchLevel == 2 then
		nConsumed = ConsumeItem(3, 1, 6,1,400,90)
	end
	
	if (nConsumed > 0) then
		local nToday = tonumber(GetLocalDate("%y%m%d"));
		if(GetTask(TSK_JOIN_DATE) ~= nToday) then
			SetTask(TSK_REMAIN_COUNT, COUNT_LIMIT);
			SetTask(TSK_JOIN_DATE, nToday);
		end
		SetTask(TSK_REMAIN_COUNT, GetTask(TSK_REMAIN_COUNT) - 1);
		
		-- �ж��Ƿ�ʹ������Ѫ��
		if GetTask(%TSK_Longxuewan_Date) == nToday then
			local nCurCount = GetTask(%TSK_Longxuewan_avail)
			if nCurCount >= 0 then
				SetTask(%TSK_Longxuewan_avail, nCurCount - 1)
			end
		else
			SetTask(%TSK_Longxuewan_avail, -1)
		end

		JoinMission(MISSION_MATCH, 1)
		G_ACTIVITY:OnMessage("SignUpChuangguan", PlayerIndex, nMatchLevel)
		
		PlayerFunLib:AddTaskDaily(3079, 1)
		if PlayerFunLib:GetTaskDailyCount(3079) > 1 then
			tbLog:PlayerActionLog("TinhNangKey","BaoDanhVuotAiThuPhi")
		else
			tbLog:PlayerActionLog("TinhNangKey","BaoDanhVuotAiMienPhi")
		end
		
	end
end

function COT_TeamJoin(nMatchLevel)

	local szLeaderName = GetName()
	
	local tbPlayers = {}
	for i=1, GetTeamSize() do
		tbPlayers[i] = GetTeamMember(i)
	end		
	
	local w,x,y = GetWorldPos()
	SetMissionV(VARV_SIGNUP_WORLD, w)
	SetMissionV(VARV_SIGNUP_POSX, x)
	SetMissionV(VARV_SIGNUP_POSY, y)
	SetMissionV(VARV_LEVEL, nMatchLevel)
	SetMissionS(VARS_TEAM_NAME, szLeaderName)
	SetMissionS(VARS_TEAMLEADER_FACTION, GetLastFactionNumber())
	SetMissionS(VARS_TEAMLEADER_GENDER, GetSex())
	Pay(10000)
	
	local ndate = tonumber(GetLocalDate("%H"))
	if ndate <= 22 and ndate >= 10 and nMatchLevel == 2 then
		SetMissionV(VARV_BATCH_MODEL,1)
	else
		SetMissionV(VARV_BATCH_MODEL,0)
	end
	
	for i = 1 , getn(tbPlayers) do 
		CallPlayerFunction(tbPlayers[i], COT_TeamMemberJoin, nMatchLevel)
	end
	
	tbLog:PlayerActionLog("EventChienThang042011","BaoDanhVuotAi")-- ������־
end

function dragon_join()
	
	local nLeaderLevel = GetLevel()
	local nMatchLevel = GetMatchLevel(nLeaderLevel)
	
	if not COT_CheckTeamRequirement(nMatchLevel) then
		return
	end
	
	local tbFreeMaps = COT_GetFreeMap(nMatchLevel)
	for i = 1, getn(tbFreeMaps) do 
		local nMapIndex = SubWorldID2Idx(tbFreeMaps[i])
		if nMapIndex >= 0 then
			lib:DoFunInWorld(nMapIndex, COT_TeamJoin, nMatchLevel)
			return
		end
	end
	
	local strLevel = tbLevels[nMatchLevel].szName
	Say("Xin l�i! Hi�n t�i khu v�c <color=red>"..strLevel.."<color>�� kh�ng c�n ch�. Xin ��i v�ng sau!",0)
end
