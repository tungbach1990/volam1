Include("\\script\\missions\\datusha\\datusha.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")
COST_MONEY = 100000
MAX_AWARD_COUNT = 100
DaTuShaRankAward = 
{
	[1] = 8e6,
	[2] = 7e6,
	[3] = 6e6,
	[4] = 5e6,
	[5] = 45e5,
	[6] = 4e6,
	[7] = 35e5,
	[8] = 3e6,
	[9] = 25e5,
	[10] = 15e5,
}
LastManAward = 
{
	[1]={szName="�� Ph� T� M�ng Kh�i",tbProp={6,1,2714,1,0,0},nRate = 2.0,},
	[2]={szName="�� Ph� T� M�ng Y",tbProp={6,1,2715,1,0,0},nRate = 2.0,},
	[3]={szName="�� Ph� T� M�ng Y�u ��i",tbProp={6,1,2717,1,0,0},nRate = 2.0,},
	[4]={szName="�� Ph� T� M�ng H� Uy�n",tbProp={6,1,2718,1,0,0},nRate = 2.0,},
	[5]={szName="�� Ph� T� M�ng B�i",tbProp={6,1,2720,1,0,0},nRate = 2.0,},	
	[6]={szName="�� Ph� T� M�ng H�i",tbProp={6,1,2716,1,0,0},nRate = 2.0,},	
	[7]={szName="�� Ph� T� M�ng H�ng Li�n",tbProp={6,1,2719,1,0,0},nRate = 2.0,},	
	[8]={szName="�� Ph� T� M�ng Th��ng Gi�i Ch�",tbProp={6,1,2721,1,0,0},nRate = 0.5,},	
	[9]={szName="�� Ph� T� M�ng H� Gi�i Ch�",tbProp={6,1,2722,1,0,0},nRate = 0.5,},	
	[10]={szName="�� Ph� T� M�ng Kh� Gi�i",tbProp={6,1,2723,1,0,0},nRate = 0.5,},
	[11]={szName="T� M�ng L�nh",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.5},
	[12]={szName="Qu� Ho�ng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=19, nExpiredTime = 10080},	
	[13]={nExp_tl=1,nRate = 65,nCount = 10000000,},	
}

TotalRankAward = 
{
	{
		{nExp_tl = 32e6},
		{
			{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nRate = 5.0, nExpiredTime = 43200}
		}
	},
	{nExp_tl = 28e6},
	{nExp_tl = 24e6},
	{nExp_tl = 20e6},
	{nExp_tl = 18e6},
	{nExp_tl = 16e6},
	{nExp_tl = 14e6},
	{nExp_tl = 12e6},
	{nExp_tl = 10e6},
	{nExp_tl = 8e6},
}
function DaTuShaClass:Join()
	local pDungeon = DungeonList[896]
	if pDungeon then
		local nMapId, nX, nY = GetWorldPos()
		pDungeon.tbPlayer[GetName()] = {tbSignUpPos={nMapId, nX, nY}}
		
		pDungeon:GotoDaTuSha();
	end
end

function about(nStep)
	
	local szTitle = ""
	local tbOpt = {}	
	if nStep == 0 then
		szTitle = "<npc>Th�i gian ho�t ��ng m�i ng�y v�o l�c 12:00, 19:00, 20:00, 21:00, t�t c� ng��i ch�i c�p 120 tr� l�n c� th� ��n b�o danh v�i ta, th�i gian b�o danh l� 10 ph�t, b�o danh c�n ph�i giao n�p 10 v�n l��ng. Sau khi ho�t ��ng b�t ��u c� th� s� d�ng k� n�ng c�a b�n th�n �� tham chi�n, th�i gian lo�n chi�n l� 30 ph�t, m�i m�t ng��i ��u c� 5 c� h�i ph�c sinh, sau khi ho�t ��ng k�t th�c c�n c� v�o �i�m t�ch l�y �� nh�n th��ng."
		tinsert(tbOpt, {"C�u Ch�u C�c l� m�t n�i nh� th� n�o", about, {1}})
		tinsert(tbOpt, {"C� ph�n th��ng g� kh�ng", about, {2}})
	elseif nStep == 1 then
		szTitle = "<npc>C�u Ch�u C�c l� m�t n�i b� m�t m� m�y n�m g�n ��y tri�u ��nh d�ng �� hu�n luy�n nh�ng ��i n�i cao th�, trong C�c c�n c� v�o t�n g�i c�a ng��i x�a l� C�u Ch�u �� chia th�nh 9 khu v�c. Sau khi b�t ��u t� v�, b�t ��u t� th� 3, c�ch nhau 3 ph�t, s� c� 1 khu v�c b� b�ng h�n ng�n n�m bao b�c l�i, n�u nh� kh�ng k�p th�i ch�y tho�t kh�i n�i �� s� b� ��ng b�ng m� ch�t. ��n ph�t th� 30 n�u nh� kh�ng ph�n th�ng b�i t�m ra ng��i cu�i c�ng, t�t c� nh�ng ng��i � trong C�c ��u b� ��ng b�ng. Trong C�c quanh n�m ��y ��c s��ng m� v� gi� l�nh. H�n chi�n � trong gi� l�nh �� v�a b� b�ng gi� uy hi�p v�a nguy hi�m v� c�ng."
		tinsert(tbOpt, {"��i tho�i tr� l�i t�ng tr��c", about, {0}})	
	elseif nStep == 2 then
		szTitle = "<npc>M�i l��t ho�t ��ng c� th� c�n c� theo �i�m t�ch l�y c�a l��t n�y �� nh�n th��ng; n�u nh� ng��i l� ng��i cu�i c�ng duy nh�t trong l��t n�y � H�nh T�n Gi��, c�ng c� th� nh�n ���c ph�n th��ng v��t m�c c�a � D�ng S� Cu�i C�ng�. M�i ng�y s� c�n c� v�o �i�m t�ch l�y m� ng��i nh�n ���c trong ng�y �� ti�n h�nh x�p h�ng, s� th��ng ph�n th��ng d�ng s� c�a b�ng x�p h�ng top 10."
		tinsert(tbOpt, {"��i tho�i tr� l�i t�ng tr��c", about, {0}})
	end
	tinsert(tbOpt, {"K�t th�c ��i tho�i"})
	CreateNewSayEx(szTitle, tbOpt)	
end

function check_rank()
	
	local szMsg = format("T�ng �i�m t�ch l�y c�a ng��i l� <color=green>%d<color><enter>", GetPlayerTotalScores())
	
	local szName, nValue = Ladder_GetLadderInfo(LadderId, 1);
	
	if (szName == nil or szName == "" or nValue == nil) then
		return Talk(1, "", szMsg.."T�m th�i ch�a c� b�ng x�p h�ng top 10.")
	end
	
	szMsg = szMsg.."B�ng x�p h�ng top 10: <enter>"	
	szMsg = szMsg..format("%s%s%s<enter>", strfill_center("Th� h�ng", 6, " "), strfill_center("T�n", 10, " "), strfill_center("T�ng t�ch l�y", 8, " "))
	for i=1, 10 do
		local szName, nValue = Ladder_GetLadderInfo(LadderId, i);
		if szName and szName ~= "" and nValue > 0 then
			szMsg = szMsg..format("%s%s%s<enter>", strfill_center(tostring(i), 6, " "), strfill_center(szName, 10, " "), strfill_center(tostring(nValue), 8, " "))
		end
	end
	local tbOpt = 
	{
		{"Tr� l�i", dialog_main},
		{"K�t th�c ��i tho�i"},
	}
	CreateNewSayEx("<npc>"..szMsg, tbOpt)
end

function round_award()
	local pDungeon = DungeonList[MAP_ID]
	if pDungeon then
		return Talk(1, "", "�ang trong th�i gian t� v� kh�ng th� nh�n th��ng")
	end
	if not DaTuShaClass.Rank then
		return
	end
	local szCurName = GetName()
	if DaTuShaClass.Scores[szCurName] == nil or DaTuShaClass.Scores[szCurName] == 0 then
		return Talk(1, "", "Ng��i v�n ch�a tham gia th� luy�n C�u Ch�u C�c")
	end
	
	if DaTuShaClass.Scores[szCurName] < 0 then
		return Talk(1, "", "��i hi�p �� nh�n ph�n th��ng n�y r�i.")
	end
	local nCount = getn(DaTuShaClass.Rank)
	if nCount > MAX_AWARD_COUNT then
		nCount = MAX_AWARD_COUNT
	end
	local nRank = nil
	for i=1, nCount do
		local szName = DaTuShaClass.Rank[i][1]
		if (szCurName == szName) then
			nRank = i
			break
		end
	end
	if nRank then
		Msg2Player(format("X�p h�ng tr�n n�y c�a ng��i l� %d, ��y l� ph�n th��ng t�ng cho ng��i xin h�y nh�n l�y.", nRank))
		local nAwardCount = getn(DaTuShaRankAward)
		local nExp = DaTuShaRankAward[nRank]
		if nRank > nAwardCount then
			nExp = DaTuShaRankAward[nAwardCount]
		end
		if nExp then
			tbAwardTemplet:Give({nExp_tl = nExp}, 1, {"Lo�n Chi�n C�u Ch�u C�c","Ph�n th��ng c� ��nh"})
			DaTuShaClass.Scores[szCurName] = -1
		end
	else
		 Talk(1, "", format("X�p h�ng c�a ng��i trong tr�n n�y kh�ng n�m trong %d danh s�ch", MAX_AWARD_COUNT))
	end	
end

function last_man_award()
	local LastMan = DaTuShaClass.LastMan
	if LastMan and LastMan.szName and LastMan.szName == GetName() and LastMan.bFlag == nil then
		if CalcFreeItemCellCount() < 1 then
			return Talk(1, "",  format("H�nh trang c�n <color=yellow>%d<color> � tr�ng.", 1))
		end
		
		tbAwardTemplet:Give(LastManAward, 1, {"Lo�n Chi�n C�u Ch�u C�c","Ph�n th��ng c�a d�ng s� cu�i c�ng"})
		LastMan.bFlag = 1
	else
		Talk(1, "", "Ng��i kh�ng ph� h�p v�i �i�u ki�n nh�n th��ng ho�c l� �� nh�n th��ng r�i.")
	end
end

function final_award()
	local nHour = tonumber(GetLocalDate("%H"))
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	
	if not(nHour > 21 and nHour < 24) then
		return Talk(1, "", "Hi�n t�i kh�ng ph�i l� th�i gian nh�n th��ng t�ng x�p h�ng.")
	end
	if GetTask(TSK_FINAL_AWARD) == nDate then
		return Talk(1, "", "��i hi�p �� nh�n ph�n th��ng n�y r�i.")
	end
	
	if CalcFreeItemCellCount() < 1 then
		return Talk(1, "",  format("H�nh trang c�n <color=yellow>%d<color> � tr�ng.", 1))
	end
	
	local nRank = nil
	for i=1, 10 do
		local szName, nValue = Ladder_GetLadderInfo(LadderId, i);
		if szName == GetName() and nValue > 0 then
			nRank = i
			break
		end
	end
	if nRank and TotalRankAward[nRank] then
		tbAwardTemplet:Give(TotalRankAward[nRank], 1, {"Lo�n Chi�n C�u Ch�u C�c","Ph�n th��ng c�a d�ng s� cu�i c�ng"})
		SetTask(TSK_FINAL_AWARD, nDate)
	else
		return Talk(1, "", "Ng��i kh�ng n�m trong top 10 b�ng x�p h�ng.")
	end
end

function give_award()
	local szTitle = "<npc>M�i l��t ho�t ��ng c� th� c�n c� theo �i�m t�ch l�y c�a l��t n�y �� nh�n th��ng; n�u nh� ng��i l� ng��i cu�i c�ng duy nh�t trong l��t n�y � H�nh T�n Gi��, c�ng c� th� nh�n ���c ph�n th��ng v��t m�c c�a � D�ng S� Cu�i C�ng�. M�i ng�y s� c�n c� v�o �i�m t�ch l�y m� ng��i nh�n ���c trong ng�y �� ti�n h�nh x�p h�ng, s� th��ng ph�n th��ng d�ng s� c�a b�ng x�p h�ng top 10."
	local tbOpt = 
	{
		
		{"Ta ��n nh�n th��ng c�a m�i tr�n", round_award},
		{"Ta ��n nh�n th��ngph�n th��ng c�a [d�ng s� cu�i c�ng]" ,last_man_award},
		{"Ta ��n nh�n ph�n th��ng t�ng t�ch l�y", final_award},
		{"K�t th�c ��i tho�i"},
	}
	
	CreateNewSayEx(szTitle, tbOpt)
end

function join_datusha()
	local pDungeon = DungeonList[MAP_ID]
	if pDungeon then
		if pDungeon.nState ~= 1 then
			return
		end
	else
		return
	end
	if (ST_GetTransLifeCount() <= 0 and GetLevel() < 120) then
		return Msg2Player(format("C�p ph�i ��t ��n <color=yellow>%d<color>.", 120))
	end
	--Change request July 13, 2011 - Modified by DinhHQ - 20110713
--	if Pay(COST_MONEY) ~= 1 then
--		return Talk(1, "", format("C�n ph�i giao n�p %d l��ng ph� b�o danh", COST_MONEY))
--	end
	if PlayerFunLib:GetTaskDailyCount(2710) >= 1 then
		if (CalcItemCount(-1, 6, 1, 30117, -1) < 1 or ConsumeEquiproomItem(1, 6, 1, 30117, 1) ~= 1) then
			Talk(1, "", "Ng��i �� tham gia m�t l�n mi�n ph� r�i, l�n n�y tham gia c�n ph�i c� 1 C�u Ch�u L�nh")
			return
		else
			tbLog:PlayerActionLog("LoanChienCuuChauCoc","TruThanhCong1CuuChauLenh")
		end
	end
	PlayerFunLib:AddTaskDaily(2710, 1)
	pDungeon.tbPlayer[GetName()] = {}
	local nMapId, nX, nY = GetWorldPos()
	pDungeon.tbPlayer[GetName()].tbSignUpPos = {nMapId, nX, nY}
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "luanzhanjiuzhou")
	pDungeon:GotoDaTuSha()
	--Ghi log t�nh n�ng key - Modified By DinhHQ -20120410
	if PlayerFunLib:GetTaskDailyCount(2710) == 1 then
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhLoanChienCuuChauCocMienPhi")
	else
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhLoanChienCuuChauCocThuPhi")
	end
end

function dialog_main()
	local szTitle = "<npc>�� ch�n ra nh�ng nh�n t�i cho qu�n ��i, tri�u ��nh �� quy�t ��nh tuy�n ch�n trong d�n ch�ng nh�ng cao th� tr� d�ng song to�n. Hoan ngh�nh c�c ch� v� ��n tham gia b�o danh."
	local tbOpt = 
	{
		{"Li�n quan ��n Lo�n Chi�n C�u Ch�u C�c", about, {0}},
		{"Ta mu�n ki�m tra xem t�ng t�ch l�y v� top 10 c�a ta", check_rank},
		{"Ta ��n �� nh�n th��ng", give_award},
		{"Ta ch� qua ���ng m� th�i"},
	}
	local pDungeon = DungeonList[MAP_ID]
	if pDungeon then
		if pDungeon.nState == 1 then
			tinsert(tbOpt, 1, {"B�o danh tham gia Lo�n Chi�n C�u Ch�u C�c", join_datusha, {}})
		end
	end
	
	
	CreateNewSayEx(szTitle, tbOpt)	
end

EventSys:GetType("AddNpcOption"):Reg("Ch��ng ��ng Cung N�", "Lo�n Chi�n C�u Ch�u C�c", dialog_main)