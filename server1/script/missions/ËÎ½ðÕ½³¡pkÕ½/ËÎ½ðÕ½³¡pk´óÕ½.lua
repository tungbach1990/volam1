Include("\\script\\missions\\�ν�ս��PKս\\�ν�ս��ͷ�ļ�.lua");

function InitMission()
    --Msg2Player("ս�½�������սһ������.");
    StartMissionTimer(1,4,TIMER_1);
    SetMissionV(1,1);--��������
    SetMissionV(MS_KEY, random(100000))
    RevivalAllNpc();
    HideNpc("T��ng Qu�n Nam T�ng",1000000);
    HideNpc("��i t��ng Kim Qu�c",1000000);

    RestMin, RestSec = GetMinAndSec(1800);
    local str1 = "<#>T�ng Kim ��i chi�n �ang cho b�o danh, nh�ng ng��i mu�n tham gia h�y nhanh ch�n ��n hai c�a v�o chi�n tr��ng T�ng Kim, th�i gian b�o danh c�n l�i l�: "..RestMin.."<#>ph�t"..RestSec.."<#> gi�y".."<#>. �i�u ki�n tham chi�n: ��ng c�p �t nh�t l� 40, ph� b�o danh 3000 l��ng. ";
    AddGlobalCountNews(str1, 1);
end;

function RunMission()
    SetMissionV(1,2);
    SetMissionV(MS_J_NPCDEATH, 0);
    SetMissionV(MS_S_NPCDEATH, 0);
    SetMissionV(MS_S_SHOWKING, 0);
    SetMissionV(MS_J_SHOWKING, 0);
    RevivalAllNpc();
    HideNpc("T��ng Qu�n Nam T�ng",1000000);
    HideNpc("��i t��ng Kim Qu�c",1000000);
    HideNpc("Qu�n y",1000000);
    HideNpc("Qu�n y Kim qu�c",1000000);
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

    	--��ʱΪGM���������ʽ����ս��
    	PutMessage("��ch qu�n �� b�t ��u h�nh ��ng! C�c chi�n s�! X�ng l�n!");
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
    str2 = GetName().."<#>R�i kh�i chi�n tr��ng, ";
    -- SetLogoutRV(0);  ��ҵ���Ҳ���Mission��OnLeave����˲����ڴ˵���SetLogoutRV(0)�������ڰ����NewWorld��Mission��ͼ�ĵط����� Fanghao_Wu 2006-3-21
    SetPKFlag(0)
    ForbidChangePK(0);
    Msg2MSAll(1, str2);
end;
