-- �׵۱���
-- by С�˶��
-- 2007.10.24
-- ��..
-- ���ڳ�����..
-- Ѱ���������ҵ����..


Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\npc_death.lua")
Include("\\script\\missions\\yandibaozang\\doubleexp.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function OnDeath(index)
	local oldsubworld = SubWorld
	local nteams = GetCurCamp()
	local szname1 = GetName()
	local szplayname1 = GetMissionS(YDBZ_TEAM_NAME[nteams])
	--print(nteams, szname1, "OnDeath")
	local nidx = NpcIdx2PIdx(index);
	if nidx > 0 then
		local oldplayindex = PlayerIndex
		PlayerIndex = nidx
		local nkills = GetTask(YDBZ_TEAMS_TASKID)
		local nteams2 = GetCurCamp()
		local szplayname2 = GetMissionS(YDBZ_TEAM_NAME[nteams2])
		local szname2 = GetName()
		SetTask(YDBZ_TEAMS_TASKID,(nkills + 1))
		local nexp = YDBZ_KILLPLAYER_EXP
		local szdstr = ""
		if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
			nexp = YDBZ_KILLPLAYER_EXP * 2
			szdstr = "<color=yellow>[Vi�m �� L�nh c� hi�u l�c]<color>"
		end
		nexp = YDBZ_checkdoubleexp(nexp)
		AddOwnExp(nexp)
		--Msg2Player(format("%s������<color=yellow>%s<color>���顣",szdstr,nexp))
		local szstr = format("<color=yellow>%s<color> th�nh vi�n<color=yellow>%s<color> ��nh tr�ng th��ng <color=yellow>%s<color>  c�a t� ��i<color=yellow>%s<color>, s� ng��i PK t�ng l�n <color=yellow>%s<color>, %s thu ���c <color=yellow>%s<color> kinh nghi�m.",szplayname2,szname2,szplayname1,szname1,(nkills + 1),szdstr,nexp)
		Msg2MSAll(YDBZ_MISSION_MATCH,szstr)
		PlayerIndex = oldplayindex
	end


	local g = YDBZ_ZUANYONG_ITEM[1][2]
	local d = YDBZ_ZUANYONG_ITEM[1][3]
	local p = YDBZ_ZUANYONG_ITEM[1][4]
	local numzimu = CalcItemCount(-1,g,d,p,-1)
	--local numbeibao = CalcItemCount(23,g,d,p,-1)
	
	if (numzimu >= 1) then
			Msg2Player(format("Tr�n h�nh trang ��i hi�p c� <color=yellow>%s<color>, c� th� h�i sinh ���c 1 l�n. T�i n�i xu�t ph�t c�a b�o t�ng b�m h�i sinh.",YDBZ_ZUANYONG_ITEM[1][1]))
			ConsumeItem(-1,1,g,d,p,-1)
			if GetMissionV(YDBZ_STATE_SIGN) == 2 or GetMissionV(YDBZ_STATE_SIGN) == 3 then
				local nlimittime = GetMSRestTime(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE)
				if nlimittime <= 1 then
					StopMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE)
					StartMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE,YDBZ_LIMIT_SETFIGHTSTATE*18)
				end
			end
			return
	end
	local world = GetMissionV(YDBZ_SIGNUP_WORLD);
	local pos_x = GetMissionV(YDBZ_SIGNUP_POSX);
	local pos_y = GetMissionV(YDBZ_SIGNUP_POSY); 
	DelMSPlayer(YDBZ_MISSION_MATCH,PlayerIndex,nteams)
	SubWorld = oldsubworld
	local szteamnametalk = {}
	local szteamlast = {}
	local szstr = format("<color=blue>T� ��i %s<color> c� th�nh vi�n<color=blue>%s<color> �� t� tr�n.",szplayname1,szname1)
	Msg2Player(szstr)
	Msg2MSAll(YDBZ_MISSION_MATCH,szstr);
	szstr = "<color=yellow>T�nh h�nh t� ��i: <color>\n"
	for i=1,3 do
			szteamnametalk[i] = GetMissionS(YDBZ_TEAM_NAME[i])
			szteamlast[i]	 = GetMSPlayerCount(YDBZ_MISSION_MATCH,i)
			local szyellow = ""
			if i == 1 then
				szyellow = "gold"
			elseif i == 2 then
				szyellow = "pink"
			elseif i == 3 then
				szyellow = "green"
			end
			if szteamnametalk[i] ~= "" then
				szstr = szstr .. format("\t\t<color=%s>T� ��i %s c�n l�i th�nh vi�n: %s ng��i<color>\n",szyellow,szteamnametalk[i],szteamlast[i])
			end
	end
	Msg2MSAll(YDBZ_MISSION_MATCH,szstr);
	--DelMSPlayer(YDBZ_MISSION_MATCH,nteams);
	NewWorld(world, pos_x, pos_y);
	SetLogoutRV(0);
	--SubWorld = oldsubworld
	--YDBZ_restore(PlayerIndex,YDBZ_MISSION_MATCH,nteams)
--	SubWorld = oldsubworld
--	if GetMSPlayerCount(YDBZ_MISSION_MATCH,nteams) == 0 then
--		local pname = GetMissionS(YDBZ_TEAM_NAME[nteams])
--		--broadcast(format("%s�Ķ��飬���׵۱����в�С��ȫ�������ˡ�",nteams))
--		Msg2MSAll(YDBZ_MISSION_MATCH,format("<color=yellow>%s<color>�Ķ��飬���׵۱����в�С��ȫ�������ˡ�",pname))
--		SetMissionS(YDBZ_TEAM_NAME[nteams],"")
--		local nteamscount = GetMissionV(YDBZ_TEAM_COUNT)
--		print(nteamscount,SubWorld)
--		SetMissionV(YDBZ_TEAM_COUNT,(nteamscount-1))
--	end
--	if GetMissionV(YDBZ_TEAM_COUNT) == 1 and GetMissionV(YDBZ_STATE_SIGN) == 1 then
--		local nidx = NpcIdx2PIdx(index);
--		local world,x,y;
--		if nidx > 0 then 
--			PlayerIndex = nidx
--			world,x,y = GetWorldPos();
--			x = x * 32
--			y = y * 32 
--			print(world)
--		else
--			x, y, world = GetNpcPos(index);
--			print("NPC")
--		end
--		print(x,y,world)
--		YDBZ_add_final_npc(world,x,y)
--		Msg2MSAll(YDBZ_MISSION_MATCH,"�׵۱��������<color=yellow>���Ķ�<color>���ٻ�������")
--		SetMissionV(YDBZ_STATE_SIGN,2)
--	end
end
