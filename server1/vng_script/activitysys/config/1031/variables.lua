EVENT_LOG_TITLE = "LOGEVENT_CTC_Thang9_TrungThu"

DATE_END = 20150925

ITEM_LD_ONG								= {szName="L�ng ��n �ng", tbProp={6,1,30309,1,0,0},nExpiredTime=DATE_END}
ITEM_LD_TRON								= {szName="L�ng ��n tr�n", tbProp={6,1,30310,1,0,0},nExpiredTime=DATE_END}
ITEM_LD_NGOISAO							= {szName="L�ng ��n ng�i sao", tbProp={6,1,30311,1,0,0},nExpiredTime=DATE_END}
ITEM_LD_CACHEP							= {szName="L�ng ��n c� ch�p", tbProp={6,1,30312,1,0,0},nExpiredTime=DATE_END}
ITEM_LD_BUOM_BUOM					= {szName="L�ng ��n b��m b��m", tbProp={6,1,30307,1,0,0},nExpiredTime=DATE_END}
ITEM_LD_KEOQUAN						= {szName="L�ng ��n k�o qu�n", tbProp={6,1,30308,1,0,0},nExpiredTime=DATE_END}

ITEM_HOP_LD_KEOQUAN			= {szName="H�p l�ng ��n k�o qu�n", tbProp={6,1,30314,1,0,0},nExpiredTime=DATE_END}
ITEM_HOP_LD_BUOMBUOM			= {szName="H�p l�ng ��n b��m b��m", tbProp={6,1,30303,1,0,0},nExpiredTime=DATE_END}
ITEM_BANH_TT_MINHNGUYET		= {szName="B�nh Trung Thu Minh Nguy�t", tbProp={6,1,30304,1,0,0},nExpiredTime=DATE_END}
ITEM_BANH_TT_VIENNGUYET		= {szName="B�nh Trung Thu Vi�n Nguy�t", tbProp={6,1,30305,1,0,0},nExpiredTime=DATE_END}
ITEM_BANH_TT_HOANGNGUYET	= {szName="B�nh Trung Thu Ho�ng Nguy�t", tbProp={6,1,30306,1,0,0},nExpiredTime=DATE_END}

MAP_HOASON = 2

MONEY = {szName="Ng�n l��ng",nJxb=1}

MONEY_1Van = 10000 --1 Van luong

--Moc su dung
MOC_500   = 500
MOC_1000 = 1000
MOC_2000 = 2000

--Task 2708
tbBITTSK_LIMIT_USE_BTT_MinhNguyet = {nTaskID = 2708,nStartBit = 0,nBitCount = 12,nMaxValue = MOC_2000} -- su dung 2000 
tbBITTSK_LIMIT_USE_BTT_VienNguyet = {nTaskID = 2708,nStartBit = 13,nBitCount = 10,nMaxValue = MOC_1000} --Su dung 1000

tbBITTSK_RECV_MOC_500_BTT_VienNguyet = {nTaskID = 2708,nStartBit = 27,nBitCount = 1,nMaxValue = 1} --Nhan Moc 1000
tbBITTSK_RECV_MOC_1000_BTT_VienNguyet = {nTaskID = 2708,nStartBit = 28,nBitCount = 1,nMaxValue = 1} --Nhan Moc 2000

tbBITTSK_RECV_MOC_500_BTT_HoangNguyet = {nTaskID = 2708,nStartBit = 29,nBitCount = 1,nMaxValue = 1} --Nhan Moc 500
tbBITTSK_RECV_MOC_1000_BTT_HoangNguyet = {nTaskID = 2708,nStartBit = 30,nBitCount = 1,nMaxValue = 1} --Nhan Moc 1000 

--Task 2709
tbBITTSK_LIMIT_USE_BTT_HoangNguyet = {nTaskID = 2709,nStartBit = 0,nBitCount = 12,nMaxValue = MOC_1000} --Su dung 1000

--gioi han hai toi da 5 hoa dang/ngay
tbBITTSK_LIMIT_GET_HOADANG_DAILY =  {nTaskID = 2709,nStartBit = 13,nBitCount = 4,nMaxValue = 5} 

TSK_EXP_DAILY_LongDenKeoQuan = 2710
MAX_EXP_DAILY_LDKQ = 100 --gioi han 5tr exp : 100*50,000 exp

--task daily th� hoa ��ng
TSK_DAILY_THAHOADANG = 2711
MAX_COUNT_THAHOADANG = 5 --gioi han 5 lan 1 ngay
--Bang tra loi cau hoi
TB_QUEST = {
						{"PK 9 v�o t� t�n bao nhi�u v�n","a.	81 v�n","b.	18 v�n","c.	Kh�ng t�n ��ng n�o"},
						{"1 ng�y �n ���c bao nhi�u kinh nghi�m t� Thi�t La H�n","a.	150 tri�u","b.	175 tri�u","c.	125 tri�u"},
						{"Level d��i 90 �n V� l�m m�t T�ch ���c bao nhi�u �i�m","a.	1","b.	2","c.	3 "},
						{"1 acc c� th� �n ���c bao nhi�u b�nh t�ng k� n�ng v� ti�m n�ng","a.	3","b.	4","c.	5"},
						{"Nh�n v�t ch� tr�ng c� th� b� ��nh ch�t hay kh�ng","a.	Kh�ng","b.	C�","c.	Bi�t ch�t li�n"},
						{"Nh�n v�t ch� tr�ng c� th� c��i nh�n v�t kh�c kh�ng","a.	Kh�ng","b.	C�","c.	Ch�a th� n�n ch�ng bi�t"},
						{"Trang b� may m�n cao nh�t hi�n t�i l� bao nhi�u %","a.	10%","b.	20%","c.	25%"},
						{"Chi�u th�c B�ch ��c Xuy�n T�m kh�ng c� v� kh� �ao th� c� ��nh ���c kh�ng","a.	C�","b.	Kh�ng ch�i Ng� ��c n�n ch�c l� kh�ng."},
						{"D�y chuy�n Kh�ng T�t C� cao nh�t l� bao nhi�u","a.	18","b.	20","c.	24"},
						{"Ng�a Phi V�n h� g�","a.	Th�","b.	Kim","c.	V� H�"},
						{"T� Th�y Tinh c� ch�c n�ng g�","a.	N�ng C�p trang b�","b.	��i h� trang b�","c.	T�y T�y"},
						{"Bao nhi�u ph�i c� th� d�ng ki�m","a.	4","b.	6","c.	10"},
						{"��o Hoa Nguy�n L�u R��ng � ��u","a.	Ba l�ng Huy�n","b.	Nam Nh�c Tr�n","c.	T��ng D��ng"},
						{"Ph�m vi hi�u qu� c�a chi�u Khinh C�ng","a.	300","b.	400","c.	500"},
						{"�� Ho�ng Kim b�n shop ���c bao nhi�u ti�n","a.	12400","b.	12499","c.	12500"},
						{"Khi b� qu�i ��nh ch�t b�n s� nh�t l�i ���c bao nhi�u ti�n ","a.	m�t n�a s� ti�n m�t","b.	m�t ph�n ba s� ti�n m�t","c.	m�t ph�n t� s� ti�n m�t"},
						{"Trang b� chi�m nhi�u � nh�t l� bao nhi�u","a.	6","b.	7","c.	8"},
						{"B� trang b� Nhu T�nh c� bao nhi�u m�n","a.	3","b.	4","c.	5"},
}
TB_ANSWER = {3,1,1,3,2,2,3,1,3,2,3,3,2,2,2,1,3,2}

