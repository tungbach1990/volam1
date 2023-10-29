
---------------------------------------------------------------------------------
--  �������������ļ������ַ���
---------------------------------------------------------------------------------

-- ��ٽű�
-- Li_Xin 2004-8-17
--Include( "\\script\\global\\����.lua" )

--TASKID_HOLIDAY_GIFT_DATE = 160;				-- �������ID of ������һ����ȡ��������ʱ��
--TASKTMPID_HOLIDAY_GIFT_DATE = 160;			-- ��ʱ�������ID of ������һ����ȡ��������ʱ��
Include( "\\script\\event\\eventhead.lua" )
Include("\\script\\event\\maincity\\event.lua")	-- ���ǽ���
Include("\\script\\event\\superplayeract2007\\event.lua")----������һ
Include("\\script\\event\\great_night\\event.lua")	-- �Ի�֮ҹ
Include("\\script\\misc\\ex_goldequp_coin.lua");	-- �һ��ƽ�װ������
Include("\\script\\event\\jiefang_jieri\\201004\\main.lua");
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\Npc.lua") -- ����


-- Խ��0904��Ż
--Include("\\script\\event\\jiefang_jieri\\200904\\zhanshenzhujiu\\jiu_hecheng.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\jinnangshijian\\jinnangshijian.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\denggao\\denggao.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
--Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

Include("\\script\\event\\guoqing_jieri\\200908\\compose.lua")
Include("\\script\\event\\other\\jilixinwanjia\\200908\\npcdailog.lua")

-- Խ��0905���ջ
--Include("\\script\\event\\birthday_jieri\\200905\\npc\\npc_liguan_dailog.lua");
Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_npc.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\activitysys\\npcfunlib.lua")

Include("\\script\\task\\killmonster\\killmonster.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")
Include("\\script\\bonus_onlinetime\\func_onlineaward.lua")
Include("\\script\\vonghoa\\exchangitem\\exchangeitem.lua")
Include("\\script\\vonghoa\\item\\head.lua")
Include("\\script\\traogiaithdnb\\thdnb7.lua");--20100908 haint code function trao giai thdnb
Include("\\script\\baoruongthanbi\\dialogmain.lua")
Include("\\script\\vlkh\\vlkh1.lua")

--tinhpn 20101022: Event Thang 10
Include("\\script\\vng_event\\201010\\head.lua")
Include("\\script\\vng_event\\compensate.lua")
Include("\\script\\vng_event\\traogiai\\vldnb2010\\vlbnb.lua")

--[DinhHQ]
	--[20110107]:trao giai Phuong Anh Hao thang 12 2010
	Include("\\script\\vng_event\\traogiai\\pah_12_2010\\head.lua")
	--[20110124]:Vip account 2011
	Include("\\script\\vng_event\\vip_account_2011\\npc\\lequan.lua")
	--[20110216]:THDNB8
	Include("\\script\\vng_event\\20110215_THDNB8\\vng_thdnb8_award.lua")
	--[20110225]: 8/3/2011
	Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\lequan.lua")
	--[20110311]: NPAH thang 02 2011
	Include("\\script\\vng_event\\20110215_THDNB8\\vng_npah0211.lua")
	
	Include("\\script\\vng_event\\traogiai\\NPAH\\vng_ToolAward.lua")
--tinhpn 20110223:Reset pass ruong
Include("\\script\\vng_feature\\resetbox.lua")
Include("\\script\\vng_event\\traogiai\\vlmc2011\\vlmc2011_main.lua")

function main()
	

	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
--[DinhHQ]
	--[20110107]:Nh�n th��ng gi�i ��u Ph��ng Anh H�o
	--	tbPAH122010_Head:addDialog(tbDailog)
	--[20110124]:Vip account 2011
	tbVNG_VipAcc2011_LeQuan:addDialog(tbDailog)
	--[20110216]:THDNB8
	tbVNG_THDNB8:AddDialog(tbDailog)
	--[20110225]: 8/3/2011
	tbVNGWD2011_LeQuan:AddDialog(tbDailog)
	--[20110311]: NPAH thang 02 2011
	tbVNG_NPAH0211:AddDialog(tbDailog)
	--Trao v�ng h�o quang VLMC2011 - Modified by DinhHQ - 20110523
	tbVLMC2011_Tittle:AddDialog(tbDailog)
	tbVngToolAward:AddDialog(tbDailog)	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	--�����Ի���
	tbDailog:AddOptEntry("��m Huy Ho�ng", onGreat_Night)
--	tbDailog:AddOptEntry("Tham gia ho�t ��ng B�o R��ng Th�n B�", BRTB_Dialog_main)
--	tbDailog:AddOptEntry("Nh�n th��ng Chung K�t V� L�m �� Nh�t Bang", GetBonusVLDNB2010_main)
--	tbDailog:AddOptEntry("Nh�n l�i Ti�n ��ng", Compensate_main)
--	if (VH_ActiveDay()==1) then
--		tbDailog:AddOptEntry("Ta ��n ��i v�t ph�m event th�ng 8", ExChangeItem_main)
--	end
	tbDailog:AddOptEntry("M� Pass R��ng", ResetBox.ShowDialog, {ResetBox})
	
	--tinhpn 20101022: Event Thang 10
--	if (Event201010:IsActive() == 1) then
--		tbDailog:AddOptEntry("��i th��ng ho�t ��ng th�ng 10", Event201010.ShowDialog, {Event201010}) 	
--	end
	
	if IsIPBonus() then
		tbDailog:AddOptEntry("H� tr� cho m�y s� d�ng CSM", IpBonus)
	end
	
	--tinhpn 20100817: Online Award
--	if (OnlineAward_StartDate() ~= 0 and OnlineAward_Check_TransferLife() ~= 0) then
--		tbDailog:AddOptEntry("Tham gia online nh�n th��ng", OnlineAward); 
--	end
	
	local ncity = gb_GetTask("MAINCITYCFG", 1);
	local nCurMapID = SubWorldIdx2ID(SubWorld);
	if (ncity >= 1 and ncity <= 7 and nCurMapID == TB_MAINCITY_CITYWAR_T[ncity][2]) then
		tbDailog:AddOptEntry("Nh�n ph�n th��ng d�nh cho Th�i Th�", maincity_award_entry)	
	end
	if tbJILIWanJia0908:IsActDate() then
		tbDailog:AddOptEntry("Ho�t ��ng k�ch t�n th�", tbJILIWanJia0908.DailogMain, {tbJILIWanJia0908} )
	end
		
		
	if FreedomEvent2010:IsActive1() == 1 then
		tbDailog:AddOptEntry("��o c� t�m �o chi�n s�", FreedomEvent2010.LiGuanEventItemDlg, {FreedomEvent2010}) 	
	end
	
	if tbRefiningIron:CheckCondition() == 1 then
		tbDailog:AddOptEntry("Ho�t ��ng t�i luy�n th�p", tbRefiningIron.NpcTalk, {tbRefiningIron}) 	
	end
	
	tbDailog:Show()
end

function jiefang0904_act()
	Say("L� Quan: Hi�n �ang trong th�i gian di�n ra ho�t ��ng ch�o m�ng ng�y gi�i ph�ng,b� con �ang n�o n�c �n m�ng chi�n th�ng, ��i hi�p c� mu�n tham gia kh�ng n�o?", 6, 
			"Ta ��n nh�n c�m nang s� ki�n/jf0904_getjinnangshijian",
			format("Ho�t ��ng r��u m�ng chi�n th�ng/#tbJiefang0904_jiu:OnDailogMain()"),
			"Ho�t ��ng chinh ph�c ��nh FanXiPan/about_denggao",
			"Ho�t ��ng Oanh Li�t Thi�n Thu/about_shuizei",
			"Ho�t ��ng Ti�u Di�t Th�y T�c/about_shuizei",
			"Ta ch� ��n xem!/OnCancel");
end

Include([[\script\event\menglan_2006\menglan_2006.lua]]);
function v_menglanjie()
	Say("Qu� h�a! Qu� h�a! Ta thay m�t Ph��ng tr��ng Thi�u L�m c�m �n v� ch�c ph�c cho ng��i!", 7, 
		"Ta mu�n d�ng t�ng v�ng Kim Li�n Hoa/#v_mljaward(1)",
		"Ta mu�n d�ng t�ng v�ng M�c Li�n Hoa/#v_mljaward(2)",
		"Ta mu�n d�ng t�ng v�ng Th�y Li�n Hoa/#v_mljaward(3)",
		"Ta mu�n d�ng t�ng v�ng H�a Li�n Hoa/#v_mljaward(4)",
		"Ta mu�n d�ng t�ng v�ng Th� Li�n Hoa/#v_mljaward(5)",
		"Ta mu�n d�ng t�ng v�ng Li�n Hoa, m�i h� m�t c�i./v_mljaward_all",
		"Ch� l� hi�u k� gh� qua xem th�i!/OnCancel"
	);
end;

function v_mljaward(nIdx)
	if (CalcEquiproomItemCount(6,1,tab_NPCIdx[nIdx][1] + 5,-1) < 1) then
		Say("Ng��i ch�ng ph�i mu�n d�ng t�ng "..tab_NPCIdx[nIdx][2].." sao? H�nh nh� ng��i kh�ng mang theo "..tab_NPCIdx[nIdx][2].."!", 1, "�� ta �i chu�n b� ��!/OnCancel")
		return
	end;
	
	local nCount = GetTask(tab_NPCIdx[nIdx][3]);
	if (nCount >= SIMGER_LIMIT) then
		Say("Ng��i �� d�ng t�ng �� s� "..tab_NPCIdx[nIdx][2].." n�y r�i! H�y d�ng t�ng lo�i kh�c �i!", 0);
		return
	end;
	
	ConsumeEquiproomItem(1, 6, 1, tab_NPCIdx[nIdx][1] + 5, -1);
	SetTask(tab_NPCIdx[nIdx][3], nCount + 1);
	AddOwnExp(500000);
	Say("Qu� h�a qu�! ��y l� ch�t t�m � m� Ph��ng tr��ng Thi�u L�m v� ch��ng m�n Nga Mi g�i t�ng ng��i.", 1, "Nh�n l�y l� v�t./OnCancel");
	Msg2Player("B�n nh�n ���c <color=yellow>500000<color> �i�m kinh nghi�m.");
end;

function v_mljaward_all()
	for i = 1, getn(tab_NPCIdx) do
		if (CalcEquiproomItemCount(6,1,tab_NPCIdx[i][1] + 5,-1) < 1) then
			Say("Ng��i ch�ng ph�i mu�n d�ng t�ng "..tab_NPCIdx[i][2].." sao? H�nh nh� ng��i kh�ng mang theo "..tab_NPCIdx[i][2].."!", 1, "�� ta �i chu�n b� ��!/OnCancel")
			return
		end;
	end;
	
	local nCount = GetTask(TK_LOTUS_ALL);
	if (nCount >= TOGETHER_LIMIT) then
		Say("Th�t c�m �n ng��i! Nh�ng 12 Bao l� x� c�a ta �� t�ng ng��i h�t r�i.", 0);
		return
	end;
	
	for i = 1, getn(tab_NPCIdx) do
		ConsumeEquiproomItem(1, 6, 1, tab_NPCIdx[i][1] + 5, -1);
	end;
	SetTask(TK_LOTUS_ALL, nCount + 1);
	
	AddOwnExp(1000000);
	AddItem(6, 1, 1136, 1, 0, 0, 0); --��һ��������
	Say("Qu� h�a qu�! ��y l� ch�t t�m � m� Ph��ng tr��ng Thi�u L�m v� ch��ng m�n Nga Mi g�i t�ng ng��i.", 1, "Nh�n l�y l� v�t./OnCancel");
	Msg2Player("B�n nh�n ���c <color=yellow>1000000<color> �i�m kinh nghi�m v� 1 <color=yellow>Bao l� x�<color>");
end;

-- �����б�
aryHoliday = {	-- ����ʱ��, ���Ͻ���ʱ������������, �ظ�����Ʒ����ʾ�ı� 
				{ 20040822, onHoliday_QiXi, "C�nh ��p tr�i trong! Hai b�n sao kh�ng �i ch�i l�, c�n � l�i ��y l�m g�?" }
				-- ��������
			 };
	
function valentineGift()
	if (GetBit(GetTask(67),24) == 1) then
		if (GetBit(GetTask(1313),1) ~= 1) then
			SetTask(1313, SetBit(GetTask(1313), 1, 1))
			Talk(1, "", "<#> H�m nay l� m�t ng�y h�nh ph�c cho nh�ng ��i l��ng duy�n! Ta c� m�n qu� n�y t�ng cho nh�ng ai �� k�t h�n! Ch�c c�c v� 'B�ch ni�n giai l�o' ")
			-- ��2����������ӡ����
			for i = 1, 2 do
				AddItem( 6, 1, 18, 1, 0, 0 ,0);
			end
			Msg2Player( "<#>B�n nh�n ���c 2 T�m T�m T��ng �nh ph�!" );
			-- ��9�䡰õ�廨��
			for i = 1, 9 do
				AddItem( 6, 0, 20, 1, 0, 0 ,0);
			end	
			Msg2Player( "<#>B�n nh�n ���c  9 b�ng hoa h�ng!" );
			-- 50��������Ҽ���1������ɽ��¶��
			if( GetLevel() >= 50 ) then
				AddItem(6, 1, 72, 1, 0, 0, 0);
				Msg2Player( "<#>B�n nh�n ���c m�t b�nh Thi�n S�n B�o L�!" );
			end
		else
			Talk(1, "", "<#> Ng��i ch�ng ph�i �� nh�n qu� r�i sao? Nh��ng cho ng��i kh�c v�i ch�!")
		end
	else
		Talk(1, "", "<#> Ng��i ch�a k�t h�n, kh�ng th� nh�n ���c qu�!")
	end
end		 	
---------------- ȡ�� ----------------------------------------
function OnCancel()
end

function LiguanLog(object)
	WriteLog(date("%H%M%S") .. ": T�i kho�n:" .. GetAccount() .. ", nh�n v�t:" .. GetName() .. "," .. object);
end
