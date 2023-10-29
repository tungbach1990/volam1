

-- ====================== �ļ���Ϣ ======================

-- ������Ե������½�� - 
-- �ļ���;��ȫ��NPC����������ýű���OnGlobalNpcDeath����
-- �����ߡ���ZERO.SYS
-- ����ʱ�䣺2009-09-28 17:57:03

-- ======================================================
--Ĭ��ȫ��PlayerIndexΪ��Ʒ������, PlayerIndex
--nNpcIndex ������npc��NpcIndex
--nAttackerIndex ���һ���� ��PlayerIndex��, 
IncludeLib("NPCINFO")
Include("\\script\\lib\\string.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\task\\killmonster\\killmonster.lua")
Include("\\script\\missions\\boss\\bigboss.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\activitysys\\config\\32\\killdailytask.lua")
--tinhpn 20100706: Vo Lam Minh Chu
Include("\\script\\bonusvlmc\\killmonster.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")

function OnGlobalNpcDeath(nNpcIndex, nAttackerIndex)
	if PlayerIndex and PlayerIndex > 0 then
		--PlayerEvent:OnEvent("OnKillNpc", nNpcIndex, nAttackerIndex)

		local szNpcName = GetNpcName(nNpcIndex)
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end
		EventSys:GetType("NpcDeath"):OnEvent(szNpcName, nNpcIndex, nAttackerIndex, PlayerIndex)
		
		local nTeamSize = GetTeamSize()
		if nTeamSize > 0 then
			for i=1, nTeamSize do
				local nPlayerIndex = GetTeamMember(i)
				lib:DoFunByPlayer(nPlayerIndex, tbKillMonster.KillMonster, tbKillMonster, nNpcIndex)
				--tinhpn 20100706: VLMC
				lib:DoFunByPlayer(nPlayerIndex, VLMC.KillMonster, VLMC, nNpcIndex)
			end
		else
			tbKillMonster:KillMonster(nNpcIndex)
			--tinhpn 20100706: VLMC
			VLMC:KillMonster(nNpcIndex)
		end
		tbKillDailyTask:OnKillMonster(nNpcIndex)		
		G_ACTIVITY:OnMessage("NpcOnDeath", nNpcIndex)
		G_TASK:OnMessage("Th�y Y�n", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("Nga Mi", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("���ng M�n", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("C�i Bang", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("Ng� ��c", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("Thi�n Nh�n", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("Thi�u L�m", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("V� �ang", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("Thi�n V��ng", nNpcIndex, "KillNpc")
		G_TASK:OnMessage("C�n L�n", nNpcIndex, "KillNpc")
		DynamicExecute("\\script\\missions\\tianchimijing\\floor4\\bossdeath.lua", "OnDeath", nNpcIndex, PlayerIndex)
		-- ���ص��� 2011.03.03
		DynamicExecute("\\script\\missions\\challengeoftime\\chuangguang30.lua", "ChuangGuan30:OnNpcDeath", nNpcIndex, PlayerIndex)
		-- ת��4������������������
		DynamicExecute("\\script\\task\\metempsychosis\\npcdeath_translife_4.lua", "OnNpcDeath", nNpcIndex, PlayerIndex)
		
		-- ��������
		if NpcFunLib:CheckBoatBoss(nNpcIndex) == 1 and tbRefiningIron:IsCarryOn() == 1 then
			tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, {tbProp={6,1, 2293, 1,0,0,},nExpiredTime=tbRefiningIron.nCloseDate,}, "Th�y t�c ��u l�nh r�i � ho�t ��ng luy�n kim", 1)
		end
		
		if (DynamicExecute("\\script\\event\\jiefang_jieri\\201004\\main.lua", "FreedomEvent2010:IsActive1") == 1) then
			DynamicExecute("\\script\\event\\jiefang_jieri\\201004\\soldier\\main.lua", "Soldier2010:MonsterDrop", nNpcIndex, PlayerIndex);
		end
		-- ��Ծ������ʮ��boss
		DynamicExecute("\\script\\huoyuedu\\worldtop10.lua", "checkworldtop10", nNpcIndex, PlayerIndex)
	end
end
