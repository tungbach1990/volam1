nITEM_EXPIRED_TIME = 20130501
EVENT_LOG_TITLE = "EventThang4_2013"
MIN_LEVEL = 150
MAX_ITEM_1_DAILY = 50

ITEM_1 = {szName="H�nh Qu�n L�nh", tbProp={6,1,30395,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME, nBindState = -2}
ITEM_2 = {szName="Huy Hi�u 1 Sao", tbProp={6,1,30396,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_3 = {szName="Huy Hi�u 2 Sao", tbProp={6,1,30397,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_4 = {szName="Huy Hi�u 3 Sao", tbProp={6,1,30398,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_5 = {szName="H�p Huy Hi�u", tbProp={6,1,30399,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_6 = {szName="Huy Hi�u 4 Sao", tbProp={6,1,30400,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_7 = {szName="Huy Hi�u Sao V�ng", tbProp={6,1,30401,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_8 = {szName="Huy Hi�u Sao ��", tbProp={6,1,30402,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_9 = {szName="Huy Hi�u ��i So�i", tbProp={6,1,30403,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_10 = {szName="Huy Hi�u Chi�n C�ng", tbProp={6,1,30404,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_11 = {szName="T�i Chi�n Th�ng", tbProp={6,1,30405,1,0,0}, nExpiredTime=nITEM_EXPIRED_TIME}
ITEM_12 = {szName="H�p Qu� Vui V�", tbProp={6,1,30348,1,0,0}, nExpiredTime= 86400}
MONEY = {szName="Ng�n l��ng",nJxb=1}

TSK_DAILY_1 = 2985 --Gi�i h�n nh�n H�nh Qu�n L�nh
TSK_DAILY_2 = 2989 --Gi�i h�n n�p H�nh Qu�n L�nh
TSK_USE_AWARD1	= {nTaskID = 2986,nStartBit = 1,nBitCount = 12,nMaxValue = 2000} --s� d�ng Huy Hi�u 4 sao
TSK_USE_AWARD2	= {nTaskID = 2986,nStartBit = 13,nBitCount = 11,nMaxValue = 1000} --s� d�ng Huy Hi�u sao v�ng
TSK_USE_AWARD3 = {nTaskID = 2987,nStartBit = 1,nBitCount = 12,nMaxValue = 2000} --s� d�ng Huy Hi�u sao ��
TSK_USE_AWARD4	= {nTaskID = 2987,nStartBit = 13,nBitCount = 15,nMaxValue = 25000} --s� d�ng Huy Hi�u ��i so�i
TSK_USE_AWARD5	= {nTaskID = 2988,nStartBit = 1,nBitCount = 14,nMaxValue = 15000} --s� l�n s� d�ng Huy Hi�u ��i so�i
TSK_USE_AWARD6	= {nTaskID = 2986,nStartBit = 24,nBitCount = 1,nMaxValue = 1} --gi�i h�n s� d�ng h�p qu� vui v�
TSK_USE_AWARD7	= {nTaskID = 2986,nStartBit = 25,nBitCount = 1,nMaxValue = 1} --gi�i h�n nh�n h�o quang
TSK_USE_AWARD8	= {nTaskID = 2986,nStartBit = 26,nBitCount = 1,nMaxValue = 1} --gi�i h�n nh�n top 10
TSK_USE_AWARD9	= {nTaskID = 2986,nStartBit = 27,nBitCount = 1,nMaxValue = 1} --gi�i h�n nh�n top 10 ng�y ��u
TSK_USE_AWARD10	= {nTaskID = 2986,nStartBit = 28,nBitCount = 1,nMaxValue = 1} --ph�n th��ng s� d�ng huy hުu ��i so�i 3000 l�n
TSK_GIVE_ITEM_COUNT = 2990

EXP_AWARD_1 = 1e6 -- N�p h�nh qu�n l�nh

COMPOSE_AWARD_1 = {
	{szName="Huy Hi�u Sao V�ng",tbProp={6,1,30401,1,0,0},nCount=1,nRate=60, nExpiredTime=nITEM_EXPIRED_TIME},
	{szName="Huy Hi�u Sao ��",tbProp={6,1,30402,1,0,0},nCount=1,nRate=40, nExpiredTime=nITEM_EXPIRED_TIME},
}