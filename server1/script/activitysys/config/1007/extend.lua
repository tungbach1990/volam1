------------------------------------------------------------------------------------------------
--Author: NgaVN
--Des: Event Ph� N� Vi�t Nam
--Date: 2012-10-10
------------------------------------------------------------------------------------------------
Include("\\script\\activitysys\\config\\1007\\head.lua")
Include("\\script\\activitysys\\config\\1007\\awardlist.lua");
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\1007\\variables.lua")

function pActivity:Use_Box_Limit(nTask)
	if %tbVNG_BitTask_Lib:isMaxBitTaskValue(nTask) == 1 then
		Talk(1, "", "S� d�ng v�t ph�m �� ��t ��n gi�i h�n, kh�ng th� s� d�ng th�m")
		return nil
	end
	return 1
end

function pActivity:Use_Big_Box()
	local nTaskVal = %tbVNG_BitTask_Lib:getBitTask(%tbBig_Box_Use_Limit);
	if %tbLogUse_Big_Box[nTaskVal]  then --ph�n th��ng ��t m�c l�n
		tbAwardTemplet:Give(%tbAward_A["AwardSpecial"], 1, {"EVENT_PHUNU", format("AwardSpecialUseBigBox",nTaskVal)})	
		if %tbUse_Big_Box_AdditionalAward[nTaskVal] then --Ph�n th��ng d�nh cho c� server old v� new
			local tbTempAward = %tbUse_Big_Box_AdditionalAward[nTaskVal]
			tbAwardTemplet:Give(tbTempAward, 1, {"EVENT_PHUNU", format("SuDung%dLanHopBanhLon", nTaskVal)})
			--Msg2Player(format("<color=green>Ch�c m�ng b�n s� d�ng v�t ph�m %s %d l�n, nh�n ���c %s<color>", "H�p B�nh L�n", nTaskVal, tbTempAward.szName))
		end
	elseif mod(nTaskVal,30) == 0 then --Ph�n th��ng ��t m�c 30..
		tbAwardTemplet:Give(%tbAward_A["AwardMocNho"], 1, {"EVENT_PHUNU", "AwardMocNhoUseBigBox"})	
	else--Ph�n th��ng th��ng
		tbAwardTemplet:Give(%tbAward_A["AwardNomal"], 1, {"EVENT_PHUNU", "AwardNomalUseBigBox"})	
	end
end	
