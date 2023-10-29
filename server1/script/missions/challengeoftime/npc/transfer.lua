Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\challengeoftime\\chuangguang30.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	
	
	tbDailog.szTitleMsg = "<#><npc>Xin ch�c m�ng c�c ch� v� �� v��t qua ���c 29 c�a �i trong th�i gian 13 ph�t, Mu�n ti�p t�c V��t �i ch�!"
	
	tbDailog:AddOptEntry("Ti�p t�c V��t �i", gotonewworld); 
	
	tbDailog:AddOptEntry("R�i kh�i", leave); 	
	tbDailog:Show()
end


function leave()
	local world = GetMissionV(VARV_SIGNUP_WORLD);
	local pos_x = GetMissionV(VARV_SIGNUP_POSX);
	local pos_y = GetMissionV(VARV_SIGNUP_POSY); 
	DelMSPlayer(MISSION_MATCH,1);
	SetLogoutRV(0);
	NewWorld(world, pos_x, pos_y);
end


function gotonewworld()
	local ndate = tonumber(GetLocalDate("%H"))
	if ndate > 22 and ndate < 10 then
		Say("Trong th�i gian n�y kh�ng th� ti�n h�nh ti�p t�c V��t �i", 0)
		leave()
		return 
	end
	local nMinute = tonumber(GetLocalDate("%M"))
	if nMinute >= 24 then
		Talk(1, "", "Xin l��ng th�, Ng��i �� v��t qu� th�i gian truy�n t�ng") 
		return
	end
	if GetMissionV(VARV_BOARD_TIMER) >= (CHUANGGUAN30_TIME_LIMIT + 60) then
		Say("Xin l��ng th�, Ng��i �� v��t qu� th�i gian truy�n t�ng!",0)
		return 
	end
	-- wangjingjun
	local nX,nY, nMapIndex = GetPos()
	SetTask(PLAYER_MAP_TASK, SubWorldIdx2ID(nMapIndex)) -- ����ҵĵ�ǰ��ͼ��ID��������
	-- ��\\settings\\maps\\liandandong\\npc_3.txt��ѡ���һ��λ��
	NewWorld(CHUANGGUAN30_MAP_ID, floor(51072/32), floor(102272/32))	-- ���͵��µĵ�ͼ
end
