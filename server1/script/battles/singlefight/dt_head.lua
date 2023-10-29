IncludeLib("SETTING");
IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")

DTMISSIONID = 14;		--
FRAME2TIME = 18;	--18֡��Ϸʱ���൱��1����
TIMER_1 = 10 * FRAME2TIME-----10���ʱһ��
TIMER_2 = 3 * 60 * FRAME2TIME----����ʱ��
EXPRETIME = (TIMER_2 - 10 * FRAME2TIME) / TIMER_1--���10����ʾ��Ҫ�˳�

MS_TIME1_ACC = 2			--��TIMER_1��10�룩ִ�еĴ�����
MS_ORGWORLDINDEX = 3		--��ʱ�����ͼ��INDEX
MS_ORGMISSION = 4		--��ʱ�����MISSION	
MS_ORGMAPID = 5			--��ʱ�����MAPID
MS_LEVEL = 	6			--����ĵȼ�
MS_ORGBACK_X1 = 7		--�˳��������������
MS_ORGBACK_Y1 =	8		
MS_ORGBACK_X2 = 9
MS_ORGBACK_Y2 = 10
MISSIONID = DTMISSIONID

MS_DTWORLDINDEX = 12		--���������ͼ��INDEX
MS_DTMISSION = 13			--���������MISSION

PL_NAME_1 = 1				--missions
PL_NAME_2 = 2				--missions

MS_PL_INDEX_1 = 14
MS_PL_CURCAMP_1 = 15
MS_PL_ADDPOINT_1 = 16
MS_PL_INDEX_2 = 17
MS_PL_CURCAMP_2 = 18
MS_PL_ADDPOINT_2 = 19
 


function dt_winbonus(nCamp)
	OldPlayer = PlayerIndex
	OldSubWorld = SubWorld
	
	if (nCamp == 1) then
		RoleIndex = GetMissionV(MS_PL_INDEX_1)
		WinnerName = GetMissionS(1);
		LoserName =  GetMissionS(2)
		str = "phe T�ng "..WinnerName.."�� s�t tr�ng th��ng ng��i phe Kim "..LoserName.."gi�nh th�ng l�i!";
	else
		RoleIndex = GetMissionV(MS_PL_INDEX_2)
		WinnerName = GetMissionS(2);
		LoserName =  GetMissionS(1)
		str = "Phe Kim"..WinnerName.."�� s�t tr�ng th��ng ng��i phe T�ng"..LoserName.."gi�nh th�ng l�i!";
	end
	Msg2MSAll(DTMISSIONID, str)
	
	PlayerIndex = RoleIndex;
	SubWorld = GetMissionV(MS_ORGWORLDINDEX)
	BT_SetData(PL_1VS1, BT_GetData(PL_1VS1) + 1);
	bt_addtotalpoint(BT_GetTypeBonus(PL_1VS1, GetCurCamp()))
	Msg2MSAll(GetMissionV(MS_ORGMISSION), str);
	
	PlayerIndex = OldPlayer
	SubWorld = OldSubWorld
end;

