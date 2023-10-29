
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\lib\\objbuffer_head.lua")
--tinhpn 20100706: Vo Lam Minh Chu
Include("\\script\\bonusvlmc\\fucmain.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
--20120620 - B� d�ng ch�n tai Minh Ch�
--	if (szNpcName == "Minh Ch� - Th�mTh�ngY") then 
--		tbDailog.szTitleMsg = "D� v� h�c ch�n nhi�p thi�n h�!"
--		tbDailog:AddOptEntry("Ph�c l�i V� L�m Minh Ch�", VLMC_main)
--	end
	if (szNpcName == "Minh ch� -  *Nh� �*") then 
		tbDailog.szTitleMsg = "D� v� h�c ch�n nhi�p thi�n h�!"
		tbDailog:AddOptEntry("Ph�c l�i V� L�m Minh Ch�", VLMC_main)
	end
	--�����Ի���
	tbDailog:Show()
	
end