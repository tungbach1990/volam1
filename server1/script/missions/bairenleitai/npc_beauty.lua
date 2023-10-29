-- ====================== �ļ���Ϣ ======================

-- ������Ե������½�� - ��̨��Ů
-- �ļ�������npc_beauty.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2011-05-03 10:26:19

-- ======================================================
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main(nNpcIndex)
	local szName = GetName();
	
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local nParam1 = GetNpcParam(nNpcIndex, 1);
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>H� n�i r�ng h� m� nghe ta d�o xong kh�c nh�c n�y ��u c�m th�y kh�ng kh�i tinh th�n, khi tu luy�n c�ng l�m t�ng m�t ph�n c�ng l�c, ng��i nghe th� xem qu� th�t c� chuy�n k� l� nh� v�y sao?"
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tinsert(tbDailog, {"L�i h�i ��n nh� v�y sao, v�y th� ta nghe th� xem.", onBeautyState, {szName, nParam1}});
	tinsert(tbDailog, {"Th�i th�i, ta kh�ng c� th� v�i m�y c�i tr� n�y ��u."})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
	
end

function onBeautyState(szName, nParam1)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\bairenleitai\\hundred_arena.lua", "HundredArena:AddDoubleState", szName, nParam1);
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex);
end
