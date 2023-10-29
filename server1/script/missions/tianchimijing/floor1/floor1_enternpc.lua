Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")

tbEnterPosConfigPath = {
	[1] = "\\settings\\maps\\tianchimijing\\floor1\\enter1.txt",
	[2] = "\\settings\\maps\\tianchimijing\\floor1\\enter2.txt",
	[3] = "\\settings\\maps\\tianchimijing\\floor1\\enter3.txt",
	[4] = "\\settings\\maps\\tianchimijing\\floor1\\enter4.txt",
	[5] = "\\settings\\maps\\tianchimijing\\floor1\\enter5.txt",
	[6] = "\\settings\\maps\\tianchimijing\\floor1\\enter6.txt",
  [7] = "\\settings\\maps\\tianchimijing\\floor1\\enter7.txt",
	[8] = "\\settings\\maps\\tianchimijing\\floor1\\enter8.txt",
	[9] = "\\settings\\maps\\tianchimijing\\floor1\\enter9.txt"							
	}

function main()
		local nNpcIndex = GetLastDiagNpc()
		local szNpcName = GetNpcName(nNpcIndex)
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<#><npc>v� ti�u hi�p n�y, ta ph�t hi�n trong ��m n��c n�y c� m�t ���ng m�t ��o, trong m�t ��o n�y b�y b� r�t nhi�u c� quan c�m b�y, c�n ph�i luy�n t�p Khinh C�ng ��i hi�p m�i c� th� �i qua ���c, nghe ��n r�ng � �o�n cu�i c�a m�t ��o c� v� s� B�o T�ng"
		G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
		tinsert(tbDailog, {"Ta mu�n t�m hi�u m�t ch�t", Realize})
		tinsert(tbDailog, {"K�t th�c ��i tho�i"})
		CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function Realize()
	local tbOpt = {}
	local szTitle = "<#><npc>Ch� m�t ��o n�y h�nh nh� kh�ng c� ��y, nh�ng ng��i t� ch� n�y �i v�o t� tr��c ��n nay c�ng ch�a c� m�t ai m� ra ���c, nghe ��n r�ng � trong m�t ��o n�y �n n�p r�t nhi�u ng��i Kim, b�n h� r�t l� t�n �c, ti�u hi�p ng��i t�t nh�t l� t�m th�m v�i ng��i c�ng nhau t� ��i �� �i v�o."
	tinsert(tbOpt, {"�i v�o m�t ��o", ReadyGo})
	--Check team member condition - Modified By DinhHQ - 20120405
	if GetTeamSize() >= 2 then
		tinsert(tbOpt, {"Ki�m tra �i�u ki�n t� ��i", VnCheckTeamCondition, {1, 1}})
	end
	tinsert(tbOpt, {"Hay l� th�i  nh�"})
	CreateNewSayEx(szTitle, tbOpt)
end

function ReadyGo()
	if GetTeamSize() <= 1 then
		SingleEnter()
	else
		TeamEnter()
	end
end

function SingleEnter()
	local tbOpt = {}
	local szTitle = "<#><npc> Thi�u hi�p ng��i x�c ��nh v��t m�t ��o m�t m�nh � ?"
	tinsert(tbOpt, {"��ng r�i.",SingleEnterSure})
	tinsert(tbOpt, {"�� ta suy ngh� ��"})
	CreateNewSayEx(szTitle, tbOpt)
end

function TeamEnter()
	if IsCaptain() ~= 1 then
		DealWithNotCaption()
	else
		DealWithIsCaption()
	end
end

function DealWithNotCaption()
	local tbOpt = {}
	local szTitle = "<#><npc> Thi�u hi�p ng��I kh�ng ph�i l� ��i tr��ng, hay l� m�i ��i tr��ng c�a ng��i ��n ��y nh�"
	tinsert(tbOpt, {"���c r�i."})
	CreateNewSayEx(szTitle, tbOpt)
end

function DealWithIsCaption()
	local nTeamSize = GetTeamSize()
	local szTitle = ""
	local _, _, nMapId = GetPos()
	local tbOpt = {}
	local bInSameMap = 1
	for i = 1, nTeamSize do
		local nPlayerIndex = GetTeamMember(i);
		local _, _, nTempMapId = DynamicExecuteByPlayer(nPlayerIndex, "", "GetPos")
		--Check enter pass - Modified By DinhHQ - 20120405
		local nHavePass = DynamicExecuteByPlayer(nPlayerIndex, "", "CalcItemCount", 3, 6, 1, 30194, -1)
		if nTempMapId ~= nMapId or not nHavePass then
			bInSameMap = 0
			break
		end
	end
	if bInSameMap ~= 0 then
		TeamEnterSure()
	else	
		szTitle = "<#><npc> Hi�p s� trong ��i ng� c�a ng��i c�n c� ng��i ch�a chu�n b� xong, xin h�y tri�u t�p t�t c� m�i ng��i ��n ch� c�a ta ��y m�i c� th� �i v�o ���c."
		tinsert(tbOpt, {"���c, ta tri�u t�p h� l�i ngay b�y gi�."})
		CreateNewSayEx(szTitle, tbOpt)
	end
end

function SingleEnterSure()
	--Check enter pass - Modified By DinhHQ - 20120405
	if not VnCheckPass(PlayerIndex) or not VnConsumePass(PlayerIndex) then
		Talk(1, "", "Ch� c�n giao cho ta 1 c�i <color=red>Thi�n Tr� M�t L�nh<color> ta s� ch� cho ng��i l�i v�o.")
		return
	end
	local nTbSize = getn(tbEnterPosConfigPath)
	local nConfigId = random(1, nTbSize)
	local szConfigPath = tbEnterPosConfigPath[nConfigId]
	local nTmp = TabFile_Load(szConfigPath, szConfigPath);
	local nTotalRow = TabFile_GetRowCount(szConfigPath)
	local nRowId = random(2, nTotalRow)
	local nPosX = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPX"))
	local nPosY = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPY"))
	NewWorld(935, nPosX/32, nPosY/32)
end

function TeamEnterSure()
	--Last time check team enter pass- Modified By DinhHQ - 20120405
	if not VnCheckTeamCondition(1) then
		return
	end
	local nTeamSize = GetTeamSize()
	local nTbSize = getn(tbEnterPosConfigPath)
	local nConfigId = random(1, nTbSize)
	local szConfigPath = tbEnterPosConfigPath[nConfigId]
	local nTmp = TabFile_Load(szConfigPath, szConfigPath);
	local nTotalRow = TabFile_GetRowCount(szConfigPath)
	for i = 1, nTeamSize do 
		local nPlayerIndex = GetTeamMember(i)		
		if VnConsumePass(nPlayerIndex) then
			local nRowId = random(2, nTotalRow)
			local nPosX = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPX"))
			local nPosY = tonumber(TabFile_GetCell(szConfigPath, nRowId, "TRAPY"))
			DynamicExecuteByPlayer(nPlayerIndex, "", "NewWorld", 935, nPosX/32, nPosY/32)			
		end		
	end
end

--Check enter pass - Modified By DinhHQ - 20120404
function VnCheckPass(nPlayerIdx)
	local nOldPlayer = PlayerIndex
	PlayerIndex = nPlayerIdx
	if CalcItemCount(3, 6, 1, 30194, -1) < 1 then		
		PlayerIndex = nOldPlayer
		return nil
	end
	PlayerIndex = nOldPlayer
	return 1
end
function VnConsumePass(nPlayerIdx)
	local nOldPlayer = PlayerIndex
	PlayerIndex = nPlayerIdx
	if ConsumeItem(3, 1, 6, 1, 30194, -1) ~= 1 then
		PlayerIndex = nOldPlayer
		return nil
	end
	PlayerIndex = nOldPlayer
	return 1
end
function VnCheckTeamCondition(bShowDialog1, bShowDialog2)
	if IsCaptain() ~= 1 then
		Talk(1, "", "Ng��i kh�ng ph�i l� ��i tr��ng kh�ng th� th�c hi�n thao t�c n�y, h�y k�u ��i tr��ng c�a ng��i t�i ��y!")
		return
	end
	local tbDialog = {}
	local nTeamSize = GetTeamSize()	
	local nOldPlayer = PlayerIndex
	for i = 1, nTeamSize do		
		--Check enter pass
		PlayerIndex = GetTeamMember(i)
		if not VnCheckPass(PlayerIndex) then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "Kh�ng c� Thi�n Tr� M�t L�nh"))
		end	
	end
	PlayerIndex = nOldPlayer
	if getn(tbDialog) > 0 then		
		if bShowDialog1 then
			local strTittle = "T� ��i hi�n t�i kh�ng th� v�o Thi�n Tr� M�t C�nh:"
			for i = 1, getn(tbDialog) do
				strTittle = strTittle.."\n"..tbDialog[i]
			end
			Describe(strTittle, 1, "��ng/OnCancel")
		end
		return nil
	else
		if bShowDialog2 then
			local strTittle = "T� ��i hi�n t�i c� th� v�o Thi�n Tr� M�t C�nh"
			Describe(strTittle, 1, "��ng/OnCancel")
		end
		return 1
	end
end