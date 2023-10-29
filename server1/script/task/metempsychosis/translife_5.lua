-----------------------------------------------------------------------------
-- Translife 5
--
-- Last modified        2012-8-16.
-- Written by           liujun4.
-- Email                dearliujun@gmail.com.
-- Copyright            Kingsoft. 
-----------------------------------------------------------------------------

Include("\\script\\misc\\eventsys\\type\\func.lua")
Include("\\script\\misc\\eventsys\\type\\harvestplant.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\task\\metempsychosis\\task_head.lua")
Include("\\script\\missions\\yandibaozang\\head.lua")

local tbAwardItem = {szName="V� C�c Ti�n ��n", tbProp={6,1,3277,1,0,0},nBindState = -2,}
local nAwardCount = 5
local nFinishSongJin = 300
local nChuanguanLimit = 17
local nYDBZguoguanLimit = 6
local nTranslifeCount = 4
local nLevelLimit = TB_LEVEL_LIMIT[nTranslifeCount+1]

TRANSLIFE5_SKILL = 1262

-----------------------------------------------------------------------------
-- FinishSongJin. 
--
-- @param tbPlayerAll        All player who finished songjin.
-----------------------------------------------------------------------------

function TRANSLIFE5_onFinishSongJin(nBattleLevel, tbPlayerAll)
	for i=1, getn(tbPlayerAll) do
		CallPlayerFunction(tbPlayerAll[i].nIndex, TRANSLIFE5_onFinishSongJinAward)
	end
end


-----------------------------------------------------------------------------
-- Chuanguan. if nChuanguanCount >= 17, then give award.
--
-- @param nChuanguanCount   
-- @param tbAllPlayer     
-----------------------------------------------------------------------------

function TRANSLIFE5_onChuanguan(nChuanguanCount, tbAllPlayer, n_level)
	if nChuanguanCount == %nChuanguanLimit then
		for i = 1, getn(tbAllPlayer) do 
			CallPlayerFunction(tbAllPlayer[i], TRANSLIFE5_onChuanguanAward)
		end
	end
end


-----------------------------------------------------------------------------
-- YDBZguoguan. if nGuoGuanCount >= 6, then give award
--
-- @param nPlayerIndex       
-- @param nGuoGuanCount      
-----------------------------------------------------------------------------

function TRANSLIFE5_onYDBZguoguan(nGuoGuanCount)
	
	if nGuoGuanCount == %nYDBZguoguanLimit then
		--if GetByte(GetTask(YDBZ_ITEM_YANDILING), 1) == 1 then
			if CalcFreeItemCellCount() > 0 then
				TRANSLIFE5_award()
			end
		--end
	end
end


-----------------------------------------------------------------------------
-- Ontianlu_tree. 
--
-- @param nNpcIndex       
-- @param nPlayerIndex      
-----------------------------------------------------------------------------

function TRANSLIFE5_ontianlu_tree(nNpcIndex)
	local nCount = GetTask(TSK_TRANSLIFE_5)
	if nCount > 0 then
		SetTask(TSK_TRANSLIFE_5, nCount+1)
		Msg2Player(format("��i hi�p ng��i �� tr�ng ���c %d c�y.", nCount))	end
end


-----------------------------------------------------------------------------
-- OnFinishSongJinAward. 
-- Giving award when player gain points above than 300.
-----------------------------------------------------------------------------

function TRANSLIFE5_onFinishSongJinAward()
	if GetTask(751) >= %nFinishSongJin then
		TRANSLIFE5_award()
	end
end


-----------------------------------------------------------------------------
-- OnChuanguanAward. 
-- Giving award when player used longxuewan.
-----------------------------------------------------------------------------

function TRANSLIFE5_onChuanguanAward()
	if GetTask(%TSK_Longxuewan_avail) >= 0 then
		TRANSLIFE5_award()
	end
end


-----------------------------------------------------------------------------
-- Giving award when player take the task of translife_5
-----------------------------------------------------------------------------

function TRANSLIFE5_award()
	if GetTask(TSK_TRANSLIFE_5) > 0 then
		tbAwardTemplet:Give(%tbAwardItem, %nAwardCount,{%tbAwardItem.szName})
	end
end


-----------------------------------------------------------------------------
-- Dialog option.      
-----------------------------------------------------------------------------

function TRANSLIFE5_wantGetTranslifeTask()
CreateTaskSay({format("<dec><npc>Ch� c� s� l�n tr�ng sinh l� %d l�n, h�n n�a ��ng c�p ��t ��n %d m�i c� th� nh�n nhi�m v� n�y, ng��i c� quy�t ��nh nh�n nhi�m v� n�y kh�ng? ", %nTranslifeCount, %nLevelLimit),
		" S� d�ng/TRANSLIFE5_sureGetTranslifeTask",
		"�� ta suy ngh� l�i/OnCancel"})
end


-----------------------------------------------------------------------------
-- Get translife task.      
-----------------------------------------------------------------------------

function TRANSLIFE5_sureGetTranslifeTask()
	local nCurTranslifecount = ST_GetTransLifeCount()
	if nCurTranslifecount ~= %nTranslifeCount then
		CreateTaskSay({format("<dec><npc>".."S� l�n tr�ng sinh hi�n t�i c�a ng��i l� %d l�n, kh�ng th� nh�n nhi�m v� n�y!", %nTranslifeCount), " Bi�t r�i!/OnCancel"})
		return 
	end
	local nCurLevel = GetLevel()
	if nCurLevel < %nLevelLimit then
		CreateTaskSay({format("<dec><npc>".."��ng c�p c�a ng��i v�n ch�a �� %d c�p!", %nLevelLimit), " Bi�t r�i!/OnCancel"})
		return 
	end	
	if GetTask(TSK_TRANSLIFE_5) == 0 then
		SetTask(TSK_TRANSLIFE_5, 1)
	end
	Msg2Player("Ng��i �� th�nh c�ng nh�n nhi�m v� tr�ng sinh 5.")
end


-----------------------------------------------------------------------------
-- Check conditions of translife_5: 400���޼��ɵ���150�������ɵ���400��ת������
-- һ�������������顷
--
-- @return      0 for false, 1 for true       
-----------------------------------------------------------------------------

function TRANSLIFE5_canTranslife()
	for i=1,getn(TBITEMNEED_5) do
		local tbProb = TBITEMNEED_5[i].tbProb
		if CalcItemCount(3,tbProb[1], tbProb[2],tbProb[3], -1) < TBITEMNEED_5[i].nCount then
			CreateTaskSay({TB_TRANSLIFE_ERRORMSG[15 + i], "���c r�i./OnCancel"})
			return 0
		end
	end
--	if GetTask(TSK_TRANSLIFE_5)-1 < N_TRANSLIFE_TREE_MIN then
--		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[19], "���c r�i./OnCancel"})
--		return 0
--	end
	--Translife 5 need 5000000 jxb - modified by DinhHQ - 20130531
	--Translife 5 b� chuy�n sinh th� 5 - modified by NgaVN - 20140620
--	if GetCash() < 10000000 then
--		CreateTaskSay({"L�n chuy�n sinh th� 5 y�u c�u ph�i c� 1000 v�n l�m chi ph�, xin h�y chu�n b� �� r�i ��n t�m ta", "���c r�i./OnCancel"})
--		return 0
--	end
	return 1
end


-----------------------------------------------------------------------------
-- Translife succeed, do some operation.      
-----------------------------------------------------------------------------

function TRANSLIFE5_translifeOperation()
	SetTask(TSK_TRANSLIFE_5, 0)   -- 5ת��������Ϊδ����
	for i=1,getn(TBITEMNEED_5) do -- �۳�5ת����
		local tbProb = TBITEMNEED_5[i].tbProb
		ConsumeItem(3,TBITEMNEED_5[i].nCount, tbProb[1], tbProb[2], tbProb[3], -1)
	end
	AddMagic(%TRANSLIFE5_SKILL, 1)   -- ������ת����
end


-----------------------------------------------------------------------------
-- Query the number of tree.      
-----------------------------------------------------------------------------

function TRANSLIFE5_queryTreeNumber()
	local ntranscount = ST_GetTransLifeCount()
	if GetTask(TSK_TRANSLIFE_5) == 0 then
		CreateTaskSay({"<dec><npc>Ng��i v�n ch�a nh�n nhi�m v� tr�ng sinh 5, kh�ng c� s� l��ng tr�ng c�y �� ki�m tra!", " Bi�t r�i!/OnCancel"})
		return 
	end
	local nTreeNumber = GetTask(TSK_TRANSLIFE_5) - 1
	CreateTaskSay({format("<dec><npc>Hi�n t�i ng��i �� tr�ng ���c<color=red>%d<color>C�y Tr�ng Sinh.", nTreeNumber),
		 " Bi�t r�i!/OnCancel"})
end


-----------------------------------------------------------------------------
-- Registe some messages to eventsys.
-----------------------------------------------------------------------------

function TRANSLIFE5_init()
	EventSys:GetType("SongJin"):Reg("OnFinish", TRANSLIFE5_onFinishSongJin)  -- �ν�
	EventSys:GetType("ChuanGuan"):Reg("OnPass", TRANSLIFE5_onChuanguan)  -- ���أ�ʹ����Ѫ�裩
	EventSys:GetType("YanDiBaoZang"):Reg("OnPass", TRANSLIFE5_onYDBZguoguan)  -- �׵۴���
	EventSys:GetType("HarvestPlants"):Reg("tianlu_tree", TRANSLIFE5_ontianlu_tree)  -- ����
end

--Make change translife for free - Modified by DinhHQ - 20130531
--TRANSLIFE5_init()