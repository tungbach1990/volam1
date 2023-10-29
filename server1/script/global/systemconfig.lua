--------------------------------------
-- ϵͳ���ã����ء�״̬��

---------------------------------------------------------------
-- ����汾����
DEF_PRODUCT_REGION_CN		= 0;		-- �й���½�汾
DEF_PRODUCT_REGION_CN_IB	= 1;		-- �й���½��Ѱ汾
DEF_PRODUCT_REGION_TW		= 2;		-- ̨��汾
DEF_PRODUCT_REGION_MY		= 3;		-- Խ�ϰ汾
DEF_PRODUCT_REGION_VN		= 4;		-- Խ�ϰ汾

SYSCFG_PRODUCT_REGION_NAME, SYSCFG_PRODUCT_REGION_ID = GetProductRegion();	-- ��ǰ�汾

---------------------------------------------------------------
-- Ǯׯ�������� (1 - ������nil - �ر�)
SYSCFG_GAMEBANK_GOLDSILVER_OPEN = 1; -- ����Ԫ�����ܿ���

SYSCFG_GAMEBANK_GOLD_GET 		= nil; -- ��Ԫ����ȡ
SYSCFG_GAMEBANK_GOLD_PAY 		= nil; -- ��Ԫ����ֵ
SYSCFG_GAMEBANK_GOLD_COIN 	= nil; -- ��Ԫ����ͭǮ
SYSCFG_GAMEBANK_GOLD_USE 		= nil; -- ��Ԫ��������������;

SYSCFG_GAMEBANK_SILVER_GET 	= 1; -- ��Ԫ����ȡ
SYSCFG_GAMEBANK_SILVER_PAY 	= 1; -- ��Ԫ����ֵ
SYSCFG_GAMEBANK_SILVER_COIN = 1; -- ��Ԫ����ͭǮ
SYSCFG_GAMEBANK_SILVER_USE 	= 1; -- ��Ԫ��������������;

SYSCFG_GAMEBANK_TICKET_OPEN = nil; -- ��Ʊ���ܿ���
SYSCFG_GAMEBANK_TICKET_GET 	= nil; -- ��Ʊ��ȡ
SYSCFG_GAMEBANK_TICKET_PAY 	= nil; -- ��Ʊ��ֵ
SYSCFG_GAMEBANK_TICKET_COIN = nil; -- ��Ʊ��ͭǮ
SYSCFG_GAMEBANK_TICKET_USE 	= nil; -- ��Ʊ������������;
---------------------------------------------------------------
-- LLG_ALLINONE_TODO_20070802
--��չ���ʹ��
SYSCFG_EXTPOINTID7_LOGINMSG		= 1;	--������Ϸʱ��������չ��״̬������Ϣ��ʾ

---------------------------------------------------------------
-- ����������� (1 - ������nil - �ر�)
SYSCFG_SHOP_OPEN            = 1;
---------------------------------------------------------------

---------------------------------------------------------------
-- �һ����������� (1 - ������nil - �ر�)
SYSCFG_TAOHUAISLAND_OPEN    = nil;
---------------------------------------------------------------

---------------------------------------------------------------
-- ÿ����ȡ������������ (1 - ������nil - �ر�)
SYSCFG_AWARDPERDAY_OPEN     = nil;
if (SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_TW) then
	SYSCFG_AWARDPERDAY_OPEN = 1;
end
---------------------------------------------------------------

---------------------------------------------------------------
-- ת�����û���ȡ������������ (1 - ������nil - �ر�)
SYSCFG_PAYMONTHAWARD_OPEN     = 1;
if (SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_TW) then
	SYSCFG_PAYMONTHAWARD_OPEN = nil;
end
---------------------------------------------------------------

---------------------------------------------------------------
-- ͬ�鹦������ (1 - ������nil - �ر�)
SYSCFG_PARTNER_OPEN     = nil;
if (SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_CN or SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_TW) then
	SYSCFG_PARTNER_OPEN = 1;
end
---------------------------------------------------------------

---------------------------------------------------------------
-- �°�Ṧ������ (1 - ������nil - �ر�)
SYSCFG_NEWTONG_OPEN     = nil;
if (SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_CN or SYSCFG_PRODUCT_REGION_ID == DEF_PRODUCT_REGION_CN_IB) then
	SYSCFG_NEWTONG_OPEN = 1;
end
---------------------------------------------------------------

---------------------------------------------------------------
function IncludeForRegionVer(strPath, strLuaFileName)
	
	local strFullName = strPath;
		
	if(SYSCFG_PRODUCT_REGION_NAME == nil) then	
		print("region_version error!!!\n");
		return
	end
	
	strFullName = strFullName..SYSCFG_PRODUCT_REGION_NAME.."\\"..strLuaFileName;
	print(strFullName);	
	Include(strFullName);
end

-- �ж�����Ƿ� VIP
function IsVip()
	if (GetAccLeftTime() > 0) then 
		return 1;
	end
	return 0
end;