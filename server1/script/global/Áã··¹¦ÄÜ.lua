Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\composelistclass.lua")
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\npc.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\composeex.lua")

function OnExit()

end;

function main()
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	
	
	tbDailog.szTitleMsg = "<#><npc>� ��y to�n k� tr�n d� b�o, kh�ch quan c� l�a ch�n tho�i m�i �i!"
	
	--Change request 04/06/2011, ��ng ch� t�o trang b� b�ch kim - Modified by DinhHQ - 20110605
--	local w,x,y = GetWorldPos()
--	if w == 176 then
--		tbDailog:AddOptEntry("Mua m�nh thi�n th�ch.", Sale, {171}); 
--	end
	
	--tbDailog:AddOptEntry("C�a h�ng H�nh Hi�p L�nh", Sale, {183, 22, 100, "XingXiaLingShopCallback(%d,%d)", "\\script\\global\\�㷷����.lua"})	
	
	--tbDailog:AddOptEntry("��i l�y B�o Th�ch", WantBuyBaoshi)
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
--	tbDailog:AddOptEntry("�� ta xem n�o (c�a ti�m �� c�)", OpenSecondStore); 
	if tbTriumphDrum:CheckCondition_BuyDrum() == 1 then
		--tbDailog:AddOptEntry("Mua Tr�ng Kh�i Ho�n",  tbTriumphDrum.NpcTalk,{tbTriumphDrum});  	
	end

	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	--tbDailog:AddOptEntry("R�i kh�i", OnExit, {}); 	
	tbDailog:Show()
end

local tbNeedBind = 
{
	["6,1,2369"] = 1,
	["6,1,2353"] = 1,
	["6,1,2352"] = 1,
	["6,1,2351"] = 1,
	["6,1,2565"] = 1,
}

function XingXiaLingShopCallback(nItemIdx, nPrice)
	local szGDP = format("%d,%d,%d", GetItemProp(nItemIdx))
	if %tbNeedBind[szGDP] == 1 then
		SetItemBindState(nItemIdx, -2)
	end
	return 1
end

function OpenSecondStore()
	CreateStores();
	AddShop2Stores(178, "C�a ti�m �� c�", 1, 100, "", 1);
	OpenStores();

end


tbEquip2Item = tbActivityCompose:new()

function tbEquip2Item:CheckItem(tbItem ,nItemIndex)
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	
	local tbRecItem = self:MakeItem(nItemIndex)
	local nExpiredTime = ITEM_GetExpiredTime(nItemIndex)
	local nLeftUsageTime = ITEM_GetLeftUsageTime(nItemIndex)
	if nExpiredTime ~= 0 or nLeftUsageTime ~= 4294967295 then
		return 
	end
	
	for k,v in tbItem do
		if k ~= "szName" and type(v) ~= "table" and v ~= -1 and tbRecItem[k] and v~= tbRecItem[k] then
			return
		elseif  k == "tbProp" and type(v) == "table" then
			local tbProp = tbRecItem[k]
			for k1,v1 in v do
				if type(v1) ~= "table" then
					if  k1 ~= "n" and v1 ~= -1 and tbProp[k1] and v1~= tbProp[k1] then
						return 
					end
				else
					if  k1 ~= "n" and v1 ~= -1 and tbProp[k1] and ( v1[1] > tbProp[k1] or tbProp[k1] > v1[2] )  then
						return 
					end
				end
			end
		end
	end		
	for key, value in tbItem do 
		if strfind(key, "Limit") and  type(value) == "function" then
			if value(tbItem, nItemIndex) ~= 1 then
				return
			end
		end
	end			
	return 1
end

function WantBuyBaoshi()
	local nPrice = 400
	local szTitle = format("Ng��i mu�n ��i lo�i B�o Th�ch n�o",tostring(nPrice))
	local tbOpt = {}
	local tbFormulaList = 
	{
		[1] = 
		{
			tbMaterial = 
			{
				{szName = "Trang b� Thanh C�u", tbProp = {0, {905,1134}}, nQuality = 1 },
			},
			tbProduct = {szName="Thanh C�u Th�ch", tbProp={6, 1, 2710, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},
		[2] = 
		{
			tbMaterial = 
			{
				{szName = "Trang b� V�n L�c", tbProp = {0, {1135,1364}}, nQuality = 1 },
			},
			tbProduct = {szName="V�n L�c Th�ch", tbProp={6, 1, 2711, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},
		[3] = 
		{
			tbMaterial = 
			{
				{szName = "Trang b� Th��ng Lang", tbProp = {0, {1365,1594}}, nQuality = 1 },
			},
			tbProduct = {szName="Th��ng Lang Th�ch", tbProp={6, 1, 2712, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},
		[4] = 
		{
			tbMaterial = 
			{
				{szName = "Trang b� Huy�n Vi�n", tbProp = {0, {1595,1824}}, nQuality = 1 },
			},
			tbProduct = {szName="Huy�n Vi�n Th�ch", tbProp={6, 1, 2713, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},
		[5] = 
		{
			tbMaterial = 
			{
				{szName = "Trang b� T� M�ng", tbProp = {0, {1825,2054}}, nQuality = 1 },
			},
			tbProduct = {szName="T� M�ng Th�ch", tbProp={6, 1, 3000, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},	
	}
		
	local tbOpt = {}
	local pEventType = EventSys:GetType("AddNpcOption")
	for i=1, getn(tbFormulaList) do
		local p = tbEquip2Item:new(tbFormulaList[i], "Equip2Stone", INVENTORY_ROOM.room_giveitem)
		local szOpt = format("��i %s", tbFormulaList[i].tbProduct.szName)
		tinsert(tbOpt, {szOpt, p.ComposeGiveUI, {p}})
	end
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szTitle, tbOpt);
end