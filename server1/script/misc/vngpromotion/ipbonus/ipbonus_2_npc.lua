Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua")

function IpBonus()
	local nPromotionSay = {	}
	
	tinsert(nPromotionSay,"Ta mu�n xem th�i gian tr�n m�ng/ShowTimeNow")
	tinsert(nPromotionSay,"Nh�n ph�n th��ng Lam B�o H�p/GetBonusGreenItem")	
	tinsert(nPromotionSay,"Nh�n ph�n th��ng Ho�ng B�o H�p/GetBonusYellowItem")	
	--tinsert(nPromotionSay,"Nh�n ph�n th��ng Nh�n ��i kinh nghi�m/GetBonusExp")	
	tinsert(nPromotionSay,"Nh�n ph�n th��ng Nh�n 1.5 �i�m t�ch l�y T�ng Kim/GetTongKimBonus")	
	tinsert(nPromotionSay,"T�i h� ch� gh� qua th�i!/OnCancel")
	
	Say("Trong ng�y, c� 4 gi� ��i hi�p tr�n m�ng � m�y c� c�i ��t CSM s� nh�n ���c <color=red>1 Lam B�o H�p<color>. Tr��ng h�p ��i hi�p r�i m�ng, �y th�c tr�n m�ng ho�c �y th�c r�i m�ng s� kh�ng ���c t�nh. Ngo�i ra, ��i hi�p c� th� nh�n hi�u qu� nh�n ��i kinh nghi�m trong 1 gi�.",getn(nPromotionSay),nPromotionSay)
end;

function ShowTimeNow()
	if CheckIPBonus() == 0 then
		Say("Hi�n t�i ��i hi�p ch�a th� xem tin t�c, h�y th� l�i sau!",0)
		return
	end
	IpBonus_Close()	
	local nHour, nMin, nSec = ShowTime()
	local nHour2, nMin2, nSec2 = ShowTimeYellowBox()
	local strMsg = format("Th�i gian tr�n m�ng � m�y c�i ��t CSM c� th� quy ��i Lam B�o H�p l�: %d gi� %d ph�t %d gi�y.<enter>T�ng th�i gian tr�n m�ng: %d gi� %d ph�t %d gi�y",nHour, nMin, nSec,nHour2, nMin2, nSec2)
	IpBonus_Start()
	Talk(1,"IpBonus",strMsg)
end

function GetBonusGreenItem()
	if CheckIPBonus() == 0 then
		Say("Hi�n t�i ��i hi�p ch�a th� nh�n th��ng, h�y th� l�i sau!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	IpResetTask()	
		
	if GetTask(TASKID_GET_TIMES) >= 6 then
		Say("H�m nay ��i hi�p �� nh�n th��ng 6 l�n r�i. Ng�y mai quay l�i nh�!",0)
		return
	end	
	
	local nHour, nMin, nSec = ShowTime()
	if nHour < 4 then
		Say("��i hi�p ch�a �� 4 gi� tr�n m�ng!",0)
		return
	end	
	
	if CalcFreeItemCellCount() < 2 then
		Say("Kh�ng �� 2 � tr�ng trong h�nh trang c�a ��i hi�p!",0)
		return
	end
	
	if IpBonus_Minus(4*60*60) == 1 then	
		SetTask(TASKID_GET_TIMES,GetTask(TASKID_GET_TIMES) + 1);
--		local  nExpireTime = GetNextExpireTime(GetLocalDate("%Y%m%d"),2)
		local nExpireTime = 7*24*60
		local nItemIndex = AddItem(6,1,30000,1,1,0);
--		SetSpecItemParam(nItemIndex, 1, nExpireTime);
		ITEM_SetExpiredTime(nItemIndex, nExpireTime);
		SyncItem(nItemIndex);	
		SetItemBindState(nItemIndex, -2);
		Say("Ch�c m�ng ��i hi�p nh�n ���c 1 Lam B�o H�p.");
		Msg2Player("B�n nh�n ���c 1 Lam B�o H�p.");	
		WriteLog(format("[IPBonus]\t%s\t%s\t%s","nh�n Lam B�o H�p",GetAccount(),GetName()))		
	end
end;

function GetBonusYellowItem()
	if CheckIPBonus() == 0 then
		Say("Hi�n t�i ��i hi�p ch�a th� nh�n th��ng, h�y th� l�i sau!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	IpResetTask()	
	if tbVNG_BitTask_Lib:getBitTask(tbBITTSK_CHECK_GET_YELLOW_BOX) ~= 0 then
		Talk(1, "", "��i hi�p �� nh�n ph�n th��ng n�y r�i.")
		return
	end
	if IsCharged() == 0 then
		Talk(1, "", "Ph�i qua n�p th� m�i c� th� nh�n th��ng.")
		return
	end
	
	if GetLevel() < 130 and  ST_IsTransLife() < 1 then
		Talk(1, "", "Ch�a tr�ng sinh ph�i c�p 130 m�i c� th� nh�n th��ng.")
		return
	end
	
	if CalcFreeItemCellCount() < 2 then
		Say("Kh�ng �� 2 � tr�ng trong h�nh trang c�a ��i hi�p!",0)
		return
	end
	
	if IpBonus_Minus_Yellow_Box(50*60*60) == 1 then
		tbVNG_BitTask_Lib:setBitTask(tbBITTSK_CHECK_GET_YELLOW_BOX, 1)
		if tbVNG_BitTask_Lib:getBitTask(tbBITTSK_CHECK_GET_YELLOW_BOX) ~= 1 then		
			return
		end
--		local  nExpireTime = GetNextExpireTime(GetLocalDate("%Y%m%d"),2)
		local nExpireTime = 7*24*60
		local nItemIndex = AddItem(6,1,30001,1,1,0);
--		SetSpecItemParam(nItemIndex, 1, nExpireTime);
		ITEM_SetExpiredTime(nItemIndex, nExpireTime);
		SyncItem(nItemIndex);
		SetItemBindState(nItemIndex, -2);
		Say("Ch�c m�ng ��i hi�p nh�n ���c 1 Ho�ng B�o H�p.");
		Msg2Player("B�n nh�n ���c 1 Ho�ng B�o H�p.");	
		WriteLog(format("[IPBonus]\t%s\t%s\t%s","nh�n Ho�ng B�o H�p",GetAccount(),GetName()))
	else
		Say("��i hi�p ch�a �� �i�u ki�n nh�n ph�n th��ng n�y!",0)
		return
	end
end;

function GetBonusExp()
	if CheckIPBonus() == 0 then
		Say("Hi�n t�i ��i hi�p ch�a th� nh�n th��ng, h�y th� l�i sau!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	
	local nDay = tonumber(date("%w"))
	if nDay ~= 0 and nDay ~= 5 and nDay ~= 6  then
		Say("Ph�n th��ng n�y ch� nh�n ���c v�o c�c ng�y th� s�u, th� b�y v� ch� nh�t h�ng tu�n!" ,1,"Th�t ng�i qu�!/OnCancel")
		return
	end

	if GetSkillState(451) > 0 then
		Say("Ch�ng ph�i ��i hi�p �� nh�n th��ng r�i sao?" ,1,"Th�t ng�i qu�!/OnCancel")
		return
	end	
		
	AddSkillState(451, 20, 1, 18*60*60);
	Say("Ch�c m�ng ��i hi�p nh�n ���c hi�u qu� Nh�n ��i kinh nghi�m!");
	Msg2Player("B�n nh�n ���c hi�u qu� nh�n ��i kinh nghi�m trong v�ng 60 ph�t.");
	WriteLog(format("[IPBonus]\t%s\t%s\t%s","nh�n ��i kinh nghi�m",GetAccount(),GetName()))
end

function GetTongKimBonus()
	if CheckIPBonus() == 0 then
		Say("Hi�n t�i ��i hi�p ch�a th� nh�n th��ng, h�y th� l�i sau!",0)
		return
	end	
	
	IpBonus_Close()	
	IpBonus_Start()
	
	local nDay = tonumber(date("%w"))
	
--	if nDay ~= 0 and nDay ~= 5 and nDay ~= 6  then
--		Say("Ph�n th��ng n�y ch� nh�n ���c v�o c�c ng�y th� s�u, th� b�y v� ch� nh�t h�ng tu�n!" ,1,"Th�t ng�i qu�!/OnCancel")
--		return
--	end
	
	if (PlayerFunLib:CheckTaskDaily(TASKID_DAILY_X2TONGKIM,3,"H�m nay ��i hi�p �� nh�n th��ng 3 l�n r�i. Ng�y mai quay l�i nh�!","<") ~= 1) then
			return
	end
	
	if (GetTask(TASKID_COUNT_X2TONGKIM) ~= 0) then
		Talk(1,"","Ch�ng ph�i ��i hi�p �� nh�n r�i sao, h�y mau �i tham gia chi�n tr��ng T�ng Kim!!!!")
		return
	end
	
	PlayerFunLib:AddTaskDaily(TASKID_DAILY_X2TONGKIM,1)
	SetTask(TASKID_COUNT_X2TONGKIM,1)
	Say("Ch�c m�ng ��i hi�p nh�n ���c hi�u qu� Nh�n 1.5 �i�m t�ch l�y T�ng Kim!");
	Msg2Player("B�n nh�n ���c hi�u qu� nh�n ��i �i�m t�ch l�y T�ng Kim.");
	WriteLog(format("[IPBonus]\t%s\t%s\t%s","nh�n ��i �i�m t�ch l�y T�ng Kim",GetAccount(),GetName()))
	
end


function OnCancel()
end;
