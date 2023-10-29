PET_PROTOCOL = "emSCRIPT_PROTOCOL_PET"
PET_OPERATION_DELETE = 1
PET_OPERATION_SUMMON = 2
PET_OPERATION_UNSUMMON = 3
PET_OPERATION_LEVEL_UP = 4
PET_OPERATION_CHANGE_NAME = 5
PET_OPERATION_CHANGE_FEATURE = 6
PET_OPERATION_TAME = 7

INDEX_STR = 1
INDEX_DEX = 2
INDEX_VIT = 3
INDEX_ENG = 4
INDEX_HP = 5
INDEX_MP = 6
ATTRIB_COUNT = 6
SKILL_COUNT = 4

SONGJIN = 1
CHANGE_OF_TIME = 2
YAN_DI = 3
TIAN_LU_TREE = 4
XIN_SHI_TASK = 5
HUO_YUE_DU = 6
YE_SOU = 7
JIAN_ZHONG_MI_GONG = 8

EVENT_LIST = {
	[SONGJIN]					= {nBit=1, szName="T�ng Kim", szCondition="T�ng Kim ��t ��n 3000 �i�m t�ch l�y "},
	[CHANGE_OF_TIME]	= {nBit=2, szName="V��t �i", szCondition="V��t qua �i th� 10"},
	[YAN_DI]					= {nBit=3, szName="Vi�m ��", szCondition="V��t qua �i th� 6"},
	[TIAN_LU_TREE]		= {nBit=4, szName="Tr�ng c�y", szCondition="S� d�ng 5 h�t gi�ng c�y Thi�n L�c �� tr�ng c�y"},
	[XIN_SHI_TASK]		= {nBit=5, szName="T�n S�", szCondition="Ho�n th�nh 1 nhi�m v� T�n S�"},
	[HUO_YUE_DU]			= {nBit=6, szName="�� n�ng ��ng", szCondition="�� n�ng ��ng ��t ��n 40 �i�m"},
	[YE_SOU]					= {nBit=7, szName="D� T�u", szCondition="Ho�n th�nh 10 nhi�m v� D� T�u (kh�ng c�n li�n t�c)"},
	[JIAN_ZHONG_MI_GONG] = {nBit=8, szName="Ki�m Gia M� Cung.", szCondition="V��t qua �i th� 2"},
}

TSK_EVENT_FINISHED = 3007
TSK_EVENT_DATE = 3008
TSK_COUNT_TRANSFER_EXP = 1

TSK_APPLE_DAILY = 3001
TSK_MAIZE_DAILY = 3009
TSK_SUGARCANE_DAILY = 3010
TSK_SWEET_POTATO_DAILY = 3002

MAX_FRUIT_COUNT_DAILY = 4

CHANGE_FEATURE_COIN = 5
CHANGE_NAME_COIN = 5
MAX_LEVEL = 20
PET_LEVEL_STEP = 10
MIN_LEVEL = 150

function IsEventFinished(nEventIndex)
	-- 		do 
	-- 	return Talk(1, "", "Ch�c n�ng ch�a m�!")
	-- end
	local tbEventData = EVENT_LIST[nEventIndex]
	if not tbEventData then
		return 0
	end
	
	local nToday
	if MODEL_GAMECLIENT == 1 then
		nToday = tonumber(GetServerDate("%Y%m%d"))
	else
		nToday = tonumber(GetLocalDate("%Y%m%d"))
	end
	
	local nRecordDate = GetTask(TSK_EVENT_DATE)
	if nToday ~= nRecordDate then
		SetTask(TSK_EVENT_DATE, nToday)
		SetTask(TSK_EVENT_FINISHED, 0)
	end
	
	local nFinish = GetTask(TSK_EVENT_FINISHED)
	return GetBit(nFinish, tbEventData.nBit)
end

function FinishEvent(nEventIndex)
	local tbEventData = EVENT_LIST[nEventIndex]
	if not tbEventData then
		return 0
	end

	local nToday
	if MODEL_GAMECLIENT == 1 then
		nToday = tonumber(GetServerDate("%Y%m%d"))
	else
		nToday = tonumber(GetLocalDate("%Y%m%d"))
	end
	
	local nRecordDate = GetTask(TSK_EVENT_DATE)
	if nToday ~= nRecordDate then
		SetTask(TSK_EVENT_DATE, nToday)
		SetTask(TSK_EVENT_FINISHED, 0)
	end
	
	local nFinish = GetTask(TSK_EVENT_FINISHED)
	nFinish = SetBit(nFinish, tbEventData.nBit, 1)
	SetTask(TSK_EVENT_FINISHED, nFinish)
end

