Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

BonusATM2011 = {}
--Gia h�n nh�n th��ng ��n h�t ng�y 18/12/2011 - Modified By DinhHQ - 20111213
--BonusATM2011.nEndDate = 20111130
BonusATM2011.nEndDate = 20111218

BonusATM2011.EXTPOINT_BONUS_ATM = 3

BonusATM2011.BIT_AWARD = 9
 
BonusATM2011.BIT_GET_AWARD = 10


function BonusATM2011:GetAward()
	
	if (self:IsActive() ~= 1) then
		Talk(1,"","Ho�t ��ng �� k�t th�c!")
		return
	end
	
	if (self:CheckAccount() ~=1) then
		Talk(1,"","��i hi�p kh�ng �� �i�u ki�n nh�n th��ng!")
		return
	end

	if (GetExtPoint(self.EXTPOINT_BONUS_ATM) < 0) then
		Talk(1,"","��i hi�p ch�a th� nh�n th��ng l�c n�y,  xin h�y  li�n h� Bang Qu�n Tr�")
		return
	end
	
	 if (tbExtPointLib:GetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_GET_AWARD) ~= 0 ) then
 		Talk(1,"","��i hi�p �� nh�n th��ng r�i")
 		return
 	end
 	
	if (CalcFreeItemCellCount() < 5 ) then
		Talk(1, "", "H�nh trang ��i hi�p kh�ng �� 5 � tr�ng!")
		return
	end
	
	 if (tbExtPointLib:SetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_GET_AWARD, 1) ~= 1) then
	 	return
	 end
	 local tbAward = {szName = "H�ng Bao An Khang", tbProp = {6,1,2105,1,0,0}, nCount = 1, nExpiredTime = 86400}
 	tbAwardTemplet:Give(tbAward, 1,{"BonusATM2011","NhanThuongBonusATM"})
end

function BonusATM2011:IsActive()
	local nCurDate = tonumber(date("%Y%m%d"))
	if (nCurDate <= self.nEndDate) then
		return 1
	else
		return 0
	end
end

function BonusATM2011:CheckAccount()
	 if (tbExtPointLib:GetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_AWARD) ~= 1) then
 		return 0
	else
		return 1
	end
end

local pEventType = EventSys:GetType("AddNpcOption")
if (BonusATM2011:IsActive() ~= 0) then
	nId = pEventType:Reg("L� Quan", "Nh�n th��ng H�ng Bao An Khang", BonusATM2011.GetAward,{BonusATM2011})
end	