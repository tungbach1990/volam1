Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");

tbList ={
		{szName="Ho�ng Kim �n (C��ng h�a) C�p 8",tbProp={0,3212},nCount=1,nQuality = 1,nExpiredTime=129600},
		{szName="Ho�ng Kim �n (Nh��c h�a) C�p 8",tbProp={0,3222},nCount=1,nQuality = 1,nExpiredTime=129600},
}
	
function main(nItemIndex)
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local szTitle = "Xin h�y l�a ch�n lo�i phi phong !"
	local tbOpt = {}
	tinsert(tbOpt,format("Ho�ng Kim �n (C��ng h�a) C�p 8/#GiveAward(%d,%d)",nItemIndex,1))
	tinsert(tbOpt,format("Ho�ng Kim �n (Nh��c h�a) C�p 8/#GiveAward(%d,%d)",nItemIndex,2))
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "R�i kh�i/no")
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1
end

function GiveAward(nItemIdx,nNumber)
	local nWidth = 1
	local nHeight = 1
	local nCount = 1
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return
	end
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d h�nh trang", nCount))
		return
	end
	if IsMyItem(nItemIdx) ~= 1 or RemoveItemByIndex(nItemIdx) ~= 1 then
		return
	end
	tbAwardTemplet:Give(tbList[nNumber], 1, {"phiphonglehop", "SudungPhiphonglehop"});
end