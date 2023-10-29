DATE_START		= 20130801
DATE_END		= 20130901

ITEM_MATERIAL_1		= {szName="���ng Quy ", tbProp={6,1,3209,1}, nExpiredTime=DATE_END}
ITEM_MATERIAL_2		= {szName="X� H��ng ", tbProp={6,1,3210,1}, nExpiredTime=DATE_END}
ITEM_MATERIAL_3		= {szName="Tr�n B�", tbProp={6,1,3211,1}, nExpiredTime=DATE_END}
ITEM_MATERIAL_4		= {szName="Li T�m Th�o", tbProp={6,1,3212,1}, nExpiredTime=DATE_END}
ITEM_MATERIAL_5		= {szName="D��c v��ng ��nh", tbProp={6,1,3213,1}, nExpiredTime=DATE_END}

ITEM_AWARD1		= {szName="H� Kh� ��n", tbProp={6,1,3214,1,0,0}, nExpiredTime=DATE_END}
ITEM_AWARD2		= {szName="S� B� ��n", tbProp={6,1,3215,1,0,0}, nExpiredTime=DATE_END}
ITEM_AWARD3		= {szName="Ch�n Long ��n", tbProp={6,1,3216,1,0,0}, nExpiredTime=DATE_END}

MAX_USE_AWARD1		= 1000 		-- 1000 c�i
MAX_USE_AWARD2_3		= 18000 	-- 18 t� exp

EVENT_LOG_TITLE		= "LOGEVENTJX1_eventhang8"
MSG_LIMITED_USE		= "S� d�ng v�t ph�m qu� gi�i h�n, kh�ng th� s� d�ng th�m"
--Money
MONEY		= {szName="Ng�n l��ng",nJxb=1}

-- Task Limit
tbBITTSK_LIMIT_1 = {nTaskID = 3014,nStartBit = 1,nBitCount = 12,nMaxValue = 1000} -- Gi�i h�n d�ng 1000 H� K� ��n
tbBITTSK_LIMIT_2 = {nTaskID = 3015,nStartBit = 1,nBitCount = 16,nMaxValue = 18000} -- Gi�i h�n 18 t� exp S� B� ��n
tbBITTSK_LIMIT_3 = {nTaskID = 3016,nStartBit = 1,nBitCount = 16,nMaxValue = 18000} -- Gi�i h�n 18 t� exp Ch�n Long ��n
tbBITTSK_LIMIT_2_COUNT = {nTaskID = 3015,nStartBit = 17,nBitCount = 12,nMaxValue = 3000} -- ��m s� l�n  d�ng S� B� ��n
tbBITTSK_LIMIT_3_COUNT = {nTaskID = 3016,nStartBit = 17,nBitCount = 12,nMaxValue = 3000} -- ��m s� l�n  d�ng Ch�n Long ��n

--Award limit point
tbTSK_INFO_1 = {nTaskID = 3014,nStartBit = 25,nBitCount = 1,nMaxValue = 1}--M�c 500 S� B� ��n 
tbTSK_INFO_2 = {nTaskID = 3014,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--M�c 1000 S� B� ��n
tbTSK_INFO_3 = {nTaskID = 3014,nStartBit = 27,nBitCount = 1,nMaxValue = 1}--M�c 2000 S� B� ��n

POSPATH_CAIJI		= "\\settings\\event\\formevent\\gather_event8.txt"