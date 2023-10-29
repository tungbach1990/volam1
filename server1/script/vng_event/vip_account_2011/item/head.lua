IncludeLib("ITEM")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
if not tbVNG_VIPAcc_ItemHead then
	tbVNG_VIPAcc_ItemHead = {}
end
tbVNG_VIPAcc_ItemHead.tbTaskInfo =
	{
		nTaskID = 2754,
		nStartBit = 12,
		nBitCount = 1,
		nMaxValue = 1
	}
function tbVNG_VIPAcc_ItemHead:isExpired(nItemIdx)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIdx)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		return 1;
	end
	return 0;
end
function tbVNG_VIPAcc_ItemHead:useItem(strItemType)
	if tbVNG_BitTask_Lib:getBitTask(self.tbTaskInfo) == 1 then
		return 0, "M�i nh�n v�t ch� ���c s� d�ng v�t ph�m n�y m�i tu�n m�t l�n."
	end
	tbVNG_BitTask_Lib:setBitTask(self.tbTaskInfo, 1)
	local tbAward = {}
	local strItemName = ""
	if(strItemType == "tieu") then
		tbAward = {nExp=200000000}
		strItemName = "Nh� � l� bao ti�u"
	elseif (strItemType == "trung") then
		tbAward = {nExp=300000000}
		strItemName = "Nh� � l� bao trung"
	elseif (strItemType == "dai") then
		tbAward = {nExp=800000000}
		strItemName = "Nh� � l� bao ��i"
	end
	tbAwardTemplet:GiveAwardByList(tbAward, format("[VNG][VipAcc2011][Ph�n th��ng kinh nghi�m s� d�ng v�t ph�m %s]", strItemName))	
	return 1
end
