-- ====================== �ļ���Ϣ ======================

-- ������Ե������½�� - 
-- �ļ�������npc_enter.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2011-05-03 16:50:24

-- ======================================================
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\log.lua")

function bairen_dialog()
	
	local tbOpt = {};
	tinsert(tbOpt, {"Ta mu�n v�o L�i ��i Ho�ng Th�nh T�", onEnterHunbredArena});
	tinsert(tbOpt, {"V� L�i ��i Ho�ng Th�nh T�", onHelpHunbredArena})
	tinsert(tbOpt, {"K�t th�c ��i tho�i", oncancel})
	CreateNewSayEx("<npc>L�i ��i Ho�ng Th�nh T� l� �� cho nh�ng cao th� tr�n giang h� c� m�t c� h�i vang danh c�a m�nh trong thi�n h�. N�u nh� l�m L�i Ch� li�n ti�p ��nh b�i nh�ng ng��i khi�u chi�n, s� vang danh thi�n h�, th�m ch� c� th� tr�c ti�p �I v�o Ho�ng Th�nh, v� n��c m� b�o ��n �n.", tbOpt)
end

function onEnterHunbredArena()
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\bairenleitai\\hundred_arena.lua", "HundredArena:NpcEnter")	
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhBachNhanLoiDai")
end

function onHelpHunbredArena()
	local tbOpt = {};
	tinsert(tbOpt, {"Ta mu�n v�o L�i ��i Ho�ng Th�nh T�", onEnterHunbredArena});
	tinsert(tbOpt, {"K�t th�c ��i tho�i", oncancel});
	
	CreateNewSayEx("<npc>L�i ��i Ho�ng Th�nh T� {{s� ���c m� m�i ng�y v�o l�c 12:00 ��n 0:00 s� k�t th�c }}. <enter> L�i ��i Ho�ng Th�nh T� t�m th�i thi�t k� 5 l�i ��i, trong �� {{L�i ��i 1 }} l� L�i ��i Ch�, ch� c� gi�nh th�ng l�i � L�i ��i n�y m�i c� th� ���c nh�n s� v� l�m c�ng nh�n."
		.."M�i l�n l�n ��i l� {{3 ph�t }}, n�u nh� trong kho�ng th�i gian n�y hai b�n b�t ph�n th�ng b�i, l�c �� {{s� l�y ng��i ch�u s�t th��ng �t h�n }} l�m l�i ch�, v� ti�p nh�n khi�u chi�n ti�p t�c c�a c�c cao th� kh�c."
		.."N�u kh�ng c� cao th� n�o d�m khi�u chi�n v�i L�i Ch�, Ho�ng th�nh T� s� ph�i ra cao th� c�a th�p ��i m�n ph�i l�n ��i khi�u chi�n, L�i Ch� c�n ph�i trong v�ng {{ 3 ph�t }} ��no b�i, n�u kh�ng s� b� t�nh l� b�i tr�n"
		.."<enter>Ch� �: c�n ph�i s� d�ng khinh c�ng nh�y l�n l�i ��i t� v�.",
		tbOpt);
end
