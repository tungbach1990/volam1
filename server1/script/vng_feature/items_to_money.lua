Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailog.lua")
Include("\\script\\lib\\log.lua")
tbVngItems2Money ={}
tbVngItems2Money.tbItemList = {
	["6,1,2125,1,0,0"] = 300000,
	["6,1,3059,1,0,0"] = 1250000,
	["6,1,2117,1,0,0"] = 2200000,
	["6,1,2402,1,0,0"] = 1100000,
	["6,1,2339,1,0,0"] = 1100000,
	["6,1,2813,1,0,0"] = 1100000,
	["6,1,2745,1,0,0"] = 1100000,
	["6,1,2517,1,0,0"] = 1100000,
	["6,1,2520,1,0,0"] = 1100000,
	["6,1,2401,1,0,0"] = 3300000,
	["6,1,2266,1,0,0"] = 1100000,
	["6,1,2267,1,0,0"] = 2200000,
	["6,1,2268,1,0,0"] = 3300000,
	["6,1,2256,1,0,0"] = 1100000,
	["6,1,2115,1,0,0"] = 2200000,
	["6,1,1448,1,0,0"] = 1100000,
	["6,1,30184,1,0,0"] = 110000000,
	["6,1,30189,1,0,0"] = 550000000,
}
tbVngItems2Money.nMaxCash = 2000000000

function tbVngItems2Money:main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDialog = DailogClass:new(szNpcName)
	tbDialog.szTitleMsg = "<npc>Ng��i c� th� mang v�t ph�m kh�ng d�ng t�i g�p ta �� ��i l�y ng�n l��ng. L�u �, ta ch� nh�n 1 s� v�t ph�m nh�t ��nh v� kh�ng nh�n c�c v�t ph�m �ang � tr�ng th�i kh�a b�o hi�m"
	tbDialog:AddOptEntry("Ta mu�n ��i", tbVngItems2Money.ExchangeUI, {tbVngItems2Money})
	tbDialog:Show()
end

function tbVngItems2Money:ExchangeUI()
	g_GiveItemUI("��i ng�n l��ng", "", {self.GiveUIOk, {self}}, nil, 0)
end

function tbVngItems2Money:GetItemKey(nItemIdx)
	local nP1, nP2, nP3, nP4, nP5, nP6 = GetItemProp(nItemIdx)
	return format("%d,%d,%d,%d,%d,%d", nP1, nP2, nP3, nP4, nP5, nP6)
end

function tbVngItems2Money:GiveUIOk(nCount)
	if nCount < 0 then
		return
	end
	local nItemIdx = 0
	local nTotalMoney = 0
	local tbItemIndexes = {}
	local strLog = ""
	for i = 1, nCount do
		nItemIdx = GetGiveItemUnit(i)		
		local strItemKey = self:GetItemKey(nItemIdx)		
		if not self.tbItemList[strItemKey] then 
			Talk(1, "", format("V�t ph�m <color=red>%s<color> m� ng��i b� v�o ta ��y kh�ng c�n, h�y gi� l�i m� d�ng", GetItemName(nItemIdx)))
			return
		else	
			tinsert(tbItemIndexes, nItemIdx)	
			nTotalMoney = nTotalMoney + self.tbItemList[strItemKey]*GetItemStackCount(nItemIdx)
			strLog = strLog..GetItemStackCount(nItemIdx).." "..GetItemName(nItemIdx)..", "
		end		
	end
	if nTotalMoney <= 0 then
		Talk(1, "", "Nh�ng th� ng��i ��a to�n l� r�c r��i, t��ng ta m� sao?")
		return
	end
	if nTotalMoney + GetCash() > self.nMaxCash then
		Talk(1, "", "S� ti�n v��t qu� gi�i h�n, ng�n l��ng thu ���c c�ng v�i s� l��ng trong h�nh trang kh�ng th� v��t qu� 200,000 v�n")
		return
	end
	for i = 1, getn(tbItemIndexes) do
		local nTempIdx = tbItemIndexes[i]
		if IsMyItem(nTempIdx) ~= 1 or RemoveItemByIndex(nTempIdx) ~= 1 then
			return
		end		
	end
	Earn(nTotalMoney)
	tbLog:PlayerActionLog("DoiVatPhamLayNganLuong", strLog, nTotalMoney)
end

local pEventType = EventSys:GetType("AddNpcOption")
nId = pEventType:Reg("Th�n B� Th��ng Nh�n", "��i v�t ph�m l�y ng�n l��ng", tbVngItems2Money.main,{tbVngItems2Money})