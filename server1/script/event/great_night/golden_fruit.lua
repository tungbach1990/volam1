IncludeLib("ITEM")
Include("\\script\\tong\\tong_award_head.lua");-- by־ɽ�������Ŀ�깱�׶�
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")

--	local GREADSEED_SEEDID_TASKID = 2310;
--	local GREADSEED_TIME_TASKID = 2311;

local _Limit = function(nNpcIdx)
	
	if (0 == GetCamp()) then
		Msg2Player("B�n ch�a gia nh�p m�n ph�i, kh�ng th� h�i qu�.")
		return
	end

	if (0 == GetFightState() or GetLife(0) <= 0 or GetProtectTime() > 0 ) then
		Msg2Player("kh�ng th� h�i qu�.")
		return
	end
	
	local nPlayerLevel = GetLevel();
	local nGetSeedLevel = nil;
	if (nPlayerLevel < 90) then
		nGetSeedLevel = 1;
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nGetSeedLevel = 2;
	elseif (nPlayerLevel >= 120) then
		nGetSeedLevel = 3;
	end
	
	if (nGetSeedLevel ~= 3) then -- ������𲻶�,���ܽ���ʰȡ
		--���������Ҽ��𲻶�,����ʰȡ
		Msg2Player("Lo�i qu� n�y ng��i ch�i ph�i t� c�p 120 tr� l�n m�i c� th� h�i ���c ")
		return
	end;
	
	return nGetSeedLevel
end

local _GetFruit = function(nNpcIdx, dwNpcId)
	
	if nNpcIdx <= 0 or GetNpcId(nNpcIdx) ~= dwNpcId then
		return 0
	end
	local nGetSeedLevel = %_Limit(nNpcIdx)
	
	if nGetSeedLevel == nil then
		return 0
	end
	
	
	DelNpc(nNpcIdx)
	--Qu� ��i Ho�ng Kim - Modified by DinhHQ - 20130516
	local tbGoldenFruits = 
	{
		{szName = "Qu� Ho�ng Kim", tbProp = {6,1,907,1,0,0,0}, nExpiredTime = 10080, nRate = 80},
		{szName = "Qu� ��i Ho�ng Kim", tbProp = {6,1,30438,1,0,0,0}, nExpiredTime = 10080, nRate = 20}
	}
	tbAwardTemplet:Give(tbGoldenFruits, 1, {"��m Huy Ho�ng", "H�i qu� huy ho�ng"})
	
	--T�m ��ng t�nh n�ng ch�a ho�t ��ng - Modified by DinhHQ - 20110427
	--tbAwardTemplet:GiveAwardByList({tbProp = {6,1,2804,1,0,0,0}}, "��m Huy Ho�ng", 30);
	
	tongaward_goldenseed();-- by־ɽ�������Ŀ�깱�׶�
	--Msg2Player("��õ���һ���ƽ�֮����");
	AddGlobalNews(format("��i hi�p %s �� h�i ���c qu� Ho�ng Kim!!!",GetName()));
end


local _OnBreak = function()
	Msg2Player("Thu th�p ��t �o�n")
end

function main()
	local nNpcIdx = GetLastDiagNpc();
	local dwNpcId = GetNpcId(nNpcIdx)
	
	if %_Limit(nNpcIdx) == nil then
		return
	end
	--����������
	tbProgressBar:OpenByConfig(2, %_GetFruit, {nNpcIdx, dwNpcId}, %_OnBreak)
end;

