Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\config\\12\\head.lua")
Include("\\script\\activitysys\\config\\12\\carriage.lua")
Include("\\script\\activitysys\\config\\12\\variables.lua")

local StartDate = 20120402
local EndDate = 20120430

local tbItem2Skill =
{
	["6,1,3146"] = {tbParam = {462, 30, 1, 3 * 18}, nCD = 3, nTaskIndex = 3065},  --��Ѫ��
	["6,1,3147"] = {tbParam = {493, 10, 1, 10 * 18}, nCD = 15, nTaskIndex = 3066}, --���ٷ�
	["6,1,3148"] = {tbParam = {1008, 1, 1, 7 * 18}, nCD = 15, nTaskIndex = 3067},  --�񵲷�
	["6,1,3149"] = {tbParam = {1206, 1, 1, 10 * 18}, nCD = 15, nTaskIndex = 3068}, --�����
}

function main(nItemIndex)
	
	local bFound = nil
	local tbNpcList = GetAroundNpcList(15)
	local szPlayerName = GetName()
	local G,D,P = GetItemProp(nItemIndex)
	local szGDP = format("%d,%d,%d", G, D, P)
	local tbSkillParam = %tbItem2Skill[szGDP]
	
	if not tbSkillParam then
		return 1
	end
	
	
	if PlayerFunLib:CheckTotalLevel(150,%szLEVEL_TIP,">=") ~= 1 then
		return 1
	end
	
	if pActivity:CheckCamp(0, %szCAMP_TIP) ~= 1 then
		return 1
	end
	
	local nLastUseTime = GetTask(tbSkillParam.nTaskIndex)
	local nCurTime = GetCurServerTime()
	
	if nCurTime - nLastUseTime < tbSkillParam.nCD then
		Msg2Player("��o c� �ang trong th�i gian ch�, ��i m�t l�t r�i h�y s� d�ng.")
		return 1
	end
	
	local nNpcIdx
	for i=1,getn(tbNpcList) do
		nNpcIdx = tbNpcList[i]
		local nTaskId = GetNpcParam(nNpcIdx, %NPC_PARAM_TASK_ID)
		if pActivity.tbTaskList[nTaskId] and pActivity.tbTaskList[nTaskId].szPlayerName == szPlayerName then
			bFound = 1
			break
		end
	end
	
	if bFound then
		AddNpcSkillState(nNpcIdx, unpack(tbSkillParam.tbParam))
		SetTask(tbSkillParam.nTaskIndex, nCurTime)
		return
	else
		Msg2Player("H�y ��n g�n Xe Ng�a c�a m�nh �� s� d�ng ��o c� n�y")
		return 1
	end
end
