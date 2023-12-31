-- Include Files
Include("\\script\\lib\\objbuffer_head.lua");
Include("\\script\\missions\\basemission\\dungeon.lua");
Include("\\script\\missions\\miniencounter\\player.lua");
Include("\\script\\missions\\miniencounter\\publicdef.lua");
Include("\\script\\missions\\miniencounter\\mapmanager.lua");

IncludeLib("SETTING");

tbPlayerQueue = {} --玩家报名列队，

-- Function	: apply_signup
-- Description : player signs up from officer 
function apply_signup()
	if DungeonGlobalData:CheckActivityTime() ~= 1 then
		Talk(1, "", "M鏸 ng祔 t� 9 gi� n 23 gi� Ph� Li Xung чt Chi課 m韎 m�, ngi i th猰 甶.");
		return nil;
	end

	-- Check Current Player State
	if ST_GetOffliveState() == 1 then						   -- 离线托管
		Talk(1, "", "駓 th竎 r阨 m筺g kh玭g th� ti課 h祅h b竜 danh.");
		return nil;
	end

	if GetOnlineCommissionStatus() == 1 then					-- 在线托管
		Talk(1, "", "駓 th竎 tr猲 m筺g kh玭g th� ti課 h祅h b竜 danh.");
		return nil;
	end

	if GetStallState() == 1 then								-- 摆摊状态
		Talk(1, "", "B竛 h祅g kh玭g th� ti課 h祅h b竜 danh.");
		return nil;
	end

	local nCurMapID = GetWorldPos();
	if DungeonGlobalData:CheckLegalPrepareMap(nCurMapID) ~= 1 then
		Talk(1, "", "Ch� c� th� � th祅h ch輓h v� T﹏ Th� th玭 ti課 h祅h b竜 danh.");
		return nil;
	end

	if ST_IsTransLife() ~= 1 and GetLevel() < DungeonGlobalData.PLAYER_LEVEL_LIMIT then
		Talk(1, "", format("C蕄 %d tr� l猲 ho芻 ngi ch琲 tr飊g sinh m韎 c� th� ti課 h祅h b竜 danh.", DungeonGlobalData.PLAYER_LEVEL_LIMIT));
		return nil;
	end

	if (-1 == GetLastFactionNumber()) then
		Talk(1, "", "Chi課 s� phe n祇 gia nh藀 s� m玭 h鋍 v� ngh� m韎 頲 b竜 danh, chi課 trng kh鑓 li謙 kh玭g th� a 頲!");
		return nil;
	end
	
	-- Notify Relay
	local szRoleName = GetName();							   -- 角色名

	local hObject = OB_Create();								-- 创建一个对象
	ObjBuffer:PushObject(hObject, szRoleName);
	ObjBuffer:PushObject(hObject, nCurMapID)
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "apply_signup", hObject, "apply_signup_callback");
	OB_Release(hObject);
end

function apply_signup_callback(nParam, ParamHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);		-- 角色名
	local nSignupResult = ObjBuffer:PopObject(ParamHandle);	 -- Relay上报名处理结果：1 - 报名成功, 2 - 已报名, 3 - 在黑名单, 其他值为失败
	
	local nPlayerIndex =  SearchPlayer(szRoleName)
	if (not nPlayerIndex) or (nPlayerIndex <= 0) then
		return
	end 
	
	local szMag

	if nSignupResult == 1 then
		szMsg = "B竜 danh th祅h c玭g! H穣 ki猲 nh蒼 i � th祅h ch輓h v� T﹏ Th� th玭  b総 u, ng 甶 n b秐  phi ph竝, b祔 h祅g, 駓 th竎 ho芻 ng xu蕋 n誹 kh玭g ngi c� th� b� c蕀 u 10 ph髏. N誹 nh� ngi v蒼 c遪 chuy謓 kh竎 c莕 l祄 th� h駓 b竜 danh 甶."
	elseif nSignupResult == 2 then
		szMsg = "Ngi  trong danh s竎h x誴 h祅h r錳, kh玭g c莕 b竜 danh l筰."
	elseif nSignupResult == 3 then
		szMsg = format(
			"Nam t� H竛 i trng phu nh蕋 ng玭 c鰑 nh. Х mu鑞 ra chi課 trng tham chi課 t筰 sao l筰 c遪 do d� s� s謙? %d ph髏 sau ngi quay l筰 甶.", 
			DungeonGlobalData.BLACK_LIST_TIME
		)
	elseif nSignupResult == 4 then
		szMsg = "Tr薾 chi課 trc v蒼 ch璦 k誸 th骳, mau ch鉵g quay l筰 ti襫 tuy課 gi誸 ch 甶."
	else
		szMsg = "B竜 danh th蕋 b筰, xin th� l筰!"
	end
	
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", szMsg)
end

function return_map()
	local szRoleName = GetName();

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "return_map", hObject);
	OB_Release(hObject);
end

function cancel_signup()
	local szRoleName = GetName();
	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "cancel_signup", hObject);
	OB_Release(hObject);
end

function allocate_map_dynamically(ParamHandle)
	local szRoleName   = ObjBuffer:PopObject(ParamHandle);

	-- TODO : 开启地图放到人数较少的GS上面
	local nGs = mod(EncounterMapManager.nCurrentGs, 8) + 1;
	local nChooseMapId = DungeonGlobalData.tbGameServerInfo[nGs];

	EncounterMapManager.nCurrentGs = EncounterMapManager.nCurrentGs + 1;
	EncounterMapManager.nCurrentGs = mod(EncounterMapManager.nCurrentGs, 8);

	local nChooseMapIdx = SubWorldID2Idx(nChooseMapId);
	if nChooseMapIdx == nil or nChooseMapIdx < 0 then
		print(">> Debug : not this server.");
		return nil;
	end

	-- create a miniencounter dungeon instance
	local tbDungeonType = DungeonType["miniencounter"];
	if tbDungeonType == nil then
		print(">> Error : tbDungeonType is nil, get miniencounter dungeon failed.");
		return nil;
	end

	local tbDungeon = tbDungeonType:new_dungeon(tbDungeonType.nTemplateMapID);		  -- Create a dungeon instance
	if tbDungeon == nil then
		print(">> Error : tbDungeon is nil, tbDungeonType:new_dungeon() failed.");
		return nil;
	end

	local nMapID  = tbDungeon.nMapId;

	-- [加入本台GS的tbMapList] --
	tbDungeon.nGameState = 1;
	EncounterMapManager:AddMap(tbDungeon);

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, nMapID);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "allocate_map_dynamically", hObject);
	OB_Release(hObject);

end

function enter_map(ParamHandle)	
	local tbPlayerList = ObjBuffer:PopObject(ParamHandle);
	local nMapID	   = ObjBuffer:PopObject(ParamHandle);
	local nReason	  = ObjBuffer:PopObject(ParamHandle);
	local nGameStartTime = ObjBuffer:PopObject(ParamHandle);
	
	if type(tbPlayerList) ~= "table" then
		return
	end
	
	local tbMap = EncounterMapManager:FindInMapList(nMapID);
	if tbMap then
		tbMap.nGameStartTime = nGameStartTime
		if nReason == 0 then
			tbMap:StartWait()
		end
	end

	for i = 1, getn(tbPlayerList) do
		local szRoleName = tbPlayerList[i][1]
		local nCamp = tbPlayerList[i][2]
		tbPlayerQueue[szRoleName] = nil
		
		local nPlayerIndex = SearchPlayer(szRoleName);
		if nPlayerIndex and nPlayerIndex > 0 then
		
			if CallPlayerFunction(nPlayerIndex, DungeonGlobalData.CheckPlayerState, DungeonGlobalData) then
				local nPosX, nPosY = EncounterMap:GetNewWorldPos(nCamp);
				CallPlayerFunction(nPlayerIndex, SetTask, DungeonGlobalData.TASK_BATTLE_PLAYER_CAMP, nCamp);
				CallPlayerFunction(nPlayerIndex, NewWorld, nMapID, nPosX, nPosY);
			else
				CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Tr筺g th竔 c馻 ngi phi ph竝 kh玭g th� v祇 b秐  chi課 trng.")
			end
		end
	end
end

function unforbid_msg(ParamHandle, ResultHandle)
	local szRoleName   = ObjBuffer:PopObject(ParamHandle)
	
	local nPlayerIndex = SearchPlayer(szRoleName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Ngi  頲 m� kh鉧, c� th� b竜 danh Ph� Li Xung чt Chi課.")
end

function return_map_msg(ParamHandle)
	local szRoleName   = ObjBuffer:PopObject(ParamHandle);

	local nPlayerIndex = SearchPlayer(szRoleName);
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return nil;
	end
	
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Ngi kh玭g c� tham gia Ph� Li Xung чt Chi課 ho芻 tr薾 u  k誸 th骳, m阨 b竜 danh l筰.")
end

function cancel_signup_msg(ParamHandle, ResultHandle)
	local szRoleName   = ObjBuffer:PopObject(ParamHandle);
	local nCancelResult = ObjBuffer:PopObject(ParamHandle);	   -- 取消结果：1 - 取消成功，-1 - 取消失败，0 - 未报名

	if nCancelResult == nil then
		return nil;
	end
	
	if nCancelResult == 1 then
		tbPlayerQueue[szRoleName] = nil
	end

	local nPlayerIndex = SearchPlayer(szRoleName);
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		print(">> Error : nPlayerIndex is invalid.");
		return nil;
	end

		local szMsg
	if nCancelResult == 1 then
		szMsg = "H駓 b竜 danh th祅h c玭g."
	elseif nCancelResult == -1 then
		szMsg = "H駓 b竜 danh th蕋 b筰, xin l祄 l筰."
	elseif nCancelResult == 0 then
		szMsg = "Hi謓 t筰 ngi kh玭g c� b竜 danh kh玭g c莕 h駓 b竜 danh."
	elseif nCancelResult == 2 then
		szMsg = "Tr薾 chi課 m� ngi tham gia b竜 danh  vang l猲, b﹜ gi� b総 u h鑙 h薾  mu閚. Mau ch鉵g n ti襫 tuy課 gi誸 ch th玦"
	end
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", szMsg)
end

-- 函数：send_forbid_msg2player
-- 说明：relay发起发送拉黑信息给玩家
-- 返回值：无。
function send_forbid_msg2player(ParamHandle, ResultHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);
	if szRoleName == nil then
		return nil;
	end
	
	tbPlayerQueue[szRoleName] = nil

	local nPlayerIndex = SearchPlayer(szRoleName);
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return nil;
	end
	
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Ngi kh玭g � trong b秐  h頿 ph竝,  h駓 b竜 danh v� b� h� th鑞g cho v祇 danh s竎h 甧n.")
end

-- 函数：send_prepare_fight_msg2player
-- 说明：relay发起发送准备信息给玩家
-- 返回值：无。
function send_prepare_fight_msg2player(ParamHandle, ResultHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);
	if szRoleName == nil then
		print(">> Error : szRoleName is invalid.");
		return nil;
	end

	local nPlayerIndex = SearchPlayer(szRoleName);
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	
	CallPlayerFunction(nPlayerIndex, Msg2Player, "Ph� Li Xung чt Chi課 s緋 b総 u, m鋓 ngi h穣 mau chu萵 b�!")
end

-- 函数：game_finish
-- 说明：relay删除地图释放资源后回调到gs做资源释放操作
-- 返回值：无。
function game_finish(ParamHandle, ResultHandle)
	local nMapID = ObjBuffer:PopObject(ParamHandle);
	if nMapID == nil or nMapID <= 0 then
		print(">> Error : nMapID is invalid.");
		return nil;
	end

	EncounterMapManager:DelMap(nMapID)
end

-- 函数：prepare_query
-- 说明：到relay查询准备队列人数
-- 返回值：无。
function prepare_query()
	local hObject = OB_Create();								-- 创建一个对象

	RemoteExecute(
		"\\script\\missions\\miniencounter\\protocol.lua",
		"get_prepare_list_num",
		hObject,
		"prepare_qurey_callback"
	);

	OB_Release(hObject);
end

-- 函数：prepare_qurey_callback
-- 说明：到relay查询准备队列人数回调函数
-- 返回值：无。
function prepare_qurey_callback(nParam, ParamHandle)
	local nPrepareNum = ObjBuffer:PopObject(ParamHandle);
	if nPrepareNum == nil or nPrepareNum < 0 then
		Talk(1, "", "Ki觤 tra s� li謚 b蕋 thng, xin ki觤 tra l筰!");
		return nil;
	end
	
	local strMsg = format("Hi謓 t筰 s� ngi trong danh s竎h x誴 h祅g l�: %d ngi.", nPrepareNum);
	Talk(1, "", strMsg);
end

-- 函数：notify_relay_game_finish
-- 说明：通知relay比赛结束，删除地图
-- 返回值：无。
function notify_relay_game_finish(nMapId)
	if nMapId == nil then
		print(">> Error : nMapId is invalid");
		return nil;
	end
	
	-- 通知relay比赛结束，删除地图
	local hObject = OB_Create();							-- 创建一个对象
	ObjBuffer:PushObject(hObject, nMapId);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "game_finish", hObject);
	OB_Release(hObject);
end

function AddPlayerToQueue(ParamHandle)
	local szPlayer = ObjBuffer:PopObject(ParamHandle)
	tbPlayerQueue[szPlayer] = 1
end

function DelPlayerFromQueue(ParamHandle)
	local szPlayer = ObjBuffer:PopObject(ParamHandle)
	tbPlayerQueue[szPlayer] = nil
end
