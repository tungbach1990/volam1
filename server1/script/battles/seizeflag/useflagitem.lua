IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")

InDist=4;--�ﵽĿ�ĵط�Χ

function main()
--����ҵ�ǰλ���Ƿ��ڶ����ͼ��
	W,X,Y=GetWorldPos();
	X = floor(X / 8);
	Y = floor(Y / 16);

	X1 = floor(BT_GetData(PL_PARAM1) / (32*8))
	Y1 = floor(BT_GetData(PL_PARAM2) /(32*16))

	if (X1 == 0 or Y1 == 0) then
		Msg2Player("B�n hi�n ch�a �o�t c�, kh�ng th� s� d�ng C� hi�u!")--??û��ʹ��������ʾ��Ϣ
		return 1
	end
	strmsg = "B�n c�n ph�i chuy�n So�i k� ��n <color=yellow>"..X1..","..Y1.."<color>";
	Dist=floor(sqrt((X-X1)*(X-X1)+(Y-Y1)*(Y-Y1)));
	
	if(Dist>=InDist) then
				Msg2Player(strmsg)
				return 1
	else
		BT_SetData(PL_SNAPFLAG, BT_GetData(PL_SNAPFLAG) + 1);
		bt_addtotalpoint(BT_GetTypeBonus(PL_SNAPFLAG, GetCurCamp()))
		BT_SortLadder();
		BT_BroadSelf();
		
		if (GetCurCamp() == 1) then
			sf_setflagposinfo(1, 0, 0)
			BT_SetGameData(GAME_CAMP1, BT_GetGameData(GAME_CAMP1) + 1)
		elseif(GetCurCamp() == 2) then
			sf_setflagposinfo(2, 0, 0)
			BT_SetGameData(GAME_CAMP2, BT_GetGameData(GAME_CAMP2) + 1)
		end;
		BT_BroadGameDataToAll();
		
		if (GetCurCamp() == 1) then
			SetMissionV(MS_TOTALFLAG_S, GetMissionV(MS_TOTALFLAG_S) + 1)
		else
			SetMissionV(MS_TOTALFLAG_J, GetMissionV(MS_TOTALFLAG_J) + 1)
		end
		--����ǹ̶�ģʽʱ�����Զ�������һ����
		if (GetMissionV(MS_FLAGMODE) == 1) then
			if (GetCurCamp() == 1 and  GetMissionV(MS_TOTALFLAG_S) < TOTALFLAG_FIX) then
				sf_createflag(GetCurCamp(), BT_GetGameData(GAME_CAMP1AREA), BT_GetGameData(GAME_CAMP2AREA))
			elseif(GetCurCamp() == 2 and  GetMissionV(MS_TOTALFLAG_J) < TOTALFLAG_FIX) then
				sf_createflag(GetCurCamp(), BT_GetGameData(GAME_CAMP2AREA), BT_GetGameData(GAME_CAMP1AREA))
			end
			BT_BroadGameDataToAll()
		end;


		RestoreOwnFeature();
		AddSkillState(460, 1, 0, 0 ) --��ɫ�⻷���ֱ����
		AddSkillState(656, 30, 0, 0) --����ҵ��ٶ�
		AddSkillState(461, 1, 0, 0) --��ɫ�⻷���ֱ����
		
		OldPlayer = PlayerIndex
		
		local award_snapflag = 50 * bt_getgn_awardtimes()
		
		if (GetCurCamp()==1) then
			sf_setflagplayer(1, 0)
			Msg2MSAll(MISSIONID, "phe T�ng <color=yellow>"..GetName().."<color> �� chuy�n th�nh c�ng 1 So�i K� ");--���½ǵļ�ʱս����"GetCamp�����GetName()�ɹ�����˧�쵽��Ŀ�ĵأ�"
			Msg2MSAll(MISSIONID, "phe T�ng m�i ng��i nh�n ���c <color=yellow>"..award_snapflag.."<color> �i�m t�ch l�y");
			local idx = 0;
			for i = 1 , 500 do 
				idx, pidx = GetNextPlayer(MISSIONID,idx, 1);
				if (pidx > 0) then
					PlayerIndex = pidx
					bt_addtotalpoint(award_snapflag)
				end
				
				if (idx <= 0) then 
			 		break
			 	end;
			end 
		else
			sf_setflagplayer(2, 0)
			Msg2MSAll(MISSIONID, "phe Kim<color=yellow>"..GetName().."<color> �� chuy�n th�nh c�ng 1 So�i K� ");--���½ǵļ�ʱս����"GetCamp�����GetName()�ɹ�����˧�쵽��Ŀ�ĵأ�"
			Msg2MSAll(MISSIONID, "phe Kim m�i ng��i nh�n ���c <color=yellow>"..award_snapflag.."<color> �i�m t�ch l�y");
			local idx = 0;
			for i = 1 , 500 do 
				idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
				if (pidx > 0) then
					PlayerIndex = pidx
					bt_addtotalpoint(award_snapflag)
				end
				
				if (idx <= 0) then 
			 		break
			 	end;
			end 
		end
		
		PlayerIndex = OldPlayer
		
		BT_SetData(PL_PARAM1 ,0)
		BT_SetData(PL_PARAM2, 0)
		ST_SyncMiniMapObj(-1, -1);
		--ϵͳͨ�棺X������������ڷ���XX����������ɹ�����˧�쵽��Ŀ�ĵأ�ĿǰX����������ڷ�������õ�˧������Ϊ��XX��
		return 0
	end
end
	
	