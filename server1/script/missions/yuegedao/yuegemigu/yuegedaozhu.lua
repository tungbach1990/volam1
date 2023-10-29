Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\missions\\yuegedao\\yuegemigu\\yuegemiguworld.lua")
Include("\\script\\lib\\player.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	if floor(GetTask(2885)/100) == 12 then
		tbDailog.szTitleMsg = "<#><npc>Ta l� Nguy�t Ca ��o Ch�"
		tbDailog:AddOptEntry("B�t ��u quy�t ��u", beginfight, {nNpcIndex})
	else
		tbDailog.szTitleMsg = "<#><npc>Ng��i ��nh kh�ng th�ng n�i ta ��u, nhanh r�i kh�i ��y �i"
	end
	tbDailog:AddOptEntry("Ta mu�n r�i kh�i!", leavemigu)
	tbDailog:Show() 
end

function beginfight(nNpcIndex)
	local szPlayerName = GetName()
	local nRoomId = YueGeMiGuWorld.tbPlayer2RoomId[szPlayerName]
	if nRoomId == nil or nRoomId <= 0 then
		return
	end
	local tbRoom = YueGeMiGuWorld.tbRoomSet[nRoomId]
	if tbRoom == nil then
		return
	end
	local _, _, nMapIndex = GetPos()
	local nMapId = SubWorldIdx2ID(nMapIndex)
	if nMapId ~= 969 then
		return
	end
	tbRoom:ChangeNpc(nNpcIndex, 0)
end

function leavemigu()
	NewWorld(968, 1566, 2836)
end