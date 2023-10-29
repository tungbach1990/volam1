

Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\missions\\arena\\rule.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\missions\\arena\\player.lua")

Include("\\script\\global\\logout_head.lua")
IncludeLib("SETTING")
local tbAccMapList = 
{
	[1] = "Ph��ng T��ng",
	[11] = "Th�nh ��",
	[37] = "Bi�n Kinh",
	[80] = "D��ng Ch�u",
	[78] = "T��ng D��ng",
	[162] = "��i L�",
	[176] = "L�m An",
	[20] = "Giang T�n Th�n",
	[53] = "Ba L�ng huy�n",
	[54] = "Nam Nh�c tr�n",
	[99] = "V�nh L�c tr�n",
	[100] = "Chu Ti�n tr�n",
	[101] = "��o H��ng th�n",
	[121] = "Long M�n tr�n",
	[153] = "Th�ch C� tr�n",
	[174] = "Long Tuy�n th�n",
}

tinsert(TB_LOGOUT_FILEFUN, {"\\script\\missions\\arena\\protocol.lua",		"player_logout"})

function allocate_map(ParamHandle, ResultHandle)
--[[			do 
		return Talk(1, "", "Ch�c n�ng ch�a m�!")
	end--]]
	
	local pDungeonType = DungeonType["arena"]
	if pDungeonType then
		local pDungeon = pDungeonType:new_dungeon(pDungeonType.TEMPLATE_MAP_ID)
		if pDungeon then
			local handle = OB_Create()
			ObjBuffer:PushObject(handle, pDungeon.nMapId)
			RemoteExecute("\\script\\missions\\arena\\protocol.lua", "reg_map", handle)
			OB_Release(handle)
		end
	end


function player_enter_map(ParamHandle, ResultHandle)
	-- do 
	-- 	return Talk(1, "", "Ch�c n�ng ch�a m�!")
	-- end
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	local nTimeOut = ObjBuffer:PopObject(ParamHandle)
	local nPlayerIndex = SearchPlayer(szName)	
	if nPlayerIndex > 0 then
		local nCurMapId = CallPlayerFunction(nPlayerIndex, GetWorldPos )
		if not CallPlayerFunction(nPlayerIndex, tbPlayer.CheckState, tbPlayer) or not %tbAccMapList[nCurMapId] then
			CallPlayerFunction(nPlayerIndex, Msg2Player, "B�n �� hi�n t�i ng��i �ang ��ng kh�ng th� �i v�o c�nh K� Tr��ng")
			player_cancel(szName)
		else
--			local tbOpt = 
--			{
--				{"����", player_enter_map_confirm, {nMapId, nTimeOut}},
--				{"����", player_cancel, {szName}},
--				{"�ȵ�"}
--			}
--			CallPlayerFunction(nPlayerIndex, CreateNewSayEx, "���ڿ��Խ��뾺����", tbOpt)
			CallPlayerFunction(nPlayerIndex, player_enter_map_confirm, nMapId, nTimeOut)
		end
	end
end

function player_logout(nPlayerIndex)
	if nPlayerIndex > 0 then
		local szName = CallPlayerFunction(nPlayerIndex, GetName)
		local handle = OB_Create()
		ObjBuffer:PushObject(handle, szName)
		RemoteExecute("\\script\\missions\\arena\\protocol.lua", "player_logout", handle)
		OB_Release(handle)
	end
end

function player_cancel(szName)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szName)
	RemoteExecute("\\script\\missions\\arena\\protocol.lua", "player_cancel", handle)
	OB_Release(handle)
end

function player_enter_map_confirm(nMapId, nTimeOut)

	local szName = GetName()
	local nCurMapId = GetWorldPos()
	if not tbPlayer:CheckState() or not %tbAccMapList[nCurMapId] then
		player_cancel(szName)
		return 
	end
	local nCurTime = GetCurServerTime()
	if nTimeOut < nCurTime then
		return Talk(1, "", "Thao t�c n�y �� v��t qu� th�i gian")
	end
	
	local nLastMapId, nX, nY = GetWorldPos()
	local nLastFightState = GetFightState()
	local tbLastState  = {tbPos ={nLastMapId, nX, nY}, nFightState = nLastFightState}
	
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szName)
	ObjBuffer:PushObject(handle, tbLastState)
	RemoteExecute("\\script\\missions\\arena\\protocol.lua", "set_last_state", handle)
	OB_Release(handle)
	local pDungeonType = DungeonType["arena"]
	if pDungeonType then
		NewWorld(nMapId, pDungeonType:GetReadyPos())
	end
end


function set_last_state(nParam, ParamHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	local tbLastState = ObjBuffer:PopObject(ParamHandle)

	if SubWorldID2Idx(nMapId) >= 0 then
		local pDungeon = DungeonList[nMapId]
		if pDungeon then
			pDungeon:SetLastState(szName, tbLastState)
		end
	end
end

function signup_callback(nParam, ParamHandle)
	-- 		do 
	-- 	return Talk(1, "", "Ch�c n�ng ch�a m�!")
	-- end
	local szName = ObjBuffer:PopObject(ParamHandle)
	local bFind = ObjBuffer:PopObject(ParamHandle)
	
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 and not bFind then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "B�o danh th�nh c�ng. �ang t�m ��i th�, xin h�y ��i �")
	end
end


function finded_oppoent(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, Msg2Player, "T�m ���c ��i th�")
	end
end

function wait_map(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, Msg2Player, "�ang chu�n b� ��u tr��ng c�a C�nh K� Tr��ng�")
	end
end

function notify_oppoent_cancel(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, Msg2Player, "��i th� c�a ng��i �� b� tr�n n�y, h� th�ng �ang t�m ��i th� m�i�")
	end
end
-------------------------------------------------------




function on_player_enter_map(szName, nMapId)
	-- 	do 
	-- 	return Talk(1, "", "Ch�c n�ng ch�a m�!")
	-- end
	
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szName)
	ObjBuffer:PushObject(handle, nMapId)
	RemoteExecute("\\script\\missions\\arena\\protocol.lua", "player_enter_map", handle, "set_last_state")
	OB_Release(handle)
end

function on_player_leave_map(szName, nMapId)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szName)
	ObjBuffer:PushObject(handle, nMapId)
	RemoteExecute("\\script\\missions\\arena\\protocol.lua", "player_leave_map", handle)
	OB_Release(handle)
end

function on_begin_battle(nMapId, tbMemberMap)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nMapId)
	for szName, pInfo in tbMemberMap do
		if pInfo then
			ObjBuffer:PushObject(handle, szName)
		end
	end
	RemoteExecute("\\script\\missions\\arena\\protocol.lua", "begin_battle", handle)
	OB_Release(handle)
end



function apply_signup()
	-- do 
	-- 	return Talk(1, "", "Ch�c n�ng ch�a m�!")
	-- end
-- Dieu chinh dk bao danh, edit by ThanhLD - 20130516
	local nTime = tonumber(GetLocalDate("%H%M"))
	if nTime < 2000 or  nTime > 2100 then
		return Talk(1, "", "Th�i gian b�o danh t� 20h00 ��n 21h00 h�ng ng�y.")
	end
	
	local nMapId = GetWorldPos()
	if not %tbAccMapList[nMapId] then
		return Talk(1, "", "Ch� c� th� b�o danh t�i t�n th� th�n ho�c th�nh th�.")
	end
	
	if ST_GetTransLifeCount()  < 3  or  GetLevel() < 150  then
		return Talk(1, "", "C�p 150 v� Tr�ng sinh 3  tr� l�n m�i ���c b�o danh.")
	end

	local _, nValue = GetRoleEquipValue()
	if nValue < 40000 then
		return Talk(1, "", "Gi� tr� binh gi�p 40.000 tr� l�n m�i ���c b�o danh.")
	end
	local nCurCount = GetTask(tbPlayer.TSK_CUR_COUNT)
	local nYW = tonumber(GetLocalDate("%Y%W"))
	if ( nCurCount >= tbPlayer.PER_WEEK_COUNT and GetTask(tbPlayer.TSK_CUR_WEEK) == nYW) then
		return Talk(1, "", "M�i tu�n ch� tham gia ���c 20 tr�n.")
	end
	local nMapId = GetWorldPos()
	if not tbPlayer:CheckState() then
		return Talk(1, "", "Trong tr�ng th�i �y th�c ho�c b�y b�n kh�ng th� b�o danh.")
	end
	
	local nRank = tbPlayer:GetRank()
	local nGroup = 0	
	if nRank < 1200 then
		nGroup = 1
	elseif 1200 <= nRank and nRank <= 2599 then
		nGroup = ceil((nRank - 1200 + 1)/50 + 1)
	else
		nGroup = ceil((2600 - 1200 + 1)/50 + 1)
	end
	
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, GetName())
	ObjBuffer:PushObject(handle, nGroup)
	if nGroup > 0 then
		RemoteExecute("\\script\\missions\\arena\\protocol.lua", "apply_search_opponents", handle, "signup_callback")
	end
	OB_Release(handle)
end

