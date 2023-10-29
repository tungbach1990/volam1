Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")
function main()
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nDate = tonumber(GetLocalDate("%y%m%d%H"));
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<#><npc>M�i ng�y Hu�n Nhan Qu�ng D��ng ��u luy�n c�ng � ��y, �ng ta c�t gi� m�t s� l��ng l�n kho b�u, D�c �� ��ng S�n T�i Kh�i, T�i �� C�ng T�ng, ti�u hi�p ng��i nh�t ��nh ph�i ��nh b�i h�n."
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)	
	
	tbDailog:AddOptEntry("Ch� n�y ��ng s� qu�, ta mu�n r�i kh�i n�i qu� qu�i n�y", OnLeave)
	tbDailog:Show()
end

function OnLeave()
	Game:MoveTo(934, "\\settings\\maps\\tianchimijing\\common\\exit.txt")
end