Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING")

tbHungBinhLeBao = tbHungBinhLeBao or {}
tbHungBinhLeBao.TASK_HUNGBINH = {nTaskID = 2993,nStartBit = 4,nBitCount = 2,nMaxValue = 2}
tbHungBinhLeBao.tbList ={
		[1] = {szName="Long ��m",tbProp={0,4485},nCount=1,nQuality = 1,nExpiredTime=10080},
		[2] = {szName="Cu�ng Lan",tbProp={0,4489},nCount=1,nQuality = 1,nExpiredTime=10080},
		[3] = {szName="M�t n� - Anh h�ng chi�n tr��ng",tbProp={0,11,482,1,0,0},nCount=1,nExpiredTime=20160,nBindState = -2},
}

function main(nItemIndex)
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local szTitle = "Xin h�y l�a ch�n lo�i ph�n th��ng !"
	local tbOpt = {}
	tinsert(tbOpt,format("Long ��m/#tbHungBinhLeBao:VnGiveAward(%d,1)",nItemIndex))
	tinsert(tbOpt,format("Cu�n Lang/#tbHungBinhLeBao:VnGiveAward(%d,2)",nItemIndex))
	tinsert(tbOpt,format("M�t n� anh h�ng chi�n tr��ng/#tbHungBinhLeBao:VnGiveAward(%d,3)",nItemIndex))
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "R�i kh�i/no")
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1	
end


function tbHungBinhLeBao:VnGiveAward(nItemIdx,nNumber)
	local nWidth = 1
	local nHeight = 1
	local nCount = 2
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(self.TASK_HUNGBINH, self.TASK_HUNGBINH.nMaxValue, "S� d�ng v�t ph�m �� ��t ��n gi�i h�n, kh�ng th� s� <enter>d�ng th�m", "<") ~= 1 then
		return
	end
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d h�nh trang", nCount))
		return
	end
	if IsMyItem(nItemIdx) ~= 1 or RemoveItemByIndex(nItemIdx) ~= 1 then
		return
	end
	tbVNG_BitTask_Lib:addTask(self.TASK_HUNGBINH, 1)
	tbAwardTemplet:Give(self.tbList[nNumber], 1, {"Hungbinhlebao", "SudungHungbinhlebao"});
end