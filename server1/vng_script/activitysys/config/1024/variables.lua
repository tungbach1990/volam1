EVENT_LOG_TITLE = "LOGTINHANG_CTC_LB_HUYNH_DE"

ITEM_HDTP_LB 		= {szName="L�nh B�i Huynh �� T��ng Ph�ng", tbProp={6,1,30592,1,0,0},nBindState=-2}
ITEM_HOANTHANH_TK_LB	= {szName="T�ng Kim Ho�n Th�nh L�nh", tbProp={6,1,30577,1,0,0},nBindState=-2}
ITEM_HOANTHANH_KILL_NPC_LB		= {szName="��nh Qu�i Ho�n Th�nh L�nh", tbProp={6,1,30578,1,0,0},nBindState=-2}

ITEM_BK90_THAP_DAI_PHAI		= {szName="B� K�p Th�p ��i Ph�i 90", tbProp={6,1,30576,1,0,0},nBindState=-2}

NUM_ADD_KILL = 500
ID_NV_TK = 6
TASK_DAILY_RESET = 2785 --Reset to�n c�c nh�n th��ng v� s� d�ng item theo ng�y
TSK_DAILY_LIMIT = 2786
TSK_DAILY_LIMIT_TK = {nTaskID = TSK_DAILY_LIMIT,nStartBit = 1,nBitCount = 4,nMaxValue = 4} --Gi�i h�n s� d�ng T�ng Kim Ho�n Th�nh L�nh
TSK_DAILY_LIMIT_KILL_NPC = {nTaskID = TSK_DAILY_LIMIT,nStartBit = 5,nBitCount = 4,nMaxValue = 4} --Gi�i h�n s� d�ng ��nh Qu�i Ho�n Th�nh L�nh

TSK_NHAN_LB_HDTP = {nTaskID = TSK_DAILY_LIMIT,nStartBit = 30,nBitCount = 1,nMaxValue = 1} --��nh d�u nh�n th��ng HDLB

EXT_POINT_ID_LBHD =  {nID = 3, nBit = 15, nVer = 1} --K�ch ho�t m� code t�i web


