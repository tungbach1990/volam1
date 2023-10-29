Include("\\script\\vng_lib\\bittask_lib.lua")

GiveSupportItem = {}

GiveSupportItem.TASK_COUNT_ITEM_1 = 2764

GiveSupportItem.TASK_COUNT_ITEM_2 = 2765

GiveSupportItem.TASK_COUNT_ITEM_3 = 2766

GiveSupportItem.TASK_COUNT_ITEM_4 = 2767

GiveSupportItem.TASK_COUNT_ITEM_5 = 2768

GiveSupportItem.TASK_COUNT_ITEM_6 = 2769

GiveSupportItem.TASK_COUNT_ITEM_7 = 2729

GiveSupportItem.tbResetTask = 
	{
		nTaskID = 2754,
		nStartBit = 30,
		nBitCount = 1,
		nMaxValue = 1
	}

GiveSupportItem.START_DATE = 201304150000
GiveSupportItem.END_DATE = 201304212400

GiveSupportItem.tbListItem = 
{
	--{szName="", nG=, nD=, nP=, nStack=, nType=}
--	{szName="C�n Kh�n T�o H�a �an (��i) ", nG=6, nD=1, nP=215, nType=1},
--	{szName="C�n Kh�n T�o H�a �an (trung) ", nG=6, nD=1, nP=216, nType=1},
--	{szName="C�n Kh�n T�o H�a �an (ti�u) ", nG=6, nD=1, nP=217, nType=1},
--	{szName="T�ng Kim Phi T�c ho�n", nG=6, nD=1, nP=190, nType=1},
--	{szName="Chi�n c� ", nG=6, nD=1, nP=156, nType=2},
--	{szName="Kh�ng ��n Chi Gi�c ", nG=6, nD=1, nP=214, nType=2},
--	{szName="L�nh b�i", nG=6, nD=1, nP=157, nType=2},
--	{szName="Chuy�n d�ng cho T�ng Kim ��c ph�ng ho�n", nG=6, nD=1, nP=195, nType=3},
--	{szName="Chuy�n d�ng cho T�ng Kim L�i ph�ng ho�n", nG=6, nD=1, nP=193, nType=3},
--	{szName="Chuy�n d�ng cho T�ng Kim H�a ph�ng ho�n", nG=6, nD=1, nP=194, nType=3},
--	{szName="T�ng Kim B�ng Ph�ng ho�n", nG=6, nD=1, nP=192, nType=3},
--	{szName="T�ng Kim Ph� Ph�ng ho�n", nG=6, nD=1, nP=191, nType=3},
--	{szName="T�ng Kim Tr��ng M�nh ho�n", nG=6, nD=1, nP=186, nType=3},
--	{szName="T�ng Kim Cao Trung ho�n", nG=6, nD=1, nP=189, nType=3},
--	{szName="T�ng Kim Cao Thi�m ho�n", nG=6, nD=1, nP=188, nType=3},
--	{szName="T�ng Kim Gia B�o ho�n", nG=6, nD=1, nP=187, nType=3},
--	{szName="T�ng Kim Tr��ng M�nh ho�n", nG=6, nD=1, nP=186, nType=3},
--	{szName="T�ng Kim N�i L�i ho�n", nG=6, nD=1, nP=185, nType=3},
--	{szName="T�ng Kim N�i B�ng ho�n", nG=6, nD=1, nP=183, nType=3},
--	{szName="T�ng Kim N�i ��c ho�n", nG=6, nD=1, nP=182, nType=3},
--	{szName="T�ng Kim N�i H�a ho�n", nG=6, nD=1, nP=184, nType=3},
--	{szName="T�ng Kim N�i Ph� ho�n", nG=6, nD=1, nP=181, nType=3},
--	{szName="T�ng Kim Ngo�i B�ng ho�n", nG=6, nD=1, nP=180, nType=3},
--	{szName="T�ng Kim Ngo�i ��c ho�n", nG=6, nD=1, nP=179, nType=3},
--	{szName="T�ng Kim Ngo�i Ph� ho�n", nG=6, nD=1, nP=178, nType=3},

	{szName="C�n Kh�n T�o H�a �an (��i) ", nG=6, nD=1, nP=215, nType=1},
	{szName="C�n Kh�n T�o H�a �an (trung) ", nG=6, nD=1, nP=216, nType=2},
	{szName="C�n Kh�n T�o H�a �an (ti�u) ", nG=6, nD=1, nP=217, nType=3},
	{szName="T�ng Kim Phi T�c ho�n", nG=6, nD=1, nP=190, nType=4},
	{szName="Chi�n c� ", nG=6, nD=1, nP=156, nType=5},
	{szName="Kh�ng ��n Chi Gi�c ", nG=6, nD=1, nP=214, nType=5},
	{szName="L�nh b�i", nG=6, nD=1, nP=157, nType=5},
	{szName="Chuy�n d�ng cho T�ng Kim ��c ph�ng ho�n", nG=6, nD=1, nP=195, nType=6},
	{szName="Chuy�n d�ng cho T�ng Kim L�i ph�ng ho�n", nG=6, nD=1, nP=193, nType=6},
	{szName="Chuy�n d�ng cho T�ng Kim H�a ph�ng ho�n", nG=6, nD=1, nP=194, nType=6},
	{szName="T�ng Kim B�ng Ph�ng ho�n", nG=6, nD=1, nP=192, nType=6},
	{szName="T�ng Kim Ph� Ph�ng ho�n", nG=6, nD=1, nP=191, nType=6},
	{szName="T�ng Kim Tr��ng M�nh ho�n", nG=6, nD=1, nP=186, nType=6},
	{szName="T�ng Kim Cao Trung ho�n", nG=6, nD=1, nP=189, nType=6},
	{szName="T�ng Kim Cao Thi�m ho�n", nG=6, nD=1, nP=188, nType=6},
	{szName="T�ng Kim Gia B�o ho�n", nG=6, nD=1, nP=187, nType=6},
	{szName="T�ng Kim Tr��ng M�nh ho�n", nG=6, nD=1, nP=186, nType=6},
	{szName="T�ng Kim N�i L�i ho�n", nG=6, nD=1, nP=185, nType=6},
	{szName="T�ng Kim N�i B�ng ho�n", nG=6, nD=1, nP=183, nType=6},
	{szName="T�ng Kim N�i ��c ho�n", nG=6, nD=1, nP=182, nType=6},
	{szName="T�ng Kim N�i H�a ho�n", nG=6, nD=1, nP=184, nType=6},
	{szName="T�ng Kim N�i Ph� ho�n", nG=6, nD=1, nP=181, nType=6},
	{szName="T�ng Kim Ngo�i B�ng ho�n", nG=6, nD=1, nP=180, nType=6},
	{szName="T�ng Kim Ngo�i ��c ho�n", nG=6, nD=1, nP=179, nType=6},
	{szName="T�ng Kim Ngo�i Ph� ho�n", nG=6, nD=1, nP=178, nType=6},
	--THDNB9
	{szName="H�i thi�n t�i t�o l� bao", nG=6, nD=1, nP=2527, nType=7},
	--{szName="C�m nang thay ��i tr�i ��t", nG=6, nD=1, nP=1781, nType=7},
}


function GiveSupportItem:IsActive()
	local now = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if (now >= self.START_DATE) and (now <= self.END_DATE) then
		return 1;
	end
	return 0;
end

function GiveSupportItem:ShowDialog()
	local tbOpt = {}
	local str = "Giao n�p v�t ph�m h� tr� T�ng Kim"

	tinsert(tbOpt, "Ta mu�n gia n�p d�ng c� h� tr� T�ng Kim/#GiveSupportItem:OpenUI()")
	tinsert(tbOpt, "<#>Tho�t/OnCancel")
	if ( getn( tbOpt ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpt ), tbOpt )	
end

function GiveSupportItem:OpenUI()
	--THDNB9 Reset l�i c�c task �� s� d�ng trong THDNB8 - Modified by DinhHQ
	if tbVNG_BitTask_Lib:getBitTask(self.tbResetTask) == 0 then
		for i = 2764, 2769 do
			SetTask(i, 0)
		end		
		SetTask(2729, 0)
		tbVNG_BitTask_Lib:setBitTask(self.tbResetTask, 1)
	end
	
	GiveItemUI("Giao n�p v�t ph�m h� tr� TK", "Giao n�p v�t ph�m h� tr� TK", "ConfirmSupportItem", "OnCancel");
end

function ConfirmSupportItem(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)	
		local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
		
		--THDNB9 Ki�m tra gi� tr� c�a H�i thi�n t�i t�o l� bao v� c�m nang thay ��i tr�i ��t - Modified by DinhHQ - 20110517
		if (itemgenre == 6 and detailtype == 1 and parttype == 1781) then
			local nItemValue= GetItemParam(nItemIndex, 1)
			if nItemValue < 60 then
				Talk(1, "", "<color=yellow>C�m nang thay ��i tr�i ��t<color> ph�i c�n �� gi� tr� l� 60 m�i ���c ch�p nh�n!");
				return
			end
		end
		if (itemgenre == 6 and detailtype == 1 and parttype == 2527) then
			local nItemValue= GetItemParam(nItemIndex, 1)
			if nItemValue ~= 0 then
				Talk(1, "", "<color=yellow>H�i thi�n t�i t�o l� bao <color>ph�i c�n �� gi� tr� l� 60 m�i ���c ch�p nh�n!");
				return
			end
		end
		
		
		if (GiveSupportItem:CheckItem(itemgenre, detailtype, parttype) <= 0) then
			Talk(1, "", "��i hi�p xin h�y b� v�o ��ng v�t ph�m !");
			return
		end
	end
	GiveSupportItem:ProcessGiveItem(nCount)
end

function GiveSupportItem:ProcessGiveItem(nCount)
	local nCount_1, nCount_2, nCount_3, nCount_4, nCount_5, nCount_6, nCount_7 = 0, 0, 0, 0, 0, 0, 0
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)	
		local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)	
		local nIndexList = self:CheckItem(itemgenre, detailtype, parttype)
		if (self.tbListItem[nIndexList].nType == 1) then
			nCount_1 = nCount_1 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 2) then
			nCount_2 = nCount_2 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 3) then
			nCount_3 = nCount_3 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 4) then
			nCount_4 = nCount_4 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 5) then
			nCount_5 = nCount_5 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 6) then
			nCount_6 = nCount_6 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 7) then
			nCount_7 = nCount_7 + GetItemStackCount(nItemIndex)
		end
	end
	--Msg2Player(nCount_1.." - " .. nCount_2.." - " .. nCount_3.." - " .. nCount_4.." - " .. nCount_5.." - " .. nCount_6)
	
	local nTotal_1 = GetTask(self.TASK_COUNT_ITEM_1) + nCount_1
	local nTotal_2 = GetTask(self.TASK_COUNT_ITEM_2) + nCount_2
	local nTotal_3 = GetTask(self.TASK_COUNT_ITEM_3) + nCount_3	
	local nTotal_4 = GetTask(self.TASK_COUNT_ITEM_4) + nCount_4
	local nTotal_5 = GetTask(self.TASK_COUNT_ITEM_5) + nCount_5	
	local nTotal_6 = GetTask(self.TASK_COUNT_ITEM_6) + nCount_6
	local nTotal_7 = GetTask(self.TASK_COUNT_ITEM_7) + nCount_7
	
	local nMod = 0
	if mod(nTotal_1, 10) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_2, 10) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_3, 10) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_4, 50) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_5, 50) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_6, 50) > 0 then
		nMod = nMod + 1
	end
	
	local nSum = floor(nTotal_1/10) +  floor(nTotal_2/10) +  floor(nTotal_3/10) +  floor(nTotal_4/50) + floor(nTotal_5/50) + floor(nTotal_6/50) + nMod + nTotal_7
	--Msg2Player(nSum .. "..................")
	if (nSum > 300) then
		Talk(1, "", "S� l��ng v�t ph�m giao n�p qu� gi�i h�n cho ph�p!");
		return
	end
	
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		if (RemoveItemByIndex(nItemIndex) ~= 1) then
			Talk(1, "", "V�t ph�m c� v�n ��!");
			return
		end
	end
	
	local nTotalAll = GetTask(self.TASK_COUNT_ITEM_1) + nCount_1 +  GetTask(self.TASK_COUNT_ITEM_2) + nCount_2 + GetTask(self.TASK_COUNT_ITEM_3) + nCount_3 + GetTask(self.TASK_COUNT_ITEM_4) + nCount_4 + GetTask(self.TASK_COUNT_ITEM_5) + nCount_5 + GetTask(self.TASK_COUNT_ITEM_6) + nCount_6 + GetTask(self.TASK_COUNT_ITEM_7) + nCount_7
	
	if (nCount_1 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_1)
		SetTask(self.TASK_COUNT_ITEM_1, nTotal + nCount_1)
		Msg2Player("��i hi�p �� n�p <color=yellow>" .. nCount_1 .. " <color>v�t ph�m lo�i 1 - T�ng s� v�t ph�m �� n�p l�: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao n�p v�t ph�m h� tr� T�ng Kim"..GetAccount().."\t"..GetName().."\t".."N�p " .. nCount_1 .. " lo�i 1 - T�ng s�: " .. nTotalAll)
	end
	
	if (nCount_2 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_2)
		SetTask(self.TASK_COUNT_ITEM_2, nTotal + nCount_2)
		Msg2Player("��i hi�p �� n�p <color=yellow>" .. nCount_2 .. " <color>v�t ph�m lo�i 2 - T�ng s� v�t ph�m �� n�p l�: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao n�p v�t ph�m h� tr� T�ng Kim"..GetAccount().."\t"..GetName().."\t".."N�p " .. nCount_2 .. " lo�i 2 - T�ng s�: " .. nTotalAll)
	end
	
	if (nCount_3 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_3)
		SetTask(self.TASK_COUNT_ITEM_3, nTotal + nCount_3)
		Msg2Player("��i hi�p �� n�p <color=yellow>" .. nCount_3 .. " <color>v�t ph�m lo�i 3 - T�ng s� v�t ph�m �� n�p l�: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao n�p v�t ph�m h� tr� T�ng Kim"..GetAccount().."\t"..GetName().."\t".."N�p " .. nCount_3 .. " lo�i 3 - T�ng s�: " .. nTotalAll)
	end
	
	if (nCount_4 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_4)
		SetTask(self.TASK_COUNT_ITEM_4, nTotal + nCount_4)		
		Msg2Player("��i hi�p �� n�p <color=yellow>" .. nCount_4 .. " <color>v�t ph�m lo�i 4 - T�ng s� v�t ph�m �� n�p l�: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao n�p v�t ph�m h� tr� T�ng Kim"..GetAccount().."\t"..GetName().."\t".."N�p " .. nCount_4 .. " lo�i 4 - T�ng s�: " .. nTotalAll)
	end
	
	if (nCount_5 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_5)
		SetTask(self.TASK_COUNT_ITEM_5, nTotal + nCount_5)
		Msg2Player("��i hi�p �� n�p <color=yellow>" .. nCount_5 .. " <color>v�t ph�m lo�i 5 - T�ng s� v�t ph�m �� n�p l�: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao n�p v�t ph�m h� tr� T�ng Kim"..GetAccount().."\t"..GetName().."\t".."N�p " .. nCount_5 .. " lo�i 5 - T�ng s�: " .. nTotalAll)
	end
	
	if (nCount_6 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_6)
		SetTask(self.TASK_COUNT_ITEM_6, nTotal + nCount_6)
		Msg2Player("��i hi�p �� n�p <color=yellow>" .. nCount_6 .. " <color>v�t ph�m lo�i 6 - T�ng s� v�t ph�m �� n�p l�: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao n�p v�t ph�m h� tr� T�ng Kim"..GetAccount().."\t"..GetName().."\t".."N�p " .. nCount_6 .. " lo�i 6 - T�ng s�: " .. nTotalAll)
	end
	
	if (nCount_7 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_7)
		SetTask(self.TASK_COUNT_ITEM_7, nTotal + nCount_7)		
		Msg2Player("��i hi�p �� n�p <color=yellow>" .. nCount_7 .. " <color>v�t ph�m lo�i 7 - T�ng s� v�t ph�m �� n�p l�: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao n�p v�t ph�m h� tr� T�ng Kim"..GetAccount().."\t"..GetName().."\t".."N�p " .. nCount_7 .. " lo�i 7 - T�ng s�: " .. nTotalAll)
	end
end

function GiveSupportItem:CheckItem(nG, nD, nP)
	local nCount = 0
	for i=1, getn(self.tbListItem) do
		local tbTemp = self.tbListItem[i]
		if (nG== tbTemp.nG and nD== tbTemp.nD and nP== tbTemp.nP) then
			nCount = i
		end
	end
	
	if (nCount > 0) then
		return nCount
	else
		return 0
	end
end

function onCancel()

end