-- ������һ������ɽѩ����
-- By: Feimingzhi(2007-05-08)
-- Content:
--��ڼ䣬����2007��06��01�շ�����ά����2007��07��01��24��֮���½��Ľ�ɫ�����ʸ�μӡ�������һ���� �ڻ�ڼ��ڣ��������½�ɫ���ȼ��ﵽ90���� �����116��Ұ�����������޼�ϵ�������񣩾Ϳ��������ִ�͸�����е���ٴ����һ����ɽѩ������¼LOG��
--һ����ɫֻ����ȡһ�Ρ�
--90���Լ�90�����µ���ң�ʹ����ɽѩ������������120 ����
--
-- 	��ٶԻ����
--ֻ����2007��06��01�շ�����ά����2007��07��01��24��֮��Ż���֡�������һ��ѡ�

SUPERPLAYERACT_BIGENTIME = 20070601     --������һ��ʼ����
SUPERPLAYERACT_ENDTIME = 20070701       --������һ��������
SUPERPLAYERACT_LevRequest = 90          --������һ��ɫ����ȼ�
SUPERPLAYERACT_TaskTime = 116             --Ҫ��Ұ���������ٶ��ٴ�
SUPERPLAYERACT_TaskDataKey = 1044       --�洢Ұ���������������key
TSK_SUPERPLAYERACT = 1816               --�洢�Ƿ���ȡ������
TSXL_ITEM_ID = 1431                     --��ɽѩ������ƷID
SUPERPLAYERACT_ExtPoint = 4             --Ҫ���½��ʺ�
Include("\\script\\task\\newtask\\tasklink\\tasklink_head.lua")    --����Ұ������

function SuperPlayerAct2007()
    local tDiaStr = 
    {
        "T�i kho�n ���c t�o m�i trong kho�ng th�i gian t� <color=green>01-06-2007<color> ��n <color=green>01-07-2007<color> ",
        format("s� c� c� h�i tham gia 'Ho�t ��ng ng��i ch�i si�u c�p'. Trong th�i gian ho�t ��ng, khi nh�n v�t m�i (trong t�i kho�n m�i t�o) ��t ��n c�p <color=yellow>%s<color> v� ho�n th�nh <color=yellow>",SUPERPLAYERACT_LevRequest),
        format("%s<color> nhi�m v� D� T�u (chu�i nhi�m v�) s� c� th� ��n L� Quan t�i c�c th�nh th� v� T�n th� th�n �� nh�n 1 <yellow=color>Thi�n S�n Tuy�t Li�n<color>.",	SUPERPLAYERACT_TaskTime)
    }
   Say( format("%s%s%s",tDiaStr[1],tDiaStr[2],tDiaStr[3]),
   		3,
   		"Nh�n Thi�n S�n Tuy�t Li�n/SuperPlayerAct_WinMedal",
   		"Thi�n S�n Tuy�t Li�n l� g�?/SuperPlayerAct_ItemDes",
   		"K�t th�c ��i tho�i/OnCancel")
end
--
function SuperPlayerAct_WinMedal()

	local nDay = tonumber(GetLocalDate("%Y%m%d"))
    local szMsg = "";
    if nDay < SUPERPLAYERACT_BIGENTIME and nDay > SUPERPLAYERACT_ENDTIME then
        Msg2Player("Th�t ��ng ti�c, th�i gian ho�t ��ng �� k�t th�c.")
        return 0;
    end;
     
    if GetExtPoint(SUPERPLAYERACT_ExtPoint) ~= 1 then
    	szMsg = "Th�t ��ng ti�c, kh�ng ph�i l� t�i kho�n m�i t�o, kh�ng th� tham gia ho�t ��ng n�y!";
        Say(szMsg,
        	2,
        	"Tr� l�i/main",
        	"K�t th�c ��i tho�i/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    
    local nLev = GetLevel()
    if nLev < SUPERPLAYERACT_LevRequest then
    	szMsg = format("Ch�a �� c�p %s, h�y ��t ��n c�p %s r�i h�y ��n t�m ta.",SUPERPLAYERACT_LevRequest,SUPERPLAYERACT_LevRequest)
        Say(szMsg,
        	2,
        	"Tr� l�i/main",
        	"K�t th�c ��i tho�i/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    
    local nTaskEDTime = GetTask(SUPERPLAYERACT_TaskDataKey)
    --local nTaskEDTime = tl_counttasklinknum(1)
    
    if nTaskEDTime < SUPERPLAYERACT_TaskTime then
    	szMsg = format("Th�t ��ng ti�c, ch�a ho�n th�nh m�t chu�i %s nhi�m v� D� T�u, kh�ng th� nh�n Thi�n S�n Tuy�t Li�n.",SUPERPLAYERACT_TaskTime)
        Say(szMsg,2,"Tr� l�i/main","K�t th�c ��i tho�i/OnCancel")
        Msg2Player(szMsg)
        return 0
    end
    if  GetTask( TSK_SUPERPLAYERACT ) > 0 then
        Say("Th�t ��ng ti�c, nh�n v�t n�y �� nh�n ph�n th��ng r�i.",2,"Tr� l�i/main","K�t th�c ��i tho�i/OnCancel")
        return 0
    end
    local nItemIdx = AddItem( 6, 1, TSXL_ITEM_ID, 1, 0, 0 )
    if nItemIdx > 0 then
        SetTask( TSK_SUPERPLAYERACT, 1 )
        Say("Thi�n S�n Tuy�t Li�n ��y! H�y c�t gi� c�n th�n!",0)
        Msg2Player("B�n nh�n ���c 1 Thi�n S�n Tuy�t Li�n.")
        WriteLog(format("[Ho�t ��ng ng��i ch�i si�u c�p] \t%s\tName:%s\tAccount:%s\t nh�n ���c m�t Thi�n S�n Tuy�t Li�n",
		GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount()));
    else
        Say("H�nh trang �� ��y, kh�ng th� nh�n v�t ph�m!",2,"Tr� l�i/main","K�t th�c ��i tho�i/OnCancel")
    end
end
--
function SuperPlayerAct_ItemDes()
    Say("Thi�n S�n Tuy�t Li�n: <enter>Nh�n v�t c�p �� t� 50 ��n 90 (bao g�m c�p 50 v� 90) s� d�ng s� nhanh ch�ng n�ng cao ��ng c�p c�a m�nh.",2,"Tr� l�i/SuperPlayerAct2007","K�t th�c ��i tho�i/OnCancel")
end
--
function OnCancel()
end