
Include("\\script\\trip\\define.lua")
Include("\\script\\global\\login_head.lua")

Include("\\script\\misc\\eventsys\\type\\player.lua")

function trip_server_onlogin(bExchangeIn)
	if bExchangeIn == 1 then--���ͼ������
		return
	end
	DisabledStall(1)
	local nAcrossServerMoney = GetTask(TSK_TRIP_MONEY)
	local nMoney = GetCash()
	local nUpMoney = 2000000000
	local nAddMoney = nAcrossServerMoney
	if (nAddMoney + nMoney) > nUpMoney then
		nAddMoney = nUpMoney - nMoney
	end
	nAddMoney = max(nAddMoney, 0)	-- ���۵���Ǯ����С��0�������ˢǮ�����
	SetTask(TSK_TRIP_MONEY, nAcrossServerMoney - nAddMoney)
	Earn(nAddMoney)
end

local nTripMode = GetTripMode()
if nTripMode == TRIP_MODE_SERVER then
	EventSys:GetType("OnLogin"):Reg(0, trip_server_onlogin)
end
