Include("\\script\\activitysys\\config\\1029\\head.lua")
Include("\\script\\lib\\log.lua")

pActivity.EVENT_LOG_TITLE = "Shangyuetuanyuan"
local nEndDate = floor(pActivity.nEndDate / 10000)
local ITEM = {}
local AWARD = {}

pActivity.ITEM = ITEM
pActivity.AWARD = AWARD
pActivity.MIN_LEVEL = 30

pActivity.TASK = {
	LvDouMoonCake = 1,
	LianZiMoonCake = 2,
	JiRouMoonCake = 3,
}

pActivity.MaxLvDouMoonCake = 68
pActivity.MaxLianZiMoonCake = 68
pActivity.MaxJiRouMoonCake = 68


local pAnnouce1 = function(tbItem, nCount)
	local szMsg = format("Ch�c m�ng hi�p s� %s h� k�t ti�n duy�n, � %s g�p Th� Ng�c Ti�n T�, Th� Ng�c Ti�n T� th�y hi�p s� r�t %s quen m�t, ��c bi�t t�ng %d ti�n v�n!", GetName(), SubWorldName(SubWorld), GetName(), tbItem.nCount)
	AddGlobalNews(szMsg)
end

local pAnnouce2 = function(tbItem, nCount)
	local szMsg = format("Ch�c m�ng hi�p s� %s h� k�t ti�n duy�n, t�i %s g�p g� Th� Ng�c Ti�n T�, nh�n ���c qu� t�ng c�a Th� Ti�n %d ti�n v�n.", GetName(), SubWorldName(SubWorld), tbItem.nCount)
	AddGlobalNews(szMsg)
end

local pLog = function(tbItem, nCount)
	%tbLog:PlayerActionLog(tbItem.EVENT_LOG_TITLE, tbItem.szLog)
end

pActivity.tbYuTu = {
	Param_Id = 1,
	Param_Finish = 2,
	nTime = 600 * 18,
	szName = "Th� Ng�c Ti�n t�",
	nId = 2132,
	
	Question = {
		{
			szQuestion = "<npc> V� L�m Truy�n K� n�m n�o c� m�t � Vi�t Nam?",
			Candidate = {"A. N�m 2004", "B. N�m 2005", "C. N�m 2006"},
			nAnswer = 2,
		},
		{
			szQuestion = "<npc> V� L�m Truy�n K� c� t�t c� bao nhi�u m�n ph�i?",
			Candidate = {"A. 9", "B. 8", "C. 10"},
			nAnswer = 3,
		},
		{
			szQuestion = "<npc> Trong V� L�m Truy�n K�, hai m�n ph�i n�o thu�c h� h�a?",
			Candidate = {"A. C�i Bang v� Thi�n V��ng", "B. C�i Bang v� Thi�n Nh�n ", "C. C�n L�n v� Thi�n Nh�n "},
			nAnswer = 2,
		},
	},
	tbTooLate = {
		szTitle = "<npc> V� hi�p s� n�y �� ch�m m�t b��c, �� c� hi�p s� may m�n tr� l�i ��ng c�u h�i c�a ta v� nh�n ���c ph�n th��ng r�i.",
		tbOpt = {{" ��ng"}},
	},
	tbWrongAnswer = {
		szTitle = "<npc> V� hi�p s� n�y tr� l�i kh�ng ��ng r�i! H�y ngh� c�n th�n r�i tr� l�i ta nh�!",
		tbOpt = {{" ��ng"}},
	},
}

ITEM.LvDouMoonCake = {szName="B�nh ��u xanh", tbProp={6,1,1510,1,0,0}, nExpiredTime=nEndDate}
ITEM.LianZiMoonCake = {szName="B�nh h�t sen", tbProp={6,1,1511,1,0,0}, nExpiredTime=nEndDate}
ITEM.JiRouMoonCake = {szName="B�nh Trung Thu g� n��ng", tbProp={6,1,1512,1,0,0}, nExpiredTime=nEndDate}
ITEM.Fen = {szName="B�t", tbProp={6,1,1503,1,0,0}, nExpiredTime=nEndDate}
ITEM.Tang = {szName=" ���ng tinh", tbProp={6,1,1504,1,0,0}, nExpiredTime=nEndDate}
ITEM.Egg = {szName=" Tr�ng g�", tbProp={6,1,1505,1,0,0},  nExpiredTime=nEndDate}
ITEM.LvDou = {szName="��u xanh", tbProp={6,1,1506,1,0,0}, nExpiredTime=nEndDate}

AWARD["5xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.4},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	nExpiredTime=nEndDate, nCount=1, nRate=0.2},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.1},
}

AWARD["6xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.4},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	nExpiredTime=nEndDate, nCount=1, nRate=0.2},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.1},
}

AWARD["7xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.5},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	nExpiredTime=nEndDate, nCount=1, nRate=0.3},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.2},
}

AWARD["8xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.8},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	nExpiredTime=nEndDate, nCount=1, nRate=0.6},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.5},
}

AWARD["9xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=1.5},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	nExpiredTime=nEndDate, nCount=1, nRate=1.2},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=1.0},
}

AWARD["CompseLvDouMoonCake"] = {
	{tbProp=ITEM.LvDouMoonCake.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=100.0},
}

AWARD["CompseLianZiMoonCake"] = {
	{tbProp=ITEM.LvDouMoonCake.tbProp,		nExpiredTime=nEndDate, nCount=1,  nRate=30.0},
	{
		nRate=70.0;
		{tbProp=ITEM.LianZiMoonCake.tbProp,		nExpiredTime=nEndDate, nCount=1},
		{pFun=pLog, szLog="Chenggongshengjilianziyuebing", EVENT_LOG_TITLE=pActivity.EVENT_LOG_TITLE},
	},
			
}

AWARD["CompseJiRouMoonCake"] = {
	{tbProp=ITEM.LianZiMoonCake.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=55.0},
	{
		nRate=45.0;
		{tbProp=ITEM.JiRouMoonCake.tbProp,		nExpiredTime=nEndDate, nCount=1},
		{pFun=pLog, szLog="Chenggongshengjikaojiyuebing", EVENT_LOG_TITLE=pActivity.EVENT_LOG_TITLE},
	},
}

AWARD["UseLvDouMoonCake"] = {
	{nExp=20000, nRate=100},
}

AWARD["UseLianZiMoonCake"] = {
	{nExp=40000, nRate=95.0},
	{tbProp={6,1,1097,1,0,0}, nRate=5.0},
}

AWARD["UseJiRouMoonCake"] = {
	{nExp=100000, nRate=85.0},
	{nExp=150000, nRate=14.9},
	{tbProp={6,1,1817,1,0,0}, nRate=0.1},
}

AWARD["YuTuAward"] = {
	{	nRate=0.01,
		[1] = {nJxb=888888},
		[2] = {pFun=pAnnouce1, nCount=888888},
	},
	{	nRate=1.0,
		[1] = {nJxb=388888},
		[2] = {pFun=pAnnouce1, nCount=388888},
	},
	{	nRate=10.0,
		[1] = {nJxb=268888},
		[2] = {pFun=pAnnouce2, nCount=268888},
	},
	{	nRate=20.0,
		[1] = {nJxb=168888},
		[2] = {pFun=pAnnouce2, nCount=168888},
	},
	{	nRate=38.09,
		[1] = {nJxb=88888},
		[2] = {pFun=pAnnouce2, nCount=88888},
	},
	{	nRate=30.90,
		[1] = {nJxb=38888},
		[2] = {pFun=pAnnouce2, nCount=38888},
	},
}