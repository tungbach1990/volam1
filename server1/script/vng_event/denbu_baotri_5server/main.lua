Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

if (not tbDenbuBT2011) then
	tbDenbuBT2011 = {};
end


tbDenbuBT2011.nEndDate = 20111128;		  -- ngay ket thuc den bu 24h00 ngay 23/11/2011
tbDenbuBT2011.nExtpoint_Is_DBBT  = 3;       -- TaskExt = 3;
tbDenbuBT2011.nBit_Is_DB   = 13;				  -- Bit trong Ext 3 l� bit thu 1


function tbDenbuBT2011:IsActive()
	local nCurDate = tonumber(date("%Y%m%d"))
	if (nCurDate < self.nEndDate) then
		return 1;
	end
	return 0;
end

function tbDenbuBT2011:GetAward()
		if( self:IsActive() ~= 1) then
			Talk(1,"","Ho�t ��ng �� k�t th�c!")
			return
		end
		
		if (tbExtPointLib:GetBitValue(self.nExtpoint_Is_DBBT, self.nBit_Is_DB) ~= 0 ) then
 			Talk(1,"","��i hi�p �� nh�n th��ng, kh�ng th� nh�n th�m.")
 			return
 		end
 		
 		 if (tbExtPointLib:SetBitValue(self.nExtpoint_Is_DBBT, self.nBit_Is_DB, 1) ~= 1) then
	 		return
	 	end
	 	
		 local tbAward = {	szName = "�i�m Kinh Nghi�m", nExp=400000000	};
		 	
 		tbAwardTemplet:Give(tbAward, 1,{"DenbuBT2011","NhanDenbuBaoTri27Server"})
end

local pEventType = EventSys:GetType("AddNpcOption")
if (tbDenbuBT2011:IsActive() ~= 0) then
	nId = pEventType:Reg("L� Quan", "Nh�n ��n B� B�o Tr�", tbDenbuBT2011.GetAward,{tbDenbuBT2011})
end	