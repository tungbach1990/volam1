--ĸ�׽ڻ
MOTHERDAY_2007_EXC_BEGINDATE =     70511            --ʯ�񻨵Ķһ�ʱ����
MOTHERDAY_2007_EXC_ENDDATE =       70514            --ʯ�񻨵Ķһ�ʱ��ֹ
MOTHERDAY_2007_MEDAL_BEGINTIME =   705110000        --ʯ�񻨵Ľ���ʱ����
MOTHERDAY_2007_MEDAL_ENDTIME =     705140030        --ʯ�񻨵Ľ���ʱ��ֹ
MOTHERDAY_SHIZHUHUA_ID =            1433               --ʯ�񻨵���ƷID��
MOTHERDAY_SZH_EXC_MAX_NUM =         5                  --����ܶһ���ʯ�񻨵�����
SZH_EXP_MEDAL = {2000000,3000000,5000000}              --ʯ�񻨶һ����齱��
TSK_MOTHERDAY_SZH_EXCTIME =         1917               --�洢�Ƿ��Ѿ��һ���ʯ�񻨵Ĵ���,���4��.
--



function SZHMedalCheckInTime()
    local nCurTime = tonumber(GetLocalDate("%y%m%d%H%M"))
    if nCurTime <= MOTHERDAY_2007_MEDAL_ENDTIME and nCurTime >= MOTHERDAY_2007_MEDAL_BEGINTIME then
        return 1
    else
        return 0
    end    
end
--
function SZHExc_Check_InTime()
    local nCurDate = tonumber(GetLocalDate("%y%m%d"))
    if nCurDate <= MOTHERDAY_2007_EXC_ENDDATE and nCurDate >= MOTHERDAY_2007_EXC_BEGINDATE then
        return 1
    else
        return 0
    end
end