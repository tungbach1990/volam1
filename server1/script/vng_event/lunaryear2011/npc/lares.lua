Include("\\script\\vng_event\\LunarYear2011\\npc\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
if not tbLares then
	tbLares = {}
end
tbLares.TSK_ID = 2755
tbLares.BIT_POS = 1
tbLares.nEndDay = 20110127
tbLares.nStartDay = 20110126
function main()
	if tbLares:isActive() ~= 1 then
		return
	end
	local tbMainDialog = tbNpcHead:createDialog()
	if tbLares:getBitValue() == 1 then
		Talk(1, "", "Hi�n gi� ta �ang r�t b�n.")
		return
	else
		tbMainDialog.szTitleMsg = "Ta ph�i chu�n b� v� tr�i �� t�u Ng�c Ho�ng t�nh h�nh � tr�n gian trong n�m v�a qua, c�c h� c�n g� th� n�i nhanh �i!"
		tbMainDialog:AddOptEntry("Ta ch� mu�n ch�c ng�y th��ng l� b�nh an", tbLares.giveAward, {tbLares})
	end	
	tbMainDialog:Show()
end

function tbLares:giveAward()
	if tbVNG_LY2011:checkCondition() ~= 1 then
		Talk(1, "", "B�n kh�ng �� �i�u ki�n s� d�ng v�t ph�m! Y�u c�u c�p �� tr�n 50 v� ��  n�p th�.")
		return
	end
	local nValue = GetTask(self.TSK_ID)
	nValue = SetBit(nValue, self.BIT_POS, 1)
	SetTask(self.TSK_ID, nValue)
	local tbExp = {nExp=50000000}
	tbAwardTemplet:GiveAwardByList(tbExp, "[VNG][Lunar Year 2011][��a �ng T�o v� tr�i]")
	Talk(2, "", "...C�c h� th�t t�t b�ng, t�t ��n r�i ta c�ng c� m�n qu� t�ng ng��i.", "�a t� ng�y.")
end

function tbLares:getBitValue()
	local nValue = GetTask(self.TSK_ID)
	return GetBit(nValue, self.BIT_POS)
end

function tbLares:isActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEndDay or now < self.nStartDay) then
		return 0;
	end
	return 1;
end