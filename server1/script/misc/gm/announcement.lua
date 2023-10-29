Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")

local TYPE_TIMING = 1
local TYPE_ON_CHANGE_GS = 2

local NAME_LIST = 
{
	["GM_ad002"] = 1,
	["GM_ad003"] = 1,
	["GM_ad004"] = 1,
	["GM_ad005"] = 1,
}

tbAnnouncement = {}

tbAnnouncement.tbMessage = {}


function tbAnnouncement:InputMessageCount(pMessage)
	g_AskClientNumberEx(1, 100, "S� l�n c�ng b�", {self.InputMessageCountBack, {self, pMessage}})
end

function tbAnnouncement:InputMessageCountBack(pMessage, nCount)
	pMessage.nCount = nCount
	g_AskClientNumberEx(1, 100, "Kho�ng c�ch th�i gian ( gi�y)", {self.InputIntervalBack, {self, pMessage}})
end

function tbAnnouncement:InputIntervalBack(pMessage, nCount)
	pMessage.nInterval = nCount
	g_AskClientStringEx("", 1, 255, "N�i dung c�ng b�", {self.InputDetailBack, {self, pMessage}})
end

function tbAnnouncement:InputExpiredDate(pMessage)
	g_AskClientStringEx("", 8, 8, "Expired(YYYYmmdd)", {self.InputExpiredDateBack, {self, pMessage}})
end

function tbAnnouncement:InputExpiredDateBack(pMessage, szDate)
	pMessage.nExpiredDate = tonumber(szDate)
	g_AskClientStringEx("", 1, 255, "N�i dung c�ng b�", {self.InputDetailBack, {self, pMessage}})
end

function tbAnnouncement:InputDetailBack(pMessage, szMsg)
	pMessage.szMsg = szMsg
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, pMessage)
	RemoteExecute("\\script\\misc\\gm\\announcement.lua", "tbAnnouncement:Recv", handle, nil, 0)
	OB_Release(handle)
end


function tbAnnouncement:RegMessage(ParamHandle, ResultHandle)
	if (OB_IsEmpty(ParamHandle) == 1) then
		return
	end
	local pMessage = ObjBuffer:PopObject(ParamHandle)
	local nType = pMessage.nType
	if nType and nType ~= %TYPE_TIMING then
		tinsert(self.tbMessage, pMessage)
	end
end

function tbAnnouncement:Public(nType)
	local pMessage = {nType = nType}
	if nType == %TYPE_TIMING then
		self:InputMessageCount(pMessage)
	elseif nType == %TYPE_ON_CHANGE_GS then
		self:InputExpiredDate(pMessage)
	end
end

function tbAnnouncement:DialogTiming()
	local szTitle = "hello"
	local tbOpt = 
	{
		{"��nh th�i gian ph�t h�nh c�ng b�", self.Public, {self, %TYPE_TIMING}},
		{"Ki�m tra th�i �i�m c�ng b�", self.FetchMessage,{self}},
		{"X�a th�i gian c�ng b� c� ��nh", self.DelMessage,{self, %TYPE_TIMING}},
		{"Tr� l�i", self.DialogMain, {self}},
		{"H�y b� "},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbAnnouncement:DialogGS()
	local szTitle = "hello"
	local tbOpt = 
	{		
		{"C�ng b� ph�t h�nh qua gs", self.Public, {self, %TYPE_ON_CHANGE_GS}},
		{"Ki�m tra c�ng b� qua gs", self.ShowLocalMessage,{self}},
		{"X�a c�ng b� qua gs", self.DelMessage,{self, %TYPE_ON_CHANGE_GS}},
		{"Tr� l�i", self.DialogMain, {self}},
		{"H�y b� "},
	}
	CreateNewSayEx(szTitle, tbOpt)
end


function tbAnnouncement:CheckRole()
	local szName = GetName()
	return %NAME_LIST[szName] == 1
end

function tbAnnouncement:DialogMain()
	if not self:CheckRole() then
		return
	end
	local szTitle = "hello"
	local tbOpt = 
	{
		{"��nh th�i gian c�ng b�", self.DialogTiming, {self}},
		{"C�ng b� qua gs", self.DialogGS, {self}},
		{"H�y b� "},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbAnnouncement:FetchMessage()
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, GetName())
	RemoteExecute("\\script\\misc\\gm\\announcement.lua", "tbAnnouncement:GetMessage", handle, "tbAnnouncement:ShowRelayMessage", 0)
	OB_Release(handle)
end

function tbAnnouncement:ShowRelayMessage(nParam, ResultHandle)
	
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex  = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		local tbMessage = ObjBuffer:PopObject(ResultHandle)
		local nCount = getn(tbMessage)
		local nRealCount = 0
		for i=1, nCount do
			local pMessage = tbMessage[i]
			if pMessage then
				local szMsg = format("%d Count:%d Interval:%d Content:%s", i, pMessage.nCount, pMessage.nInterval, pMessage.szMsg)
				CallPlayerFunction(nPlayerIndex, Msg2Player, szMsg)
				nRealCount = nRealCount + 1
			end
		end
		if nRealCount <= 0 then
			CallPlayerFunction(nPlayerIndex, Msg2Player, "announcement is empty")
		end
	end
end

function tbAnnouncement:DelMessage(nType)
	if nType == %TYPE_TIMING then
		g_AskClientNumberEx(1, 100, "ID c�ng b�", {self.DelRelayMessage, {self}})
	elseif nType == %TYPE_ON_CHANGE_GS then
		g_AskClientNumberEx(1, 100, "ID c�ng b�", {self.Trans2DelLocalMessage, {self}})
	end
	
end

function tbAnnouncement:DelRelayMessage(nId)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nId)
	RemoteExecute("\\script\\misc\\gm\\announcement.lua", "tbAnnouncement:DelMessage", handle, nil, 0)
	OB_Release(handle)
end

function tbAnnouncement:Trans2DelLocalMessage(nId)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nId)
	RemoteExecute("\\script\\misc\\gm\\announcement.lua", "tbAnnouncement:Trans2DelLocalMessage", handle, nil, 0)
	OB_Release(handle)
end

function tbAnnouncement:DelLocalMessage(ParamHandle, ResultHandle)
	if (OB_IsEmpty(ParamHandle) == 1) then
		return
	end
	local nId = ObjBuffer:PopObject(ParamHandle)
	self.tbMessage[nId] = nil
end

function tbAnnouncement:ShowLocalMessage()
	local nCount = getn(self.tbMessage)
	local nRealCount = 0
	for i=1, nCount do
		local pMessage = self.tbMessage[i]
		if pMessage then
			local szMsg = format("%d ExpiredDate:%d Content:%s", i, pMessage.nExpiredDate,pMessage.szMsg)
			Msg2Player(szMsg)
			nRealCount = nRealCount + 1
		end
	end
	if nRealCount <= 0 then
		Msg2Player("announcement is empty")
	end
end

function tbAnnouncement:OnLogin()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	for i=1, getn(self.tbMessage) do
		local pMessage = self.tbMessage[i]
		if pMessage and pMessage.nExpiredDate > nCurDate then
			Msg2Player(pMessage.szMsg)
		end
	end
end


--EventSys:GetType("OnLogin"):Reg(3, tbAnnouncement.OnLogin, tbAnnouncement)
--EventSys:GetType("AddNpcOption"):Reg("L� Quan", "GM", tbAnnouncement.DialogMain, {tbAnnouncement}, tbAnnouncement.CheckRole, {tbAnnouncement})