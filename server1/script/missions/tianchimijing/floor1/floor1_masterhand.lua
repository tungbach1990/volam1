Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\tianchimijing\\floor1\\gamefloor1.lua")
Include("\\script\\lib\\composeex.lua")
--Bonus award - Modified By DinhHQ - 20120405
Include("\\script\\missions\\tianchimijing\\vnextaward.lua")
function main()
	if GetFightState() == 1 then
		DealWithFightPlayer()
	else
		DealWithUnFightPlayer()
	end	
end

function DealWithFightPlayer()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc> Con ���ng n�y ��t �o�n, duy nh�t ch� c� Khinh C�ng m�i �i qua ���c, mu�n nh�n ���c n�ng l�c s� d�ng Khinh C�ng, th� h�y �i t�m �ao, Th��ng, Ki�m b� th�t l�c c�a ta mang ��n ��y, nh�ng lo�i binh kh� n�y c� � trong R��ng Binh Kh� tr�n m�t ��t."
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tinsert(tbDailog, {"Ta �� t�m ���c r�i", ThrowPlayer})
	tinsert(tbDailog, {"�� ta suy ngh� ��"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function ThrowPlayer()
	local tbOpt = {}
	local szTitle = ""
	local tbFormula =
	{
		szFailMsg = "�n Th� Cao Nh�n: Ng��i �em ��n nh�ng th� m� ta kh�ng c�n ��n, ng��i mu�n l�a g�t ta � ?",
		nFreeItemCellLimit = 0,
		szComposeTitle = "",
		tbMaterial = 
		{
			{szName = "�ao ", tbProp = {6, 1, 2592}, nCount = 1},
			{szName = "th��ng ", tbProp = {6, 1, 2593}, nCount = 1},
			{szName = "Ki�m ", tbProp = {6, 1, 2594}, nCount = 1},
		},
		tbProduct = 
		{
			szName = nil,
			pFun = function (self, nItemCount, szLogTitle)
			end	
		},
		pLimitFun = function (self, nItemCount)
			return 1
		end
	}
	local pCompose = tbActivityCompose:new()
	pCompose:_init(tbFormula, "�ao Th��ng Ki�m c�a Thi�n Tr� M�t c�nh ��i l�y Khinh C�ng.")
	local nRetCode = pCompose:Compose(1)
	if nRetCode == 1 then
		--Bonus award - Modified By DinhHQ - 20120405
		tbVnExtAward:SetAwardFlag(1)
		SetAForbitSkill(210, 0)
		szTitle = "<#><npc> ha ha , t�t t�t , qu� nhi�n l� �ao binh c�a ta, r� r�i ,Khinh C�ng l� s� d�ng nh� v�y! ( ng��i c� th� s� d�ng Khinh C�ng r�i )"
		tinsert(tbOpt, {"�a t� ��i hi�p"})
		CreateNewSayEx(szTitle, tbOpt)
	else
	end
end

function DealWithUnFightPlayer()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>Ti�u hi�p, ta �� ��i ng��i l�u l�m r�i, ng��i c� c�n ta �em ng��i v�o trong kia kh�ng? v�a �� r�i th� kh�ng ra ���c ��u nh�!"
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tinsert(tbDailog, {"Xin h�y ��a ta v�o", TransPlayer})
	tinsert(tbDailog, {"�� ta suy ngh� ��"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end


function TransPlayer()
	--Bonus award - Modified By DinhHQ - 20120405
	tbVnExtAward:SetAwardFlag(1)
	GameFloor1:MoveToTrap("�i�m truy�n t�ng c�a �n Th� Cao Nh�n")
end