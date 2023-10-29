Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\missions\\tianchimijing\\floor_templet\\game.lua")
--Bonus award - Modified By DinhHQ - 20120405
Include("\\script\\missions\\tianchimijing\\vnextaward.lua")
function main()
		local nNpcIndex = GetLastDiagNpc()
		local szNpcName = GetNpcName(nNpcIndex)
		local tbDailog = DailogClass:new(szNpcName)
		tbDailog.szTitleMsg = "<#><npc> Ti�u hi�p kh�ng ng� ng��i l�i c� th� v��t ���c ��n n�i n�y, ��y l� t�ng 2 c�a Thi�n Tr� M�t C�nh, ta c� th� gi�p ng��i �i v�o M�t C�nh t�ng 3, c� �i�u ng��i ph�i c�n th�n nh�, M�t C�nh t�ng 3 v� c�ng nguy hi�m."
		G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
		tinsert(tbDailog, {"Gi�i thi�u quy t�c �i v�o Thi�n Tr� M�t C�nh t�ng 3", Realize})
		tinsert(tbDailog, {"Ta mu�n �i Thi�n Tr� M�t C�nh t�ng 3", ToFloor3})
		----Bonus award - Modified By DinhHQ - 20120405		
		tinsert(tbDailog, {"Ta mu�n nh�n ph�n th��ng v��t qua t�ng 2", tbVnExtAward.ToFloor3GetAward, {tbVnExtAward}})
		tinsert(tbDailog, {"Thi�n Tr� M�t C�nh ��ng s� qu�, ta mu�n r�i kh�i Thi�n Tr� M�t C�nh", LeaveMijing})
		tinsert(tbDailog, {"K�t th�c ��i tho�i"})
		CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function Realize()
	local tbOpt = {}
	local szTitle = ""
	szTitle = "<#><npc> B�n trong M�t C�nh t�ng 3 c�t gi�u r�t nhi�u kho b�u, ti�u hi�p ng��i t�t nh�t n�n t�m v�i ng��i c�ng t� ��i v�i ng��i �i v�o M�t C�nh t�ng 3, b�n trong M�t C�nh t�ng 3 c� 10 gian M�t Ph�ng, ta c� th� ��a ng��i v�o m�t gian M�t Ph�ng t�y �, n�u ng��i �ang � trong tr�ng th�i t� ��i, ta s� ��a ng��i v� t� ��i c�a ng��i c�ng nhau v�o 1 trong nh�ng M�t Ph�ng ��. Trong M�t Ph�ng kh�ng cho ph�p m� <C�m Nang H�i Thi�n T�i T�o> v� nh�ng lo�i t�i thu�c kh�c, hi�u qu� ��c bi�t c�a Ti�n Th�o L� v� nh�ng ��o c� t�ng kinh nghi�m c�ng v� hi�u."
	tinsert(tbOpt, {"Tr� v�", main})
  CreateNewSayEx(szTitle, tbOpt)
end

function ToFloor3()
	local nTeamSize = GetTeamSize()
	if (nTeamSize ~= 0 ) then
		if (IsCaptain() ~= 1) then
			Msg2Player("Ng��i kh�ng ph�i ��i tr��ng")
			return 0
		else 
			local szMsg = ""
			local _, _, nMapId = GetPos()
			local bInSameMap = 1
			for i = 1, nTeamSize do
				local nPlayerIndex = GetTeamMember(i);
				local _, _, nTempMapId = DynamicExecuteByPlayer(nPlayerIndex, "", "GetPos")
				local szName = DynamicExecuteByPlayer(nPlayerIndex, "", "GetName")
				if nTempMapId ~= nMapId then
					szMsg = format("%s\n%sth�nh vi�n trong ��i kh�ng � g�n, kh�ng th� �i v�o Thi�n Tr� M�t C�nh t�ng 3", szMsg, szName)
					bInSameMap = 0
				end
			end
			if bInSameMap == 0 then
				Msg2Player(szMsg)
				return 0
			end
		end
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\tianchimijing\\floor3\\gamefloor3.lua", "GameFloor3:WantEnterMap")
end

function LeaveMijing()
	local szPosPath = "\\settings\\maps\\tianchimijing\\common\\exit.txt"
	local nMapId = 934
	if GetTeamSize() >= 1 then
		LeaveTeam()
	end
	Game:MoveTo(nMapId, szPosPath)
end

