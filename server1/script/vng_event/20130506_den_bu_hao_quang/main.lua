Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\vng_event\\20130506_den_bu_hao_quang\\head.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\lib\\log.lua")

function tbTittleCompensate:ShowDialog()
do return end
	if (self:IsActive() ~= 1) then
		Talk(1,"","Hi�n t�i kh�ng ph�i th�i gian nh�n th��ng.")
		return
	end
	if not self.tbAccount[GetAccount()] then
		Talk(1, "", "C�c h� kh�ng c� t�n trong danh s�ch nh�n th��ng, xin h�y ki�m tra l�i.")
		return
	end
	if (tbExtPointLib:GetBitValue(self.nExpointID, self.nExtpointBit) == 1) then
		Talk(1, "", "Ch�ng ph�i ��i hi�p ��  nh�n th��ng r�i sao?")
		return
	end
	if (tbExtPointLib:SetBitValue(self.nExpointID, self.nExtpointBit, 1) ~= 1)then
		return
	end
	
	local nServerTime = GetCurServerTime()+ self.nTittleExpiredTime
	local nDate	= FormatTime2Number(nServerTime);	
	local nDay	= floor(mod(nDate,1000000) / 10000);
	local nMon	= mod(floor(nDate / 1000000) , 100)
	local nTime	= nMon * 1000000 + nDay * 10000	
	 SetTask(TASK_ACTIVE_TITLE, self.nTittleID);
	Title_AddTitle(self.nTittleID, 2, nTime);
	Title_ActiveTitle(self.nTittleID);
	AddSkillState(self.tbSkill[1], self.tbSkill[2], 2, nTime, 1)
 	local str_title = Title_GetTitleName(self.nTittleID);		
	Msg2Player(format("Ch�c m�ng b�n �� nh�n ���c danh hi�u <color=yellow>%s<color>", str_title));
	tbLog:PlayerActionLog("DenBuHaoQuangPhuHao", "NhanHaoQuangDaiPhuHao")
end

function tbTittleCompensate:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%M"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function OnCancel()
end

local pEventType = EventSys:GetType("AddNpcOption")

if (tbTittleCompensate:IsActive() ~= 0) then
	--nId = pEventType:Reg("Chi�n T�m T�n Gi�", "Nh�n ��n b� danh hi�u Th�p ��i K� Nh�n", tbTittleCompensate.ShowDialog,{tbTittleCompensate})
end	