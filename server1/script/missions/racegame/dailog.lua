-- �ļ�������dailog.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-17 11:00:21
--�����ĶԻ�
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\missions\\racegame\\ready\\ready.lua")
function racegame_SignUp_main(nStep)
	jiefang_0804_ResetTask()
	local tbSay = {}
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc> Trong th�i gian t� 11-06-2008 ��n 24:00 13-07-2008, V� l�m minh ch� s� t� ch�c Cu�c �ua 4 m�a � c�c th�nh th�. 30 ng��i ��u ti�n ch�y v� ��ch v� n�i chuy�n v�i �ng ch� tr��ng �ua s� nh�n ���c ph�n th��ng h�u h�, ng��i c� mu�n tham gia ho�t ��ng n�y kh�ng?",
			"Ta s� kh�ng b� qua ng�n n�m c� m�t n�y!/#racegame_SignUp_main(2)",
			"T�m hi�u th�ng tin ho�t ��ng/#racegame_SignUp_main(3)",
			"Th�t ng�i qu�, ta s� quay l�i sau./OnCancel",	
		}
	elseif nStep == 2 then
		local nReadyMissionState = gb_GetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.ReadyMissionState)
		local nMissionState = gb_GetTask(racegame_tbMission.G_TSK_NAME, racegame_tbMission.MissionState)
		--local nPlayerCount	= racegame_tbReadyMission:GetMSPlayerCount()
		
--		if nPlayerCount >= racegame_tbReadyMission.nPlayerCountLimit then
--			Say("�ⳡ������Ѿ��ﵽ���ޣ���μ���һ���ɣ�",0)
--			return 
--		end
		
		if GetLevel() < racegame_tbReadyMission.nLevelLimit then
			Say(format("��ng c�p kh�ng �� %s, kh�ng th� tham gia ho�t ��ng.", racegame_tbReadyMission.nLevelLimit), 0 )
			return 
		end
		
		
		if nReadyMissionState == 1 then
			
			local w = GetWorldPos()
			SetTask(jiefang_0804_TSK_MapId, w)			
			local nRandId = random(1, getn(racegame_tbReadyMission.tbWaitPos) )
			return NewWorld(racegame_tbReadyMission.nMapId, racegame_tbReadyMission.tbWaitPos[nRandId][1], racegame_tbReadyMission.tbWaitPos[nRandId][2])
		elseif (nReadyMissionState == 0 and nMissionState ~= 0) or nReadyMissionState == 3 then
			tbSay = 
			{
				"��i hi�p �� tr� m�t r�i, cu�c �ua �� b�t ��u. Th�i gian thi ��u m�i tu�n: <enter>Th� 2 ��n th� 6, s�ng 10:00 ��n 11:00, chi�u 22:00 ��n 23:00<enter>Th� 7; ng�y 30 th�ng 4 v� 01 th�ng 5, r�ng s�ng 02:00 ��n 03:00, s�ng 10:00 ��n 11:00, chi�u 14:00 ��n 15:00, t�i 22:00 ��n 23:00<enter>Ch� nh�t, s�ng 10:00 ��n 11:00, tr�a 14:00 ��n 15:00, t�i 22:00 ��n 23:00.",
				"Th�t ng�i qu�, ta s� quay l�i sau./OnCancel",	
			}
			tbSay[1] = "<dec><npc>"..tbSay[1]
		elseif nReadyMissionState == 0 and nMissionState == 0 then
			tbSay = 
			{
				"Cu�c �ua v�n ch�a b�t ��u. Th�i gian thi ��u m�i tu�n:<enter>Th� 2 ��n th� 6, s�ng 10:00 ��n 11:00, chi�u 22:00 ��n 23:00<enter>Th� 7; ng�y 30 th�ng 4 v� 01 th�ng 5, r�ng s�ng 02:00 ��n 03:00, s�ng 10:00 ��n 11:00, chi�u 14:00 ��n 15:00, t�i 22:00 ��n 23:00<enter>Ch� nh�t, s�ng 10:00 ��n 11:00, tr�a 14:00 ��n 15:00, t�i 22:00 ��n 23:00.",
				"Th�t ng�i qu�, ta s� quay l�i sau./OnCancel",
			}
			tbSay[1] = "<dec><npc>"..tbSay[1]
		end
	elseif nStep == 3 then
		tbSay = 
		{
			"<dec><npc>M�i cu�c �ua di�n ra trong 15 ph�t, trong �� c� 1 ph�t �� chu�n b�. Sau khi b�o danh tham gia, ng��i ch�i s� ���c ��a ��n khu v�c chu�n b�. Sau khi cu�c tranh t�i b�t ��u, c�c tuy�n th� ph�i ra s�c ch�y th�t nhanh v� ��ch. Trong qu� tr�nh �ua, tr�n ���ng �ua s� xu�t hi�n c�c ��o c� h� tr�, s� d�ng ��o c� n�y c� th� gi�p t�ng t�c �� ch�y c�a b�n th�n ho�c l�m gi�m t�c �� c�a ng��i kh�c. 30 ng��i ��u ti�n v� ��ch v� n�i chuy�n v�i �ng ch� ���ng �ua s� nh�n ���c ph�n th��ng c� gi� tr�.",
			"Th�t ng�i qu�, ta s� quay l�i sau./OnCancel",	
		}
		
	end
	CreateTaskSay(tbSay)
end



function racegame_Award_main()
	jiefang_0804_ResetTask()
	local nAwardState = GetTask(jiefang_0804_TSK_AwardState)
	local nPlayerMapId = GetTask(jiefang_0804_TSK_MapId)
	if nPlayerMapId == 0 then
		nPlayerMapId = 520
	end
	if nAwardState == 1 then
		return NewWorld(nPlayerMapId, racegame_tbMission.tbSignUpPos[1], racegame_tbMission.tbSignUpPos[2])
	end
	local nRankCount = racegame_tbMission:GetMissionV(racegame_tbMission.tbMissionV.RANK_COUNTER)
	nRankCount = nRankCount + 1
	racegame_tbMission:SetMissionV(racegame_tbMission.tbMissionV.RANK_COUNTER, nRankCount)
	local szMsg = format("Ha ha, ��i hi�p trong cu�c �ua n�y ���c x�p h�ng <color=yellow>%d<color>.",  nRankCount)
	
	Msg2MSAll(racegame_tbMission.nMissionId, format("<color=yellow>%s<color> trong cu�c �ua n�y ���c x�p h�ng <color=yellow>%d<color>.",GetName(),  nRankCount))
	Msg2Player(szMsg)
	if nRankCount >= 1 and nRankCount <= 10 then
		AddOwnExp(2000000)
		if random(1,100) <=50 then
			AddItem(4, 239, 1, 1, 0, 0)
			Msg2Player("Nh�n ���c 1 T� Th�y Tinh")
		end
	elseif nRankCount >= 11 and nRankCount <= 20 then
		AddOwnExp(1000000)
	elseif nRankCount >= 21 and nRankCount <= 30 then
		AddOwnExp(500000)
	end 
	
	SetTask(jiefang_0804_TSK_AwardState, 1)
	if nRankCount >= 30 then
		racegame_tbMission:CloseGame();
	end
	
	NewWorld(nPlayerMapId, racegame_tbMission.tbSignUpPos[1], racegame_tbMission.tbSignUpPos[2])
end

function OnCancel()
end