Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	local szTitle = "<npc>C� c�n mua thu�c kh�ng?"
	local tbOpt = {}
	tinsert(tbOpt, {"Giao d�ch", yes})
	tinsert(tbOpt, {"Kh�ng giao d�ch"})
	CreateNewSayEx(szTitle, tbOpt)
end;


function yes()
	Sale(12)
end;

