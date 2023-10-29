Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

if (not tbVipAcc2012) then
	tbVipAcc2012 = {};
end

tbVipAcc2012.nStartDate = 20120123;
tbVipAcc2012.nEndDate = 20120220;
tbVipAcc2012.nExtpointID  = 4;
tbVipAcc2012.nBit1   = 9;--acc c� trong danh s�ch
tbVipAcc2012.nBit2   = 10;--acc �� nh�n th��ng


function tbVipAcc2012:IsActive()
	local nCurDate = tonumber(date("%Y%m%d"))
	if (nCurDate >= self.nStartDate) and (nCurDate < self.nEndDate) then
		return 1;
	end
	return 0;
end

function tbVipAcc2012:main()
	local tbOpt = {}
	tinsert(tbOpt, {"Nh�n", tbVipAcc2012.GetAward, {tbVipAcc2012}})
	tinsert(tbOpt, {"��ng"})	
	CreateNewSayEx("Ph�n th��ng d�nh cho VIP l� 600 tri�u �i�m kinh nghi�m kh�ng c�ng d�n, ��i hi�p c� mu�n nh�n ng�y kh�ng?", tbOpt)
end

function tbVipAcc2012:GetAward()
		if( self:IsActive() ~= 1) then
			Talk(1,"","Hi�n t�i kh�ng ph�i th�i gian nh�n th��ng, xin h�y gh� th�m trang ch� �� bi�t th�m th�ng tin.!")
			return
		end
		if (tbExtPointLib:GetBitValue(self.nExtpointID, self.nBit1) ~= 1 ) then
 			Talk(1,"","Xin th� l�i, ��i hi�p kh�ng c� trong danh s�ch nh�n th��ng.")
 			return
 		end
		if (tbExtPointLib:GetBitValue(self.nExtpointID, self.nBit2) ~= 0 ) then
 			Talk(1,"","��i hi�p �� nh�n th��ng, kh�ng th� nh�n th�m.")
 			return
 		end
 		
 		 if (tbExtPointLib:SetBitValue(self.nExtpointID, self.nBit2, 1) ~= 1) then
	 		return
	 	end
	 	
		 local tbAward = {szName = "�i�m Kinh Nghi�m", nExp=600e6};
		 	
 		tbAwardTemplet:Give(tbAward, 1,{"VipAcc2012","NhanPhanThuongDiemKinhNghiem"})
end

local pEventType = EventSys:GetType("AddNpcOption")
if (tbVipAcc2012:IsActive() ~= 0) then
	nId = pEventType:Reg("Nguy�t Nhi", "Nh�n Ph�n th��ng d�nh cho VIP", tbVipAcc2012.main,{tbVipAcc2012})
end	