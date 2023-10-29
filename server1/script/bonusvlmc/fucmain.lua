Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\bonusvlmc\\func_check.lua");
Include("\\script\\bonusvlmc\\func_quest999.lua");
Include("\\script\\bonusvlmc\\vlmc_main.lua");

function VLMC_main()
	local tbOpp = {}
	local nCurrDate = tonumber(GetLocalDate("%y%m%d"))
	
	ResetTaskGiveQuest()
	
	local str1 = "<#> M�t h�t c�t kh�ng th� l�m n�n sa m�c. Tuy ta l� ng��i c� v� c�ng c�i th� trong thi�n h�, nh�ng �� th�ng nh�t v� l�m th� c�n c� s� ��ng g�p c�ng s�c c�a c�c anh h�ng h�o ki�t !";
	local str2 = "<#> ��i s�ng ch� l� m�t kho�nh kh�c nh�ng v�i kho�nh kh�c �y ng��i ta c� th� l�m n�n nh�ng vi�c v�nh c�u !";
	
--	if (GetTask(VLMC_Task_IsQuest) == 0) then
--		tinsert(tbOpp,"Ta ��n nh�n nhi�m v� [C�u kh�n ph� nguy]/AcceptQuest");
--	end
--	
--	if (GetTask(VLMC_Task_IsQuest) == 1 and GetTask(VLMC_Task_IsFinishQuest) ~= 1) then
--		tinsert(tbOpp,"Ta �� ho�n th�nh nhi�m v� [C�u kh�n ph� nguy]/FinishQuest");
--		tinsert(tbOpp,"Xem chi ti�t nhi�m v�/ReviewQuest");
--	end
	
	if (GetGlbValue(GlbVar1)== 1 and GetTask(TSK_Get2ExpTK)~= nCurrDate ) then
		tinsert(tbOpp,"Nh�n ph�n th��ng nh�n ��i �i�m kinh nghi�m chi�n tr��ng T�ng Kim/Get2xExpTK");
	end	
	
	if (GetGlbValue(GlbVar2)== 1 and GetTask(TSK_GetBonusEXP)== 0 ) then
		tinsert(tbOpp,"Nh�n ph�n th��ng nh�n ��i �i�m kinh nghi�m khi ��nh qu�i/GetEXPBonus");
	end
	
	if (GetGlbValue(GlbVar1) ~= 1) then
		if (Is_VLMC() == 1 and TimeActive() == 1 and GetTask(TSK_Active_TK) == 0 ) then
			tinsert(tbOpp,"Bang ph�t nh�n ��i �i�m kinh nghi�m trong T�ng Kim/AcceptEXPBonusTK");
		end
	end
	
	if (GetGlbValue(GlbVar2) ~= 1) then
		if (Is_VLMC() == 1 and TimeActive() == 1 and GetTask(TSK_Active_x2EXP) == 0 ) then
			tinsert(tbOpp,"Bang ph�t nh�n ��i �i�m kinh nghi�m ��nh qu�i/AcceptActiveX2EXP");
		end
	end
	
	tinsert(tbOpp, "<#>Tho�t/OnCancel")
	if ( Is_VLMC() == 0 ) then
		Say( str1, getn( tbOpp ), tbOpp )
		return
	end;
	Say( str2, getn( tbOpp ), tbOpp )	
end

function OnCancel()
end 

