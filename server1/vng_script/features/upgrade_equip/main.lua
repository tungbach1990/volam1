Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\vng_script\\features\\upgrade_equip\\head.lua")
Include("\\vng_script\\features\\upgrade_equip\\upgrade_equip.lua")


function tbVngUpgradeABDQ:main()
	local szMsg = format("<npc><color=yellow>Ng��i mu�n ph�n gi�i hay n�ng c�p trang b� ho�ng kim An bang hay ��nh qu�c, ta c� th� gi�p ��!<color>\n")
	local tbOpt = {}
	
	tinsert(tbOpt, {format("Ph�n gi�i trang b� An bang - ��nh qu�c"), self.ReleaseEquip_UI, {self}})
	tinsert(tbOpt, {format("N�ng c�p trang b� An bang - ��nh qu�c"), self.UpgradeEquip_UI, {self}})	
	tinsert(tbOpt, {"H�y b� "})
	CreateNewSayEx(szMsg, tbOpt)
end
function tbVngUpgradeABDQ:ReleaseEquip_UI()
	local strDesc = "Ch� ph�n gi�i trang b� An bang - ��nh qu�c."	
	g_GiveItemUI("Ph�n gi�i trang b�", strDesc, {self.ReleaseEquip, {self}}, nil, 1)
end

function tbVngUpgradeABDQ:UpgradeEquip_UI()	
	local strDesc = format("N�ng c�p trang b� [Ho�n M�] An bang c�n: Trang b� an bang th��ng v� c�c nguy�n li�u t��ng �ng.<enter>")
	strDesc = strDesc..format("N�ng c�p trang b� [C�c ph�m] ��nh qu�c c�n: Trang b� ��nh qu�c th��ng v� c�c nguy�n li�u t��ng �ng.<enter>")
	strDesc = strDesc.."* 1 An bang/��nh qu�c h�n th�ch t�ng : 1% t� l� th�nh c�ng. <enter>* 1 Thi�n Tinh Kho�ng t�ng : 10% T� l� th�nh c�ng.<enter>T� l� th�nh c�ng t�i �a: 80%"
	g_GiveItemUI("N�ng c�p trang b�", strDesc, {self.UpgradeEquip, {self}}, nil, 1)
end

EventSys:GetType("AddNpcOption"):Reg("B�ch ngh� nh�n","Li�n quan ��n trang b� An bang - �inh qu�c", tbVngUpgradeABDQ.main,{tbVngUpgradeABDQ})


