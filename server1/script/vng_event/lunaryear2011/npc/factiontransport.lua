Include("\\script\\vng_event\\LunarYear2011\\vng_ly2011_head.lua")
Include("\\script\\item\\ib\\shenxingfu.lua")

function main()
	if tbVNG_LY2011:isActive() == 0 then
		return
	end
	local tbMainDiaglog = 
		{
			"Thi�u L�m Ph�i/#visitMaster(2)",
			"Thi�n V��ng Bang/#visitMaster(1)",
			"���ng M�n/#visitMaster(3)",
			"Ng� ��c Gi�o/#visitMaster(4)",
			"Nga My Ph�i/#visitMaster(5)",
			"Th�y Y�n M�n/#visitMaster(6)",
			"C�i Bang/#visitMaster(8)",
			"Thi�n Nh�n Gi�o/#visitMaster(7)",
			"V� �ang Ph�i/#visitMaster(9)",
			"C�n L�n Ph�i/#visitMaster(10)",
			"��ng/onCancel"
		}
	Say("T�n 10 v�n l��ng ta s� ��a ng��i �i g�p tr��ng m�n c�c ph�i.", getn(tbMainDiaglog), tbMainDiaglog)
end
function visitMaster(nFactionID)
--Msg2Player(nFactionID)
	if (GetCash() < 100000) then
		Talk(1, "", "H�nh nh� ng��i kh�ng mang theo ti�n!")
		return
	end
--	local tbFactionList = 
--		{
--			["shaolin"] = 2,
--			["tianwang"] = 1,
--			["tangmen"] = 3,
--			["wudu"] = 4,
--			["emei"] = 5,
--			["cuiyan"] = 6,
--			["gaibang"] = 8,
--			["tianren"] = 7,
--			["wudang"] = 9,
--			["kunlun"] = 10,
--		}
--	local strFaction = GetFaction()
--	if tbFactionList[strFaction] ~= nill then
		if Pay(100000) == 1 then
			gopos_step3(9, nFactionID)
		end
--	else
--		Talk(1, "", "Ng��i v�n ch�a nh�p ph�i!")
--	end
end
function onCancel()
end