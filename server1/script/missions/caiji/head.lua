TEMPLATE_MAP_ID = 977

PREPARE_TIME = 4 * 60 --׼��ʱ�䣬��λ����
GAME_TIME = 16 * 60 --����ʱ�䣬��λ����
REFRESH_TIME = 15

MAX_GROUP_MEMBER = 15
MAX_GROUP = 10

NPC_PARAM_MAPID = 1
NPC_PARAM_COLLECTED = 2
PLANT_LIST = 
{
	["yellow"] = {nNpcId = 1930, nLevel = 1, szName = "C�y L�a V�ng", szScriptPath = "\\script\\missions\\caiji\\plant.lua"},
	["green"] = {nNpcId = 1931, nLevel = 1, szName = "C�y L�a Xanh", szScriptPath = "\\script\\missions\\caiji\\plant.lua"},
}

NPCID2PLANTTYPE = 
{
	[1930] = "yellow",
	[1931] = "green"
}

ITEM_PLANT = 
{
	["yellow"] = {szName = "L�a V�ng", tbProp={6,1,3200,1,0,0}, nExpiredTime = 20120701},
	["green"] = {szName = "L�a Xanh", tbProp={6,1,3199,1,0,0},nExpiredTime = 20120701},
}

ITEM_TOOL = 
{
	["nomal"] = {szName = "L��i Li�m S�t", tbProp={6,1,3197,1,0,0}},
	["platinum"] = {szName = "L��i Li�m B�c", tbProp={6,1,3198,1,0,0}}
}


TOOL2PROGRESSID = 
{
	["nomal"] = 7,
	["platinum"] = 1,
}

RANK_AWARD = 
{
	[1] = {nExp_tl = 50000000},
	[2] = {nExp_tl = 40000000},
	[3] = {nExp_tl = 30000000},
	[4] = {nExp_tl = 25000000},
	[5] = {nExp_tl = 20000000},
	[6] = {nExp_tl = 20000000},
	[7] = {nExp_tl = 20000000},
	[8] = {nExp_tl = 20000000},
	[9] = {nExp_tl = 20000000},
	[10] = {nExp_tl = 20000000},
}