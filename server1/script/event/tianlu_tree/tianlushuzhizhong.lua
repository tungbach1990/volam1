-- ��»��֮��
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\event\\tianlu_tree\\tree.lua")
Include("\\script\\activitysys\\g_activity.lua")
--New eventsys action - modified by DinhHQ - 20130625
Include("\\script\\misc\\eventsys\\eventsys.lua")

local TSK_DAYLY_PLANT_NUM = 4015  -- ÿ����������
local TSK_PLANT_TIME = 4016   -- ����ʱ��
local MAX_LIMIT_PLANT_NUM = 40 -- ÿ����������
local PLANT_DELTA_TIME = 50  -- �������ʱ��
local MAX_LIMIT_PLANT_NUM_2 = 80

function main(nItemIndex)
	-- Change limit use by level - modified by DinhHQ - 20130531
	local nMaxLimit 
	local nTranslifeCount = ST_GetTransLifeCount() 
	if nTranslifeCount > 4 or (nTranslifeCount == 4 and GetLevel() >= 180) then
		nMaxLimit = %MAX_LIMIT_PLANT_NUM_2
	else
		nMaxLimit = %MAX_LIMIT_PLANT_NUM
	end
	if not PlayerFunLib:CheckTaskDaily(%TSK_DAYLY_PLANT_NUM, nMaxLimit, "H�m nay ��i hi�p �� tr�ng "..nMaxLimit.." c�y, kh�ng th� tr�ng th�m n�a, ngh� ng�i r�i ng�y mai l�i ��n.", "<") then
		return 1
	end
	-- �������λ��
	local szMapList = "11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53,175"
	local _,_,nMapIndex = GetPos()
	local nMapId = SubWorldIdx2ID(nMapIndex)
	if lib:CheckInList(szMapList, nMapId) then
		-- ����������ʱ��
		local deltaTime = GetCurServerTime() - GetTask(%TSK_PLANT_TIME)  
--		if GetTask(%TSK_PLANT_TIME)~=0 and deltaTime<%PLANT_DELTA_TIME then
--			Msg2Player("��i hi�p ng��i m�t qu� r�i ��, ngh� ng�i m�t l�t r�i h�y ti�p t�c.")
--			return 1
--		end
		-- ����
		SetTask(%TSK_PLANT_TIME, GetCurServerTime()) -- ��������ʱ��
		PlayerFunLib:AddTaskDaily(%TSK_DAYLY_PLANT_NUM, 1) -- ������������		
		--New eventsys action - modified by DinhHQ - 20130625
		EventSys:GetType("HarvestPlants"):OnPlayerEvent("use_tianlu_seed", PlayerIndex)
		G_ACTIVITY:OnMessage("Use_Tianlu_Seed");
		--B�ch ni�n h�i ng� l�nh b�i 2012 - modified by DinhHQ - 20120927
		DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\1005\\personal_quest.lua", "tbPVLB_Quest:AddTreeQuest")
		-- ��������������ӿ�
		%CreateTree(PlayerIndex)
		return 0
	else
		Talk(1, "","��o c� n�y ch� ���c s� d�ng t�i c�c th�nh th� v� th�n tr�n.")
		return 1
	end
end