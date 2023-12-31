Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");

function InitMission()
    --Msg2Player("战事紧急，大战一触即发.");
    StartMissionTimer(1,4,TIMER_1);
    SetMissionV(1,1);--允许报名了
    SetMissionV(MS_KEY, random(100000))
    RevivalAllNpc();
    HideNpc("Tng Qu﹏ Nam T鑞g",1000000);
    HideNpc("Чi tng Kim Qu鑓",1000000);

    RestMin, RestSec = GetMinAndSec(1800);
    local str1 = "<#>T鑞g Kim i chi課 產ng cho b竜 danh, nh鱪g ngi mu鑞 tham gia h穣 nhanh ch﹏ n hai c鯽 v祇 chi課 trng T鑞g Kim, th阨 gian b竜 danh c遪 l筰 l�: "..RestMin.."<#>ph髏"..RestSec.."<#> gi﹜".."<#>. 襲 ki謓 tham chi課: Ъng c蕄 輙 nh蕋 l� 40, ph� b竜 danh 3000 lng. ";
    AddGlobalCountNews(str1, 1);
end;

function RunMission()
    SetMissionV(1,2);
    SetMissionV(MS_J_NPCDEATH, 0);
    SetMissionV(MS_S_NPCDEATH, 0);
    SetMissionV(MS_S_SHOWKING, 0);
    SetMissionV(MS_J_SHOWKING, 0);
    RevivalAllNpc();
    HideNpc("Tng Qu﹏ Nam T鑞g",1000000);
    HideNpc("Чi tng Kim Qu鑓",1000000);
    HideNpc("Qu﹏ y",1000000);
    HideNpc("Qu﹏ y Kim qu鑓",1000000);
    idx = 0;
    
    for i = 1 , 500 do
    	idx, pidx = GetNextPlayer(1,idx, 0);
    	
    	if (idx == 0) then
    		break
    	end;
    	
    	if (pidx > 0) then
    		PlayerIndex = pidx;
    		SetFightState(1);
    	end;

    	--此时为GM发布命令，正式打响战斗
    	PutMessage("мch qu﹏  b総 u h祅h ng! C竎 chi課 s�! X玭g l猲!");
    end;
    
    StartMissionTimer(1,5, TIMER_2);
end;

function EndMission()

    for i = 1, 20 do 
    SetMissionV(i , 0);
    end;

    StopMissionTimer(1,4);
    StopMissionTimer(1,5);
    GameOver();
end;

function OnLeave(RoleIndex)
    PlayerIndex = RoleIndex;
    str2 = GetName().."<#>R阨 kh醝 chi課 trng, ";
    -- SetLogoutRV(0);  玩家掉线也会从Mission中OnLeave，因此不能在此调用SetLogoutRV(0)，必须在把玩家NewWorld出Mission地图的地方调用 Fanghao_Wu 2006-3-21
    SetPKFlag(0)
    ForbidChangePK(0);
    Msg2MSAll(1, str2);
end;
