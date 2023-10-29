Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")
Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\head.lua")

tbVNGWD2011_gardener = {}

function main()
	if tbVNG_WomenDay2011:IsActive() ~= 1 or tbVNG_WomenDay2011:CheckCondition() ~= 1 then
		return 
	end
	tbVNGWD2011_gardener:MainDialog()	
end

function tbVNGWD2011_gardener:MainDialog()
	if tbVNG_WomenDay2011:IsActive() ~= 1 then
		return
	end
	local tbMainDialog = tbVNGWD2011_NpcHead:CreateDialog()
	tbMainDialog:AddOptEntry("T�ng b�nh m�", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "T�ng B�nh M�"})
	tbMainDialog:AddOptEntry("��i b� hoa h�ng", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "H�p th�nh B� Hoa H�ng"})
	tbMainDialog:AddOptEntry("Mua d�y c�t hoa", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "Mua D�y C�t Hoa"})
	tbMainDialog:Show()			
end
