Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tagnewplayer\\func_check.lua");
Include("\\script\\tagnewplayer\\func_itembonusweekly.lua");
Include("\\script\\tagnewplayer\\func_itemtim.lua");
Include("\\script\\tagnewplayer\\func_itemanbang.lua");
Include("\\script\\tagnewplayer\\bonusEXP.lua");
Include("\\script\\tagnewplayer\\func_bonusthanhtich.lua");
Include("\\script\\tagnewplayer\\func_quest180.lua");



function NWP_main()
do return end
	if (IsCode()~=1) then
		Talk(1, "", "��i hi�p kh�ng thu�c ��i t��ng tham gia An Bang Ho�ng Kim L�nh b�i ! .");
		return
	end
	local tbOpp = {}
	--local nDay = tonumber(GetLocalDate("%Y%m%d"))
	local str = "<#> ��i hi�p xin h�y ch�n ph�n th��ng";
	if (CheckObject() == 1) then
		if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel120) == 1) then
			tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng th�ng ��ng c�p 120 sau khi �� tr�ng sinh/GetLevel120"); --�� tr�ng sinh l�n 1, th�ng c�p 120
		end
	end
	if (CheckObject() == 2) then
		local IsQ, IsFQ = GetCurQuest()
		if(IsQ == 0) then
			tinsert(tbOpp,"Ta mu�n nh�n nhi�m v� li�n ho�n th� nh�t/AcceptFirstQuest");
		end
		
		if (IsQ == 1) then
			if (IsFQ == 0) then
				tinsert(tbOpp,"Ta mu�n xem nhi�m v� �� nh�n/ReviewCurQuest");
				tinsert(tbOpp,"Ta �� ho�n th�nh nhi�m v� li�n ho�n th� nh�t/FinishFirstQuest");
			elseif (IsFQ == 1) then
				tinsert(tbOpp,"Ta mu�n nh�n nhi�m v� li�n ho�n th� hai/GetSecondQuest");
			end		
		end
		
		if (IsQ == 2) then
			if (IsFQ == 1) then
				tinsert(tbOpp,"Ta mu�n xem nhi�m v� �� nh�n/ReviewCurQuest");
				tinsert(tbOpp,"Ta �� ho�n th�nh nhi�m v� li�n ho�n th� hai/FinishSecondQuest");
			elseif (IsFQ == 2) then
				tinsert(tbOpp,"Ta mu�n nh�n nhi�m v� li�n ho�n th� ba/GetThirdQuest");
			end	
		end
		
		if (IsQ == 3) then
			if (IsFQ == 2) then
				tinsert(tbOpp,"Ta mu�n xem nhi�m v� �� nh�n/ReviewCurQuest");
				tinsert(tbOpp,"Ta �� ho�n th�nh nhi�m v� li�n ho�n th� ba/FinishThirdQuest");
			end	
		end
		
	end
	if (CheckObject() == 3 and CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetLevel165) == 1) then
		tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng th�ng ��ng c�p 165/GetLevel165");--ch�a tr�ng sing, thang l�n c�p 165
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusTim) == 1) then
			tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng trang b� T�m/GetItemTim");
	end
	if (CheckGetItem(NWP_EXTPOINT, NWP_E5_BIT_GetItemBonusAnBang) == 1) then
			tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng trang b� An Bang/GetItemAnBang");
	end
	tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng th�nh t�ch/GetBonusThanhTich_main");
	tinsert(tbOpp,"Ta mu�n nh�n ph�n th��ng h�ng ng�y/BonusEveryDay");
	tinsert(tbOpp, "<#>Tho�t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end
function OnCancel()
end 

