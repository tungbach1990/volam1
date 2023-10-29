Include("\\script\\event\\springfestival08\\allbrother\\event.lua");	-- 
Include("\\script\\event\\BeiDouChuanGong\\zhizuochuangongwan.lua");	-- 
Include("\\script\\event\\other\\xunmashu\\dialog.lua")
Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua");			-- ����ת���Ի�
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\task\\metempsychosis\\translife_4_ex.lua")
Include("\\script\\task\\metempsychosis\\translife_7.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName);
	end
	
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "Xin ch�o, t�i h� l� truy�n nh�n c�a B�c ��u M�n, ch�ng hay c�c h� c�n g�?";
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	tbDailog:AddOptEntry("Ta mu�n tr�ng sinh", zhuansheng_help_method);
	tbDailog:AddOptEntry("Nh�n k� n�ng sau khi tr�ng sinh 7 ", GetSkillAfterTS7);
	tbDailog:AddOptEntry("Nhi�m v� t� h�i giai huynh ��", allbrother_0801_main);
	tbDailog:AddOptEntry("Luy�n ti�n �an truy�n c�ng", BeiDouChuanGong_main, {1});
	tbDailog:AddOptEntry("T�m ki�m B�c ��u Tr��ng Sinh Thu�t", beidou_translife_main);
	tbDailog:AddOptEntry("Ta mu�n h�c k� n�ng Chi�n � Thi�n Thu", beidou_learn_specialskill);
	
	if tbXunMaShu0903:IsActDate() then
		tbDailog:AddOptEntry("Ho�t ��ng [B�o r��ng th�n b�]", tbXunMaShu0903.DialogMain_Box, {tbXunMaShu0903});
		tbDailog:AddOptEntry("B�c ��u Thu�n M� Thu�t", tbXunMaShu0903.DialogMain_Horse, {tbXunMaShu0903});
	end
	
	tbDailog:Show();
end