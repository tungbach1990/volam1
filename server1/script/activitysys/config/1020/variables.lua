EVENT_LOG_TITLE		= "EVENT_T6_2013"
DATE_END		= 20130701
--Nguy�n li�u d�ng �� gh�p v�t ph�m
ITEM_MATERIAL_1 = {szName = "B�t M�", tbProp = {6,1,30204,1,0,0},nExpiredTime=DATE_END}
ITEM_MATERIAL_2 =  {szName = "S�a", tbProp = {6,1,30206,1,0,0},nExpiredTime=DATE_END}
ITEM_MATERIAL_3 = {szName = "B�", tbProp = {6,1,30205,1,0,0},nExpiredTime=DATE_END}
ITEM_MATERIAL_4 = {szName = "���ng", tbProp = {6,1,30209,1,0,0},nExpiredTime=DATE_END}
ITEM_MATERIAL_5 = {szName = "Chocolate", tbProp = {6,1,30207,1,0,0},nExpiredTime=DATE_END}
ITEM_MATERIAL_6 = {szName = "Tr�i c�y", tbProp = {6,1,30208,1,0,0},nExpiredTime=DATE_END}

--Tien van
MONEY		= {szName="Ng�n l��ng",nJxb=1}

--Ph�n th��ng gh�p
ITEM_AWARD_1		= {szName = "B�nh kem th��ng", tbProp = {6,1,30210,1,0,0},nExpiredTime=DATE_END}
ITEM_AWARD_2		= {szName = "B�nh kem Chocolate", tbProp = {6,1,30211,1,0,0},nExpiredTime=DATE_END}
ITEM_AWARD_3		= {szName = "B�nh kem tr�i c�y", tbProp = {6,1,30212,1,0,0},nExpiredTime=DATE_END}
ITEM_AWARD_4		=  {szName = "B�nh sinh nh�t", tbProp = {6,1,30213,1,0,0},nExpiredTime=DATE_END}

-- Task gi�i h�n
tbBITTSK_GET_EXP = {nTaskID = 2998,nStartBit = 24,nBitCount = 1,nMaxValue = 1} -- Gi�i h�n Nh�n �i�m EXP trong su�t event
tbBITTSK_LIMIT_USE_OFTEN_CAKE = {nTaskID = 2998,nStartBit = 1,nBitCount = 11,nMaxValue = 1000} -- Gi�i h�n d�ng 1000 c�i  b�nh kem th��ng trong su�t event
tbBITTSK_LIMIT_USE_CHOCOLATE = {nTaskID = 2998,nStartBit = 12,nBitCount = 11,nMaxValue = 800} -- Gi�i h�n d�ng 800 c�i b�nh kem chocolate trong su�t event
tbBITTSK_LIMIT_USE_FRUIT = {nTaskID = 2999,nStartBit = 1,nBitCount = 16,nMaxValue = 10000} -- Gi�i h�n exp d�ng b�nh kem tr�i c�y trong su�t event
tbBITTSK_LIMIT_USE_FRUIT_COUNT = {nTaskID =3000,nStartBit = 1,nBitCount = 16,nMaxValue = 10000} -- ��m s� l�n  d�ng b�nh kem tr�i c�y trong su�t event
tbBITTSK_LIMIT_USE_BIRTHDAY_CAKE = {nTaskID = 2999,nStartBit = 17,nBitCount = 14,nMaxValue = 500} -- Gi�i h�n d�ng b�nh kem sinh nh�t ��c bi�t  trong su�t event

--��t m�c
tbTSK_INFO_1 = {nTaskID = 2998,nStartBit = 25,nBitCount = 1,nMaxValue = 1}--M�c 500 b�nh kem tr�i c�y
tbTSK_INFO_2 = {nTaskID = 2998,nStartBit = 26,nBitCount = 1,nMaxValue = 1}--M�c 1000 b�nh kem tr�i c�y
tbTSK_INFO_3 = {nTaskID = 2998,nStartBit = 27,nBitCount = 1,nMaxValue = 1}--M�c 250 b�nh kem ��c bi�t
tbTSK_INFO_4 = {nTaskID = 2998,nStartBit = 28,nBitCount = 1,nMaxValue = 1}--M�c 500 b�nh kem ��c bi�t

