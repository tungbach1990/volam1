Include("\\script\\event\\other\\caipiao\\head_gs.lua")

function tbCaiPiao:ShowAllInfo(tbNumberList, tbNumberNameList)
	for nNumber, nCount in tbNumberList do
		local tbName	= tbNumberNameList[nNumber]
		local szMsg		= ""
		for k, v in tbName do
			if v then
				szMsg = szMsg.." "..k
			end
		end
		szMsg = format("S� <color=yellow>%s<color> �� ch�n <color=yellow>%s<color> l�n, ng��i ch�n <color=green>%s<color>", nNumber, nCount, szMsg)
		Msg2Player(szMsg)
	end
end

function tbCaiPiao:ApplyStartRound(nWeekDay)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nWeekDay)	
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_StartRound", handle)
	OB_Release(handle)
end

function tbCaiPiao:SetStage(nStage)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nStage)	
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_SetStage", handle)
	OB_Release(handle)
end

function tbCaiPiao:ApplyGetInfo(nWeekDay)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nWeekDay)
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_ApplyGetInfo", handle, "tbCaiPiao_ApplyGetInfo_CallBack")
	OB_Release(handle)
end

function tbCaiPiao:AutoTest(nWeekDay, nOnlyWager)
	local handle = OB_Create()
	nWeekDay = nWeekDay or 0
	nOnlyWager = nOnlyWager or 0
	ObjBuffer:PushObject(handle, nWeekDay)
	ObjBuffer:PushObject(handle, nOnlyWager)
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_AutoTest", handle)
	OB_Release(handle)
end

function tbCaiPiao:GM(nWeekDay)
	local szTitle = "Ch� l�nh"	
	nWeekDay = nWeekDay or 15
	local tbOpt = 
	{
		{"�Զ�����", self.AutoTest, {self}},
		{"�Զ�����ĳ��", self.AutoTest, {self, nWeekDay}},
		{"�Զ���Ͷĳ��", self.AutoTest, {self, nWeekDay, 1}},
		{"Xem th�ng tin ch�n s�", self.ApplyGetInfo, {self, nWeekDay} },
		{"��Ͷ", self.OpenInputUI, {self}},
		{"Nh�n l�nh ph�n th��ng", self.ApplyGetAward, {self, nWeekDay}},
		{"Xem k�t qu�", self.QueryResult, {self, nWeekDay}},
		{"����Ͷע", self.SetStage, {self, 1}},
		{"B�t ��u t�nh tr�ng th��ng", self.SetStage, {self, 2}},
		
		
		{"���ؽű�head_gs", LoadScript, {[[\script\event\other\caipiao\head_gs.lua]]}},
		{"���ؽű�GM", LoadScript, {[[\script\event\other\caipiao\testcomand.lua]]}},
		{"K�t th�c ��i tho�i"},
	}
	
	
	CreateNewSayEx(szTitle, tbOpt)
end

--relay �ص�
local _CheckPlayer = function(nPlayerIndex)
	if nPlayerIndex <= 0 then
		return 
	end
	local szOldName = tbCaiPiao.tbTempCallBack[nPlayerIndex]
	local szCurName = lib:DoFunByPlayer(nPlayerIndex, GetName)
	if szOldName ~= nil and szCurName ~= nil and szOldName == szCurName then
		tbCaiPiao.tbTempCallBack[nPlayerIndex] = nil
		return 1
	end
end

function tbCaiPiao_ApplyGetInfo_CallBack(nParam, ResultHandle)

	if %_CheckPlayer(nParam) ~= 1 then
		return 
	end
	local szMsg = ObjBuffer:PopObject(ResultHandle)
	
	lib:DoFunByPlayer(nParam, Msg2Player, szMsg)
end

