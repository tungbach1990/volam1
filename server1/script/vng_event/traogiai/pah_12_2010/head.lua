Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\vng_event\\traogiai\\pah_12_2010\\pah_award.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\awardtemplet.lua")

tbPAH122010_Head = {}
tbPAH122010_Head.nExtPointID = 3
tbPAH122010_Head.nBitPos = 9

function tbPAH122010_Head:isActive()
	if(tbList[GetAccount()] ~= nil and  tbExtPointLib:GetBitValue(self.nExtPointID, self.nBitPos) == 0) then
		return 1
	end
	return 0
end

function tbPAH122010_Head:addDialog(tbDialog)
	if self:isActive() ~= 1 then
		return
	end
	tbDialog:AddOptEntry("Nh�n ph�n th��ng Ph��ng Anh H�o th�ng 12",tbPAH122010_Head.main,{tbPAH122010_Head})
end

function tbPAH122010_Head:main()	
	if(tbPAH122010_Head:isActive() ~= 1) then 
		return
	end
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	tbMainDialog.szTitleMsg = format("Gi�i ��u l�n n�y nh�n ���c ph�n th��ng l� <color=red>%d<color> [H�ng Bao C�u L�c B�]. ��i hi�p c� mu�n nh�n ngay kh�ng?", tbList[GetAccount()])
	tbMainDialog:AddOptEntry("Nh�n", tbPAH122010_Head.getAward, {tbPAH122010_Head})
	tbMainDialog:Show()
end

function tbPAH122010_Head:getAward()
	if (tbExtPointLib:GetBitValue(self.nExtPointID, self.nBitPos) == 1) then
		Talk(1, "", "Ch�ng ph�i ��i hi�p ��  nh�n th��ng r�i sao? ��ng tham lam qu�.")
		return
	end
	local strAccount = GetAccount()
	local nAwardCount = tbList[strAccount]
	if (CalcFreeItemCellCount() < nAwardCount) then
		Talk(1, "", format("�� b�o v� t�i s�n vui l�ng ch�a �t nh�t <color=red>%d<color> � tr�ng trong h�nh trang.", nAwardCount))
		return
	end
	if (tbExtPointLib:SetBitValue(self.nExtPointID, self.nBitPos, 1) == 1)then
		local tbAward = {szName="H�ng Bao C�u L�c B�",tbProp={6,1,30032,1,0,0},nCount=nAwardCount,nExpiredTime = 43200}
		tbAwardTemplet:GiveAwardByList(tbAward, "Nh�n th��ng Ph��ng Anh H�o th�ng 12")
	end
end