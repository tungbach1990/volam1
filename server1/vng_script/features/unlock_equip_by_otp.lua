Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\features\\dispose_equip.lua")
Include("\\vng_script\\vng_lib\\extpoint.lua")

tbUnlockEqOpt = {}

tbUnlockEqOpt.TSK_LIFE_TIME_OTP = 2771
tbUnlockEqOpt.LIFE_TIME = 10*60 --10ph
tbUnlockEqOpt.EXTPOINT_OTP  =  {nID = 3, nBit = 14, nVer = 2} 
tbUnlockEqOpt.KEYLOG = "LOG_FEATURE_CTC"
function tbUnlockEqOpt:ShowUnlockOptUI()
	local nCheckOTP = VngExtPointLib:GetBitValueByVersion(tbUnlockEqOpt.EXTPOINT_OTP)
	if nCheckOTP ~= 1 then
		Talk(1,"","H�y k�ch ho�t m� OPT ch�c n�ng m� kh�a trang b� nhanh tr��c.")
		return
	end
	if tbUnlockEqOpt:OnUpdateStateOTP() ~= 1 then
		return
	end
	local strDesc = "H�y b� nh�ng trang b� c�n th�o kh�a v�o."	
	g_GiveItemUI("Th�o kh�a", strDesc, {self.DoUnlockEqByOtp, {self}}, nil, 1)
end

function tbUnlockEqOpt:DoUnlockEqByOtp(nCount)	
	local nCheckOTP = VngExtPointLib:GetBitValueByVersion(tbUnlockEqOpt.EXTPOINT_OTP)
	if nCheckOTP ~= 1 then
		Talk(1,"","H�y k�ch ho�t m� OPT ch�c n�ng m� kh�a trang b� nhanh tr��c.")
		return
	end
	--Ki�m tra �i�u ki�n th�o kh�a
	for i=1, nCount do		
		local nItemIdx = GetGiveItemUnit(i)	
		if (nItemIdx <= 0) then
			return
		end
		local nCheck = self:check_StateEquip(nItemIdx)			
		if nCheck ~= 1 then
			Msg2Player("C� trang b� kh�ng �� �i�u ki�n �� th�o kh�a, h�y ki�m tra l�i.")
			return
		end
	end		
	--Th�o kh�a
	for i=1, nCount do		
		local nItemIdx = GetGiveItemUnit(i)	
		if (nItemIdx <= 0) then
			return
		end
		local nCheck = self:check_StateEquip(nItemIdx)			
		if nCheck ~= 1 then
			Msg2Player("C� trang b� kh�ng �� �i�u ki�n �� th�o kh�a, h�y ki�m tra l�i.")
			return
		end
		SetItemBindState(nItemIdx,0)
		SyncItem(nItemIdx)
		local szItemName = GetItemName(nItemIdx)
		Msg2Player(format("M� kh�a trang b�: <color=yelow>%s<color> th�nh c�ng.",szItemName))
		tbLog:PlayerActionLog(self.KEYLOG.." UNLOCK EQUIP - "..szItemName)
	end	
	VngExtPointLib:SetBitValueByVersion(self.EXTPOINT_OTP, 0)	
	KickOutSelf()
end

function tbUnlockEqOpt:check_StateEquip(nItemIdx)
	
	local nBindState = GetItemBindState(nItemIdx)	
	
	if nBindState <= 0 and nBindState ~= -1  then	
		Talk(1,"",format("- Trang b� kh�a v�nh vi�n kh�ng th� m� kh�a.\n - Trang b� �� kh�a b�o hi�m ho�c �ang m� kh�a b�o hi�m m�i c� th� m� kh�a."))
		return 0
	end
	--kiem tra trang bi xep chong
	if IsItemStackable(nItemIndex) == 1 then
		Talk(1,"","Trang b� x�p ch�ng kh�ng th� kh�ng th� m� kh�a")
		return 0
	end
	if (itemgenre == 7) then 
		Say("Trang b� h� h�i kh�ng th� m� kh�a")
		return	0
	end
	if IsMyItem(nItemIdx) ~= 1 then
		Talk(1,"","Th�t th� m�i l� ��c t�nh t�t!!!")
		tbLog:PlayerActionLog(self.KEYLOG.." UNLOCK EQUIP - Nghi van hack -  item bo vao khong o trong hanh trang")
		return 0
	end
	return 1
end

function tbUnlockEqOpt:OnUpdateStateOTP()
	print("=====OnLogin/Logout tbUnlockEqOpt:OnUpdateStateOTP()=====")
	local nCheckOTP = VngExtPointLib:GetBitValueByVersion(self.EXTPOINT_OTP)
	--chua kich hoat ma OTP
	if nCheckOTP ~= 1 then		
		SetTask(self.TSK_LIFE_TIME_OTP,0)
		return 0
	end	
	local nCurTimeSv = GetCurServerTime()
	local nCurTimeOTP = GetTask(self.TSK_LIFE_TIME_OTP)
	
	if nCurTimeOTP == 0 then --ghi nhan thoi gian dau tien sau khi kich hoat OTP		
		SetTask(self.TSK_LIFE_TIME_OTP,nCurTimeSv)
		print("=====tbUnlockEqOpt:OnUpdateStateOTP() TSK_LIFE_TIME_OTP: ====="..GetTask(self.TSK_LIFE_TIME_OTP))
		return 1
	elseif (nCurTimeSv - nCurTimeOTP) >= self.LIFE_TIME then --het thoi gian ton tai 10ph
		Msg2Player(format("<color=yellow>Th�i gian hi�u l�c c�a m� OTP m� kh�a trang b� nhanh �� h�t.<color>")		)
		VngExtPointLib:SetBitValueByVersion(self.EXTPOINT_OTP, 0)
		SetTask(self.TSK_LIFE_TIME_OTP,0)
		print("=====tbUnlockEqOpt:OnUpdateStateOTP() TSK_LIFE_TIME_OTP: ====="..GetTask(self.TSK_LIFE_TIME_OTP))
		return 0
	end
	return 1
end

--Kiem tra OTP ton tai 10ph
function tbUnlockEqOpt:OnLogin(bExchangeIn)
	local nCheckOTP = VngExtPointLib:GetBitValueByVersion(tbUnlockEqOpt.EXTPOINT_OTP)
	if nCheckOTP ~= 1 then		
		return
	end	
	if(bExchangeIn == 1 or ST_GetOffliveState() == 1)then
		return
	end	
	self:OnUpdateStateOTP()
end
function tbUnlockEqOpt:OnLogout(bExchangeIn)
	local nCheckOTP = VngExtPointLib:GetBitValueByVersion(tbUnlockEqOpt.EXTPOINT_OTP)
	if nCheckOTP ~= 1 then		
		return
	end	
	if(bExchangeIn == 1 or ST_GetOffliveState() == 1)then
		return
	end	
	self:OnUpdateStateOTP()
end

EventSys:GetType("OnLogin"):Reg(0, tbUnlockEqOpt.OnLogin, tbUnlockEqOpt)
EventSys:GetType("OnLogout"):Reg(0, tbUnlockEqOpt.OnLogout, tbUnlockEqOpt)
