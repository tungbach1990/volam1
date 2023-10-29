
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\2\\variables.lua")
Include("\\script\\activitysys\\config\\2\\award.lua")
Include("\\script\\activitysys\\config\\2\\head.lua")

local _limit = function()
	if GetLevel() < 150 and ST_GetTransLifeCount() == 0 then
		 Talk(1, "", format("��ng c�p c�a ��i hi�p kh�ng �� �� thu th�p C�y Gi�ng Sinh!"))
		 return 1
    end
	if pActivity:GetTaskDaily(%TSK_TREE_LIMIT) >= %MAX_TREE_LIMT then 
		Talk(1, "", format("H�m nay ��i hi�p �� thu th�p %d c�y r�i, ng�y mai l�i ��n nh�.", %MAX_TREE_LIMT))
		return 1
	end
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return 1
	end
end

local _OnBreak = function()
	Msg2Player("Qu� tr�nh thu th�p b� gi�n �o�n.")
end

local _GetAward = function(nNpcIndex, dwNpcId)
	if nNpcIndex <= 0 or GetNpcId(nNpcIndex) ~= dwNpcId then
		return
	end
	if PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1 then
		return
	end
	if %_limit() then
		return
	end
	
	if GetNpcParam(nNpcIndex, 4) == 1 then
		return 
	end
	SetNpcParam(nNpcIndex, 4, 1)
	pActivity:AddTaskDaily(%TSK_TREE_LIMIT,1)
	tbAwardTemplet:Give(%tbTreeAwardList, 1, {EVENT_LOG_TITLE, "get tree award"})
	DelNpc(nNpcIndex)
	
end 



function main()

	local nNpcIndex = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIndex)
	local nHM = tonumber(GetLocalDate("%H%M"))
	if nHM < 1900 or nHM >= 2400 then
		Talk(1 , "", "M�i ng�y ch� c� th� nh�n th��ng trong kho�ng th�i gian t� 19h ��n 24h, �� qu� th�i gian nh�n th��ng c�y bi�n m�t.")
		DelNpc(nNpcIndex)
		return
	end
	if %_limit() then
		return
	end
	-- pActivity:AddTaskDaily(%TSK_TREE_LIMIT,1)
	tbProgressBar:OpenByConfig(13, %_GetAward, {nNpcIndex, dwNpcId}, %_OnBreak)
end



