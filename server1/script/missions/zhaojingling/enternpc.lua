Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")

local tbEnterNpc = 
{
		szName = "Quan nh�c nh� Ho�ng Th�nh T�",
		nNpcId = 1747,
		nLevel = 95,
		nMapId = 176,
		szPosPath = "\\settings\\maps\\chrismas\\enternpc.txt",
		szScriptPath = "\\script\\missions\\zhaojingling\\enternpc.lua",
}

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>�� hu�n luy�n nh�ng �ai n�i cao th� m�i , �� n�ng cao ch� s� giang h�, Ho�ng Th�nh T� ta ��y chi�u m� H�a Ki�t kh�p n�i. N�u nh� ng��i c� � ��nh b�o hi�u cho tri�u ��nh, h�y tham gia b�o danh ho�t ��ng. H�c th�nh v�n v� ngh�, gi�p cho �� V��ng Gia. C�c h� v� ngh� ��y m�nh, b�o ki�m m�ng tr�n."
	tbDailog:AddOptEntry("Ho�ng Th�nh T� hu�n luy�n cung", xunlianying)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog:Show()
end

function xunlianying()
	local tbOpt = {}
	tinsert(tbOpt, {"Hu�n luy�n M�c Nh�n", zhaojingling})
	tinsert(tbOpt, {"K�t th�c ��i tho�i", oncancel})
	CreateNewSayEx("<npc>Hu�n Luy�n Cung n�y l� d�ng c�c lo�i ho�t ��ng �� hu�n luy�n c�c lo�i n�ng l�c c�a ng��i, v� s� tr� th�nh m�t trong nh�ng ��i n�i cao th�, v� nh�n ���c ban th��ng c�a tri�u ��nh.", tbOpt)	
end

function zhaojingling()
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\zhaojingling\\enterdialog.lua", "dialogmain")
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhTruyTimMocNhan")
end

function addenternpc()
	if (TabFile_Load(%tbEnterNpc.szPosPath, %tbEnterNpc.szPosPath) == 0) then
		print("Load TabFile Error!"..%tbEnterNpc.szPosPath)
		return 0
	end
	%tbEnterNpc.nPosX = TabFile_GetCell(%tbEnterNpc.szPosPath, 2, "POSX")
	%tbEnterNpc.nPosY = TabFile_GetCell(%tbEnterNpc.szPosPath, 2, "POSY")
	
	basemission_CallNpc(%tbEnterNpc)
end

-- function initialize()
-- 	addenternpc()
-- 	DynamicExecute("\\script\\missions\\zhaojingling\\prepare\\preparegame.lua", "PrepareGame:Start")
-- end

-- AutoFunctions:Add(initialize)

