
Include("\\script\\missions\\dangboss\\dangbaossclass.lua")

Include("\\script\\lib\\composeclass.lua")
Include("\\script\\event\\qingren_jieri\\200902\\event.lua");	


if not tbDangBossDailog then
	tbDangBossDailog = tbBaseClass:new()
end




function tbDangBossDailog:_init(tbTaskCtrl)
	self.szClassName = "tbDangBossDailog"
	self.tbTask = tbTaskCtrl
	self.nStartDate = 090117
	self.nEndDate = 090217
end

function tbDangBossDailog:IsActDay()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	--return self.nStartDate <= nDate and nDate <= self.nEndDate
	return 1
end

function tbDangBossDailog:Main()
	Talk(1, "", "Ho�t ��ng t�m  ��ng.")
	do return end
	if self:IsOpenModule() ~= 1 then
		return Talk(1, "", "Ho�t ��ng t�m  ��ng.")
	end
	
	if self:IsActDay() ~= 1 then
		return Talk(1, "", "Ho�t ��ng �� k�t th�c.")
	end
	
	local tbSay = 
	{
		"<dec><npc>�G�n ��y quan ph� c� t� ch�c c�c ho�t ��ng ��u ng�u � ph�a b�n kia s�ng, xin h�i c�c h� c� mu�n sang kia kh�ng?",
		format("Ta mu�n b�o danh tham gia ho�t ��ng ��u ng�u/#%s:DailogSignUp(1)", self.szClassName),
		format("Ta l� ng��i th�ng cu�c v� ��n nh�n th��ng/#%s:GetAward(1)", self.szClassName),
		format("Ta mu�n t�m hi�u ho�t ��ng ��u ng�u/#%s:Explain()", self.szClassName),
		"Ta s� quay l�i sau!/OnCancel",
		
	}
	
	CreateTaskSay(tbSay)
end

function tbDangBossDailog:Explain(nStep)
	local tbSay = 
	{
		"<dec><npc>M�i t�i t� 20:00-21:00 ho�t ��ng s� b�t ��u. T� 20:00 ��n 20:00 v� 21:00 ��n 21:10; ng��i ch�i c�p 80 v� �� n�p th� c� th� ��n ��y b�o danh, m�i ��t ch� ���c 100 ng��i. M�t ng��i s� bi�n th�n th�nh kim ng�u, nh�ng ng��i kh�c s� ��u ng�u. N�u nh� trong v�ng 5 ph�t ��nh b�i kim ng�u th� s� ���c th��ng kim ng�u b�o r��ng. N�u kh�ng th� nh�n v�t bi�n th�nh kim ng�u s� ���c quan ph� tr�ng th��ng.",
		"Ta �� hi�u r�i/OnCancel",
	}
	
	CreateTaskSay(tbSay)
end


function tbDangBossDailog:DailogSignUp(nStep)
	
	local nMapId = 895
	local nMoney = 0
	
	local nCurMatchId = tbDangBoss:GetMissionV(tbDangBoss.tbMissionV.MATCH_ID, nMapId)
	local nContinueCount = self.tbTask:GetContinueCount(nCurMatchId) + 1
	local nMissionState = tbDangBoss:GetMissionState(nMapId)
	local nPlayerCount = tbDangBoss:GetMSPlayerCount(0, nMapId)
	if nStep == 1 then
		if nMissionState == 2 then
			nMoney = nContinueCount * 1e5
			local tbSay = 
			{
				format("<dec><npc>Th�i gian b�o danh �� qua, hi�n t�i ph�i chi tr� %d ng�n l��ng m�i c� th� v�o. X�c nh�n mu�n chi tr�?", nMoney),
				format("���ng nhi�n, ta mu�n �i b�o th�/#%s:DailogSignUp(2)", self.szClassName),
				"Kh�ng c�n!/OnCancel",
			}
			return CreateTaskSay(tbSay)
		end
		
	elseif nStep == 2 then
		if nMissionState == 2 then
			nMoney = nContinueCount * 1e5
		end
		
		if GetCash() < nMoney then
			return Talk(1, "", format("Ng�n l��ng kh�ng ��, c�n %d", nMoney))
		end
	end	
	
	if tbDangBoss:IsPlayerEligible() ~= 1 then
		Talk(1, "", format("C�p %d tr� l�n v� %s m�i c� th� tham gia", tbDangBoss.nMinLevel, (tbDangBoss.bIsCharged == 1 and "N�p") or ""))
		return 0
	end
	
	if nMissionState ~= tbDangBoss.READY_STATE and nMissionState ~= tbDangBoss.BATTLE_STATE then
		Talk(1, "", "R�t ti�c th�i gian b�o danh �� qua. Xin h�y ��i ��t sau")
		return 0
	end
	if nPlayerCount >= tbDangBoss.nMaxPlayerCount then
		Talk(1, "", format("S� ng��i b�o danh �� ��t ��n %d. R�t ti�c, xin h�y ��i ��t sau", tbDangBoss.nMaxPlayerCount))
		return 0
	end
	
	
	
	local nMapId, nPosX16, nPosY16 = GetWorldPos()
	self.tbTask:SetLastPos(nMapId, nPosX16, nPosY16)
	tbDangBoss:GotoBattlePlace()
end

local tbItem = 
{
	{nExp = 1e7},
	{
		{szName="Nh�t K� C�n Kh�n Ph�", tbProp={6, 1, 2126, 1, 0, 0}, nExpiredTime = 60*24*30, nRate = 0.5},
		{szName="Thi�n tinh b�ch c�u ho�n", tbProp={6, 1, 2183, 1, 0, 0}, nRate = 3},
		
		{szName="Huy�n tinh kho�ng th�ch c�p 8", tbProp={6, 1, 147, 8, 0, 0}, nRate = 16},
		{szName="Huy�n tinh kho�ng th�ch c�p 7", tbProp={6, 1, 147, 7, 0, 0}, nRate = 21},
		{nExp = 1e7, nRate = 10},
		
		{nExp = 2e7, nRate = 8},
		
	
		
		{nExp = 5e7, nRate = 2},
		
		
		{szName="V� L�m M�t T�ch", tbProp={6, 1, 26, 1, 0, 0}, nRate = 8},
		{szName="T�y T�y Kinh", tbProp={6, 1, 22, 1, 0, 0}, nRate = 8},
		{szName="Qu� Ho�ng Kim", tbProp={6, 1, 907, 1, 0, 0}, nRate = 5, nExpiredTime = 60*24*7},
		{szName="Thi�n Ni�n Huy Ho�ng qu�", tbProp={6, 1, 2270, 1, 0, 0} , nExpiredTime = 60*24*7, nRate= 18.5},
	}
}

function tbDangBossDailog:GetAward(nStep, nCurCount)
	local nTotalCount = self.tbTask:GetAwardCount()
	
	if nTotalCount == 0 then
		return Talk(1, "", "R�t ti�c, trong ��t ��u ng�u v�a r�i kh�ng ph�i l� ng��i th�ng cu�c ho�c �� nh�n th��ng r�i.")
	end
	
	if nStep == 1 then
		local tbSay = 
		{
			format("<dec><npc>H�m nay c� th� nh�n %d ph�n th��ng, <color=red>(N�u nh� h�m nay kh�ng nh�n ng�y mai s� m�t �i)<color>Ng��i mu�n:", nTotalCount),
			format("Nh�n t�t c�/#%s:GetAward(2, %d)", self.szClassName, nTotalCount),
			format("Ch� nh�n 1 ph�n/#%s:GetAward(2, 1)", self.szClassName, 1),
			"K�t th�c ��i tho�i/OnCancel"
		}
		CreateTaskSay(tbSay)
	elseif nStep == 2 then
		if CalcFreeItemCellCount() >= nCurCount then
			tbAwardTemplet:GiveAwardByList(%tbItem, "Nh�n ph�n th��ng kim ng�u sinh t�n", nCurCount)
			self.tbTask:PayAwardCount(nCurCount)
		else
			Talk(1, "", format("H�nh trang kh�ng �� nh�n %d ph�n th��ng", nTotalCount))
		end
	end	
end

function tbDangBossDailog:IsOpenModule()
	return gb_GetModule("chunjie2009_dangboss")
end

tbDangBossDailog:_init(tbDangBossTaskCtrl)