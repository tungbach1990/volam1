Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

BonusOnlineSurvey2011 = {}

BonusOnlineSurvey2011.nEndDate = 20111207

BonusOnlineSurvey2011.EXTPOINT_BONUS_ATM = 3

BonusOnlineSurvey2011.BIT_AWARD = 11
 
BonusOnlineSurvey2011.BIT_GET_AWARD = 12


function BonusOnlineSurvey2011:GetAward()
	
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
	
	 if (tbExtPointLib:SetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_GET_AWARD, 1) ~= 1) then
	 	return
	 end
	 
	 local tbAward = {szName = "�i�m kinh nghi�m", nExp_tl = 100000000}
 	tbAwardTemplet:Give(tbAward, 1,{"BonusOnlineSurvey2011","NhanThuongBonusOnlineSurvey2011"})
end

function BonusOnlineSurvey2011:IsActive()
	local nCurDate = tonumber(date("%Y%m%d"))
	if (nCurDate <= self.nEndDate) then
		return 1
	else
		return 0
	end
end

function BonusOnlineSurvey2011:CheckAccount()
	 if (tbExtPointLib:GetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_AWARD) ~= 1) then
 		return 0
	else
		return 1
	end
end

local pEventType = EventSys:GetType("AddNpcOption")
if (BonusOnlineSurvey2011:IsActive() ~= 0) then
	nId = pEventType:Reg("L� Quan", "Nh�n th��ng ch��ng tr�nh thu th�p � ki�n", BonusOnlineSurvey2011.GetAward,{BonusOnlineSurvey2011})
end	