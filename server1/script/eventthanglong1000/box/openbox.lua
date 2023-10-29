Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\EventThangLong1000\\head.lua")

function main()
	local n_size = GetTeamSize();
	local strLeaderName = ""
	if (n_size < 2) then
		CreateTaskSay({"<dec><npc>H�y t� ��i v�i th�nh vi�n r�i m�i m� R��ng !", "K�t th�c ��i tho�i/OnCancel"});
		return
	end
	if (IsCaptain() == 0) then
		CreateTaskSay({"<dec><npc>Ch� c� ��i tr��ng m�i c� th� m� R��ng.", "K�t th�c ��i tho�i/OnCancel"});
		return
	else
		strLeaderName = GetName()
	end
	if (GetTask(Task_Allow_OpenBox) ~= 1) then
		Talk(1,"","C�n ph�i ti�u di�t <color=yellow>Tr�n Long H� B�o <color>  th� m�i c� th� m� ���c R��ng !")
		return
	end
	if (PlayerFunLib:CheckTaskDaily(Task_Daily_OpenBox,3,"M�i ng�y ch� c� th� m� 3 R��ng C� V�t m� th�i !","<") ~= 1) then
			return
	end
	PlayerFunLib:AddTaskDaily(Task_Daily_OpenBox,1)
	
	local oldPlayer = PlayerIndex;
	for i = 1, n_size do
		local nplayer = GetTeamMember(i);
		PlayerIndex = nplayer;
		SetTask(Task_Allow_OpenBox, 0)
		Talk(1,"","��i Tr��ng <color=yellow>" ..strLeaderName.. "<color> v�a m�i m� R��ng C� V�t th�nh c�ng !")
		if (PlayerFunLib:CheckTaskDaily(Task_Daily_GetBonusByKillBoss,21,"M�i ng�y ng��i ch�i c� th� nh�n �i�m kinh nghi�m chung v�i t� ��i t�i �a  21 l�n !","<") ~= 1) then
			Msg2Player("H�m nay ��i hi�p �� nh�n �i�m kinh nghi�m chung v�i t� ��i �� 21 l�n")
		else
			PlayerFunLib:AddTaskDaily(Task_Daily_GetBonusByKillBoss,1)
			GetBonusOpenBox(IsCaptain())
		end
	end;
	PlayerIndex = oldPlayer;
end

function GetBonusOpenBox(nValue)
	
	if (nValue ~= 0) then--la doi truong
		local nVar = random(1, 3)
		if (nVar ==1) then
			for i=1,2 do
				local nItemIndex = AddStackItem(50, 6, 1, 30045, 1, 0, 0)
				ITEM_SetExpiredTime(nItemIndex, 20101025);
				SyncItem(nItemIndex)
			end
		end
		if (nVar ==2) then
			for i=1,2 do
				local nItemIndex = AddStackItem(50, 6, 1, 30046, 1, 0, 0)
				ITEM_SetExpiredTime(nItemIndex, 20101025);
				SyncItem(nItemIndex)
			end
		end
		if (nVar ==3) then
			for i=1,2 do
				local nItemIndex = AddStackItem(50, 6, 1, 30047, 1, 0, 0)
				ITEM_SetExpiredTime(nItemIndex, 20101025);
				SyncItem(nItemIndex)
			end
		end
		AddOwnExp(4000000)
		Msg2Player("Ban nh�n ���c 4000000 �i�m kinh nghi�m")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N�m Th�ng Long"..GetAccount().."\t"..GetName().."\t".."M� R��ng nh�n ���c 4000000 �i�m EXP ")
	else --la thanh vien
			local nVar2 = random(1, 3)
			if (nVar2 ==1) then
					local nItemIndex = AddStackItem(20, 6, 1, 30045, 1, 0, 0)
					ITEM_SetExpiredTime(nItemIndex, 20101025);
					SyncItem(nItemIndex)
			end
			if (nVar2 ==2) then
					local nItemIndex = AddStackItem(20, 6, 1, 30046, 1, 0, 0)
					ITEM_SetExpiredTime(nItemIndex, 20101025);
					SyncItem(nItemIndex)
			end
			if (nVar2 ==3) then
					local nItemIndex = AddStackItem(20, 6, 1, 30047, 1, 0, 0)
					ITEM_SetExpiredTime(nItemIndex, 20101025);
					SyncItem(nItemIndex)
			end
	AddOwnExp(1000000)
	Msg2Player("Ban nh�n ���c 1000000 �i�m kinh nghi�m")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N�m Th�ng Long"..GetAccount().."\t"..GetName().."\t".."M� R��ng nh�n ���c 1000000 �i�m EXP ")
	end
end

function OnCancel()
end