-- �ٰ���ְ�ܡ���������
-- By Li_Xin (2004-07-20)

Include("\\script\\global\\shenmi_chapman.lua") 
Include("\\script\\lib\\gb_taskfuncs.lua");
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\event\\act2years_yn\\baibaoxiang.lua") 
Include("\\script\\event\\leize_upplatina\\platina_upgrade.lua")--�׽�װ��
Include("\\script\\event\\leize_upplatina\\recoin_platinaequip.lua")--�����׽�װ��
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
--Exchange exp to meridan material - Modified By DinhHQ - 20120712
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailog.lua")
function main()
	if (CheckGlobalTradeFlag() == 0) then		-- ȫ�־���ϵͳ���׿���
		return
	end
	local nNpcIndex = GetLastDiagNpc();	
	local szNpcName = "Th�n B� Th��ng Nh�n"
	local tbDailog = DailogClass:new(szNpcName);	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	tbDailog.szTitleMsg = "<npc>Ta c� � t� T�y V�c xa x�i ��n Trung Nguy�n mu�n mua m�t s� ��c s�n nh� th�y tinh, kim nguy�n b�o v� ng�n phi�u. N�u nh� ng��i c� nh�ng v�t ph�m tr�n th� ta c�ng c� 1 s� v�t ph�m qu� mu�n c�ng ng��i trao ��i."
	tbDailog:AddOptEntry("Trao ��i �� ph� v� kh�", get1);
	tbDailog:AddOptEntry("Mua K� tr�n d� b�o", get2);
	tbDailog:AddOptEntry("X� l� <trang b� t�n h�i>", deal_brokenequip);
	tbDailog:AddOptEntry("Ta mu�n ��i b�o r��ng>", BaiBaoXiang_Give_UI);
	tbDailog:Show()	
	
--	local tbDecOpp =
--	{
--		"<dec><npc>Ta c� � t� T�y V�c xa x�i ��n Trung Nguy�n mu�n mua m�t s� ��c s�n nh� th�y tinh, kim nguy�n b�o v� ng�n phi�u. N�u nh� ng��i c� nh�ng v�t ph�m tr�n th� ta c�ng c� 1 s� v�t ph�m qu� mu�n c�ng ng��i ��i.",
--		
--		--Change request 04/06/2011, ��ng ch� t�o trang b� b�ch kim - Modified by DinhHQ - 20110605
--		--"Ta mu�n th�ng c�p cho trang b� B�ch Kim n�y/upgrade_paltinaequip",
--		--"Ta mu�n ch� t�o trang b� Ho�ng Kim th�nh trang b� B�ch Kim/upgrade_goldformplatina",
--		
--		--"�������������׽�װ��/recoin_platina_main",
--		"<#> Trao ��i �� ph� v� kh� /get1",
--		"<#> Mua K� tr�n d� b�o/get2",
--		"<#> X� l� <trang b� t�n h�i>/deal_brokenequip",
--		--"�����˽�׽�װ�����/unweave_paltinaequip",
--		"<#>Ta mu�n ��i b�o r��ng/BaiBaoXiang_Give_UI",
--		"<#> Ta xem th� tr��c ��!/no",
--		
--	};
--	local ndate = tonumber(GetLocalDate("%y%m%d%H"))
--	
--	--Say(str[1],5,str[6],str[2],str[3],str[4], str[5])
--	CreateTaskSay(tbDecOpp);
end;

function no()
end;