Include("\\script\\activitysys\\config\\25\\head.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function pActivity:CheckCondition()
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 3 then
		Msg2Player("C�n ph�i c� 3 ng��i t� ��i v�i nhau m�i c� th� tham gia")
		return
	end
	local tbMarkList = 
	{
		[1] = {395, 199, 423},
		[2] = {404, 255, 424},
		[3] = {256, 397, 248},
	}
	local nSum = 0
	local nMul = 1
	for i = 1, nTeamSize do
		local nPlayerIndex = GetTeamMember(i)
		local tbEquip = DynamicExecuteByPlayer(nPlayerIndex, "", "GetAllEquipment")
		if tbEquip[12] and  tbEquip[12] > 0 then
			local _, _, nP = GetItemProp(tbEquip[12])
			nSum = nSum + nP
			nMul = nMul * nP
		else
			Msg2Player("��i ng� tham gia kh�ng ph� h�p �i�u ki�n, b�n kh�ng th� ��p tr�ng") 
			return
		end
	end
	local nFlag = 0
	for i = 1, 3 do
		local nTmpSum = tbMarkList[i][1] + tbMarkList[i][2] + tbMarkList[i][3]
		local nTmpMul = tbMarkList[i][1] * tbMarkList[i][2] * tbMarkList[i][3]
		if nSum == nTmpSum and nMul == nTmpMul then
			nFlag = 1
			break
		end
	end
	if nFlag == 0 then
		Msg2Player("��i ng� tham gia kh�ng ph� h�p �i�u ki�n, b�n kh�ng th� ��p tr�ng")
		return
	end 
	return 1
end


function pActivity:AddYuanDanDialogNpc()
	local tbNpc = {
	[1] = {
			szName = "Nguy�n ��n", 
			nLevel = 95,
			nMapId = 37,
			nPosX = 1760 * 32,
			nPosY = 3056 * 32,
			nNpcId = 1612,
			nIsBoss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua"
		},
	[2] = {
			szName = "Nguy�n ��n", 
			nLevel = 95,
			nMapId = 37,
			nPosX = 1658 * 32,
			nPosY = 3168 * 32,
			nNpcId = 1612,
			nIsBoss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua"
		},
	[3] = {
			szName = "Nguy�n ��n", 
			nLevel = 95,
			nMapId = 37,
			nPosX = 1704 * 32,
			nPosY = 3120 * 32,
			nNpcId = 1612,
			nIsBoss = 0,
			szScriptPath = "\\script\\activitysys\\npcdailog.lua"
		},
	}
	for i = 1, getn(tbNpc) do
		basemission_CallNpc(tbNpc[i])
	end
end

function pActivity:GetGoldExp(nExp, bFlag, szLogTitle, TaskVarIdx_GetGoldExpSum, nGoldExpLimit)
	local szFailMsg = "Nh�n kinh nghi�m �� ��, kh�ng th� nh�n th�m kinh nghi�m nhi�u h�n"
	local szOption = "<"
	if self:CheckTask(TaskVarIdx_GetGoldExpSum, nGoldExpLimit, szFailMsg, szOption) then
		self:AddTask(TaskVarIdx_GetGoldExpSum, nExp/100000)
		PlayerFunLib:AddExp(nExp, bFlag, szLogTitle)
	end
end
