Include("\\script\\missions\\miniencounter\\protocol.lua");
Include("\\script\\lib\\objbuffer_head.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\activitysys\\playerfunlib.lua");
Include("\\script\\global\\autoexec_head.lua")
--Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local szThisFile = "\\script\\missions\\miniencounter\\dialog.lua"

function about_mini_encounter()
	local szTitle = "<npc>M�i ng�y th�i gian m� c�a Ph� Li Xung ��t Chi�n l� 9:00 - 23:00. B�o danh ���c 10 ng��i s� m� b�n �� chi�n tr��ng ngay, s� ng��i b�o danh nhi�u nh�t l� 16 ng��i. Doanh tr�i T�ng Kim 2 b�n ��u c� c� Nguy�n So�i, k�ch s�t ���c c� Nguy�n So�i c�a ��i ph��ng c� th� nh�n ���c 1 �i�m cho phe m�nh, gi�m 1 �i�m c�a ��ch. Gi�a b�n �� c� c� R�ng, phe k�ch s�t ���c c� R�ng th� s� kh� ��i th�nh, c� th� nh�n ���c 2 �i�m. B�n n�o ��t ���c 20 �i�m tr��c th� b�n �� th�ng. B�n th�ng s� nh�n ���c ph�n th��ng �i�m c�ng hu�n l�n, b�n thua nh�n ph�n th��ng nh�. ��i hi�p c� th� ��n ti�m c�ng hu�n mua ��o c� c�n thi�t. C�n c� theo bi�u hi�n c�a ��i hi�p trong chi�n tr��ng c� th� nh�n �i�m t�ch l�y nh�t ��nh, �i�m t�ch l�y n�y x�p h�ng m�i tu�n, ��i hi�p c� th� nh�n ph�n th��ng x�p h�ng phong ph�. Nh�n ALT+� c� th� xem �i�m t�ch l�y";
	CreateNewSayEx(szTitle, {{"Tr� l�i", no}});
end


function mini_encounter()
	local tbOption = 
	{
		{"B�o danh Ph� Li Xung ��t Chi�n", apply_signup},
		{"Quay l�i chi�n tr��ng", return_map},
		{"H�y b�o danh", cancel_signup},
		{"Ki�m tra s� ng��i b�o danh", prepare_query},
		{"�� ta suy ngh�", no},
	}

	local szTitle = "<npc>Ng��i ��n b�o danh tham gia Ph� Li Xung ��t Chi�n ��ng kh�ng, b�o danh nhanh l�n, ��ng c� ��ng ng� ra n�a";
	CreateNewSayEx(szTitle, tbOption)
end

function open_shop()
	Msg2Player(format("Hi�n t�i ��i hi�p c� %d �i�m c�ng hu�n.", GetTask(3450)));
	Sale(184, 23, 100, "open_shop_callback(%d,%d,%d)", "\\script\\missions\\miniencounter\\dialog.lua")
end

function open_shop_callback(nItemIdx, nPrice, nStackCount)
	SetItemBindState(nItemIdx, -2);
	return 1;
end

function sj_score()
	local tbOption = 
	{
		{"Ki�m tra �i�m t�ch l�y x�p h�ng c�a tu�n tr��c", sj_score_query},
		{"Nh�n ph�n th��ng �i�m t�ch l�y x�p h�ng c�a tu�n tr��c", sj_score_award},
		{"�� ta suy ngh�", no},
	};

	local szTitle = "<npc>T�i ��y c� th� ki�m tra v� nh�n ph�n th��ng �i�m t�ch l�y c�a Ph� Li Xung ��t Chi�n";
	CreateNewSayEx(szTitle, tbOption)
end

function sj_score_query()
	local szRoleName = GetName();

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute(
		"\\script\\missions\\miniencounter\\weekly_rank.lua",
		"tbMiniEncounterRank:QueryPersonalData",
		hObject,
		"sj_score_query_callback"
	);
	OB_Release(hObject);
end

function sj_score_query_callback(nParam, ParamHandle)
	local nResult = ObjBuffer:PopObject(ParamHandle);

	if nResult <= 0 or nResult > 100 then
		Talk(1, "", "Th�t ��ng ti�c, �i�m t�ch l�y tu�n tr��c c�a ng��i kh�ng n�m trong nh�m 100 th� h�ng ��u, tu�n n�y ti�p t�c c� g�ng �i! ");
	else
		Talk(1, "", format("Xin ch�c m�ng b�n, �i�m t�ch l�y x�p h�ng tu�n tr��c l�: h�ng %d", nResult));
	end
end

function sj_score_award()
	local szRoleName = GetName();

	local hObject = OB_Create()
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute(
		"\\script\\missions\\miniencounter\\weekly_rank.lua",
		"tbMiniEncounterRank:QueryPersonalData",
		hObject,
		"sj_score_award_callback"
	);
	OB_Release(hObject);
end

function sj_score_award_callback(nParam, ParamHandle)
	local nResult = ObjBuffer:PopObject(ParamHandle);
	
	-- ����������������
	local nTaskValue = GetTask(3475)
	local nWeek = GetByte(nTaskValue, 1)
	local nFlag = GetByte(nTaskValue, 2)
	local nCurWeek = tonumber(GetLocalDate("%W"))
	if nWeek ~= nCurWeek then
		nTaskValue = SetByte(nTaskValue, 1, nCurWeek)
		nFlag = 0
		nTaskValue = SetByte(nTaskValue, 2, nFlag)
		SetTask(3475, nTaskValue)
	end
	
	if nFlag > 0 then
		Talk(1, "", "�� nh�n ph�n th��ng r�i, kh�ng th� nh�n l�i");
		return nil;
	end

	--nResult = 2;												-- ����һ���콱����
	if nResult <= 0 or nResult > 100 then
		Talk(1, "", "Th�t ��ng ti�c, �i�m t�ch l�y tu�n tr��c c�a ng��i kh�ng n�m trong nh�m 100 th� h�ng ��u, tu�n n�y ti�p t�c c� g�ng �i! ");
		return nil;
	else
		Msg2Player(format("Xin ch�c m�ng b�n, �i�m t�ch l�y x�p h�ng tu�n tr��c l�: h�ng %d", nResult));
	end
	
	
	nTaskValue = SetByte(nTaskValue, 2, 1)
	SetTask(3475, nTaskValue)
end

function sj_history_exploit()
	local hObject = OB_Create();
	RemoteExecute(
		"\\script\\missions\\miniencounter\\history_exploit.lua",
		"tbMiniEncounterHistory:QueryHistoryExploit",
		hObject,
		"sj_history_exploit_callback"
	);
	OB_Release(hObject);
end

function sj_history_exploit_callback(nParam, ParamHandle)
	local nResult = ObjBuffer:PopObject(ParamHandle);
	if nResult == nil or nResult <= 0 then nResult = 0; end
	local strMsg = format("Hi�n t�i t�ng c�ng hu�n l�: %d", nResult);
	Talk(1, "", strMsg);
end

function onFirstTime()
	if GetTask(3999) ~= 1 then
		Msg2Player("��i hi�p v�n ch�a tham gia Ph� Li Xung ��t Chi�n, kh�ng th� nh�n th��ng.");
		return 0;
	end

	SetTask(3999, 2);
	PlayerFunLib:AddExp(20000000, 1, "[�����ͻս]��һ�β�����2000W���齱��");
	return 1;
end

function main()
--temporarily close - modified by DinhHQ 20130608
do return end
	local tbOption = {
		{"Gi�i thi�u Ph� Li Xung ��t Chi�n", about_mini_encounter},
		{"Ph� Li Xung ��t Chi�n", mini_encounter},
		{"C�a h�ng c�ng hu�n", open_shop},
		{"�i�m t�ch l�y Ph� Li Xung ��t Chi�n�i�m t�ch l�y", sj_score},
		{"�� ta suy ngh�", no},
	}
	local szTitle = "<npc>Ng��i ��n b�o danh tham gia Ph� Li Xung ��t Chi�n ��ng kh�ng, b�o danh nhanh l�n, ��ng c� ��ng ng� ra n�a"
	CreateNewSayEx(szTitle, tbOption)
end

function OnServerStart()
	do return end
	local nSubWorld = SubWorldID2Idx(325)
	local nNpcIndex
	if nSubWorld >= 0 then
		nNpcIndex = AddNpcEx(2068, 1, 0, nSubWorld, 49568, 101376, 1, "Ng��i ti�p d�n chi�n tr��ng", 0)
		if nNpcIndex > 0 then
			SetNpcScript(nNpcIndex, %szThisFile)
		end
		
		nNpcIndex = AddNpcEx(2068, 1, 0, nSubWorld, 50112, 99040, 1, "Ng��i ti�p d�n chi�n tr��ng", 0)
		if nNpcIndex > 0 then
			SetNpcScript(nNpcIndex, %szThisFile)
		end
	end
end
--temporarily close - modified by DinhHQ 20130608
--AutoFunctions:Add(OnServerStart)