-- ��ɽ��̨�Ի�
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\missions\\huashanqunzhan\\high_grade\\ready\\readyclass.lua")
Include("\\script\\missions\\huashanqunzhan\\mid_grade\\ready\\readyclass.lua")
Include("\\script\\lib\\awardtemplet.lua")
function huashanqunzhan_SignUpMain(nStep)
	local tbSay = nil
	local nPlayerLevel = GetLevel()
	
	local tbReadyMission = nil
	if nPlayerLevel < 50 then
		tbReadyMission = nil
	elseif nPlayerLevel < 120 then
		tbReadyMission = huashanqunzhan_tbReady_M
	else
		tbReadyMission = huashanqunzhan_tbReady_H
	end
	
	local nState = tbReadyMission and tbReadyMission:CheckMathState() or nil
	if nStep == 1 then
		if nState == 1 then
			tbSay = 
			{
				format("<dec><npc>%s �� b�t ��u b�o danh, ph� b�o danh l� 10 v�n l��ng, ��i hi�p c� ��ng � kh�ng?",tbReadyMission.tbRef.szMatchName),
				 "B�o danh tham gia/#huashanqunzhan_SignUpMain(2)",
			}
		elseif nState == 0 or nState == -1 then
			local tbWorld = 
			{
				{"-","-","-"},
				{"Ng�y", "S� tr�n", "Th�i gian"},
				{"-","-","-"},
				{"Th� 2 ��n th� 6", "2", "10:00 - 10:45"},
				{"","", "22:00 - 22:45"},
				{"-","-","-"},
				{"","","10:00 - 10:45"},
				{"Th� 7 v� Ch� nh�t", "3", "15:00 - 15:45"},
				{"","","22:00 - 22:45"},
				{"-","-","-"},
			}
			local szMsg = nState == 0 and "Tr�n ��u v�n ch�a b�t ��u." or "Tr�n ��u �ang ���c ti�n h�nh."
			tbSay = 
			{
				"<dec><npc>"..szMsg.."Th�i gian thi ��u nh� sau:<enter>"..huashanqunzhan_drawtable(tbWorld),
			}
		elseif nState == -2 then
			local tbMacthMission	= tbReadyMission.tbRef
			
			local szWinerName		= tbMacthMission:GetMissionS(tbMacthMission.tbMissionS.WINER_INDEX)
			local szMsg				= (szWinerName and szWinerName ~= "")  and format("Ng��i chi�n th�ng: <color=yellow>%s<color>", szWinerName) or "Tr�n n�y kh�ng c� Ng��i chi�n th�ng"
			
			tbSay = 
			{
				format("<dec><npc>Tr�n %s �� ph�n th�ng b�i, %s", tbMacthMission.szMatchName, szMsg),
				
			}
		elseif nState == nil then
			tbSay = 
			{
				"<dec><npc>Ng��i ch�i c�p tr�n 50 �� n�p th� m�i c� th� tham gia Hoa S�n ��i Chi�n. C�p t� 50 ��n 119 c� th� tham gia Hoa S�n ��i Chi�n trung c�p; c�p 120 tr� l�n c� th� tham gia Hoa S�n ��i Chi�n cao c�p. Ng��i ch�a �� ��ng c�p �� tham gia.",
			}
		end		
	elseif nStep == 2 then
		if GetCash() < tbReadyMission.nMoney then
			return Say(format("Ph� b�o danh l� %d l��ng, ng�n l��ng tr�n ng��i kh�ng ��.", tbReadyMission.nMoney), 0)
		end
		
		
		if tbReadyMission == nil then
			return Say("��ng c�p ch�a �� 50, kh�ng th� tham gia b�o danh.", 0)
		else
			return huashanqunzhan_SignUpStep(tbReadyMission)
		end
	end
	
	if  huashanqunzhan_CheckGetAward(tbReadyMission.tbRef) then
		tinsert(tbSay,2,"Ph�n th��ng cho ng��i chi�n th�ng./huashanqunzhan_GetAward")
	end
	
	tinsert(tbSay, "K�t th�c ��i tho�i/OnCancel")
	CreateTaskSay(tbSay)
end


function huashanqunzhan_SignUpStep(tbMission)
	local nState = tbMission:CheckMathState()
	if nState == 1 then
		tbMission:GotoReadyPlace()
	elseif nState == 0 then
		Say("Tr�n ��u v�n ch�a b�t ��u.", 0)
	elseif nState == -1 then
		Say("Tr�n ��u �ang ti�n h�nh, xin ��i ��n tr�n sau.", 0)
	elseif nState == -2 then
		
		local tbMacthMission	= tbMission.tbRef
		local szWinerName		= tbMacthMission:GetMissionS(tbMacthMission.tbMissionS.WINER_INDEX)
		local szMsg				= szWinerName and format("Ng��i chi�n th�ng: <color=yellow>%s<color>", szWinerName) or "Tr�n n�y kh�ng c� Ng��i chi�n th�ng"
		local tbSay = 
		{
			format("<dec><npc>Tr�n %s �� ph�n th�ng b�i, %s", tbMacthMission.szMatchName, szMsg),
			"K�t th�c ��i tho�i/OnCancel"
		}
		CreateTaskSay(tbSay)
	end
	
end

function huashanqunzhan_GetAward()
	if CalcFreeItemCellCount() < 20 then
		return Say("T�i h�nh trang �� ��y, h�y d�n d�p h�nh trang �� b�o ��m an to�n cho v�t ph�m.",0)
	end
	local tbAward = 
	{
		{szName="Lam Th�y Tinh", tbProp={4, 238, 1, 1, 0, 0}, nCount = 2},
		{szName="L�c Th�y Tinh", tbProp={4, 240, 1, 1, 0, 0}, nCount = 2},
		{szName="T� Th�y Tinh", tbProp={4, 239, 1, 1, 0, 0}, nCount = 2},
		{szName="Tinh H�ng B�o Th�ch", tbProp={4, 353, 1, 1, 0, 0}, nCount = 12},
		{szName="V� L�m M�t T�ch", tbProp={6, 1, 26, 1, 0, 0}},
		{szName="T�y T�y Kinh", tbProp={6, 1, 22, 1, 0, 0}},
	}
	local nCount = GetTask(huashanqunzhan.TSK_Winer)
	
	tinsert(tbAward, { nJxb = 90000 * nCount})
	
	tbAwardTemplet:GiveAwardByList(tbAward, "L�i ��i Hoa S�n ��i Chi�n")
	SetTask(huashanqunzhan.TSK_Winer, 0)
end


function huashanqunzhan_CheckGetAward(tbMission)
	local nState = tbMission:GetMissionState()
	local nPlayerMathId = GetTask(tbMission.TSK_MatchId)
	local nMathId = tbMission:GetMissionV(tbMission.tbMissionV.MATCH_ID)
	if nPlayerMathId == nMathId and nState == 2 and GetTask(tbMission.TSK_Winer) > 0 then
		
		return 1
	end
	return nil
end

function OnCancel()
	
end




function huashanqunzhan_drawtable(tbWord)
	local nLen = 0
	local str = ""
	for _, tb2 in tbWord do
		for _, sz in tb2 do
			if sz and nLen < strlen(sz) then
				nLen = strlen(sz)
			end
		end
	end
	for _, tb2 in tbWord do
		local str_space
		for j, sz in tb2 do
			if sz ~= "-" or ( sz == "-" and j==1 )then
				str = str.."|"
			else
				str = str.."-"
			end
			 str_space = sz == "-" and "-" or " "
			str = str..strfill_center(sz,nLen, str_space)
		end
		str = str.."|"
	
		str = str.."<enter>"
	end
	return str
end
