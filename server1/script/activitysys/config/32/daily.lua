Include("\\script\\activitysys\\config\\32\\head.lua")
Include("\\script\\activitysys\\config\\32\\variables.lua")
Include("\\script\\activitysys\\config\\32\\killdailytask.lua")
Include("\\script\\activitysys\\config\\32\\gatherdailytask.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")
Include("\\script\\lib\\log.lua")
--Phong v�n l�nh b�i - ghi nh�n s� l�n ho�n th�nh nhi�m v� V� l�m minh ch� - Modified by DinhHQ - 20110920
Include("\\script\\activitysys\\g_activity.lua")

function pActivity:IsOpen()
	return 1;
end

function pActivity:Init()
	%tbKillDailyTask:Init();
	%tbGatherDailyTask:Init();
	%tbTalkDailyTask:Init();
end

function pActivity:AcceptKillTask()
	%tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuThamThangY")
	%tbKillDailyTask:AcceptTask();
end

function pActivity:AcceptTalkTask()
	%tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuThamThangY")
	%tbTalkDailyTask:AcceptTask();
end

function pActivity:AcceptGatherTask()
	%tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuThamThangY")
	%tbGatherDailyTask:AcceptTask();
end

function pActivity:CompletKillTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbKillDailyTask:CompleteTask() == 1) then
		--Phong v�n l�nh b�i - ghi nh�n s� l�n ho�n th�nh nhi�m v� V� l�m minh ch� - Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "KillTask");
		--Thay ��i ph�n th��ng nhi�m v� gi�t qu�i h�ng ng�y - Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 15000000}, format("Ho�n th�nh nhi�m v� h�ng ng�y(%s) nh�n ���c %d c�i %s", "Nhi�m v� S�t qu�i ", 15000000, "kinh nghi�m "));
		Talk(1,"",format("%s, Ng��i qu� l� m�t v� ��i hi�p. ��y l� m�n qu� nh� ta t�ng cho ng��i, mong h�y nh�n l�y. Ng�y mai g�p l�i nh�.", GetSex() == 1 and "Ch� " or "Ca Ca"));
		
	end
end

function pActivity:CompletTalkTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbTalkDailyTask:CompleteTask() == 1) then
		--Phong v�n l�nh b�i - ghi nh�n s� l�n ho�n th�nh nhi�m v� V� l�m minh ch� - Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "TalkTask");
		--Thay ��i ph�n th��ng nhi�m v� ��i tho�i h�ng ng�y - Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 15000000}, format("Ho�n th�nh nhi�m v� h�ng ng�y(%s) nh�n ���c %d c�i %s", "Nhi�m v� ��i tho�i ", 15000000, "kinh nghi�m "));
		Talk(1,"",format("%s, Ng��i qu� l� m�t v� ��i hi�p. ��y l� m�n qu� nh� ta t�ng cho ng��i, mong h�y nh�n l�y. Ng�y mai g�p l�i nh�.", GetSex() == 1 and "Ch� " or "Ca Ca"));
		
	end
end

function pActivity:CompletGatherTask()
	if (PlayerFunLib:CheckFreeBagCell(1,"default") ~= 1) then
		return
	end
	
	if (%tbGatherDailyTask:CompleteTask() == 1) then
		--Phong v�n l�nh b�i - ghi nh�n s� l�n ho�n th�nh nhi�m v� V� l�m minh ch� - Modified by DinhHQ - 20110920
		G_ACTIVITY:OnMessage("FinishVLMC_VNG", "GatherTask");
		--Thay ��i ph�n th��ng nhi�m v� thu th�p h�ng ng�y - Modified By DinhHQ - 20110810
		tbAwardTemplet:GiveAwardByList({nExp = 10000000}, format("Ho�n th�nh nhi�m v� h�ng ng�y(%s) nh�n ���c %d c�i %s", "Nhi�m v� thu th�p", 10000000, "kinh nghi�m "));
		Talk(1,"",format("%s, Ng��i qu� l� m�t v� ��i hi�p. ��y l� m�n qu� nh� ta t�ng cho ng��i, mong h�y nh�n l�y. Ng�y mai g�p l�i nh�.", GetSex() == 1 and "Ch� " or "Ca Ca"));
		
	end
end

function pActivity:TalkToNpc()
	%tbTalkDailyTask:TalkToNpc();
end