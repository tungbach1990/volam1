Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\missions\\zhaojingling\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local tbPaiMingAward = 
{
	[1] = 
	{
		nExp_tl = 20e6	
	},
	[2] = 
	{
		nExp_tl = 15e6
	},
	[3] = 
	{
		nExp_tl = 13e6
	},
	[4] = 
	{
		nExp_tl = 10e6
	},
	[5] = 
	{
		nExp_tl = 8e6
	},
	[6] = 
	{
		nExp_tl = 6e6
	},
	[7] = 
	{
		nExp_tl = 5e6
	},
	[8] = 
	{
		nExp_tl = 4e6
	},
	[9] = 
	{
		nExp_tl = 3e6
	},
	[10] = 
	{
		nExp_tl = 2e6
	},
}

local tbAllPaiMingAward = 
{
	[1]={
		[1]={szName="Ch� T�n B� B�o",tbProp={6,1,2375,1,0,0},nRate = 20.0,nCount = 3,},
		[2]={szName="T�i B�o Th�y T�c",tbProp={6,1,2376,1,0,0},nRate = 40.0,nCount = 4,},
		[3]={nJxb=1,nRate = 20.0,nCount = 30000000,},
		[4]={nExp_tl=1,nRate = 20.0,nCount = 60000000,},
	},
	[2]={
		[1]={szName="Ch� T�n B� B�o",tbProp={6,1,2375,1,0,0},nRate = 20.0,nCount = 2,},
		[2]={szName="T�i B�o Th�y T�c",tbProp={6,1,2376,1,0,0},nRate = 40.0,nCount = 3,},
		[3]={nJxb=1,nRate = 20.0,nCount = 24000000,},
		[4]={nExp_tl=1,nRate = 20.0,nCount = 48000000,},
	},
	[3]={
		[1]={
			[1]={szName="Ch� T�n B� B�o",tbProp={6,1,2375,1,0,0},},
			[2]={szName="T�i B�o Th�y T�c",tbProp={6,1,2376,1,0,0},},
			nRate = 25.0,
		},
		[2]={szName="T�i B�o Th�y T�c",tbProp={6,1,2376,1,0,0},nRate = 25.0,},
		[3]={nJxb=1,nRate = 25.0,nCount = 22000000,},
		[4]={nExp_tl=1,nRate = 25.0,nCount = 44000000,},
	},
	[4]={
		[1]={szName="T�i B�o Th�y T�c",tbProp={6,1,2376,1,0,0},nRate = 33.0,nCount = 2,},
		[2]={nJxb=1,nRate = 33.0,nCount = 18000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 36000000,},
	},
	[5]={
		[1]={szName="T�i B�o Th�y T�c",tbProp={6,1,2376,1,0,0},nRate = 33.0,nCount = 2,},
		[2]={nJxb=1,nRate = 33.0,nCount = 16000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 32000000,},
	},
	[6]={
		[1]={szName="Ch� T�n B� B�o",tbProp={6,1,2375,1,0,0},nRate = 33.0,},
		[2]={nJxb=1,nRate = 33.0,nCount = 12000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 24000000,},
	},
	[7]={
		[1]={szName="T�i B�o Th�y T�c",tbProp={6,1,2376,1,0,0},nRate = 33.0,},
		[2]={nJxb=1,nRate = 33.0,nCount = 10000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 20000000,},
	},
	[8]={
		[1]={szName="T�i B�o Th�y T�c",tbProp={6,1,2376,1,0,0},nRate = 33.0,},
		[2]={nJxb=1,nRate = 33.0,nCount = 8000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 16000000,},
	},
	[9]={
		[1]={nJxb=1,nRate = 50.0,nCount = 5000000,},
		[2]={nExp_tl=1,nRate = 50.0,nCount = 10000000,},
	},
	[10]={
		[1]={nJxb=1,nRate = 50.0,nCount = 3000000,},
		[2]={nExp_tl=1,nRate = 50.0,nCount = 6000000,},
	},
}

local szRemoteScript = "\\script\\event\\zhaojingling\\event.lua"

function dialogmain()
	local tbOpt = {}
	local szTitleMsg = "<npc>Ch�ng trai tr�, ng��i mu�n hu�n luy�n n�ng l�c ph�n �ng c�a m�nh kh�ng? Th� t�m c�ng nhi�u <color=yellow> M�c Nh�n <color> nh�, s� nh�n ���c ph�n th��ng"
	local szTitleMsg = format("%s, m�i ng�y ng��i ch� c� <color=yellow>%d<color>l�n c� h�i c� th� tham gia mi�n ph�, c� g�ng t�p luy�n �i nh�!", szTitleMsg, MAXGAMETIME)
	tinsert(tbOpt, {"Ta mu�n th� xem", onok})
	tinsert(tbOpt, {"Nh�n l�nh ph�n th��ng", getaward})
--	tinsert(tbOpt, {"�鿴ǰһ���ǰʮ��", querytopten})
	tinsert(tbOpt, {"V� vi�c hu�n luy�n M�c Nh�n", detail})	
	tinsert(tbOpt, {"Ta hi�n t�i r�t b�n, khi kh�c s� quay l�i.", oncancel})
	CreateNewSayEx(szTitleMsg, tbOpt)
end

function onok()
	local tbOpt = {}
	tinsert(tbOpt, {"���c!", wantjoin})
	tinsert(tbOpt, {"Ta c� vi�c g�p, h�y ��i ta t�", oncancel})
	CreateNewSayEx("<npc>Ng��i qua b�n kia chu�n b� �i, ��i m�t l�t s� b�t ��u chu�n b�", tbOpt)
end

function wantjoin()
	if checkjoingame() ~= 1 then
		return
	end
	dojoingame()
end

function detail()
	local tbOpt = {}
	tinsert(tbOpt, {"Ta bi�t r�i!", oncancel})
	CreateNewSayEx("<npc>Hu�n luy�n M�c Nh�n m�t tr�n l�<color=yellow>15<color> ph�t, trong �� c�<color=yellow>5<color> ph�t chu�n b�, sau khi b�o danh tham gia ng��i s� ���c ��a ��n b�n �� chu�n b�, sau khi ho�t ��ng b�t ��u ng��i  s� ���c ��a v�o ��u tr��ng hu�n luy�n,n�u nh� � �� ng��I nh�n th�y <color=yellow> M�c Nh�n<color>ch� c�n d�ng chu�t<color=yellow> click chu�t tr�i <color> l�n n� l� ���c, tuy nhi�n ng��I s� b� ng��i ch�i kh�c c�n tr�, trong l�c n�y ng��i c� th� s� d�ng ��o c� �� �ng ph� v�i t�nh h�nh nh� v�y, ch� c�n ng��I t�m ���c nhi�u <color=yellow> M�c Nh�n<color> s� nh�n ���c ph�n th��ng ��ng k�", tbOpt)
end

function oncancel()
end

function checkjoingame()
	if PlayerFunLib:CheckTotalLevel(MINLEVEL, "C�p 125 v� c�p 125 tr� l�n ho�c nh�ng tr�ng s� �� tr�ng sinh m�i ���c tham gia ho�t ��ng M�c Nh�n n�y", ">=") ~= 1 then
		return
	end
	local nCurHour = tonumber(GetLocalDate("%H"))
	if nCurHour >= 0 and nCurHour < 12 then
		Talk(1, "", "M�i ng�y v�o l�c 12:00 ��n 24:00 b�t ��u ho�t ��ng B�t M�c Nh�n, hi�n t�i kh�ng ph�i l� th�i gian di�n ra ho�t ��ng")
		return
	end
	local nTimes = GetTaskA(TSK_PLAYTIMES, TSK_DAYKEY)
	if nTimes >= MAXGAMETIME then
		Talk(1, "", "M�i ng�y ch� c� th� tham gia 3 tr�n ��u, ng�y mai h�y ��n nh�")
		return
	end
	
	if GetTask(TSK_RANK) ~= 0 and GetTask(TSK_COUNT_ONETIME) > 0 then
		Talk(1, "", "C�n ph�i nh�n ph�n th��ng c�a tr�n ng�y h�m qua m�i ti�p t�c tham gia ���c, nhanh �i nh�n th��ng �i")
		return
	end

	return 1
end

function dojoingame()
	local nMapId, nX, nY = GetWorldPos()
	SetTask(TSK_LEAVERMAPID, nMapId)
	SetTask(TSK_LEAVERPOSX, nX)
	SetTask(TSK_LEAVERPOSY, nY)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\zhaojingling\\templet\\gametemplet.lua", "GameTemplet:MoveTo", PREPARE_MAP, POSPATH, 2, PREPAREPOSENDLINE)	
end

function getaward()
	local tbOpt = {}
	tinsert(tbOpt, {"Nh�n th��ng x�p h�ng m�i tr�n", getonetimeaward})
	--Change request 14/7/2011 - Modified by DinhHQ - 20110714
--	tinsert(tbOpt, {"Ph�n th��ng t�ng x�p h�ng m�i ng�y", getallpaimingaward})
	CreateNewSayEx("<npc>H�y nh�n h�t ph�n th��ng c�a tr�n tr��c �� r�i m�i c� th� ti�p t�c tham gia tr�n ti�p theo", tbOpt)		
end

function checkbox()
	local nWidth = 1
	local nHeight = 1
	local nCount = 2
	if CountFreeRoomByWH(nWidth, nHeight) >= nCount then
		return 1
	else
		local szMsg = format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nCount, nWidth, nHeight)
		Talk(1,"", szMsg)
		return
	end
end

function getonetimeaward()
	local nRank = GetTask(TSK_RANK)
	local nCount = GetTask(TSK_COUNT_ONETIME)
	if nRank <= 0 or nRank > 10 then
		Talk(1, "", "Kh�ng c� ph�n th��ng �� nh�n")
		return
	end
	if nCount <= 0 then
		Talk(1, "", "Kh�ng c� ph�n th��ng �� nh�n")
		return		
	end
	
	if checkbox() ~= 1 then
		return
	end
	tbAwardTemplet:GiveAwardByList(%tbPaiMingAward[nRank], "Nh�n th��ng x�p h�ng m�i tr�n ho�t ��ng M�c Nh�n")
	SetTask(TSK_RANK, 0)
end

function getallpaimingaward()
	local nIsAward = GetTaskA(TSK_IS_AWARD, TSK_IS_AWARD_DAYKEY)
	if nIsAward > 0 then
		Talk(1, "", "Ph�n th��ng t�ng x�p h�ng �� nh�n r�i")
		return
	end
	local obj = ObjBuffer:New()
	obj:Push(GetName())
	DynamicExecute("\\script\\missions\\zhaojingling\\enterdialog.lua",
		"RemoteExecute", %szRemoteScript, "tbJingLing:g2s_GetFormerPaiMing", obj.m_Handle, "receivepaiming", 0)
	obj:Destroy()		
end

function receivepaiming(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPaiMing = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	if nPaiMing ~= nil and nPaiMing <= 10 then
		if dogetallpaimingaward(nPlayerIndex, nPaiMing) == 1 then
			CallPlayerFunction(nPlayerIndex, AddTaskA, TSK_IS_AWARD, TSK_IS_AWARD_DAYKEY, 1)
			CallPlayerFunction(nPlayerIndex, Msg2Player, format("Nh�n th��ng t�ng x�p h�ng th� %s", nPaiMing))
		end
	else
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Kh�ng c� ph�n th��ng �� nh�n")
	end
end

function dogetallpaimingaward(nPlayerIndex, nPaiMing)
	if CallPlayerFunction(nPlayerIndex, checkbox) ~= 1 then
		return 
	end 
	CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, %tbAllPaiMingAward[nPaiMing], "Nh�n ph�n th��ng  x�p h�ng m�i ng�y ho�t ��ng M�c Nh�n")
	return 1
end

function querytopten()
	local obj = ObjBuffer:New()
	obj:Push(GetName())
	DynamicExecute("\\script\\missions\\zhaojingling\\enterdialog.lua",
		"RemoteExecute", %szRemoteScript, "tbJingLing:g2s_QueryTopTen", obj.m_Handle, "displaytopten", 0)
	obj:Destroy()			
end

function displaytopten(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	
	local tbTopTen = ObjBuffer:PopObject(ResultHandle)
	if tbTopTen == nil then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Tr��c m�t v�n ch�a c� x�p h�ng")
		return
	end
	local nCount = getn(tbTopTen)
	if nCount == 0 then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Tr��c m�t v�n ch�a c� x�p h�ng")
		return
	end
	local szMsg = format("%-32s%-10s\n", "T�n", "S� �i�m")
	for i=1, nCount do
		local szTemp = format("%-32s%-10d\n", tbTopTen[i][1], tbTopTen[i][2])
		szMsg = szMsg.. szTemp
	end
	CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szMsg, {{"K�t th�c ��i tho�i"}})
end


