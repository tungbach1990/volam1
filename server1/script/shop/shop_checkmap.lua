
-- ====================== �ļ���Ϣ ======================

-- ������Եonline ����������жϽű�
-- Edited by peres
-- 2006/01/16 PM 12:42

-- ����й��Ҹ�
-- �Ҹ�ֻ��˲���Ƭ�ϣ�һС��һС��
-- ������ĺڰ�������󺣣�ͯ���ʱ�����͸�ĸһ������ȥ����
-- ҹ��Ĵ��ڷ����������������СС����λ�ϸо��Լ����ų�ˮƯ������ľ�ͷ
-- ����һ�̣������ǲ����ڵ�
-- ֻ�������������ˡ������మ

-- ======================================================

-- LLG_ALLINONE_TODO_20070802

Include("\\script\\global\\systemconfig.lua") -- ϵͳ����
Include("\\script\\trip\\define.lua")
Include("\\script\\maps\\checkmap.lua");

-- ���Խ��й�������������ͼ ID
aryMap = {
	44, 326, 327, 328, 329, 330, 331, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374,375,376,377,378,379,380,381,382,383,384,385,386,--�ν�ս����Ӫ
	323,324,325,	--�ν�����
	221,222,223,	--����ս����Ӫ
	208,			--����(by ��־ɽ)
	605,606,607,	--���ֵ�һ���Ӫ
	608,609,610,611,612,613,		--���ֵ�һ��׼����
	520,521,522,523,524,525,526,	-- ������
--	-- �һ���
--	235,
--	236,
--	237,
--	238,
--	239,
--	240,
--	241,
}

OtherMap = {m_Maps = {}}

function OtherMap:Initialize()
	for i = 1, getn(aryMap) do
		self.m_Maps[aryMap[i]] = 1
	end
end

function OtherMap:AddMap(mapid)
	self.m_Maps[mapid] = 1
end

function OtherMap:DelMap(mapid)
	self.m_Maps[mapid] = nil
end

function OtherMap:Check(mapid)
	if (self.m_Maps[mapid] ~= nil) then
		return 1
	else
		return 0
	end
end
OtherMap:Initialize()

function IsShopMap(nMapID)
	if (IsCityMap(nMapID) == 1 or
		IsFreshmanMap(nMapID) == 1 or
		IsTongMap(nMapID) == 1 or
		OtherMap:Check(nMapID) == 1) then
		return 1
	else
		return 0
	end
end

function main()
	if (CheckGlobalTradeFlag() == 0) then		-- ȫ�־���ϵͳ���׿���
		return
	end
	
	-- �� global\systemconfig.lua ����������󿪹�
	if SYSCFG_SHOP_OPEN ~= 1 then
		Msg2Player("<color=yellow>Hi�n t�i K� Tr�n C�c v�n ch�a m�! <color>")
		return 0
	end

	if GetTripMode() == TRIP_MODE_SERVER then
		Msg2Player("<color=yellow>Hi�n t�i K� Tr�n C�c v�n ch�a m�! <color>")
		return 0
	end
	local nMapID, _, _ = GetWorldPos()
	if (GetFightState() >= 1 or IsShopMap(nMapID) == 0) then
		Msg2Player("<color=yellow>K� Tr�n C�c ch� c� th� m� t�i c�c th�nh th�, t�n th� th�n v� m�t s� khu v�c phi chi�n ��u kh�c! <color>")
		return 0
	else
		return 1
	end
end
