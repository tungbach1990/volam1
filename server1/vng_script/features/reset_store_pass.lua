Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\features\\dispose_equip.lua")
--mo khoa trang bi bang ma OTP
Include("\\vng_script\\features\\unlock_equip_by_otp.lua")

ResetStorePass = {}

ResetStorePass.TSK_TIME_ASSIGN = 2784

ResetStorePass.WAIT_DATE = 3

ResetStorePass.TBMONTH =  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}

ResetStorePass.LOG_TITLE = "LOG_FEATURE_CTC"

ResetStorePass.ITEM_REQUIE = {szName="Ph� kh�a c�ng c�",tbProp={6,1,30591,1,0,0},}

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "Tr�n ��i n�y kh�ng g� ta kh�ng l�m ���c, ng��i c� kh� kh�n g� t�m ta."		
	tbDailog:AddOptEntry("Gi�p ta v�n �� v� r��ng ch�a ��", ResetStorePass.ShowDialog, {ResetStorePass} )
	tbDailog:AddOptEntry("Gi�p ta v�n �� h�y trang b� kh�a", DisposeEquip.ShowDisposeUI, {DisposeEquip} )
	
	local nCheckOTP = VngExtPointLib:GetBitValueByVersion(tbUnlockEqOpt.EXTPOINT_OTP)
	if nCheckOTP == 1 then	
		tbDailog:AddOptEntry("M� kh�a nhanh trang b�", tbUnlockEqOpt.ShowUnlockOptUI, {tbUnlockEqOpt} )
	end
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tbDailog:Show()
end

function ResetStorePass:ShowDialog()
	local tbOpt = {}
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	self:CheckExpiredDate()
	
	if (GetTask(self.TSK_TIME_ASSIGN) <= 0) then
		tinsert(tbOpt ,"��ng k� h�y m�t kh�u r��ng/#ResetStorePass:AssignResetStorePass()")
	end
	if (GetTask(self.TSK_TIME_ASSIGN) > 0) then
		if (self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN),  self.WAIT_DATE) == nCurDate) then
			tinsert(tbOpt ,"X�c nh�n h�y m�t kh�u r��ng/#ResetStorePass:ConfirmResetStorePass()")
		end	
		tinsert(tbOpt ,"Xem th�i gian ho�n th�nh h�y m�t kh�u r��ng/#ResetStorePass:ShowTimeResetStorePass()")
		tinsert(tbOpt, "B� ��ng k� h�y m�t kh�u r��ng/#ResetStorePass:CancelResetStorePass()")
	end
	tinsert(tbOpt, "Tho�t/nothing")
	Say("��i hi�p t�m ta c� vi�c g�?", getn(tbOpt), tbOpt)	
end

function ResetStorePass:AssignResetStorePass()
	local tbProp = self.ITEM_REQUIE.tbProp
	if (ConsumeEquiproomItem(1, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1) then			
		return Talk(1,"",format("Mu�n ta m� kho�, c�n ��a cho ta 1 v�t ph�m<color=yellow> Ph� kh�a c�ng c�<color>. Ng��i kh�ng c� c�i ta c�n, h�y �i ki�m r�i v� g�p ta."))
	end
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	SetTask(self.TSK_TIME_ASSIGN, nCurDate)
	self:ShowTimeResetStorePass()
	tbLog:PlayerActionLog(self.LOG_TITLE.."- Reset Pass R��ng - ��ng K�")
	Msg2Player("��ng k� m� kh�a m�t kh�u th�nh c�ng, ch� � 3 ng�y sau x�c nh�n m� kh�a.")	
end

function ResetStorePass:CancelResetStorePass()
	SetTask(self.TSK_TIME_ASSIGN, 0)
	Msg2Player("B� ��ng k� h�y m�t kh�u r��ng th�nh c�ng!")
	tbLog:PlayerActionLog(self.LOG_TITLE.."- Reset Pass R��ng - H�y ��ng K�")
end

function ResetStorePass:ShowTimeResetStorePass()
	local nDate =  self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN),  self.WAIT_DATE)
	local szDate = mod(nDate, 100) .. "-" .. mod(floor(nDate/100), 100) .. "-" .. floor(nDate/10000)
	Talk(1, "", "<color=yellow>�� d�ng k� m� m�t kh�u r��ng.<color>\nM�t kh�u r��ng s� ���c h�y v�o ng�y <color=yellow>" .. szDate  .. "<color>\nN�u sau 24h ng�y <color=yellow>" .. szDate .. " <color>��i hi�p kh�ng x�c nh�n h�y m�t kh�u r��ng th� vi�c ��ng k� l�n n�y s� b� h�y b�!")
	return
end

function ResetStorePass:ConfirmResetStorePass()
	GMCancleBoxPassword()
	Msg2Player("�� x�a b� m�t kh�u r��ng th�nh c�ng! Vui l�ng ��t l�i m�t kh�u m�i �� ��m b�o t�i s�n.")
	SetTask(self.TSK_TIME_ASSIGN, 0)
	tbLog:PlayerActionLog(self.LOG_TITLE.."- Reset Pass R��ng - Th�nh C�ng h�y m�t kh�u R��ng")
end

function ResetStorePass:CheckExpiredDate()
	if (GetTask(self.TSK_TIME_ASSIGN) <= 0) then
		return
	end
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if (nCurDate == self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN),  self.WAIT_DATE + 1)) then
		SetTask(self.TSK_TIME_ASSIGN, 0)
		Msg2Player("Ng�y x�c nh�n h�y m�t kh�u r��ng �� qu� h�n, xin h�y ��ng k� l�i!")
	end
end

function ResetStorePass:AnnounceResetStorePassDate()
	self:CheckExpiredDate()
	if (GetTask(self.TSK_TIME_ASSIGN) > 0) then
		self:ShowTimeResetStorePass()
	end
end

function ResetStorePass:GetNextDate(oldday, num)
	local nDay = tonumber(oldday)
	local nYear = floor(nDay / 10000)
	local nMonth = floor((nDay - nYear * 10000) / 100)
	nDay = nDay - nYear * 10000 - nMonth * 100 
	nDay = nDay + num
	while (nDay > self.TBMONTH[nMonth]) do
		nDay = nDay - self.TBMONTH[nMonth]
		if (nMonth == 12) then
			nMonth = 1
			nYear = nYear + 1
		else
			nMonth = nMonth + 1
		end
	end
	return (nYear * 10000 + nMonth * 100 + nDay)
end

function nothing()

end
