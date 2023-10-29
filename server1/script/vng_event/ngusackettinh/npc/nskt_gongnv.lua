Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\vng_event\\ngusackettinh\\npc\\nskt_compose_item.lua")

tbNSKT_gongnv = {}

function tbNSKT_gongnv:addDialog(tbDialog)
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"));
	if ((nCurDay >= tbNSKT_head.nStartDay) and (nCurDay < tbNSKT_head.nItemExpiredTime)) then
		tbDialog:AddOptEntry("Ho�t ��ng Ng� Th�i K�t Tinh",tbNSKT_gongnv.main,{tbNSKT_gongnv})
	end			
end

function tbNSKT_gongnv:main()	
	local tbMainDialog = 	self:createDiaglog()
	tbMainDialog.szTitleMsg = "M�a ��ng ��n r�i m� ta ch�a k�p chu�n b� g�, hi�n ta �ang c�n m�t c�y th�ng �� trang ho�ng ��m gi�ng sinh, n�u ng��i gi�p ���c ta, ta s� c� m�n qu� d�nh cho ng��i"
	if (tbNSKT_head:isActive() == 1)then
		tbMainDialog:AddOptEntry("Gi�i thi�u ho�t ��ng", tbNSKT_gongnv.description, {tbNSKT_gongnv})
		tbMainDialog:AddOptEntry("H�p th�nh k�t tinh", tbNSKT_gongnv.crystalCompose, {tbNSKT_gongnv})
	end	
	tbMainDialog:AddOptEntry("Ho�t ��ng ng�i sao may m�n", tbNSKT_gongnv.luckyStarActivity, {tbNSKT_gongnv})
	tbMainDialog:AddOptEntry("��i ng�a Phi�n V�", tbNSKT_gongnv.horseAward, {tbNSKT_gongnv})
	tbMainDialog:Show()			
end

function tbNSKT_gongnv:description()	
	local tbDescDialog =	self:createDiaglog()
	tbDescDialog.szTitleMsg = "Gi�ng sinh s�p ��n r�i, m�i ng��i �ang t�t b�t chu�n b�, sao c�c h�n c�n � ��y?. H�y  xem c�ch th�c tham gia � trang ch� nh�!"
	tbDescDialog:AddOptEntry("Tr� l�i", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbDescDialog:Show()
end

function tbNSKT_gongnv:crystalCompose()
	local tbComposeDialog =	self:createDiaglog()
	tbComposeDialog.szTitleMsg = "K�t tinh th�t ��p, d��ng nh� ch�ng c�ng �n ch�a nhi�u b�t ng�."
	tbComposeDialog:AddOptEntry("Tam s�c k�t tinh", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"K�t Tinh Tam S�c"})
	tbComposeDialog:AddOptEntry("T� s�c k�t tinh", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"K�t Tinh T� S�c"})
	tbComposeDialog:AddOptEntry("Ng� s�c k�t tinh", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"K�t Tinh Ng� S�c"})
	tbComposeDialog:AddOptEntry("Tr� l�i", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbComposeDialog:Show()	
end

function tbNSKT_gongnv:luckyStarActivity()
	local tbStarActDialog =	self:createDiaglog()
	tbStarActDialog.szTitleMsg = "C�y th�ng gi�ng sinh th�t ��p, ng��i t�ng ta sao?"
	tbStarActDialog:AddOptEntry("T�ng", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"Ng�i Sao"})
	tbStarActDialog:AddOptEntry("Tr� l�i", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbStarActDialog:Show()	
end

function tbNSKT_gongnv:horseAward()
	local tbHorseAwardDialog =	self:createDiaglog()
	tbHorseAwardDialog.szTitleMsg = "C� 2 c�ch ��i Phi�n V�:<enter>Phi�n V� h�n s� d�ng 6 th�ng : <color=red>60<color> l�nh b�i<enter>Phi�n V� kh�ng h�n s� d�ng: <color=red>200<color> l�nh b�i"	
	tbHorseAwardDialog:AddOptEntry("��i Phi�n V� c� h�n s� d�ng", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"Phi�n V�"})
	tbHorseAwardDialog:AddOptEntry("��i Phi�n V� kh�ng h�n s� d�ng", tbNSKT_ItemCompose.compose, {tbNSKT_ItemCompose,"Phi�n V� Kh�ng H�n S� D�ng"})
	tbHorseAwardDialog:AddOptEntry("Tr� l�i", tbNSKT_gongnv.main, {tbNSKT_gongnv})
	tbHorseAwardDialog:Show()		
end

function tbNSKT_gongnv:createDiaglog()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	return DailogClass:new(szNpcName)
end

function tbNSKT_gongnv:onCancel()
end