Include("\\script\\missions\\bw\\bwhead.lua");
function OnDeath(Launcher)
	local curcamp = GetCurCamp();
	local i;
	local szCaptainName = {};
	local szCaptainName = bw_getcaptains();

	local PlayerIndex1 = NpcIdx2PIdx(Launcher); -- murder����
	local OrgPlayer  = PlayerIndex; --����
	local DeathName = GetName();
	local str;

	local nLaunGroupID;
	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		local LaunName = GetName();
		nLaunGroupID = GetCurCamp();
		if (nLaunGroupID == 2 or nLaunGroupID == 3) then
			str  = GetMissionS(CITYID).."<#> Trong tr�n ��u l�i ��i nhi�u ng��i, <color=yellow>"..szCaptainName[nLaunGroupID - 1].."<color> ��i <color=yellow>"..LaunName.."<color><#> trong thi ��u �� ��nh b�i <color=yellow>"..szCaptainName[4 - nLaunGroupID].."<color> ��i <color=yellow>"..DeathName.."<color><#>.";
			Msg2MSAll(BW_MISSIONID, str);
		end
	end;
	
	PlayerIndex = OrgPlayer;
	if (nil ~= str) then
		DelMSPlayer(BW_MISSIONID, PlayerIndex);
	end;
	bw_all_death();
end;

function bw_all_death()
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;
	local str1 = "";
	local szCaptainName = {};
	local szCaptainName = bw_getcaptains();
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0 ) and (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> hai b�n c�ng ch�t trong thi ��u l�i ��i,"..szCaptainName[1].."<color><#> v� <color=yellow>"..szCaptainName[2].."<color><#> h�a nhau!";
		bw_death_close(str1)
	elseif (nGroup2PlayerCount <= 0) then
		str1 = GetMissionS(CITYID).."K�t qu� l�i ��i <#>, ��i <color=yellow>"..szCaptainName[1].."<color> ��nh b�i ��i <color=yellow>"..szCaptainName[2].."<color>, <#> <color=yellow>"..szCaptainName[1].."<color> gi�nh chi�n th�ng chung cu�c!";
		bw_branchtask_win(1);
		bw_death_close(str1)
	elseif (nGroup1PlayerCount <= 0) then 
		str1 = GetMissionS(CITYID).."K�t qu� l�i ��i <#>, ��i <color=yellow>"..szCaptainName[2].."<color> ��nh b�i ��i <color=yellow>"..szCaptainName[1].."<color>, <#> <color=yellow>"..szCaptainName[2].."<color> gi�nh chi�n th�ng chung cu�c!";
		bw_branchtask_win(2);
		bw_death_close(str1)
	end;
end;

function bw_death_close(str1)
	Msg2MSAll(BW_MISSIONID, str1);
	--AddGlobalCountNews(str1);
	SetMissionV(MS_STATE,3);
	CloseMission(BW_MISSIONID);
end;