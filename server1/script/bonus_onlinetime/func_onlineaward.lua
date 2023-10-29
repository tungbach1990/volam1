do return end
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\bonus_onlinetime\\head.lua")
Include("\\script\\task\\random\\task_head.lua");
Include("\\script\\baoruongthanbi\\head.lua");

--tbRandomTask =
--{
--	211,
--	212,
--	213,
--	214,
--	215,
--	216,
--	222,
--	224,
--	225,
--	226,
--	227,
--	228,
--}
--
--
--tbOnlineAwardExp =
--{
--	{szName = "�i�m kinh nghi�m", nExp_tl = 15000000},
--}
--
--tbOnlineAwardHuyenTinh =
--{
--	{szName="Huy�n Tinh Kho�ng Th�ch ", tbProp={6,1,147,2,0,0}, nCount=10},
--	{szName="Huy�n Tinh Kho�ng Th�ch ", tbProp={6,1,147,3,0,0}, nCount=10},
--	{szName="Huy�n Tinh Kho�ng Th�ch ", tbProp={6,1,147,4,0,0}, nCount=10},
--}
--
--function IsActiveGetHuyenTinh()
--	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
--	if (nCurDate <= 20101110) then
--		return 1
--	else
--		return 0
--	end
--end

function OnlineAward()
	do return end
	 OnlineAward_ResetStillOnlineNewDay()
	
	local tbOpt = {};
		local szTitle = format("��i hi�p, xin h�y ch�n ph�n th��ng:");
		tbOpt = 
		{
			"Nh�n ph�n th��ng th�i gian Online/OnlineAward_GetBonus",
			"Ki�m tra th�i gian Online/OnlineAward_ShowTimeNow",
			"K�t th�c/Cancel",
		}
	tinsert(tbOpt, 1, szTitle)
	CreateTaskSay(tbOpt);
end

function OnlineAward_GetBonus()
	do return end
--	if CheckIPBonus() == 0 then
--		Say("Hi�n t�i ��i hi�p ch�a th� nh�n th��ng, h�y th� l�i sau!",0)
--		return
--	end
	if OnlineAward_Check_TransferLife() ~= 1 then
		Say("Hi�n t�i ��i hi�p ch�a th� xem tin t�c, h�y th� l�i sau!",0)
		return		
	end

	OnlineAward_SummaryOnlineTime()
	OnlineAward_StartTime()
	
	local nHour, nMin, nSec = OnlineAward_ShowTime()
	if nHour < 1 then
		Say("��i hi�p ch�a �� 1 gi� tr�n m�ng!",0)
		return
	end
	
	if (PlayerFunLib:CheckTaskDaily(BNCQ_TASKID_GET_TIMES,6,"H�m nay ��i hi�p �� nh�n th��ng 6 l�n r�i. Ng�y mai quay l�i nh�!","<") ~= 1) then
			return
	end
	
	if CalcFreeItemCellCount() < 1 then
		Say("Kh�ng �� 1 � tr�ng trong h�nh trang c�a ��i hi�p!",0)
		return
	end
	
	local tbOpt = {};
		local szTitle = format("��i hi�p, xin h�y ch�n ph�n th��ng:");
		tbOpt = 
		{
			"Nh�n ph�n th��ng B�nh ch�ng ��c bi�t/#OnlineAward_ConfirmBonus()",
--			"Nh�n ph�n th��ng lo�i 2/#OnlineAward_ConfirmBonus(2)",
			"K�t th�c/Cancel",
		}
	tinsert(tbOpt, 1, szTitle)
	CreateTaskSay(tbOpt);
	
	
--	if OnlineAward_PayTime(1*60*60) == 1 then	
--		PlayerFunLib:AddTaskDaily(BNCQ_TASKID_GET_TIMES,1)
--		for i = 1, 10 do AddLenhBaiBH() end
--		for i = 1, 10 do AddMocNhan() end
--		tbAwardTemplet:GiveAwardByList({szName = "Huy�n Thi�n Ch�y", tbProp={6,1,2348,1,0,0}, nExpiredTime = 10080, nBindState = -2, nCount = 2}, "Online nh�n th��ng");
--	end
	
end


function OnlineAward_ConfirmBonus()
	do return end
--	if (nType == 1) then
		if OnlineAward_PayTime(1*60*60) == 1 then	
			PlayerFunLib:AddTaskDaily(BNCQ_TASKID_GET_TIMES,1)
--			for i = 1, 10 do AddLenhBaiBH() end
--			for i = 1, 10 do AddMocNhan() end
--			if (IsActiveGetHuyenTinh() == 1) then
--				tbAwardTemplet:GiveAwardByList(tbOnlineAwardHuyenTinh, "Online nh�n th��ng");
--			end
			local tbAward = {szName="B�nh Ch�ng",tbProp={6,1,30086,1,0,0},nCount=10,nExpiredTime=20110220}
			tbAwardTemplet:GiveAwardByList(tbAward, "[VNG][Lunar Year 2011][Online nh�n th��ng]");
		end
--	else
--		if OnlineAward_PayTime(1*60*60) == 1 then	
--			PlayerFunLib:AddTaskDaily(BNCQ_TASKID_GET_TIMES,1)
--			tbAwardTemplet:GiveAwardByList(tbOnlineAwardExp[1], "Online nh�n th��ng");
--			if (IsActiveGetHuyenTinh() == 1) then
--				tbAwardTemplet:GiveAwardByList(tbOnlineAwardHuyenTinh, "Online nh�n th��ng");
--			end
--		end
--	end
end


function OnlineAward_ShowTimeNow()
	do return end
	if OnlineAward_Check_TransferLife() ~= 1 then
		Say("Hi�n t�i ��i hi�p ch�a th� xem tin t�c, h�y th� l�i sau!",0)
		return		
	end
	OnlineAward_SummaryOnlineTime()	
	local nHour, nMin, nSec = OnlineAward_ShowTime()
	local strMsg = format("Th�i gian tr�n m�ng c�a ��i hi�p l�:\n\t<color=yellow> %d <color> gi� <color=yellow> %d <color> ph�t <color=yellow> %d <color> gi�y.",nHour, nMin, nSec)
	OnlineAward_StartTime()
	Talk(1,"Online Nh�n Th��ng",strMsg)
end

function AddLenhBaiBH()
do return end
	--local nRandomTaskID = createRandomTask();
	local nRandomIndex = random(1, getn(tbRandomTask))
	local nRandomTaskID = tbRandomTask[nRandomIndex]
	
	nRandomItemIndex = AddItem(6, 2, 1020, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	nExpiredTime = BNCQ_OneDayTime
	ITEM_SetExpiredTime(nRandomItemIndex, nExpiredTime);
	SetItemBindState(nRandomItemIndex, -2);
	SyncItem(nRandomItemIndex);
	local strItem = GetItemName(nRandomItemIndex)
	Msg2Player("B�n nh�n ���c "..strItem)
	WriteLog(date("%Y%m%d %H%M%S").."\t".." Online nh�n th��ng "..GetAccount().."\t"..GetName().."\t".." Online nh�n th��ng nh�n ���c "..strItem)
end

function AddMocNhan()
do return end
		local ndx = AddItem(6,1,1085,1,0,0)
		SetSpecItemParam(ndx, 2, 9)
		nExpiredTime = BNCQ_OneDayTime
		ITEM_SetExpiredTime(ndx, nExpiredTime);
		SetItemBindState(ndx, -2);
		SyncItem(ndx)
		local strItem = GetItemName(ndx)
		Msg2Player("B�n nh�n ���c "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".." Online nh�n th��ng "..GetAccount().."\t"..GetName().."\t".." Online nh�n th��ng "..strItem)
end

function Cancel()
end
