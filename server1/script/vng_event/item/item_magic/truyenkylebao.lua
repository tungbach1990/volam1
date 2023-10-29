Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING")

tbTruyenKyLeBao = tbTruyenKyLeBao or {}
tbTruyenKyLeBao.TASK_TRUYENKY = {nTaskID = 2993,nStartBit = 6,nBitCount = 2,nMaxValue = 2}
tbTruyenKyLeBao.tbList ={
		[1] = {
			{szName="Ch�n Nguy�n ��n (��i)",tbProp={6,1,30229,1,0,0},nCount=200,nBindState=-2},
			{szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=1000},
		},
		[2] = {szName = "�i�m Kinh Nghi�m", nExp=1300e6},
		[3] = {
			{szName="Huy�t Long ��ng C�p 5",tbProp={6,1,30289,5,0,0},nCount=20},
			{szName="Huy�t Long ��ng C�p 6",tbProp={6,1,30289,6,0,0},nCount=20},
			{szName="Huy�t Long ��ng C�p 8",tbProp={6,1,30289,8,0,0},nCount=20},
			{szName="Huy�t Long ��ng C�p 9",tbProp={6,1,30289,9,0,0},nCount=20},
			{szName="Huy�t Long ��ng C�p 12",tbProp={6,1,30289,12,0,0},nCount=20},
		},
}
	
function main(nItemIndex)
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local szTitle = "Xin h�y l�a ch�n lo�i ph�n th��ng !"
	local tbOpt = {}
	tinsert(tbOpt,format("Ch�n nguy�n ��n(��i) v� H� m�ch ��n/#tbTruyenKyLeBao:VnGiveAward(%d,1)",nItemIndex))
	tinsert(tbOpt,format("�i�m kinh nghi�m kh�ng th� c�ng d�n/#tbTruyenKyLeBao:VnGiveAward(%d,2)",nItemIndex))
	tinsert(tbOpt,format("B� huy�t long ��ng(5x20,6x20,8x20,9x20,12x20)/#tbTruyenKyLeBao:VnGiveAward(%d,3)",nItemIndex))
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "R�i kh�i/no")
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1	
end


function tbTruyenKyLeBao:VnGiveAward(nItemIdx,nNumber)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(self.TASK_TRUYENKY, self.TASK_TRUYENKY.nMaxValue, "S� d�ng v�t ph�m �� ��t ��n gi�i h�n, kh�ng th� s� <enter>d�ng th�m", "<") ~= 1 then
		return
	end
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d h�nh trang", nCount))
		return
	end
	if IsMyItem(nItemIdx) ~= 1 or RemoveItemByIndex(nItemIdx) ~= 1 then
		return
	end
	tbVNG_BitTask_Lib:addTask(self.TASK_TRUYENKY, 1)
	tbAwardTemplet:Give(self.tbList[nNumber], 1, {"Truyenkylebao", "Sudungtruyenkylebao"});
end