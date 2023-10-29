

Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")
function zhongqiu0808_zhangonghuizhang(nBattleLevel, i)
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	local tbItem = 	{szName="Huy ch��ng chi�n c�ng", tbProp={6, 1, 1818, 1, 0, 0}}
	if nDate >= zhongqiu0808_ZhanGongStartTime and nDate <= zhongqiu0808_ZhanGongEndTime then
		if zhongqiu0808_PlayerLimit() == 1 and nBattleLevel == 3  then
			if BT_GetData(PL_CURRANK) == 5 then
				Msg2Player("T�ng ��i hi�p 1 Huy ch��ng chi�n c�ng v� th�nh t�ch xu�t s�c!")
				tbAwardTemplet:GiveAwardByList(tbItem,tbItem.szName )
			else
				Msg2Player("Huy ch��ng chi�n c�ng ch� c� th� t�ng cho ng��i ch�i ��t danh hi�u ��i t��ng, h�y c� g�ng h�n trong l�n sau!")
			end
		end
	end
	
	
	
end

function zhongqiu0808_gongxuanlingpai()
	local tbSay = 
	{
		"<dec><npc>D�ng 2000 �i�m t�ch l�y T�ng Kim ��i 1 C�ng tr�ng l�nh b�i.",
		"X�c nh�n/zhongqiu0808_gongxuanlingpai_ok",
		"H�y b� /no"
	}
	CreateTaskSay(tbSay)
end

function zhongqiu0808_gongxuanlingpai_ok()
	if GetLevel() < 120 or IsCharged() ~= 1 then 
		return Say("Ch� c� nh�n v�t c�p 120 tr� l�n �� n�p th� m�i c� th� ��i C�ng Tr�ng L�nh B�i.", 0)
	end
	
	local tbItem = 	{szName="C�ng tr�ng l�nh b�i", tbProp={6, 1, 1819, 1, 0, 0}}
	local nPoint = 2000
	if nt_getTask(747) < nPoint then
		Say(format("�i�m t�ch l�y c�a b�n kh�ng �� %d, kh�ng �� �� ��i C�ng tr�ng l�nh b�i.", nPoint),0);
		return 0;
	end
	nt_setTask(747, floor(nt_getTask(747) - nPoint));
	tbAwardTemplet:GiveAwardByList(tbItem,tbItem.szName )
end