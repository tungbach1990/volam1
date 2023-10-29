Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local SelectOpt = function(pInfo)
	local nPlayerIndex = PlayerIndex

	local nPak = usepack(pInfo.nPak)
	CallPlayerFunction(nPlayerIndex, pInfo.pFun, pInfo.pSelf)
	usepack(nPak)
end

MAKE_EQUIP_LIST = {}
REFINE_EQUIP_LIST = {}



local dialog_refine = function()
	do return end
	local szTitle = "��i hi�p mu�n tr�ng ch� c�i g�?"
	local tbOpt = 
	{
		{REFINE_EQUIP_LIST["chilin"].szOpt, %SelectOpt, {REFINE_EQUIP_LIST["chilin"]}},
		{REFINE_EQUIP_LIST["baihu"].szOpt, %SelectOpt, {REFINE_EQUIP_LIST["baihu"]}},
		{REFINE_EQUIP_LIST["jinwu"].szOpt, %SelectOpt, {REFINE_EQUIP_LIST["jinwu"]}},
		{"K�t th�c ��i tho�i"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end
--pEventType:Reg("Th� r�n th�n b�", "Tr�ng ch� trang b�", dialog_refine)

local dialog_make = function()
	szTitle = "Ng��i mu�n ch� t�o �� g�?"
	tbOpt = 
	{
		--{MAKE_EQUIP_LIST["chilin"].szOpt, %SelectOpt, {MAKE_EQUIP_LIST["chilin"]}},
		--{MAKE_EQUIP_LIST["baihu"].szOpt, %SelectOpt, {MAKE_EQUIP_LIST["baihu"]}},
		--{MAKE_EQUIP_LIST["jinwu"].szOpt, %SelectOpt, {MAKE_EQUIP_LIST["jinwu"]}},
		--{MAKE_EQUIP_LIST["zimang"].szOpt, %SelectOpt, {MAKE_EQUIP_LIST["zimang"]}},
		{"K�t th�c ��i tho�i"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end



pEventType:Reg("Th� r�n trong th�nh", "Ch� t�o trang b�", dialog_make)
