Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("SETTING");

tbList ={
		{szName="Phi phong Ng� Phong (D�ch chuy�n t�c th�i )",tbProp={0,3473},nCount=1,nQuality = 1,nExpiredTime=1*30*24*60},
		{szName="Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=1*30*24*60},
		{szName="Phi phong Ng� Phong (Tr�ng k�ch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=1*30*24*60},
}
	
function main(nItemIndex)
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local szTitle = "Xin h�y l�a ch�n lo�i phi phong !"
	local tbOpt = {}
	tinsert(tbOpt,format("Phi phong Ng� Phong (D�ch chuy�n t�c th�i )/#VnGiveAward(%d,1)",nItemIndex))
	tinsert(tbOpt,format("Phi phong Ng� Phong (X�c su�t h�a gi�i s�t th��ng)/#VnGiveAward(%d,2)",nItemIndex))
	tinsert(tbOpt,format("Phi phong Ng� Phong (Tr�ng k�ch) )/#VnGiveAward(%d,3)",nItemIndex))
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "R�i kh�i/no")
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1	
end


function VnGiveAward(nItemIdx,nNumber)
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