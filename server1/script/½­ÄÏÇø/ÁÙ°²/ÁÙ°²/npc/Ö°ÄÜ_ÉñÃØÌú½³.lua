-- ���ܣ�����װ��
-- С�˶�� 2008.1.14

Include( "\\script\\task\\system\\task_string.lua" );

-- ����
Include("\\script\\global\\recoin_goldenequip.lua")
-- ������������
Include("\\script\\task\\equipex\\head.lua");
-- �׽�װ��
Include("\\script\\global\\platina_upgrade.lua")
--�����׽�װ��
--Include("\\script\\global\\recoin_platinaequip.lua")
--Include("\\script\\event\\reclaim_equip\\reclaim_equip.lua") --���հ���Ʒ

Include("\\script\\misc\\itemexchangevalue\\itemexchangevalue.lua") -- �һ���������
Include("\\script\\misc\\itemexchangevalue\\ex_goldequip_lingpai.lua")	-- �һ���װ�����ƣ������ȣ�
Include("\\script\\activitysys\\npcdailog.lua")

function main()
	if (CheckGlobalTradeFlag() == 0) then		-- ȫ�־���ϵͳ���׿���
		return
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tbDailog.szTitleMsg = "<dec><npc>Th�t kh�ng ng� ta ��y �� mai danh �n t�ch �� l�u nh� v�y, th� m� v�n b� nh� ng��i t�m th�y ���c, ch�c l� ng��i v� mu�n ch� t�o <color=yellow> trang b� Ho�ng Kim <color> m� ��n ��y ch� g�."
	tbDailog.szTitleMsg = gsub(tbDailog.szTitleMsg , "<dec>", "")
	
	local aryDescribe =
	{
	--	"Ta mu�n t�m hi�u v� b� An bang Ho�n m�./main_talk",
	--	"Ta mu�n m�i ng��i tr�ng luy�n trang b� b�ch kim/platina_main",
		--"����������������װ��/refine_jinwu",
		--"�������������׽�װ��/recoin_platina_main",
	--	"Nh� ng��i gi�p ta ph�n m�nh m�t s� trang b� ho�ng kim./split_entry",
	--	"Ta mu�n s� d�ng m�nh trang b� �� h�p th�nh trang b� Ho�ng Kim./compose_entry",
		--"Ta mu�n ��i thi�t huy�t ��n/exchange_tiexuedan",
		--"�������������Ӱ���ε�����/perfect_hongying_main",
		--"��������һЩ����Ĵ������/equipex_recycle_main",
		--"�������Ƭ������ͬ�ƽ�װ����������Ƭ/exchange_entry",
		--"Ta mu�n l�y trang b� ��i th�nh h�n th�ch/exchange_olditem",
		--"Ta mu�n d�ng h�n th�ch ��i l�nh b�i/exchange_lingpai",
		--"Ta mu�n d�ng l�nh b�i ��i trang b�/exchange_lingpai2goldequip",
	}
	for i = 1, getn(aryDescribe) do
		local _,_, szOpt, szFun = strfind(aryDescribe[i], "([^/]+)/([^/]+)")
		local fn = getglobal(szFun)
		if fn then
			tbDailog:AddOptEntry(szOpt, fn);	
		end
	end
	
	
	
	--�����Ի���
	tbDailog:Show()
	
-- ������������������񣬲���ѡ��
--	local nNextStatus = check_nexttask_status();
--	if (check_nexttask_condition() == 1) then
--		tinsert(aryDescribe, 2, "����������������İ�������/nexttask_talk");
--	end
--	tinsert(aryDescribe, 2, "�������ð�װ��/reclaimBindEquip_main");
	
end

function exchange_tiexuedan()
	if (CalcFreeItemCellCount() < 2) then
		Say("�� ��m b�o an to�n cho v�t ph�m, h�y �� ch�a ra 2 � tr�ng tr� l�n", 0);
		return
	end
	GiveItemUI("��i thi�t huy�t ��n", "Xin h�y b� 1 trang b� ho�ng kim m�n ph�i b�t k� v�o � b�n d��i", "do_exchange_tiexuedan", "onCancel")
end

function do_exchange_tiexuedan(nCount)
	if nCount ~= 1 then
		CreateTaskSay({"S� l��ng v�t ph�m b� v�o kh�ng ��ng y�u c�u", "Th�nh th�t xin l�i, ta s� s�p x�p l�i/exchange_tiexuedan", "Th�t ng�i qu�, ta s� quay l�i sau./onCancel"});
		return
	end

	local nItemIndex	= GetGiveItemUnit(1)
	local nQuality		= GetItemQuality(nItemIndex);	--Ʒ��
	
	if (nQuality ~= 1 or GetGlodEqIndex(nItemIndex) > 140) then
		CreateTaskSay({"H�y ��a cho ta 1 trang b� ho�ng kim m�n ph�i", "Th�nh th�t xin l�i, ta s� s�p x�p l�i/exchange_tiexuedan", "Th�t ng�i qu�, ta s� quay l�i sau./onCancel"});
		return
	end
	
	if (RemoveItemByIndex(nItemIndex) ~= 1) then
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",
			"��i thi�t huy�t ��n Error",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			"X�a trang b� ho�ng kim m�n ph�i th�t b�i:\t"..GetItemName(nCurItemIdx)));
	end
	
	
	for i = 1, 20 do
		AddItem(6, 1, 2163, 1, 1, 0);
	end
	Msg2Player("Ch�c m�ng ��i hi�p �� nh�n ���c 20 Thi�t Huy�t ��n!");
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t %s",
			"��i thi�t huy�t ��n Success",
			GetLocalDate("%y-%m-%d %H:%M:%S"),
			GetAccount(),
			GetName(),
			format("��i %s thu ���c thi�t huy�t ��n", GetItemName(nItemIndex))));
end