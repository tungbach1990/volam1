Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\missions\\dungeon\\npcdialog.lua")
Include("\\script\\missions\\dungeon\\dungeonmanager.lua")

function main()	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>V� ��i hi�p th�t l� �a l�. �� c� trong ng��i �� c� th� luy�n thi�p ch�c h�n ngo�i giang h� c�ng l� m�t v� anh h�ng h�o ki�t. M�t l�c n�a th� luy�n ���ng s� m�, trong l�c ch� ��i �� ta gi�i th�ch cho ng��i lu�t � trong th� luy�n ���ng n�y."
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th� Luy�n ���ng", 1);
	
	tbDailog:AddOptEntry("Xin tr��ng l�o ch� d�y.",readRule);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() ~= 1 and tbDungeon:IsPrepareTime() ~= 1) then
		tbDailog:AddOptEntry("Ta mu�n ��i 1 c� h�i tri�u t�p cung ti�n th�",buyChance);
	end

	tbDailog:AddOptEntry("��n nh�n tri�u t�p ph�",getCallItem);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() ~= 1 and tbDungeon:IsPrepareTime() == 1) then
		tbDailog:AddOptEntry("B� qua b��c chu�n b�",skipPrepareTime);
	end
	
	tbDailog:AddOptEntry("Xem th�nh t�ch c�a ��t n�y",queryKillCount);
	tbDailog:AddOptEntry("Xem nh�n ���c bao nhi�u huy ch��ng",queryMedalCount);
	
	if (tbDungeon ~= nil and tbDungeon:IsBattleOver() == 1) then
		tbDailog:AddOptEntry("Ta ��n nh�n ph�n th��ng",getAward);
	end

	tbDailog:AddOptEntry("Ta mu�n r�i kh�i th� luy�n ���ng",leave);
	
	--�����Ի���
	tbDailog:Show()
end

function buyChance()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th� Luy�n ���ng", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:BuyChance();
	end
end

function getAward()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th� Luy�n ���ng", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:GetAward();
	end
end

function leave()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th� Luy�n ���ng", 1);
	if (tbDungeon ~= nil) then
		tbDungeonManager:LeaveDungeon(tbDungeon.nDungeonId, PlayerIndex);
	end
end

function getCallItem()
	if (CalcEquiproomItemCount(6,1,2315,-1) >= 1) then
		Talk(1,"","Ng��i �� c� tri�u t�p ph� r�i.");
		return
	end
	
	if (PlayerFunLib:CheckFreeBagCell(1, "default") == 1) then
		PlayerFunLib:GetItem("return {tbProp={6,1,2315,1,0,0},}",1,"Nh�n [Th� Luy�n ���ng tri�u t�p ph�]")
	end
end

function skipPrepareTime()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th� Luy�n ���ng", 1);
	if (tbDungeon ~= nil) then
		tbDungeon:SkipPrepare();
	end
end

function queryMedalCount()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th� Luy�n ���ng", 1);
	if (tbDungeon ~= nil) then
		Talk(1,"",format("Hi�n t�i c�c h� c� <color=green>%d<color> huy ch��ng th� luy�n ���ng.", tbDungeon:GetMedal()));
	end
end

function queryKillCount()
	local tbDungeon = tbDungeonManager:GetMineDungeon("Th� Luy�n ���ng", 1);
	if (tbDungeon ~= nil) then
		Talk(1,"",format("Ng��i �� ��nh l�i ���c <color=green>%d<color> t�n th�ch kh�ch", tbDungeon:GetKillCount()));
	end
end

function readRule()
	local szTitle =  "<npc>��i hi�p c� th� xem tr��c quang c�nh c�a b�n ���ng, m�t l�c n�a s� xu�t hi�n h�ng lo�t th�ch kh�ch xu�t hi�n. Vi�c c�a ng��i l� �i�u binh �� ph�ng th�. B�n ���ng c� 10 n�i �n gi�u c� quan, c�c h� ch� c�n ��n g�n n�i c�n g�i cung ti�n th� �� g�i s� tr� gi�p, m�i l�n m� 1 c� quan c�n 100 �i�m tinh l�c v� 5 huy hi�u th� luy�n. Ng��i v�n c� th� �i�u ph�i ��n v� tr� kh�c �� ph�t huy h�t t�c d�ng, m�i l�n �i�u ph�i m�t 2 huy ch��ng th� luy�n. H�u h�t m�i th�ch kh�ch ��u c� huy ch��ng th� luy�n, ��nh b�i c� c� may nh�n ���c. Sau 100 t�n th�ch kh�ch xu�t hi�n v� sau, c�ng ��nh b�i c�ng nhi�u th� ph�n th��ng c�ng h�p d�n, l�o phu c�ng s� chu�n b� ph�n th��ng h�p d�n h�n. <enter>�� b�i 1-49 th�ch kh�ch nh�n ���c m�c ch� b�o h�p <enter>�� b�i 50-69 th�ch kh�ch nh�n ���c ��ng ch� b�o h�p <enter>�� b�i 70-89 th�ch kh�c nh�n ���c ng�n ch� b�o h�p <enter>�� b�i 90-99 th�ch kh�ch nh�n ���c ho�ng kim b�o h�p <enter>�� b�i 100 th�ch kh�ch tr� l�n c� th� nh�n ���c huy�n thi�t b�o h�p <enter>C�n v� b�o h�p ch�a nh�ng ph�n th��ng g� th� xem v�n may c�a c�c h� ��."
	local tbOpt = {}
	tinsert(tbOpt, {"�a ta tr��ng l�o ch� d�y."})
	CreateNewSayEx(szTitle, tbOpt);
end


function OnExit()

end;