Include("\\script\\task\\150skilltask\\emei\\register.lua")
Include("\\script\\task\\150skilltask\\150skilltaskhead.lua")

pTask.tbFactSkill = {
	[4] = {[90] = {380, 328, 332}, [120] = {712},},
}

function pTask:CheckMissionCondition()
	return %Check150SkillTaskCondition(self.tbFactSkill)
end

function pTask:Talk(szMsg)
	Talk(1, "", szMsg)
end

local _OnBreak = function(nNpcIndex)
	Msg2Player("Thu th�p ��t �o�n")
end

local _GetAward = function(nNpcIndex, dwNpcID, nAddStepNum, nTaskId, szTaskName, nGotoDetailId)
	if nNpcIndex == nil then
		Msg2Player("Ng��i thu th�p th�t b�i.")
		return 0
	end
	
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcID then
		Msg2Player("Ng��i thu th�p th�t b�i.")
		return 0
	end	
	
	if IsNpcHide(nNpcIndex) == 1 then
		Msg2Player("Ng��i thu th�p th�t b�i.")
		return 0
	end
	
	if PlayerFunLib:CheckFreeBagCell(1,"H�nh trang kh�ng ��") ~= 1 then
		return 0
	end
	
	Msg2Player("Thu th�p k�t th�c!")
	
	local tbAward = {}
	tbAward = {
		{szName = "Tri�m Tuy�t B�ng Li�n", tbProp = {6, 1, 2911, 1, 0, 0}, nBindState = -2,},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "Nhi�m v� k� n�ng c�p 150 ph�i Nga My thu th�p nh�n ���c ��o c� Tri�m Tuy�t B�ng Li�n")
	G_TASK:ExecEx(szTaskName, nGotoDetailId, nAddStepNum, nTaskId)
	HideNpc(nNpcIndex, 20 * 18)
end 

function pTask:GetBingLian(nAddStepNum, nTaskId, szTaskName, nGotoDetailId)
	local nNpcIndex = GetLastDiagNpc()
	local dwNpcIndex = GetNpcId(nNpcIndex)
	
	Msg2Player("B�t ��u thu ho�ch")
	tbProgressBar:OpenByConfig(2, %_GetAward, {nNpcIndex, dwNpcIndex, nAddStepNum, nTaskId, szTaskName, nGotoDetailId}, %_OnBreak, {nNpcIndex})
end