EVENT_LOG_TITLE		= "EVENT_THANG112012"
DATE_START		= 20120701
DATE_END		= 20121201
POSPATH_CAIJI		= "\\settings\\event\\formevent\\gather_event11.txt"
--POSPATH_CAIJI		= "\\settings\\event\\formevent\\gather_pos.txt"
ITEM_MATERIAL_1		= {szName="Cu�n s�ch tr�ng", tbProp={6,1,30304,1}, nExpiredTime=DATE_END}
ITEM_MATERIAL_2		= {szName="L� m�c", tbProp={6,1,30305,1}, nExpiredTime=DATE_END}
ITEM_MATERIAL_3		= {szName="C�y b�t", tbProp={6,1,30306,1}, nExpiredTime=DATE_END}
ITEM_MATERIAL_4		= {szName="Hoa tri �n", tbProp={6,1,30307,1}, nExpiredTime=DATE_END}
ITEM_MATERIAL_5		= {szName="C�c t�y", tbProp={6,1,30308,1}, nExpiredTime=DATE_END}
ITEM_MATERIAL_6		= {szName="H�p b�t ch�", tbProp={6,1,30309,1,0,0}, nExpiredTime=DATE_END}
ITEM_MATERIAL_7		= {szName="B�t ch�", tbProp={6,1,30310,1}, nExpiredTime=DATE_END}
ITEM_MATERIAL_8		= {szName="B� hoa", tbProp={6,1,30319,1}, nExpiredTime=DATE_END}

ITEM_AWARD1				= {szName="S�ch l�ch s�", tbProp={6,1,30311,1,0,0}, nExpiredTime=DATE_END}
ITEM_AWARD2				= {szName="S�ch ��a l�", tbProp={6,1,30312,1,0,0}, nExpiredTime=DATE_END}
ITEM_AWARD3				= {szName="S�ch v�n h�c", tbProp={6,1,30313,1,0,0}, nExpiredTime=DATE_END}

ITEM_AWARD4				= {szName="B� hoa m�u xanh", tbProp={6,1,30320,1,0,0}, nExpiredTime=DATE_END,nRate=65}
ITEM_AWARD5				= {szName="B� hoa m�u ��", tbProp={6,1,30321,1,0,0}, nExpiredTime=DATE_END,nRate=35}
ITEM_AWARD6				= {szName="B� hoa m�u v�ng", tbProp={6,1,30322,1,0,0}, nExpiredTime=DATE_END}

ITEM_USE_MATERIAL_6		= {szName="B�t ch�", tbProp={6,1,30310,1,0,0}, nExpiredTime=DATE_END}

ITEM_ONLINEAWARD1		= {szName="Bang H�i Thi�t Huy�t L�nh", tbProp={6,1,3217,1,0,0}, nExpiredTime=DATE_END,nRate=50}
ITEM_ONLINEAWARD2		= {szName="Bang H�i �an T�m L�nh", tbProp={6,1,3218,1,0,0}, nExpiredTime=DATE_END,nRate=50}
MONEY		= {szName="Ng�n l��ng",nJxb=1}

--cac Task nhiem vu
TSK_GET_ONLINEAWARD		= 2922
TSK_LAST_ONLINEDATA		= 2921
TSK_LAST_ONLINETIME		= 2920
TSK_USE_AWARD1		= {nTaskID = 2925,nStartBit = 12,nBitCount = 11,nMaxValue = 1000}
TSK_USE_AWARD2		= {nTaskID = 2925,nStartBit = 1,nBitCount = 11,nMaxValue = 2000}
TSK_USE_AWARD3		= {nTaskID = 2926,nStartBit = 1,nBitCount = 12,nMaxValue = 1500}
TSK_USE_AWARD4		= {nTaskID = 2961,nStartBit = 1,nBitCount = 11,nMaxValue = 2000}
TSK_USE_AWARD6		= {nTaskID = 2961,nStartBit = 12,nBitCount = 10,nMaxValue = 1000}
--TSK_COMPOSE_MATERIAL4		= 3

---Cac gioi han
MAX_GET_ONLINEAWARD		= 10
MAX_USE_AWARD1		= 1000
MAX_USE_AWARD2		= 2000
MAX_USE_AWARD3		= 1500
MAX_USE_AWARD4		= 2000
MAX_USE_AWARD6		= 1000

AWARD_ONLINEITEM		= {[1]=ITEM_ONLINEAWARD1, [2]=ITEM_ONLINEAWARD2}
AWARD_GHEPRANDOMITEM		= {[1]=ITEM_AWARD4, [2]=ITEM_AWARD5}

--Ph�n th��ng kinh nghi�m
EXP_AWARD1		= 1000000
EXP_AWARD2		= 6000000
EXP_AWARD3		= 5000000
EXP_AWARD4		= 1000000
EXP_AWARD6		= 10000000
