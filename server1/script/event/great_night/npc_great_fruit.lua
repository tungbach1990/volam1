IncludeLib("ITEM")
Include("\\script\\tong\\tong_award_head.lua");-- by־ɽ�������Ŀ�깱�׶�
Include("\\script\\item\\huihuangzhiguo_advance.lua")
Include("\\script\\activitysys\\g_activity.lua")

function main()
	
	if (0 == GetCamp()) then
		Msg2Player("B�n ch�a gia nh�p m�n ph�i, kh�ng th� h�i qu�.")
		return
	end
	if (0 == GetFightState() or GetLife(0) <= 0) then
		Msg2Player("kh�ng th� h�i qu�.")
		return
	end

	local GREADSEED_SEEDID_TASKID = 2310;
	local GREADSEED_TIME_TASKID = 2311;
	local nTime = GetCurrentTime();
	local nNpcIdx = GetLastDiagNpc();
	local nPlayerLevel = GetLevel();
	local nGetSeedLevel;
	
	if (GetNpcParam(nNpcIdx, 4) == 1) then
		return
	end
	
	if (nPlayerLevel < 90) then
		nGetSeedLevel = 1;
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nGetSeedLevel = 2;
	elseif (nPlayerLevel >= 120) then
		nGetSeedLevel = 3;
	end
	
	if (nGetSeedLevel ~= GetNpcParam(nNpcIdx, 1)) then -- ������𲻶�,���ܽ���ʰȡ
		--���������Ҽ��𲻶�,����ʰȡ
		if (1 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("Lo�i qu� n�y ng��i ch�i t� c�p 90 tr� xu�ng c� th� h�i!")
		elseif (2 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("Lo�i qu� n�y ng��i ch�i t� c�p 90 ��n c�p 119 m�i c� th� h�i.")
		else
			Msg2Player("Lo�i qu� n�y ng��i ch�i t� c�p 120 tr� l�n m�i c� th� h�i!")
		end
		return
	end;
	
	if (GetNpcParam(nNpcIdx, 2) == GetTask(GREADSEED_SEEDID_TASKID)) then
		if (nTime >= GetTask(GREADSEED_TIME_TASKID) + 10) then
			-- �¹�ʵ
			if (huihuangzhiguo_advance:GetGuoZiAvd() == 0) then
				-- �ɹ�ʵ
				local nItemIndex = AddItem(6,1,904 + nGetSeedLevel - 1,1,0,0,0);
				ITEM_SetExpiredTime(nItemIndex, 10080);
	--			local nowdate = tonumber(GetLocalDate("%y%m%d"))
	--			SetSpecItemParam(nItemIndex, 1, nowdate)
				SyncItem(nItemIndex)
				Msg2Player("B�n nh�n ���c m�t qu� Huy Ho�ng ");
			end
			SetTask(GREADSEED_TIME_TASKID, 0);
			SetTask(GREADSEED_SEEDID_TASKID, 0);
			DelNpc(nNpcIdx)
			SetNpcParam(nNpcIdx, 4, 1)
			tongaward_goldenseed();-- by־ɽ�������Ŀ�깱�׶�
			
			G_ACTIVITY:OnMessage("CaiJiHuiHuangZhiGuo");

		else	--ʱ��û��10����;
			Msg2Player(format("B�n �� ch�n qu� n�y, %d gi�y sau m�i c� th� h�i qu�!",
						(10 - (nTime - GetTask(GREADSEED_TIME_TASKID)))
							))
			return
		end;
	else
		Msg2Player("B�n ch�n qu� n�y, 10 gi�y sau qu� ch�n c� th� h�i ���c.")
		SetTask(GREADSEED_TIME_TASKID, nTime);
		SetTask(GREADSEED_SEEDID_TASKID, GetNpcParam(nNpcIdx, 2));
	end;
end;

