-- �ļ�������event.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-01-16 10:57:44
--��ȡ�ص�: �������١��������ߴ���е������ȡ
--Ҫ��ÿ��ÿ�˺�ֻ����ȡ4��
--��ȡʱ��: ÿ��21��00 �C 22��00
--��ȡʱ��: �� 2008��02��02�� �C 2008��03��02�� 24��00
--ʹ��ʱ��: �� 2008��02��02�� �C 2008��03��02�� 24��00
Include("\\script\\event\\springfestival08\\luckplanting\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\pay.lua")

local _FormatTimeHMToSring = function(nTimeHM)
	local nMinute = floor(nTimeHM / 100)
	local nSecond = mod(nTimeHM , 100)
	szMsg = format("%02d:%02d", nMinute, nSecond)
	return szMsg
end
function luckplanting_0801_main()
	local nDate		= tonumber(GetLocalDate("%y%m%d"))
	local nTimeHM	= tonumber(GetLocalDate("%H%M"))
	local nTSKV		= GetTask(TSK_luckplanting_0801)
	local nWeek		= tonumber(GetLocalDate("%w"))
	local tbWeek = {[5] = 1, [6] = 1, [0] = 1}
	if luckplanting_0801_CheckMap() ~= 1 then
		Say("Xin l�i, vi�c n�y ta kh�ng r�, ��i hi�p h�y ��n t�n th� th�n h�i th�m.", 0)
		return 0;
	end
	
	--ÿ��21��00 �C 22��00
	if nTimeHM < luckplanting_0801_GiveTime_S or nTimeHM > luckplanting_0801_GiveTime_E then
		Say(format("M�i ng�y v�o th�i �i�m %s - %s m�i ph�n ph�t m�m c�y.",%_FormatTimeHMToSring(luckplanting_0801_GiveTime_S), %_FormatTimeHMToSring(luckplanting_0801_GiveTime_E)),  0)
		return 0;
	end
	
	if GetLevel() < 80 or IsCharged() == 0 then
		Say("Xin l�i, ��ng c�p c�a b�n ch�a ��t 80 c�p v�/ho�c ch�a n�p th�.", 0)
		return 0;
	end
	
	
	if not luckplanting_0801_IsActDay() then
		Say(format("Ho�t ��ng <color=yellow>%s<color> v�n ch�a b�t ��u.",luckplanting_0801_szActName), 0)
		return 0;
	end
	if nDate ~= floor(nTSKV/256) then
		nTSKV = nDate * 256 --���㲢����ʱ��
	end
	if mod(nTSKV,256) >= TSKV_luckplanting_0801 then --����
		Say(format("B�n h�m nay �� nh�n l�y <color=yellow>%d<color> l�n, ng�y mai h�y quay l�i nh�.", TSKV_luckplanting_0801), 0)
		return 0;
	end
	local tbItem = {szName="C�y con", tbProp={6, 1, 1642, 1, 0, 0}, nExpiredTime = 20090105}
	tbAwardTemplet:GiveAwardByList(tbItem, "luckplanting")
	
	SetTask(TSK_luckplanting_0801, nTSKV+1);
end

function luckplanting_0801_IsActDay()
	local nDate		= tonumber(GetLocalDate("%y%m%d"))
	
	local nWeek		= tonumber(GetLocalDate("%w"))
	local tbWeek = {[5] = 1, [6] = 1, [0] = 1}
	return nDate >= luckplanting_0801_Time_S and nDate <= luckplanting_0801_Time_E and tbWeek[nWeek]
end

function luckplanting_0801_CheckMap()
	local tbCityMap = 
	{
		[174]	=1,
		[121]	=1,
		[153]	=1,
		[101]	=1,
		[99]	=1,
		[100]	=1,
		[20]	=1,
		[53]	=1,
	}
	return tbCityMap[SubWorldIdx2ID(SubWorld)]
end
         