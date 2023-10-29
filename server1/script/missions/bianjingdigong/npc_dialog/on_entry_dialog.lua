--======================================================================
--Author:   Tan Qingyu
--Date:     2012-3-31 11:01:04
--Describe: �꾩�ع� ���NPC�Ի��ű�
--======================================================================

Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\missions\\bianjingdigong\\bianjingdigong_head.lua")

function main()
	--�������ˣ�����յع�ʱ������������
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	
	local tbOpenDate = BJDG_HEAD.tbOpenDate
	local nIsOpen = BJDG_HEAD.nIsOpen
	
	if (nIsOpen == 0) or (nCurDate < tbOpenDate.nBegin) or (nCurDate >= tbOpenDate.nEnd and tbOpenDate.nEnd ~= 0) then
		Talk(1, "", "Giang h� ��n r�ng trong th�nh Bi�n Kinh c� m�t ��a Cung th�n b�, nghe n�i trong �� ti�m �n v� s� b�o t�ng qu� gi�, b�ng m�i gi� ta ph�i v�o ��a cung cho b�ng ���c. Ta tin r�ng s� c� 1 ng�y, nh�t ��nh s� l�m cho ��a Cung hi�n di�n tr��c b�n d�n thi�n h�!")
		return
	end
	
	local nLastResetDate = GetTask(BJDG_HEAD.nLastResetDateTaskId)
	if nCurDate ~= nLastResetDate then
		SetTask(BJDG_HEAD.nInDungeonTimeTaskId, 0)
		SetTask(BJDG_HEAD.nLastResetDateTaskId, nCurDate)
	end

	local nNpcIndex = GetLastDlgNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDialog = DailogClass:new(szNpcName)
	tbDialog.szTitleMsg = "<npc>Huynh mu�i ch�ng t�i ��n ��y �� �i�u tra b� m�t c�a ��a Cung Bi�n Kinh, v� �� l�p n�n 4 tr�n ph�p trong ��a Cung n�y. Trong tr�n ph�p c� th� b�o h� cho ng��i. Ng��i c� th� t� ch� c�a ta l�a ch�n truy�n t�ng ��n b�t k� tr�n ph�p n�o ng��i mu�n, c�ng c� th� ��i tho�i v�i gia huynh K� L�c Nh�n � trong ��a Cung �� truy�n t�ng. Trong ��a Cung v� c�ng nguy hi�m, m�i ng�y ng��i ch� c� th� l�u l�i n�i �� 2 ti�ng ��ng h� m� th�i, c�n n�u nh� ng��i c� ���c l�i l�c g� khi v�o �� hay kh�ng, th� c�n ph�i xem b�n l�nh c�a nh� ng��i nh� th� n�o ��."
	G_ACTIVITY:OnMessage("ClickNpc", tbDialog, nNpcIndex)
	tinsert(tbDialog, {"�i v�o ��a Cung", SendMeToDlg})
	tinsert(tbDialog, {"Ki�m tra th�i gian c�n l�i", QueryLeftTime})
	tinsert(tbDialog, {"K�t th�c ��i tho�i"})
	CreateNewSayEx(tbDialog.szTitleMsg, tbDialog)
end

function SendMeToDlg()
	local nNpcIndex = GetLastDlgNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDialog = DailogClass:new(szNpcName)
	
	if PlayerFunLib:CheckTotalLevel(135, "default", ">=") ~= 1 then
		return
	end
	
	if GetCamp() == 0 then
		Talk(1, "", "Ch�o ��i hi�p: ��a Cung mu�n tr�ng hi�m nguy, ng��i m�i gia nh�p giang h� nh� c�c h� kh�ng th� v�o ��")
		return
	end
	
	local nHour = tonumber(GetLocalDate("%H"))
	if BJDG_HEAD.tbOpenTime[nHour] ~= 1 then
		Talk(1, "", "M�i ng�y v�o l�c 10:00-24:00, 0:00-2:00 l� th�i gian m� b�n �� m� cung.")
		return
	end
	
	local nInDungeonTime = GetTask(BJDG_HEAD.nInDungeonTimeTaskId)
	if nInDungeonTime >= BJDG_HEAD.nDailyLimitTime then
		Talk(1, "", "��a Cung l� n�i v� c�ng nguy hi�m, m�i ng�y ng��i ch� c� th� v�o �� ���c 2 ti�ng ��ng h� m� th�i.")
		return
	else
		tbDialog.szTitleMsg = "<npc>Xin h�y l�a ch�n �i�m truy�n t�ng"
		G_ACTIVITY:OnMessage("ClickNpc", tbDialog, nNpcIndex)
		tinsert(tbDialog, {"Thanh Long Tr�n", SendMeTo, {"Thanh Long Tr�n"}})
		tinsert(tbDialog, {"B�ch H� Tr�n", SendMeTo, {"B�ch H� Tr�n"}})
		tinsert(tbDialog, {"Chu T��c Tr�n", SendMeTo, {"Chu T��c Tr�n"}})
		tinsert(tbDialog, {"Huy�n V� Tr�n", SendMeTo, {"Huy�n V� Tr�n"}})
		tinsert(tbDialog, {"K�t th�c ��i tho�i"})
	end
	CreateNewSayEx(tbDialog.szTitleMsg, tbDialog)
end

function SendMeTo(szPos)
	NewWorld(unpack(BJDG_HEAD.tbPos[szPos]))
end

function QueryLeftTime()
	local nLeftTime = BJDG_HEAD.nDailyLimitTime - GetTask(BJDG_HEAD.nInDungeonTimeTaskId)
	if nLeftTime <= 0 then
		nLeftTime = 0
	end
	local nLeftHours = floor(nLeftTime / 3600);
	local nLeftMinutes = floor(mod(nLeftTime, 3600) / 60);
	local nLeftSeconds = mod(nLeftTime, 60);
	
	Talk(1, "", format("H�m nay c�c h� c�n c� th� l�u l�i trong ��a Cung [%02d:%02d:%02d]", nLeftHours, nLeftMinutes, nLeftSeconds))
end
