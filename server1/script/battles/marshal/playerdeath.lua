--��������ű�

IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\marshal\\head.lua")

function OnDeath(Launcher)
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;
	if (bt_CheckDeathValid() == 0) then
		return
	end
	PlayerIndex1 = NpcIdx2PIdx(Launcher);
	OrgPlayer  = PlayerIndex;
	DeathName = GetName();
	deathcamp = GetCurCamp();
	currank = BT_GetData(PL_CURRANK)

	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		launchrank = BT_GetData(PL_CURRANK)
		if (GetCurCamp() ~= deathcamp) then
			LaunName = GetName();
			--����ɱNpc��Ŀ�����а�
			BT_SetData(PL_KILLPLAYER, BT_GetData(PL_KILLPLAYER) + 1); --��¼���ɱ������ҵ�����
			serieskill = BT_GetData(PL_SERIESKILL) + 1;
			BT_SetData(PL_SERIESKILL, serieskill); --��¼��ҵ�ǰ����ն��
			
		if (TAB_SERIESKILL[launchrank][currank] == 1) then
			serieskill_r = GetTask(TV_SERIESKILL_REALY) 
			serieskill_r = serieskill_r + 1
			SetTask(TV_SERIESKILL_REALY,serieskill_r)

			if (mod(serieskill_r, 3) == 0) then
				if (deathcamp == 1) then
					local npoint = bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
					mar_addmissionpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
					Msg2Player("<color=yellow> b�n nh�n ���c �i�m t�ch l�y Li�n tr�m "..npoint)
				else
					local npoint = bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
					mar_addmissionpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
					Msg2Player("<color=yellow> b�n nh�n ���c �i�m t�ch l�y Li�n tr�m "..npoint)
				end
			end
		end
			if (BT_GetData(PL_MAXSERIESKILL) < serieskill) then 
				BT_SetData(PL_MAXSERIESKILL, serieskill) -- ͳ����ҵ������ն��
			end
			
			local rankradio = 1;
			
			if ( RANK_PKBONUS[launchrank] == nil or RANK_PKBONUS[launchrank][currank] == nil) then
				rankradio = 1
				print("battle rank tab error!!!please check it !")
			else
				rankradio = RANK_PKBONUS[launchrank][currank]
			end
			local earnbonus = 0
			if (deathcamp == 1) then
				earnbonus = floor(BT_GetTypeBonus(PL_KILLPLAYER, 2) * rankradio)
			else
				earnbonus = floor(BT_GetTypeBonus(PL_KILLPLAYER, 1) * rankradio)
			end
			pointplayer = bt_addtotalpoint(earnbonus)
			mar_addmissionpoint(earnbonus)
			Msg2Player("<color=yellow> B�n h� g�c ��i ph��ng nh�n v� nh�n d��c <color>"..pointplayer.." <color=yellow>�i�m t�ch l�y " )
	
			local rankname = "";
			rankname = tbRANKNAME[currank]
			launchrank = BT_GetData(PL_CURRANK);
			launrankname = tbRANKNAME[launchrank]
			
			BT_SortLadder();
			BT_BroadSelf();
		
			if (GetCurCamp()  == 1) then
				str  = "Ng��i ch�i "..launrankname..LaunName.." h� tr�ng th��ng ng��i ch�i "..rankname..DeathName..", t�ng PK l� "..BT_GetData(PL_KILLPLAYER);
			else
				str  = "Ng��i ch�i "..launrankname..LaunName.." h� tr�ng th��ng ng��i ch�i "..rankname..DeathName..", t�ng PK l� "..BT_GetData(PL_KILLPLAYER);
			end
			Msg2Player("<color=pink> Ch�c m�ng! B�n �� h� ���c:"..rankname..DeathName..", T�ng PK l� "..BT_GetData(PL_KILLPLAYER));
			Msg2MSAll(MISSIONID, str);
		end
		PlayerIndex = OrgPlayer;
	end;

	BT_SetData(PL_BEKILLED, BT_GetData(PL_BEKILLED) + 1)
	BT_SetData(PL_SERIESKILL, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	
	BT_SortLadder();
	BT_BroadSelf();
	sf_onplayerleave()
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end
