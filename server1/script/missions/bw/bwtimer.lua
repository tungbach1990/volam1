Include("\\script\\missions\\bw\\bwhead.lua");

szCaptainName = {};
function OnTimer()
	timestate = GetMissionV(MS_STATE);
	V = GetMissionV(MS_NEWSVALUE) + 1;
	SetMissionV(MS_NEWSVALUE, V);
	
	szCaptainName = bw_getcaptains(); --��ȡ���Ӷӳ������֣�

	if (timestate == 1) then 	--�����׶�
		local str1 = ReportMemberState(V);
		bw_noticecaptainkey(str1);
	elseif (timestate == 2) then --��ս��
		ReportBattle(V);
	elseif (timestate == 3) then  --ս��������
		Msg2MSAll(BW_MISSIONID, "K�t th�c tr�n ��u!");
		StopMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID);
		StopMissionTimer(BW_MISSIONID, BW_TOTALTIME_ID);
	end;
end;

function ReportMemberState(V)
	--�ڱ����ڼ䣬ϵͳ����֪ͨ��ҵ�ǰ�ı������

	if (V == GO_TIME) then
		bw_begin_compete();
	end;
	
	RestMin = floor((GO_TIME - V) / 3);
	RestSec = mod((GO_TIME - V),3) * 20;
	local str1;

	if (RestMin > 0) and (RestSec == 0) then
		str1 = "Th�i gian v�o thi ��u l�i ��i <#> c�n: <color=yellow>"..RestMin.."<color><#> ph�t."
		Msg2MSAll(BW_MISSIONID, str1);
		if ((GO_TIME - V) == 3) then 
			str1 = GetMissionS(CITYID).."Th�i gian v�o thi ��u l�i ��i <#> ch� c�n ��ng <color=yellow>1<color> ph�t, xin m�i ng��i nhanh ch�ng v�o tr��ng ��u."
			--AddGlobalCountNews(str1)
		end
	elseif (RestMin == 0) then
		str1 = "Th�i gian v�o thi ��u l�i ��i <#> c�n: <color=yellow>" ..RestSec.. "<color><#> gi�y."
		Msg2MSAll(BW_MISSIONID, str1);
	end;
	return str1;
end;

function bw_noticecaptainkey(str1)
	local nCount = GetMissionV(MS_MAXMEMBERCOUNT);
	if (nCount <= 1) then
		return
	end;
	local i;
	local nOldPlayer = PlayerIndex;
	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	local masteridx, szName, nKey, str;
	for i = 1, 2 do
		masteridx = SearchPlayer(GetMissionS(i));
		if (masteridx > 0) then
			PlayerIndex = masteridx;
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) <= 0 and nil ~= str1) then
				Msg2Player(str1);
			end
			szName = GetMissionS(MSS_CAPTAIN[i]);
			nKey = GetMissionV(MS_TEAMKEY[i]);
			nCount = GetMissionV(MS_MAXMEMBERCOUNT);
			str = "C�c h� �� thu�c ��i thi ��u <color=yellow> "..GetMissionS(CITYID).."<color> <#> thu�c ��i <color=yellow> "..nCount.."<color> ��u v�i <color=yellow> "..nCount.."<color>, <#> s� th� t� v�o ��u tr��ng <color=yellow> ["..nKey.."]<color>. H�y th�ng b�o v�i ��i h�u m�nh v�o ��u tr��ng.";
			Msg2Player(str);
		end
	end;
	SubWorld = nOldSubWorld;
	PlayerIndex = nOldPlayer;
end;

function bw_begin_compete()
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0  and nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> Th�i gian thi ��u l�i ��i �� ��n, ��i <color=yellow>"..szCaptainName[1].."<#> <color> v� ��i <color=yellow>"..szCaptainName[2].."<#> <color> kh�ng ��ng gi� v�o ��u tr��ng, tr�n ��u h�y b�!";
		Msg2MSAll(BW_MISSIONID,str1)
		--AddGlobalCountNews(str1);
		SetMissionV(MS_STATE,3);
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nGroup1PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> Th�i gian thi ��u l�i ��i �� ��n, ��i <color=yellow>"..szCaptainName[1].."<#> <color> kh�ng ��ng gi� v�o ��u tr��ng, ��i <color=yellow>"..szCaptainName[2].."<#> <color> ���c x� th�ng!"
		Msg2MSAll(BW_MISSIONID, str1);
		--AddGlobalCountNews(str1);
		bw_branchtask_win(2);
		CloseMission(BW_MISSIONID);
		return
	end;

	if (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."<#> Th�i gian thi ��u l�i ��i �� ��n, ��i <color=yellow>"..szCaptainName[2].."<#> <color> kh�ng ��ng gi� v�o ��u tr��ng, ��i <color=yellow>"..szCaptainName[1].."<#> <color> ���c x� th�ng!";
		Msg2MSAll(BW_MISSIONID, str1);
		--AddGlobalCountNews(str1);
		bw_branchtask_win(1);
		CloseMission(BW_MISSIONID);
		return
	end;
		
	Msg2MSAll(BW_MISSIONID, "Ch�m d�t th�i gian v�o ��u tr��ng, thi ��u ch�nh th�c b�t ��u!");
	str = GetMissionS(CITYID).."L�i ��i <#> <color=yellow>"..szCaptainName[1].."<color> <#> v� <color=yellow>"..szCaptainName[2].."<color> <#> ch�m d�t th�i gian v�o ��u tr��ng, thi ��u ch�nh th�c b�t ��u!";
	--AddGlobalCountNews(str);
	RunMission(BW_MISSIONID);
	return
end;

function ReportBattle(V)
	bw_checkwinner();	--ս�����й����У�ϵͳ����֪ͨ�������������
	gametime = (floor(GetMSRestTime(BW_MISSIONID,BW_TOTALTIME_ID)/18));
	RestMin = floor(gametime / 60);
	RestSec = mod(gametime,60);
	if (RestMin == 0) then
		Msg2MSAll(BW_MISSIONID, "Giai �o�n chi�n ��u L�i ��i <#>: Hai b�n �ang thi ��u. Th�i gian c�n  <color=yellow>"..RestSec.."<color><#> gi�y.");
	elseif (RestSec == 0) then
		Msg2MSAll(BW_MISSIONID, "Giai �o�n chi�n ��u L�i ��i <#>: Hai b�n �ang thi ��u. Th�i gian c�n  <color=yellow>"..RestMin.."<color><#> ph�t.");
	else
		Msg2MSAll(BW_MISSIONID, "Giai �o�n chi�n ��u L�i ��i <#>: Hai b�n �ang thi ��u. Th�i gian c�n  <color=yellow>"..RestMin.."<color><#> ph�t<color=yellow>"..RestSec.."<color><#> gi�y.");
	end;
end;

function bw_checkwinner()
	local nGroup1PlayerCount = GetMSPlayerCount(BW_MISSIONID, 1);
	local nGroup2PlayerCount = GetMSPlayerCount(BW_MISSIONID, 2);
	if (nGroup1PlayerCount <= 0 ) and (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."Hai b�n ��ng th�i r�i kh�i ��u tr��ng <#>, ��i <color=yellow>"..szCaptainName[1].."<color> <#> v� <color=yellow>"..szCaptainName[2].."<color> <#> h�a nhau!";
		bw_all_gone(str1)
		return
	end;

	if (nGroup1PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."K�t qu� l�i ��i <#>, ��i <color=yellow>"..szCaptainName[2].."<color> <#> �� ��nh b�i ��i <color=yellow>"..szCaptainName[1].."<color> <#>, gi�nh th�ng l�i chung cu�c!"
		bw_all_gone(str1)
		return
	end;
	
	if (nGroup2PlayerCount <= 0 ) then 
		str1 = GetMissionS(CITYID).."K�t qu� l�i ��i <#>, ��i <color=yellow>"..szCaptainName[1].."<color> <#> �� ��nh b�i ��i <color=yellow>"..szCaptainName[2].."<color> <#>, gi�nh th�ng l�i chung cu�c!"
		bw_all_gone(str1)
		return
	end;
end;

function bw_noticecaptainnews(str1)
	local nCount = GetMissionV(MS_MAXMEMBERCOUNT);
	if (nCount <= 1) then
		return
	end;
	local i;
	local nOldPlayer = PlayerIndex;
	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	for i = 1, 2 do
		masteridx = SearchPlayer(GetMissionS(i));
		if (masteridx > 0) then
			PlayerIndex = masteridx;
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) <= 0 and nil ~= str1) then
				Msg2Player(str1);
			end
		end
	end;
	SubWorld = nOldSubWorld;
	PlayerIndex = nOldPlayer;
end;

function bw_all_gone(str1)
	Msg2MSAll(BW_MISSIONID, str1);
	--AddGlobalCountNews(str1);
	SetMissionV(MS_STATE,3);
	bw_noticecaptainnews(str1);
	CloseMission(BW_MISSIONID);
end;