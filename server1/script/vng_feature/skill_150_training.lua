-- 文件名　：suxiaobaijuwan_150.lua
-- 创建者　：wangjingjun
-- 内容　　：150级技能的速效白驹丸
-- 创建时间：2011-07-28 10:57:36


Include("\\script\\global\\baijuwanhead.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\\playerfunlib.lua")
Include("\\script\\skill\\lvlup150_l21_limit.lua")
Include("\\script\\lib\\log.lua")

tbFastSpeedSkill_Banjuwan_150 = {}

tbFastSpeedSkill_Banjuwan_150.tbItemType = {
	["6,1,30314"] = {nTargetExp = 50, strUsedItem = "Thi猲 S琻 Th竛h Th駓", strLog = "SuDungThienSonThanhThuy"},
	["6,1,30449"] = {nTargetExp = 6000, strUsedItem = "Thi猲 S琻 Th竛h Th駓 (i)", strLog = "SuDungThienSonThanhThuyDai"},
}

function tbFastSpeedSkill_Banjuwan_150:AddSkillStackExp(nSkillId, nExp, strItemCode)
	local strUsedItem = self.tbItemType[strItemCode].strUsedItem
	local strLog = self.tbItemType[strItemCode].strLog
	local nTotalExp = nExp
	local nNextExp = GetSkillNextExp(nSkillId) - GetSkillExp(nSkillId)
	local nNeedAddExp = 0
	local szSkillName = GetSkillName(nSkillId)
	local nLastSkillExp = GetSkillExp(nSkillId)
	local nLastSkillLvl = GetCurrentMagicLevel(nSkillId, 0)
	while nExp > nNextExp do
		if GetCurrentMagicLevel(nSkillId, 0) >= GetSkillMaxLevel(nSkillId) then
			Msg2Player(format("S� d鬾g %s th祅h c玭g, <color=yellow> %s <color>  tu luy謓 n﹏g cao <color=yellow> %d <color>", strUsedItem, szSkillName, nTotalExp))
			return
		end
		nNeedAddExp = nNextExp
		nExp = nExp - nNeedAddExp
		AddSkillExp(nSkillId, nNeedAddExp, 1)		
		nNextExp = GetSkillNextExp(nSkillId)
	end
	AddSkillExp(nSkillId, nExp, 1)
	local nCurSkillExp = GetSkillExp(nSkillId)
	local nCurSkillLvl = GetCurrentMagicLevel(nSkillId, 0)
	Msg2Player(format("S� d鬾g %s th祅h c玭g, <color=yellow> %s <color>  tu luy謓 n﹏g cao <color=yellow> %d <color>", strUsedItem, szSkillName, nTotalExp))
	tbLog:PlayerActionLog(strLog, "K� n╪g "..szSkillName, "C蕄  c� "..nLastSkillLvl, "C蕄  hi謓 t筰 "..nCurSkillLvl, "ч tu luy謓 c� "..nLastSkillExp, "ч tu luy謓 hi謓 t筰 "..nCurSkillExp)
end

function tbFastSpeedSkill_Banjuwan_150:CheckSkill(nSkillId)
	local nCurSkillLevel = GetCurrentMagicLevel(nSkillId, 0);
	local nSkillExp = GetSkillExp(nSkillId)
	
	if HaveMagic(nSkillId) == -1 then
		return 0
	end

	if nSkillExp == -1 or nCurSkillLevel < 1 or nCurSkillLevel >= GetSkillMaxLevel(nSkillId) then
		return 0
	end
	
	if nCurSkillLevel == 20 and tbLvUp150L21Limit:IsAvailable(nSkillId) ~= 1 then
		return 0
	end
	
	return 1
end

function tbFastSpeedSkill_Banjuwan_150:AddSkillToList(tbDec, tbSrc)
	for i = 1, getn(tbSrc) do
		local nSkillId = tbSrc[i]
		if self:CheckSkill(nSkillId) == 1 then
			tinsert(tbDec , nSkillId)
		end
	end
end

function tbFastSpeedSkill_Banjuwan_150:GetCanUpdateSkill()
	local tbSkill = {};
	
	self:AddSkillToList(tbSkill, ARY_UPGRADE_SKILL_150)
	return tbSkill;
end

function tbFastSpeedSkill_Banjuwan_150:ShowMenu(nItemIndex)
	local tbSkill = self:GetCanUpdateSkill()
	
	local szTitle = "Xin h穣 l鵤 ch鋘 k� n╪g m� ngi mu鑞 t╪g:"
	
	tbOpt = {}
	for i=1, getn(tbSkill) do
		local nSkillId = tbSkill[i]
		local szSkillName = GetSkillName(nSkillId)		
		tinsert(tbOpt, 	{szSkillName, self.UseItem, {self, nItemIndex, nSkillId}})		
	end
	tinsert(tbOpt , {"H駓 b� "})
	CreateNewSayEx(szTitle, tbOpt)
end

function tbFastSpeedSkill_Banjuwan_150:UseItem(nItemIndex, nSkillId)
	if not self:CheckSkill(nSkillId) then
		return
	end
	local nG, nD, nP, _, _, _ = GetItemProp(nItemIndex)
	local strItemCode = format("%s,%s,%s", nG, nD, nP)
	if not self.tbItemType[strItemCode] then
		return
	end
	
	if IsMyItem(nItemIndex) == 1 and ConsumeEquiproomItem(1,nG, nD, nP,1) == 1 then	
		self:AddSkillStackExp(nSkillId, self.tbItemType[strItemCode].nTargetExp, strItemCode)		
	end
end

function main(nItemIndex)
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	tbFastSpeedSkill_Banjuwan_150:ShowMenu(nItemIndex)
	return 1	
end
