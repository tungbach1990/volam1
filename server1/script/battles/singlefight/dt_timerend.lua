Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\singlefight\\dt_head.lua")

function OnTimer()
	dtworld = GetMissionV(MS_DTWORLDINDEX)
	orgworld = GetMissionv(MS_ORGWORLDINDEX)

	State = GetMissionV(MS_STATE) ;
	if (State == 0) then
		return
	end;
	
	local str = "<#> Th�i gian ��n ��u k�t th�c, phe Kim"..GetMissionS(1).."<#> v� phe T�ng"..GetMissionS(2).."<#> h�a nhau!"
	
	Msg2MSAll(MISSIONID, str);
	SubWorld = orgworld
	Msg2MSAll(GetMissionV(MS_ORGMISSION),str)--֪ͨ�ν�ս��������
	SubWorld = dtworld
	CloseMission(MISSIONID);
end;
  