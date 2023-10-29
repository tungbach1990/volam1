
EVENT_LOG_TITLE		= "LOGEVENT_CTC_Event_Thang5_2015"

DATE_END = 20150515

MSG_LIMITED_USE		= "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m"
MAX_1000 = 1000
MAX_2000 = 2000

--Nguy�n li�u d�ng �� gh�p v�t ph�m
ITEM_RUONGTHANBI		= {szName="R��ng Th�n B�", tbProp={6,1,30257,1,0,0}, nExpiredTime=DATE_END}
ITEM_HC_HOANGKIM	= {szName="Hu�n Ch��ng Ho�ng Kim", tbProp={6,1,30259,1,0,0}, nExpiredTime=DATE_END}
ITEM_CK_THANBI	= {szName="Ch�a Kh�a Th�n B�", tbProp={6,1,30258,1,0,0}, nExpiredTime=DATE_END}

tbBITTSK_LIMIT_USE_1000 = {nTaskID = 2692,nStartBit = 0,nBitCount = 10,nMaxValue = MAX_1000}
tbBITTSK_LIMIT_USE_2000 = {nTaskID = 2692,nStartBit = 11,nBitCount = 12,nMaxValue = MAX_2000}

--toa do xuat hien Tra
MapID_Ruong = 37
NpcID_Ruong = 1876
tbNpc_Monter = {
						{641,"B�ch Ma H� B�o"},
						{641,"T�ch La H� B�o"},
						{641,"Ph� T�ch H� B�o"},
						{641,"��ng �u H� B�o"},
					}
tbNpc_Monter_Chat ={
	"L�ng v�ng � ��y l�m g�...",
	"Ng��i t�m ki�m g� trong kho b�u n�y �?",
	"Bi�n kh�i ��y mau.. kh�ng ��ng tr�ch",
	"Ta kh�ng n��ng tay...",
}	
				

MAX_USE_6888 = 6888
MAX_USE_4888 = 4888
MAX_USE_688 = 688

--Task 2755
TASKID_1 = 2755
tbBITTSK_LIMIT_USE_TDLB = {nTaskID = TASKID_1,nStartBit = 0,nBitCount = 16,nMaxValue = MAX_USE_6888 }
tbBITTSK_LIMIT_USE_BNLB = {nTaskID = TASKID_1,nStartBit = 17,nBitCount = 13,nMaxValue = MAX_USE_4888 }
--Task 2756
TASKID_2 = 2756
tbBITTSK_LIMIT_USE_BKLB = {nTaskID = TASKID_2,nStartBit = 0,nBitCount = 12,nMaxValue = MAX_USE_688 }

tbBITTSK_688_BKLB 	= {nTaskID = TASKID_2,nStartBit = 30,nBitCount = 1,nMaxValue = 1 } -- Nhan thuong moc 688

NPC_BOX_INFO		= "\\vng_script\\activitysys\\config\\1023\\listnpc.txt"

