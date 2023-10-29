Include("\\script\\activitysys\\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")
function main(nIdx)
	if tbVngMysticChest:IsActive() ~= 1 then
		Talk(1, "", "V�t ph�m n�y ch� c� th� s� d�ng v�o th�i gian: <color=red>00h00 ng�y 22 th�ng 10 n�m 2011 ��n 24h00 ng�y 31 th�ng 10 n�m 2011<color>")
		return 1
	end
	if PlayerFunLib:VnCheckInCity("default") ~= 1 or PlayerFunLib:CheckFreeBagCell(2,"default") ~= 1 then
		return 1
	end
	 tbVngMysticChest:Use()
	return 0
end

MysticChestAnnounce = function (nItemIdx)
	local strItemName = GetItemName(nItemIdx)
	local strMessage = format("<color=green>Ch�c m�ng <color=yellow>%s<color=green> �� nh�n ���c v�t ph�m <color=yellow>%s<color=green> khi s� d�ng <color=yellow>R��ng Th�n B�<color>", GetName(), strItemName)
	local handle = OB_Create()
	local _, nTongId = GetTongName()
	if (nTongId ~= 0) then
		Msg2Tong(nTongId, strMessage)
	end
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbVngMysticChest = {}
tbVngMysticChest.tbAward =
{
	{szName="T� M�ng L�nh",tbProp={6,1,2350,1,0,0},nCount=1,nRate=10, CallBack = MysticChestAnnounce},
	{szName="Kim � L�nh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.2, CallBack = MysticChestAnnounce},
	{szName="Kim Hoa Chi B�o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=2, CallBack = MysticChestAnnounce},
	{szName="�� Ph� Kim � Kh�i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.6, CallBack = MysticChestAnnounce},
	{szName="�� Ph� Kim � Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.7, CallBack = MysticChestAnnounce},
	{szName="�� Ph� Kim � H�i",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.3, CallBack = MysticChestAnnounce},
	{szName="�� Ph� Kim � Y�u ��i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.3, CallBack = MysticChestAnnounce},
	{szName="�� Ph� Kim � H� Uy�n",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.3, CallBack = MysticChestAnnounce},
	{szName="�� Ph� Kim � H�ng Li�n",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.7, CallBack = MysticChestAnnounce},
	{szName="�� Ph� Kim � B�i",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.5, CallBack = MysticChestAnnounce},
	{szName="�� Ph� Kim � Th��ng Gi�i",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.5, CallBack = MysticChestAnnounce},
	{szName="�� Ph� Kim � H� Gi�i",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.5, CallBack = MysticChestAnnounce},
	{szName="�� Ph� Kim � Kh� Gi�i",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.4, CallBack = MysticChestAnnounce},
	{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=70},
	{szName = "�i�m Kinh Nghi�m", nExp=100000000,nRate=13},	
}

function tbVngMysticChest:IsActive()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate < 201110220000 or nCurDate > 201110312400 then
		return 0
	end
	return 1
end

function tbVngMysticChest:Use()
	tbAwardTemplet:Give(self.tbAward, 1, {"Event_Thang10", "SuDungRuongThanBi"})
end