Include("\\script\\global\\meridian\\vnmeridan_head.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_feature\\checkinmap.lua")
tbVnMeridanTaskCount = {
	[30227] = 1,--ch�n nguy�n ��n ti�u
	[30228] = 5,--ch�n nguy�n ��n trung
	[30229] = 10,--ch�n nguy�n ��n ��i
}
tbVnMeridanLog = {
	[30227] = "SuDungChanNguyenDonTieu",--ch�n nguy�n ��n ti�u
	[30228] = "SuDungChanNguyenDonTrung",--ch�n nguy�n ��n trung
	[30229] = "SuDungChanNguyenDonDai",--ch�n nguy�n ��n ��i
}
function main(nItemIndex)
	local _, _, nP = GetItemProp(nItemIndex)
	if not tbVnMeridanTaskCount[nP] then
		return 1
	end
	if not PlayerFunLib:VnCheckInCity ("default") then
		return 1
	end
	local strItemName = GetItemName(nItemIndex)
	local nBITTSK_IDX = tbVnMeridanHead.nMAX_MERIDAN_TSK_IDX
	local nLimitCount = tbVnMeridanHead.tbBitTask[nBITTSK_IDX].nMaxValue
	local nCurCount = tbVnMeridanHead:GetDailyTaskCount(nBITTSK_IDX)
	if tbVnMeridanHead:CheckTaskLimit(nBITTSK_IDX) ~= 1 then
		Talk(1, "", format("M�i ng�y ch� c� th� h�p th� t�i �a %d �i�m Ch�n Nguy�n", nLimitCount))
		return 1
	end
	local nNewCount = 0
	if nCurCount + tbVnMeridanTaskCount[nP] > nLimitCount then
		nNewCount = nLimitCount
	else
		nNewCount = nCurCount  + tbVnMeridanTaskCount[nP]
	end
	tbVnMeridanHead:SetDailyTaskCount(nBITTSK_IDX, nNewCount)
	SetTask(4000, GetTask(4000) + nNewCount - nCurCount)
	Msg2Player(format("S� d�ng %s th�nh c�ng, nh�n ���c %d �i�m Ch�n Nguy�n", strItemName, nNewCount - nCurCount))
	tbLog:PlayerActionLog("KinhMach", tbVnMeridanLog[nP])
end