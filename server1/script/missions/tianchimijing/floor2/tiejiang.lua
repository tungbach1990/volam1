Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\global\\global_tiejiang.lua")

function main()
	local szTitle = "<#><npc> C�n giao d�ch kh�ng?"
	local tbOpt = {}
	tinsert(tbOpt, {"Giao d�ch", yes}) 
	tinsert(tbOpt, {"C�a h�ng tinh luy�n th�ch", energy_sale}) 
	tinsert(tbOpt, {"Nh�n ti�n gh� qua th�i"}) 
	CreateNewSayEx(szTitle, tbOpt);
end

function yes()
	Sale(35)
end
