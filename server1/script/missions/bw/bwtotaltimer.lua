Include("\\script\\missions\\bw\\bwhead.lua");

function OnTimer()
	State = GetMissionV(MS_STATE) ;
	if (State == 0) then
		return
	end;
	
	local str1 = "";
	local szCaptainName = {};
	local szCaptainName = bw_getcaptains();
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0 ) and (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."Hai b�n ��ng th�i r�i kh�i ��u tr��ng <#>, ��i <color=yellow>"..szCaptainName[1].."<color><#> v� <color=yellow>"..szCaptainName[2].."<color><#> h�a nhau!";
	end;

	if (nGroup1PlayerCount == nGroup2PlayerCount) then 
		str1 = GetMissionS(CITYID).."K�t qu� l�i ��i <#>, ��i <color=yellow>"..szCaptainName[1].."<color=yellow> <#> v� ��i <color=yellow>"..szCaptainName[2].."<color=yellow> <#> h�a nhau"
	elseif (nGroup2PlayerCount > nGroup1PlayerCount) then
		str1 = GetMissionS(CITYID).."K�t qu� l�i ��i <#>, ��i <color=yellow>"..szCaptainName[2].."<color> c�n l�i nhi�u ng��i h�n ��i <color=yellow>"..szCaptainName[1].."<color> <#> <color=yellow>"..szCaptainName[2].."<color>, gi�nh th�ng l�i chung cu�c!"
		bw_branchtask_win(2);
	elseif (nGroup1PlayerCount > nGroup2PlayerCount) then 
		str1 = GetMissionS(CITYID).."K�t qu� l�i ��i <#>, ��i <color=yellow>"..szCaptainName[1].."<color> c�n l�i nhi�u ng��i h�n ��i <color=yellow>"..szCaptainName[2].."<color> <#> <color=yellow>"..szCaptainName[1].."<color>, gi�nh th�ng l�i chung cu�c!"
		bw_branchtask_win(1);
	end;
	Msg2MSAll(BW_MISSIONID, str1);
	--AddGlobalCountNews(str1);
	SetMissionV(MS_STATE,3);
	CloseMission(BW_MISSIONID);
	return
end;