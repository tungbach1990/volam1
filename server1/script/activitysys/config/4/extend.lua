Include("\\script\\activitysys\\config\\4\\head.lua")
Include("\\script\\activitysys\\config\\4\\variables.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\config\\4\\award_ext.lua")
--{szName="", tbProp={}, nExpiredTime=20120601,}
local Items = 
{
	Seed = {szName="H�t M�m ", tbProp={6,1,3157,1,0,0}, nExpiredTime=20120601,},
	Chemicals = {szName="T�i Thu�c T�ng Tr��ng", tbProp={6,1,3158,1,0,0}, nExpiredTime=20120601,},
	Water = {szName="B�nh N��c", tbProp={6,1,3159,1,0,0}, nExpiredTime=20120601,},
	Pigment = {szName="Ph�m M�u S�c", tbProp={6,1,3160,1,0,0}, nExpiredTime=20120601,},
	Red_Flower = {szName="Hoa Ph��ng ��", tbProp={6,1,3161,1,0,0}, nExpiredTime=20120601,},
	Purple_Flower = {szName="Hoa Ph��ng T�m", tbProp={6,1,3162,1,0,0}, nExpiredTime=20120601,},
	White_Flower = {szName="Hoa Ph��ng Tr�ng", tbProp={6,1,3163,1,0,0}, nExpiredTime=20120601,},
}

local Award_B = 
{
	{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200, CallBack = _Message},
	{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=1, CallBack = _Message},
	{szName="T� M�ng Chi B�o (N�n)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={1,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (�o)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={5,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (H�ng Li�n)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={0,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (Ng�c B�i)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={8,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (Gi�y)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={7,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (Bao Tay)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={3,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (Nh�n Tr�n)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={2,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (Nh�n D��i)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={9,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (�ai L�ng)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=2,tbParam={4,0,0,0,0,0}},
	{szName="T� M�ng Chi B�o (V� Kh�)",tbProp={6,1,30140,1,0,0},nCount=1,nRate=1,tbParam={6,0,0,0,0,0}},
	{szName="�� Ph� Kim � Kh�i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=2},
	{szName="�� Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=2},
	{szName="�� Ph� Kim � H�i",tbProp={6,1,2984,1,0,0},nCount=1,nRate=2},
	{szName="�� Ph� Kim � Y�u ��i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=2},
	{szName="�� Ph� Kim � H� Uy�n",tbProp={6,1,2986,1,0,0},nCount=1,nRate=2},
	{szName="�� Ph� Kim � H�ng Li�n",tbProp={6,1,2987,1,0,0},nCount=1,nRate=2},
	{szName="�� Ph� Kim � B�i",tbProp={6,1,2988,1,0,0},nCount=1,nRate=2},
	{szName="�� Ph� Kim � Th��ng Gi�i",tbProp={6,1,2989,1,0,0},nCount=1,nRate=1},
	{szName="�� Ph� Kim � H� Gi�i",tbProp={6,1,2990,1,0,0},nCount=1,nRate=1},
	{szName="�� Ph� Kim � Kh� Gi�i",tbProp={6,1,2991,1,0,0},nCount=1,nRate=1},
	{szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=40.5},
	{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=10},
	{szName = "�i�m Kinh Nghi�m", nExp=100000000,nRate=5},
	{szName = "Kim � Ph�t Qu�n - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate = 0.2, CallBack = _Message},
	{szName = "Kim � Kim Kh�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0}, nRate = 0.2, CallBack = _Message},
	{szName = "Kim � H�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0}, nRate = 0.2, CallBack = _Message},
	{szName = "Kim � Y�u ��i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0}, nRate = 0.2, CallBack = _Message},
	{szName = "Kim � H� Uy�n - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0}, nRate = 0.2, CallBack = _Message},
	{szName = "Kim � H�ng Li�n - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0}, nRate = 0.2, CallBack = _Message},
	{szName = "Kim � Ng�c B�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate = 0.2, CallBack = _Message},
	{szName = "Kim � Th��ng Gi�i Ch� - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0}, nRate = 0.1, CallBack = _Message},
	{szName = "Kim � H� Gi�i Ch� - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0}, nRate = 0.1, CallBack = _Message},
	{szName = "Kim � Kh� Gi�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}, nRate = 0.1, CallBack = _Message},
	{szName="Kim Hoa Chi B�o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=3.3},
	{szName="Ph� Th�y Chi B�o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=2},
	{szName="Phong V�n Chi B�o",tbProp={6,1,3004,1,0,0},nCount=1,nRate=1, CallBack = _Message},
	{szName="M�t n� V��ng Gi�",tbProp={0,11,561,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
}

local SpecialAwardPoint = {100, 200, 300, 400, 500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000}

local Kill_Monster_Award = {szName=Items.Seed.szName, tbProp=Items.Seed.tbProp, nExpiredTime=Items.Seed.nExpiredTime}

local LogAction = 
{
	szUse2FlowerN = "SuDungHoaPhuongTim%dLan",
	szUsePurpleFlower = "SuDungHoaPhuongTim",
	szUseRedFlowerN = "SuDung%dLanHoaPhuongDo",
	szComposeRedFlower = "GhepHoaPhuongDo",
	szComposeWhiteFlower = "GhepHoaPhuongTrang",
	szComposePurpleFlower = "GhepHoaPhuongTim",
}

function pActivity:KillMonster(nNpcIndex)
	NpcFunLib:DropSingleItem(%Kill_Monster_Award, 1, 3, nNpcIndex)
end

function pActivity:ComposeFlower(szKey)
	if self.pCompose[szKey] then
		self.pCompose[szKey]:ComposeDailog(1)
	end
end

function pActivity:ReachSpecialPoint(PointList, nValue)
	for _, v in PointList do
		if v == nValue then
			return 1
		end
	end
end

function pActivity:UseRedFlower()
	local nCount = self:GetTask(%TSK_RED_FLOWER_COUNT) + 1
	self:AddTask(%TSK_RED_FLOWER_COUNT, 1)
	PlayerFunLib:AddExp(1000000, 1, %EVENT_LOG_TITLE, "Red Flower Exp award")
	
	if nCount == 500 or nCount == 1000 then
		local szAction = format(%LogAction.szUseRedFlowerN, nCount)
		%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, szAction)
	end
end

function pActivity:CanUseWhiteFlower()
	local nCount = self:GetTask(%TSK_2_FLOWER_COUNT)
	if self:ReachSpecialPoint(%SpecialAwardPoint, nCount+1) or nCount == 1999 then
		if PlayerFunLib:CheckFreeBagCell(1,"Ng��i mu�n nh�n ���c ph�n th��ng, kh�ng gian h�nh trang c�n ph�i c� 1 ch� tr�ng th� m�i s� d�ng ��o c� n�y") then
			return 1
		end
	else
		return 1
	end
end

function pActivity:Use2FlowerLog(nCount)
	if nCount == 50 or mod(nCount,100) == 0 then
		%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, format(%LogAction.szUse2FlowerN,nCount))
	end
end

function pActivity:Use2FlowerCommonAward(nCount)
	local bResult = 1
	if self:ReachSpecialPoint(%SpecialAwardPoint, nCount) then
		tbAwardTemplet:Give(%Award_B, 1, {%EVENT_LOG_TITLE, "From Award_B"})
	else
		bResult = nil
	end
	if nCount == %N_2_FLOWER_EXT_AWARD then
		PlayerFunLib:GetItem({szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200}, 1, %EVENT_LOG_TITLE, "SuDungHoaPhuongTim1000Lan")
	elseif nCount == %N_MAX_2_FLOWER then
		PlayerFunLib:GetItem({szName = "Kim � Kh� Gi�i - T� ch�n h� ph�i", tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0}}, 1, %EVENT_LOG_TITLE, "SuDungHoaPhuongTim2000Lan")
	end
	self:Use2FlowerLog(nCount)	
	return bResult
end

function pActivity:UseWhiteFlower()
	self:AddTask(%TSK_2_FLOWER_COUNT, 1)
	local nCount = self:GetTask(%TSK_2_FLOWER_COUNT)
	
	PlayerFunLib:AddExp(12000000, 1, %EVENT_LOG_TITLE, "White Flower Exp award")
	self:Use2FlowerCommonAward(nCount)
end

function pActivity:UsePurpleFlower()
	self:AddTask(%TSK_2_FLOWER_COUNT, 1)
	local nCount = self:GetTask(%TSK_2_FLOWER_COUNT)
	
	PlayerFunLib:AddExp(6000000, 1, %EVENT_LOG_TITLE, "Use Purple Flower Exp award")
	if not self:Use2FlowerCommonAward(nCount) then
		tbAwardTemplet:Give(%Award_A, 1, {%EVENT_LOG_TITLE, "From Award_A"})
		
	end
	%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, %LogAction.szUsePurpleFlower)
end

--szLogTitle
pActivity.pCompose = {}
local tbRedFormula = 
{
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 0.02,
	tbProduct = Items.Red_Flower,
	tbMaterial = {
		[1] = {szName=Items.Seed.szName, tbProp=Items.Seed.tbProp, nCount=1},
		[2] = {szName=Items.Chemicals.szName, tbProp=Items.Chemicals.tbProp, nCount=1},
		[3] = {szName=Items.Water.szName, tbProp=Items.Water.tbProp, nCount=1},
	},
	pProductFun = function(pCompose, nCount)
		%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, %LogAction.szComposeRedFlower)
	end,
	
}

local tbWhiteFormula = 
{
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 0.02,
	tbProduct = Items.White_Flower,
	tbMaterial = {
		[1] = {szName=Items.Seed.szName, tbProp=Items.Seed.tbProp, nCount=1},
		[2] = {szName=Items.Chemicals.szName, tbProp=Items.Chemicals.tbProp, nCount=1},
		[3] = {szName=Items.Water.szName, tbProp=Items.Water.tbProp, nCount=1},
		[4] = {szName=Items.Pigment.szName, tbProp=Items.Pigment.tbProp, nCount=1},	
	},
	pProductFun = function(pCompose, nCount)
		%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, %LogAction.szComposeWhiteFlower)
	end,
}

local tbPurpleFormula = 
{
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 0.02,
	tbProduct = Items.Purple_Flower,
	tbMaterial = {
		[1] = {szName=Items.Seed.szName, tbProp=Items.Seed.tbProp, nCount=1},
		[2] = {szName=Items.Chemicals.szName, tbProp=Items.Chemicals.tbProp, nCount=1},
		[3] = {szName=Items.Water.szName, tbProp=Items.Water.tbProp, nCount=1},
		[4] = {szName=Items.Pigment.szName, tbProp=Items.Pigment.tbProp, nCount=1},			
	},
	pProductFun = function(pCompose, nCount)
		%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, %LogAction.szComposePurpleFlower)
	end,
}

pActivity.pCompose["Red"] = tbActivityCompose:new(tbRedFormula, "ComposeRedFlower", INVENTORY_ROOM.room_equipment)
pActivity.pCompose["White"] = tbActivityCompose:new(tbWhiteFormula, "ComposeWhiteFlower", INVENTORY_ROOM.room_equipment)
pActivity.pCompose["Purple"] = tbActivityCompose:new(tbPurpleFormula, "ComposePurpleFlower", INVENTORY_ROOM.room_equipment)

