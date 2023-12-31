-- 文件名　：translife_4.lua
-- 创建者　：wangjingjun
-- 内容　　：4转相关对话和函数
-- 创建时间：2011-08-01 14:15:10

Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\lib\\log.lua")

function calSkillPoint(nCurLevel)
	local nResult = 0
	if nCurLevel < NSTARTLEVEL_4 then
		nResult = 0
	else
		nResult = floor((nCurLevel - NSTARTLEVEL_4) / NPERPOINTNEEDLEVEL) + 1
	end
	return nResult
end

function updataSkillPoint_4()
	local ntranscount = ST_GetTransLifeCount()
	
	if ntranscount < 4 then
		return
	end
	
	-- 当前等级可以获得的等级奖励
	
	if ntranscount == 4 then
		local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
		local nLastUpLevel = GetTask(TSK_LAST_UP_LEVEL_4)
		local nCurLevel = GetLevel()
		local nAddPoint = calSkillPoint(nCurLevel) - calSkillPoint(nLastUpLevel)
		SetTask(TSK_LAST_UP_LEVEL_4, nCurLevel)
		SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint + nAddPoint)
		
	elseif ntranscount >= 5 then
		local nTotalPoint = calSkillPoint(200) - calSkillPoint(1)
		local nUsedPoint = GetTask(TSK_USED_SKILL_POINT_4)
		SetTask(TSK_LEAVE_SKILL_POINT_4, nTotalPoint - nUsedPoint)
	end
	
end

function sureGetTranslifeTask_4()
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount ~= 3 then
		CreateTaskSay({"<dec><npc>".."Hi謓 t筰 ngi kh玭g ph秈 l� chuy觧 sinh 3, kh玭g th� ti誴 nh薾 nhi謒 v�!", " Bi誸 r錳!/OnCancel"})
		return 
	end
	
	local nCurLevel = GetLevel()
	if nCurLevel < 200 then
		CreateTaskSay({"<dec><npc>".."Ъng c蕄 c馻 ngi ch璦 n c蕄 200!", " Bi誸 r錳!/OnCancel"})
		return 
	end
	
	SetTask(TSK_TRANSLIFE_4, 1)
	Msg2Player("Ngi  nh薾 nhi謒 v� th祅h c玭g, h穣 nhanh ch﹏ 甶 thu th藀 T輈h L辌h Кn 甶")end

function wantGetTranslifeTask_4()
	CreateTaskSay({"<dec><npc>Ch� c� nh鱪g cao th� n祇 c� s� l莕 chuy觧 sinh l� 3 l莕, h琻 n鱝 ng c蕄 ph秈 t n c蕄 200 m韎 c� th� nh薾 nhi謒 v� n祔, ngi x竎 nh mu鑞 nh薾 kh玭g?",
		" S� d鬾g/sureGetTranslifeTask_4",
		"в ta suy ngh� l筰/OnCancel"})
end

function querySkillPoint_4()
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount < 4 then
		CreateTaskSay({"<dec><npc>Ngi v蒼 ch璦 chuy觧 sinh 4, kh玭g c� 甶觤 k� n╪g  ki觤 tra!", " Bi誸 r錳!/OnCancel"})
		return 
	end
	updataSkillPoint_4()		-- 更新剩余可用的技能点
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	local nUsedSkillPoint = GetTask(TSK_USED_SKILL_POINT_4)
	CreateTaskSay({format("<dec><npc>Hi謓 t筰 ngi c� th� s� d鬾g 甶觤 k� n╪g chuy觧 sinh 4 d� l筰 l� %d,  s� d鬾g l� %d 甶觤", nLeaveSkillPoint, nUsedSkillPoint),
		 " Bi誸 r錳!/OnCancel"})
	return 
end

function wantClearSkillPoint_4()
	--襲 ch豱h gi� t葃 甶觤 k� n╪g TS4 - Modified by DinhHQ - 20110813
	CreateTaskSay({format("<dec><npc>T葃 甶觤 k� n╪g tr飊g sinh 4, c莕 c� %d lng v� 1 <color=red>[B綾 u T葃 T駓 Кn]<color>, ngi x竎 nh l� t葃 l筰 hay kh玭g?",CLEAR_SKILL_4_PRICE ),
		"X竎 nh薾/sureClearSkillPoint_4",
		"в ta suy ngh� l筰/OnCancel"})
end

function sureClearSkillPoint_4()
	-- 未4转
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount < 4 then
		CreateTaskSay({"<dec><npc>Ngi v蒼 ch璦 chuy觧 sinh 4, kh玭g c莕 t葃 甶觤 k� n╪g n祔!", " Bi誸 r錳!/OnCancel"})
		return 
	end
	-- 钱不够	
	--襲 ch豱h gi� t葃 甶觤 k� n╪g TS4 - Modified by DinhHQ - 20110813
	if GetCash() < CLEAR_SKILL_4_PRICE or CalcItemCount(3, 6, 1, 30127, -1) <= 0 then
		CreateTaskSay({format("<dec><npc>T葃 甶觤 k� n╪g tr飊g sinh 4 c莕 c� <color=yellow> %d <color> lng v� 1 <color=yellow>[B綾 u T葃 T駓 Кn]<color>, h穣 chu萵 b� y  r錳 n g苝 ta",CLEAR_SKILL_4_PRICE), "Bi誸 r錳/OnCancel"})
		return 
	end
	
	updataSkillPoint_4()
	
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	local nUsedSkillPoint = GetTask(TSK_USED_SKILL_POINT_4)
	-- 没有使用技能点
	if nUsedSkillPoint <= 0 then
		CreateTaskSay({"<dec><npc>Ngi  ph﹏ ph鑙 甶觤 k� n╪g chuy觧 sinh 4 l� 0, kh玭g c莕 t葃 甶觤!", " Bi誸 r錳!/OnCancel"})
		return 
	end
	
	--襲 ch豱h gi� t葃 甶觤 k� n╪g TS4 - Modified by DinhHQ - 20110813
	if ConsumeItem(3, 1, 6, 1, 30127, -1) ~= 1 then
		CreateTaskSay({"<dec><npc>Ngi n鉯 c� B綾 u T葃 T駓 Кn sao ta kh玭g th蕐?", "в ta 甶 t譵/OnCancel"})
		return 
	end
	Pay(CLEAR_SKILL_4_PRICE)
	for i=1,getn(TB_SKILL_4) do
		if HaveMagic(TB_SKILL_4[i][1]) > 0 then
		SetSkillLevel(TB_SKILL_4[i][1],0)		-- 将技能等级都变成0
		end
	end
	
	nLeaveSkillPoint = nLeaveSkillPoint + nUsedSkillPoint
	nUsedSkillPoint = 0
	SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint)
	SetTask(TSK_USED_SKILL_POINT_4, nUsedSkillPoint)
	CreateTaskSay({format("<dec><npc>Ngi  t葃 th祅h c玭g 甶觤 k� n╪g chuy觧 sinh 4, hi謓 t筰 ngi c� th� s� d鬾g 甶觤 k� n╪g chuy觧 sinh 4 d� l筰 l� %d,  s� d鬾g l� %d 甶觤", nLeaveSkillPoint, nUsedSkillPoint),
		 " Bi誸 r錳!/OnCancel"})
	tbLog:PlayerActionLog("clear_4_turn_skill_point")
end