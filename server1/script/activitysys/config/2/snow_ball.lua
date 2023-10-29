Include("\\script\\activitysys\\config\\2\\head.lua")
Include("\\script\\activitysys\\config\\2\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local tbCampName = {
	[1] = {[1]="Ng��i Tuy�t T�m", [2]="�ng Gi� Noel T�m"},
	[2] = {[1]="Ng��i Tuy�t V�ng", [2]="�ng Gi� Noel V�ng"},
}

function AskForSpecialPlayerResult(nParam, hResult)
	local szTargetName = ObjBuffer:PopObject(hResult)
	local szName = ObjBuffer:PopObject(hResult)
	local nCamp = ObjBuffer:PopObject(hResult)
	local nResult = ObjBuffer:PopObject(hResult)
	
	local nPlayerIndex = SearchPlayer(szTargetName)
	if nPlayerIndex <= 0 then
		return
	end
	
	local szMsg = "Ng��i b� Tuy�t C�u c�a ng��i ch�i %s n�m tr�ng, bi�n th�nh 1 %s."
	if nResult ~= 1 then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", format(szMsg, szName, %tbCampName[nCamp][1]))
		return
	end
	
	CallPlayerFunction(nPlayerIndex, pActivity.SetTaskDaily, pActivity, %TSK_CAMP_FLAG, nCamp*10+2)
	CallPlayerFunction(nPlayerIndex, pActivity.SB_ChangeToSnowman, pActivity)
	CallPlayerFunction(nPlayerIndex, Talk, 1, "", format(szMsg, szName, %tbCampName[nCamp][2]))
end

function main(nItemIndex, nTargetNpcIndex)
	if (not nTargetNpcIndex) or (nTargetNpcIndex <= 0) or (nTargetNpcIndex == PlayerIndex) then
		return 1
	end
	
	if tonumber(GetLocalDate("%Y%m%d%H%M")) >= pActivity.nEndDate then
		Msg2Player("V�t ph�m n�y �� h�t h�n")
		RemoveItemByIndex(nItemIndex)
		return 1
	end
	
	if not PlayerFunLib:CheckTotalLevel(150, "default", ">=") then
		return 1
	end
	
	if pActivity:GetTaskDaily(%TSK_SNOW_BALL) >= %MAX_SNOW_BALL then
		Talk(1, "", format("M�i ng�y nhi�u nh�t s� d�ng %d Tuy�t C�u.", %MAX_SNOW_BALL))
		return 1
	end
	
	if not PlayerFunLib:CheckInMap("11,1,37,176,162,78,80,174,121,153,101,99,100,20,53,175", "Ch� c� th� s� d�ng t�i c�c th�nh th� ho�c c�c t�n th� th�n.") then
		return 1
	end
	
	local nTargetIndex = NpcIdx2PIdx(nTargetNpcIndex)
	if nTargetIndex == 0 then
		Talk(1, "", "Ch� c� th� s� d�ng ��i v�i ng��i ch�i.")
		return 1
	end
	
	if nTargetIndex == PlayerIndex then
		Talk(1, "", "Kh�ng th� s� d�ng cho b�n th�n.")
		return 1
	end
	
	local szName1 = CallPlayerFunction(nTargetIndex, GetName)
	
	local nCampFlag = CallPlayerFunction(nTargetIndex, pActivity.GetTaskDaily, pActivity, %TSK_CAMP_FLAG)
	if nCampFlag == 0 then
		
		local nCamp = random(1,2)
		nCampFlag = nCamp * 10
		CallPlayerFunction(nTargetIndex, pActivity.SetTaskDaily, pActivity, %TSK_CAMP_FLAG, nCamp*10+1)
		
		local nType = random(1,1000)
		if nType <= 10 then
			local handle = OB_Create()
			local szTargetName = CallPlayerFunction(nTargetIndex, GetName)
			ObjBuffer:PushObject(handle, szTargetName)
			ObjBuffer:PushObject(handle, GetName())
			ObjBuffer:PushObject(handle, nCamp)
			RemoteExecute("\\script\\activitysys\\config\\2\\2012christmas_day.lua",
											"SnowmanBattle:AskForSpecialPlayer", handle,
											"AskForSpecialPlayerResult", nCamp)
											
			OB_Release(handle)
		end
		
	end
	
	CallPlayerFunction(nTargetIndex, pActivity.SB_ChangeToSnowman, pActivity)
	pActivity:AddTaskDaily(%TSK_SNOW_BALL, 1)
	PlayerFunLib:GetItem(%tbSB_Award["UseSnowBall"][1], 1, %EVENT_LOG_TITLE, "UseSnowBall")
	
end