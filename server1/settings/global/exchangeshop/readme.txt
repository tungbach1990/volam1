\settings\global\exchangeshop\shop.txt
˵�����̵����ñ�
����Ҫ�㣺�����̵�ID������ָ���̵������Щ��ƷID
ShopId���̵�ID����1��ʼ�����ε���
Item1~Item20����ƷID��һ���̵������Ʒ�������Ϊ20������ƷID����\settings\global\exchangeshop\goods.txt��

ʹ�÷�����
?gm ds Include("\\script\\global\\exchangeshop\\main_s.lua")
?gm ds tbExchangeShopServer:OpenExchangeShop(nShopId) --��ָ�����̵�

\settings\global\exchangeshop\goods.txt
˵������Ʒ���ñ�
����Ҫ�㣺������ƷID�����ݾ�����������������
ItemId����ƷID����1��ʼ�����ε���
ItemGenre�����߳��ò������ο�magicscript.txt
ItemDetailType�����߳��ò������ο�magicscript.txt
ParticularType�����߳��ò������ο�magicscript.txt
Level�����߳��ò������ο�magicscript.txt
nCount������Ʒ�õ�������
SaleBeginDate�����ۿ�ʼ���ڣ��ɲ���д
SaleEndDate�����۽������ڣ��ɲ���д
ExpiredTime����Ч�ڣ���λ����
tbCostId����������ID������ID����\settings\global\exchangeshop\cost.txt��������ʹ��Ӣ����ĸ���ŷָ��������ID����ζ�Ÿ���Ʒ��Ҫ�����������
nTaskid	nBitPos	nBitCount�������ɳ��򿪷���Ա���ã���¼������Ϣ��
nMaxGetNum����������Ĵ���
nBind���Ƿ��
szComment����Ʒ����˵��

\settings\global\exchangeshop\cost.txt
˵�����������ñ�
CostId������ID����1��ʼ�����ε���
ParamKey���̶���д "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE, ITEM, CUSTOM"�е�һ���������������͡����ң� ��Ʒ���ң�����������ң�magicscript��Ʒ���Զ������͡�
ParamDetail��������ParamKey����д���پ���ϸ��ParamDetail������ͬ���壩��
����� ParamKey == "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE"��ֵ���� ParamDetail��ֵΪ������һ��
��\swordonline\gameworld\include\GameDataDef.h�����ö��ֵһ��
CURRENCYTYPE_MONEY			= 1,	// ������
CURRENCYTYPE_FUYUAN			= 2,	// ��Ե
CURRENCYTYPE_COIN			= 3,	// ͭǮ
CURRENCYTYPE_SCORE			= 4,	// ����
CURRENCYTYPE_GOLDCOIN		= 5,	// ���
CURRENCYTYPE_SLIVER			= 6,	//���ң�������
CURRENCYTYPE_TICKET			= 7,	//Ʊ�ӣ�������
CURRENCYTYPE_YUANBAO		= 8,	//Ԫ����������
CURRENCYTYPE_GOLDCOIN_NEW	= 9,	// �½�ң���������̨��Ļ���
CURRENCYTYPE_CONTRIBUTION	= 10,	// ���׶�
CURRENCYTYPE_HONOUR			= 11,	// ������������
CURRENCYTYPE_GOLDCOIN_SCORE = 12,	// ��һ���
CURRENCYTYPE_RESPECT		= 13,	// ����
CURRENCYTYPE_REFINING		= 14,	// ����ʯ
CURRENCYTYPE_ENERGY			= 15,	// ����
CURRENCYTYPE_ARENA_CREDITS	= 16,	// ����������ѫ��
CURRENCYTYPE_ITEM_LONGLINGQI	= 17,	// ������	6,1,3056
CURRENCYTYPE_ITEM_LINLINGQI		= 18,	// ������ 6,1,3057
CURRENCYTYPE_ITEM_GUILINGQI		= 19,	// ������	6,1,3059
CURRENCYTYPE_ITEM_FENGLINGQI	= 20,	// ������	6,1,3058
CURRENCYTYPE_ITEM_WUXINGQISHI	= 21,	// ������ʯ	6,1,2125
CURRENCYTYPE_ITEM_XINGXIALING	= 22,	// ������	6,1,2566
CURRENCYTYPE_TASK_SJGX			= 23,	//С�ν�ѫ  �������ID = 3450
CURRENCYTYPE_TASK_GUTA		= 24, //�������� �������ID = 4164
CURRENCYTYPE_XINGYU			= 25,	// ���� ����������⴦��ԭ��Ӧ���Ƕ���Ϊ���ҵ� 6,1,4546
CURRENCYTYPE_TASK_DIANQUAN	= 26,	//�����ȯ �������ID = 4200

Param1��
��� ParamKey == "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE"��������Ϊ��������ֵ
Param1 == ����ֵ

��� ParamKey == "ITEM", 
Param1 == Genreֵ��
Param2 == nDetailֵ��
Param3 == nParticularֵ
Param4 == nLevelֵ
Param5 == nCountֵ����������

���ParamKey == "CUSTOM",��
Param1 == ����ֵ
ParamDetail == ��1��ʼ���Զ����ֵ������ÿһ���Զ������ģ���Ҫ�ظ���
������Ҫ��\script\global\exchangeshop\cost\costcustom.lua ע���ȡ����__GetValue�����ĺ���__CostValue���ο�����
tbCostCustom:RegisterCostCustmonNode(ParamDetailKey, ParamDetailKeyName, __GetValue, __CostValue)
Param6��Ԥ������ʱ����

Comment���ô����ĵ�Ԫ��˵����������ʾ

----------------------------------------------------------------------------------------------------------------------
File thi�t l�p shop m�i theo c� ch� v�t ��i v�t:
\settings\global\exchangeshop\shop.txt
Thuy�t minh: Thi�t l�p Shop
�i�m quan tr�ng c�a thi�t l�p: thi�t l�p ID shop, thi�t l�p ID nh�ng v�t ph�m ch� ��nh s� ���c b�n trong shop
ShopID: ID c�a shop, b�t ��u l� 1, t�ng d�n
Item1~Item20 : ID v�t ph�m b�n trong shop (m�t shop ch� c� th� b�n t�i �a 20 v�t ph�m, ID v�t ph�m li�n quan � \settings\global\exchangeshop\goods.txt )

Ph��ng ph�p s� d�ng:
?gm ds Include("\\script\\global\\exchangeshop\\main_s.lua")
?gm ds tbExchangeShopServer:OpenExchangeShop(nShopId)
-- M� shop ch� ��nh

\settings\global\exchangeshop\goods.txt
Thuy�t minh: B�ng thi�t l�p v�t ph�m b�n trong shop
�i�m quan tr�ng c�a thi�t l�p: Thi�t l�p ID v�t ph�m b�n, d�a theo t�nh h�nh c� th� m� thi�t l�p
ItemID: ID v�t ph�m, b�t ��u t� 1, t�ng d�n
ItemGenre: Tham s� v�t ph�m th��ng d�ng, tham kh�o magicscript.txt
ItemDetailType: Tham s� v�t ph�m th��ng d�ng, tham kh�o magicscript.txt
ParticularType: Tham s� v�t ph�m th��ng d�ng, tham kh�o magicscript.txt
Level: Tham s� v�t ph�m th��ng d�ng, tham kh�o magicscript.txt
nCount: S� l��ng ��t ���c c�a v�t ph�m
SaleBeginDate: Ng�y b�t ��u b�n, c� th� kh�ng �i�n
SaleEndDate: Ng�y k�t th�c b�n, c� th� kh�ng �i�n
ExpiredTime: H�n s� d�ng, t�nh b�ng ph�t
tbCostId: Thi�t l�p ID ��n v� ti�u hao (ID ti�u hao li�n quan \settings\global\exchangeshop\cost.txt), c� th� d�ng d�u ph�y �� ng�n c�ch nhi�u ID ��n v� ti�u hao, � l� mua v�t ph�m c�n ti�u hao nhi�u lo�i t�i nguy�n)
nTaskid	nBitPos	nBitCount (3 c�t n�y do ng��i dev thi�t l�p, l�u log th�ng tin s� l��ng mua)
nTaskid: ID 32bit c�a nhi�m v�, tr��c m�t ch� d�ng �� d� ph�ng)
(4219, 4220, 4221, 4222, 4223, 4224, 4225, 4226, 4227, 4228)
nBitPos: V� tr� b�t ��u
nBitCount : S� l��ng
nMaxGetNum: S� l��ng t�i �a b�n ra
nBind: C� kh�a hay kh�ng
szComment: Thuy�t minh c�a v�t ph�m ���c b�n
Ch� �: Kh�ng h� tr� c� ch� l�m m�i nhi�m v� bi�n l��ng, n�u c� nhu c�u, c�n ph�i l�m m�i th� c�ng nhi�m v� bi�n l��ng

\settings\global\exchangeshop\cost.txt
Thuy�t minh:  B�ng thi�t l�p ti�u hao
CostID: ID ti�u hao, t� 1, t�ng d�n
ParamKey: �i�n c� ��nh
Vi�t 1 trong s� nh�ng c�i (CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE, ITEM, CUSTOM), t��ng �ng v�i lo�i ti�u hao (ti�n t�, v�t ph�m ti�n t�, nhi�m v� bi�n l��ng ti�n t�, v�t ph�m magicscript, lo�i t� ��nh ngh�a)

ParamDetail: (D�a v�o ParamKey, sau �� ti�p t�c ph�n chi ti�t ParamDetail, s� mang � ngh�a kh�c nhau),
N�u ParamKey == "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE", th� ParamDetail s� �i�n 1 trong s� nh�ng lo�i sau
V� \swordonline\gameworld\include\GameDataDef.h  �� ��nh ngh�a gi� tr� th�ng nh�t
CURRENCYTYPE_MONEY			= 1,	// ti�n v�n
CURRENCYTYPE_FUYUAN			= 2,	// ph�c duy�n
CURRENCYTYPE_COIN			= 3,	// ti�n ��ng
CURRENCYTYPE_SCORE			= 4,	// t�ch �i�m
CURRENCYTYPE_GOLDCOIN		= 5,	// ti�n v�ng
CURRENCYTYPE_SLIVER			= 6,	// ng�n l��ng (ph� b�)
CURRENCYTYPE_TICKET			= 7,	// phi�u (ph� b�)
CURRENCYTYPE_YUANBAO		= 8,	// nguy�n b�o (ph� b�)
CURRENCYTYPE_GOLDCOIN_NEW	= 9,	// ti�n v�ng m�i, �� ph�n bi�t v�i ti�n t� c�a ��i Loan
CURRENCYTYPE_CONTRIBUTION	= 10,	// �� c�ng hi�n
CURRENCYTYPE_HONOUR			= 11,	// �i�m vinh d� li�n ��u
CURRENCYTYPE_GOLDCOIN_SCORE = 12,	//  ti�n v�ng t�ch l�y
CURRENCYTYPE_RESPECT		= 13,	// danh v�ng
CURRENCYTYPE_REFINING		= 14,	// tinh luy�n th�ch
CURRENCYTYPE_ENERGY			= 15,	// tinh l�c
CURRENCYTYPE_ARENA_CREDITS	= 16,	// hu�n ch��ng vinh d� c�nh k� tr��ng
CURRENCYTYPE_ITEM_LONGLINGQI	= 17,	// long l�nh k� 	6,1,3056
CURRENCYTYPE_ITEM_LINLINGQI		= 18,	// l�n l�nh k� 6,1,3057
CURRENCYTYPE_ITEM_GUILINGQI		= 19,	//  quy l�nh k�	6,1,3059
CURRENCYTYPE_ITEM_FENGLINGQI	= 20,	// ph�ng l�nh k�	6,1,3058
CURRENCYTYPE_ITEM_WUXINGQISHI	= 21,	// ng� h�nh k� th�ch	6,1,2125
CURRENCYTYPE_ITEM_XINGXIALING	= 22,	// h�nh hi�p l�nh	6,1,2566
CURRENCYTYPE_TASK_SJGX			= 23,	//ti�u hu�n ch��ng t�ng kim    ID nhi�m v� bi�n l��ng = 3450
CURRENCYTYPE_TASK_GUTA		= 24, //t�ch �i�m c� th�p    ID nhi�m v� bi�n l��ng = 4164
CURRENCYTYPE_XINGYU			= 25,	// Tinh ng�c  ��o c� tinh ng�c x� l� ��c bi�t, v�n d� ���c ��nh ngh�a l� ti�n t�  6,1,4546
CURRENCYTYPE_TASK_DIANQUAN	= 26,	//C�m t� �i�m quy�n    ID nhi�m v� bi�n l��ng = 4200

N�u ParamKey == "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE" �� thi�t l�p v�t ph�m ti�u hao c� th�
Param1 == gi� tr� ti�u hao

N�u ParamKey == "ITEM",
Param1 == gi� tr� Genre#
Param2 == gi� tr� nDetail#
Param3 == gi� tr� nParticular
Param4 == gi� tr� nLevel
Param5 == gi� tr� nCount#s� l��ng ti�u hao

N�u ParamKey == "CUSTOM"
Param1 == gi� tr� ti�u hao
ParamDetail == b�t  ��u t� 1 (gi� tr� t� ��nh ngh�a, chia t�ng lo�i ti�u hao t� ��nh ngh�a ra, kh�ng n�n tr�ng l�p)
Ngo�i ra, � \script\global\exchangeshop\cost\costcustom.lua c�n ph�i ��ng k� nh�n tham s� __GetValue v� __CostValue,
tham kh�o tbCostCustom:RegisterCostCustmonNode(ParamDetailKey, ParamDetailKeyName, __GetValue, __CostValue)
Param6#�� d� ph�ng, t�m th�i kh�ng d�ng ��n
Comment: thuy�t minh lo�i ti�n t� ti�u hao, d�ng �� hi�n th� nh�c nh�.

Tham kh�o c�ch s� d�ng shop bang h�i - h� th�ng bang h�i m�i t�i:
\script\activitysys\config\52\extend.lua
Include("\\script\\global\\exchangeshop\\main_s.lua")
function pActivity:OpenShop()
    ...
    tbExchangeShopServer:OpenExchangeShop(1)
    ...
end