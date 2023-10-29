Include("\\script\\vng_event\\LunarYear2011\\vng_ly2011_head.lua")
Include("\\script\\lib\\awardtemplet.lua")

if not tbMasterGift then
	tbMasterGift = {}
end	
tbMasterGift.TSK_DAY_LIMIT = 2760

function tbMasterGift:addDialog(tbDialog, strFaction)
	if tbVNG_LY2011:isActive() ~= 1 then
		return
	end
	tbDialog:AddOptEntry("T�ng b�nh ng�y xu�n", tbMasterGift.getGift, {tbMasterGift, strFaction})
end

function tbMasterGift:getGift(strFaction)
	if tbVNG_LY2011:checkCondition() ~= 1 then
		Talk(1, "", "B�n kh�ng �� �i�u ki�n s� d�ng v�t ph�m! Y�u c�u c�p �� tr�n 50 v� ��  n�p th�.")
		return
	end
--	local tbFactionList = 
--		{
--			["shaolin"] = "Thi�u L�m",
--			["tianwang"] = "Thi�n V��ng Bang",
--			["tangmen"] = "���ng M�n",
--			["wudu"] = "Ng� ��c Gi�o",
--			["emei"] = "Nga My",
--			["cuiyan"] = "Th�y Y�n M�n",
--			["gaibang"] = "C�i Bang",
--			["tianren"] = "Thi�n Nh�n Gi�o",
--			["wudang"] = "V� �ang",
--			["kunlun"] = "C�n L�n",
--		}
--	if GetFaction() ~= strFaction then
--		Talk(1, "", format("Ng��i kh�ng ph�i l� �� t� c�a <color=red>%s<color>, m�n qu� n�y ta kh�ng d�m nh�n. H�y �em v� cho s� ph� c�a ng��i �i.", tbFactionList[strFaction]))
--		return
--	end
	if CalcItemCount(-1, 6, 1, 30089, -1) < 1 then
		Talk(1, "", "Con n�i t�ng qu� cho ta, sao ta kh�ng th�y?")
		return
	end
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"))
	if GetTask(self.TSK_DAY_LIMIT) >= nCurDay then
		Talk(1, "", "Con th�t c� l�ng nh�ng h�m nay con ��  t�ng qu� cho ta r�i, h�y gi� l�i m� d�ng.")
		return
	end	
	if ConsumeEquiproomItem(1, 6, 1, 30089, 1) == 1 then
		SetTask(self.TSK_DAY_LIMIT, nCurDay)
		local tbExp = {nExp=10000000}
		tbAwardTemplet:GiveAwardByList(tbExp, "[VNG][Lunar Year 2011][T�ng b�nh cho ch��ng m�n]")
		Talk(2, "", "B�nh th�t th�m ngon. C�m �n con v� ch�c con n�m m�i g�p nhi�u �i�u t�t l�nh.", "�a t� s� ph�.")
	end
end