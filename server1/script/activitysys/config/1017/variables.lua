EVENT_LOG_TITLE		= "EVENT_Cuoi_T5"
ITEM_EXPIRED_TIME = 20130608
--Nguy�n li�u d�ng �� gh�p v�t ph�m
ITEM_MATERIAL_1 = {szName="Ch�a Kh�a ��ng", tbProp={6,1,30389,1}, nExpiredTime=ITEM_EXPIRED_TIME}
ITEM_MATERIAL_2 = {szName="Ch�a Kh�a B�c", tbProp={6,1,30390,1}, nExpiredTime=ITEM_EXPIRED_TIME}
ITEM_MATERIAL_3 = {szName="Ch�a Kh�a Ng� S�c", tbProp={6,1,30391,1}, nExpiredTime=ITEM_EXPIRED_TIME}

--Ph�n th��ng gh�p
ITEM_AWARD_1		= {szName="R��ng Ng� S�c", tbProp={6,1,30392,1,0,0}, nExpiredTime=ITEM_EXPIRED_TIME}
ITEM_AWARD_2		= {szName="R��ng ��ng", tbProp={6,1,30393,1,0,0}, nExpiredTime=ITEM_EXPIRED_TIME}
ITEM_AWARD_3		= {szName="R��ng B�c", tbProp={6,1,30394,1,0,0}, nExpiredTime=ITEM_EXPIRED_TIME}

--S� d�ng r��ng ng� s�c nh�n h� m�ch ��n
ITEM_AWARD_4       = {szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=3}
 
 
TSK_LIMIT_USE_BRONZE_CHEST = 1500   --r��ng ��ng
TSK_LIMIT_USE_SILVER_CHEST = 2000 --r��ng b�c
LIMIT_USE_BOX_SHINING = 2000 --r��ng ng� s�c
FLIPCARD_MAX_DAILY = 200

TSK_USE_AWARD1		= {nTaskID = 2983,nStartBit = 1,nBitCount = 12,nMaxValue = 1500} --s� d�ng Item r��ng ��ng
TSK_USE_AWARD2		= {nTaskID = 2983,nStartBit = 13,nBitCount = 12,nMaxValue = 2000}	--S� d�ng r��ng b�c
TSK_USE_AWARD3		= {nTaskID = 2984,nStartBit = 1,nBitCount = 12,nMaxValue = 2000}	--S� d�ng r��ng ng� s�c
TSK_RESET_OLD_TASK = {nTaskID = 2984,nStartBit = 13,nBitCount = 1,nMaxValue = 1}
TSK_FLIPCARD_DAILY_LIMIT = 2981

MONEY		= {szName="Ng�n l��ng",nJxb=1}

EXP_AWARD_1		= {szName = "1000000 �i�m kinh nghi�m", nExp=1e6}
EXP_AWARD_2		= {szName = "6000000 �i�m kinh nghi�m", nExp=6e6}
tbExpRate = {
		{szName = "5000000 �i�m kinh nghi�m", nExp=1e6,nRate=50},
		{szName = "6000000 �i�m kinh nghi�m", nExp=2e6,nRate=30},
		{szName = "7000000 �i�m kinh nghi�m", nExp=3e6,nRate=20},
}

FLIPCARD_CASH_REQUIRE = 20000
FLIPCARD_FREE_BAG_REQUIRE = 1
FLIPCARD_EXP_AWARD = 100000