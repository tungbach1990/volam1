Include("\\script\\vng_event\\vip_account_2011\\npc\\head.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
if not tbVNG_VipAcc2011_VLTN then
	tbVNG_VipAcc2011_VLTN = {}
end

tbVNG_VipAcc2011_VLTN.nStartDay = 20120801
tbVNG_VipAcc2011_VLTN.nEndDay = 20121231
tbVNG_VipAcc2011_VLTN.nExtPointID = 4
--cac bit ��nh d�u gamer c� trong danh s�ch nh�n nh� � l� bao
--tbVNG_VipAcc2011_VLTN.nBit_NYLB_Tieu = 2
--tbVNG_VipAcc2011_VLTN.nBit_NYLB_Trung = 3
tbVNG_VipAcc2011_VLTN.nBit_NYLB_Dai = 10
--cac bit ��nh d�u gamer ��  nh�n nh� � l� bao
--tbVNG_VipAcc2011_VLTN.nBit_NYLB_Tieu2 = 6
--tbVNG_VipAcc2011_VLTN.nBit_NYLB_Trung2 = 7
tbVNG_VipAcc2011_VLTN.nBit_NYLB_Dai2 = 11
--bit ��nh d�u m�i tu�n 1 nh�n v�t ch� ���c s� d�ng 1 lo�i nh� � l� bao
tbVNG_VipAcc2011_VLTN.tbTaskInfo =
	{
		nTaskID = 2754,
		nStartBit = 12,
		nBitCount = 1,
		nMaxValue = 1
	}

function tbVNG_VipAcc2011_VLTN:isActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now > self.nEndDay or now < self.nStartDay) then
		return 0;
	end
	return 1;
end

function tbVNG_VipAcc2011_VLTN:addDialog(tbDialog)
	if (self:isActive() ~= 1) then 
		return
	end
	--if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Tieu) == 1 or tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Trung) == 1 or tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Dai) == 1) then
	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Dai) == 1) then
		tinsert(tbDialog, "Nh�n nh� � l� bao/#tbVNG_VipAcc2011_VLTN:main()");
		--tbDialog:AddOptEntry("Nh�n nh� � l� bao", tbVNG_VipAcc2011_VLTN.main, {tbVNG_VipAcc2011_VLTN})
	end
end

function tbVNG_VipAcc2011_VLTN:main()
	local tbMainDialog = tbVNG_Vip_NpcHead:CreateDialog()
	tbMainDialog.szTitleMsg = "Xin h�y ch�n ph�n th��ng:"
--	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Tieu) == 1 and tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Tieu2) == 0) then
--	--	tbMainDialog:AddOptEntry("Nh�n nh� � l� bao ti�u", tbVNG_VipAcc2011_VLTN.GetAward, {tbVNG_VipAcc2011_VLTN, "tieu"})
--	end
--	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Trung) == 1 and tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Trung2) == 0) then
--	--	tbMainDialog:AddOptEntry("Nh�n nh� � l� bao trung", tbVNG_VipAcc2011_VLTN.GetAward, {tbVNG_VipAcc2011_VLTN, "trung"})
--	end
	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Dai) == 1 and tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Dai2) == 0) then
		tbMainDialog:AddOptEntry("Nh�n nh� � l� bao ��i", tbVNG_VipAcc2011_VLTN.GetAward, {tbVNG_VipAcc2011_VLTN, "dai"})
	end
	tbMainDialog:Show()
end

function tbVNG_VipAcc2011_VLTN:GetAward(strItemType)
	if (CalcFreeItemCellCount() < 10) then
		Talk(1, "", "�� b�o v� t�i s�n, xin vui l�ng ch�a 10 � tr�ng trong h�nh trang r�i m�i s� d�ng v�t ph�m n�y!")
		return
	end
	local tbAward = {}
	tbVNG_BitTask_Lib:setBitTask(self.tbTaskInfo, 0)
--	if strItemType == "tieu" then
--		if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Tieu2) == 0 and tbExtPointLib:SetBitValue(self.nExtPointID, self.nBit_NYLB_Tieu2, 1) == 1) then
--			tbAward = {szName="Nh� � L� Bao(Ti�u)",tbProp={6,1,30092,1,0,0},nCount=1,nExpiredTime=10080,nBindState = -2}			
--			tbVNG_Vip_NpcHead:GiveAward(tbAward, "[VNG][VIPAcc2011][Nh�n nh� � l� bao t�i NPC V� L�m Truy�n Nh�n]")
--			return
--		end
--	end
--	if strItemType == "trung" then
--		if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Trung2) == 0 and tbExtPointLib:SetBitValue(self.nExtPointID, self.nBit_NYLB_Trung2, 1) == 1) then
--			tbAward = {szName="Nh� � L� Bao(Trung)",tbProp={6,1,30093,1,0,0},nCount=1,nExpiredTime=10080,nBindState = -2}
--			tbVNG_Vip_NpcHead:GiveAward(tbAward, "[VNG][VIPAcc2011][Nh�n nh� � l� bao t�i NPC V� L�m Truy�n Nh�n]")
--			return
--		end
--	end
	if strItemType == "dai" then
		if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBit_NYLB_Dai2) == 0 and tbExtPointLib:SetBitValue(self.nExtPointID, self.nBit_NYLB_Dai2, 1) == 1) then
			tbAward = {szName="Nh� � L� Bao(��i)",tbProp={6,1,30094,1,0,0},nCount=1,nExpiredTime=10080,nBindState = -2}
			tbVNG_Vip_NpcHead:GiveAward(tbAward, "[VNG][VIPAcc2011][Nh�n nh� � l� bao t�i NPC V� L�m Truy�n Nh�n]")
			return
		end
	end	
end