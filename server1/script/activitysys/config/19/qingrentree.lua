Include("\\script\\activitysys\\config\\19\\valentinehead.lua")
Include("\\script\\activitysys\\config\\19\\config.lua")
Include("\\script\\activitysys\\config\\19\\head.lua")

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")

local _OnBreak = function()
	Msg2Player("Thu th�p ��t �o�n")
end

local _GetAward = function(nNpcIdx, dwNpcId)
	if nNpcIdx <= 0 or GetNpcId(nNpcIdx) ~= dwNpcId then
		return 0
	end	
	
	if PlayerFunLib:CheckFreeBagCell(1,"H�nh trang kh�ng ��") ~= 1 then
		return 0
	end
	
	local nTreePickStep = GetNpcParam(nNpcIdx, TREE_PICKSTEP)
	SetNpcParam(nNpcIdx, TREE_PICKSTEP, nTreePickStep + 1)
	Msg2Player("Thu th�p k�t th�c!")
	if nTreePickStep == 1 then
		local tbAward =  {{szName = "L� H�p T�nh Nh�n", tbProp = {6, 1, 2702, 1, 0, 0}, nExpiredTime = 20110224},}
		tbAwardTemplet:GiveAwardByList(tbAward, "Thu th�p L� H�p T�nh Nh�n")
		AddNpcSkillState(nNpcIdx, 662,1, 1, 0)	-- �رո�̾��
	end
end 

function main()

	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	local szNpcName = GetNpcName(nNpcIdx)
	local nTreeType = GetNpcParam(nNpcIdx, TREE_TYPE)
	local nTreeGrowStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	if nTreeGrowStep == 4 then
		
		if CheckGetAwardBelong(nNpcIdx) ~= 1 then
				return
		end
			
		local nTreePickStep = GetNpcParam(nNpcIdx, TREE_PICKSTEP)
		if nTreePickStep == 0 then -- ��û��ʼ
			Msg2Player("C�y T�nh Nh�n sau khi tr��ng th�nh 30 ph�t sau s� kh� h�o, trong v�ng 30 ph�t xin h�y thu ho�ch L� H�p.")
			SetNpcParam(nNpcIdx, TREE_PICKSTEP, nTreePickStep + 1)
			nTreePickStep = 1
		end
		
		if nTreePickStep == 1 then -- ��ʼ��ժ
			Msg2Player("B�t ��u thu ho�ch")
			tbProgressBar:OpenByConfig(1, %_GetAward, {nNpcIdx, dwNpcId}, %_OnBreak)
			return 
		end
		
		if nTreePickStep == 2 then
			Msg2Player("�� thu ho�ch r�i")
			return
		end
		
		return
	end
	
	lib:ShowMessage("C�y T�nh Nh�n �ang sinh tr��ng")
	
end

function CheckGetAwardBelong(nNpcIdx)
	if CheckValentineLevel() ~= 1 then
		return 0
	end
	
	local szBelongPlayerIdx = NPC_DATA[nNpcIdx]
	if szBelongPlayerIdx ~= GetName() then
		Msg2Player("��y kh�ng ph�i l� c�y c�a b�n")
		return 0
	end
	return 1
end