Include("\\script\\missions\\dungeon\\dungeons\\shiliantang\\shiliantang.lua")
Include("\\script\\missions\\dungeon\\npcdialog.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local _CallTower = function()
	tbDungeonManager:DoTempletFun("Th� Luy�n ���ng", "CallTower")
end

local _CallBackTower = function()
	tbDungeonManager:DoTempletFun("Th� Luy�n ���ng", "CallBackTower")
end

function main()
	local szTitle = "<color=yellow>Tri�u t�p ph�<color> n�y t�i ��a �i�m ch� ��nh c� th� tri�u t�p<color=red>cung ti�n th�<color>, c�ng c� th� tri�u t�p <color=red> cung ti�n th�<color> t�i v� tr� kh�c."
	
	if tbDungeonManager:DoTempletFun("Th� Luy�n ���ng", "CheckOwnerInDungeon") then
		local tbOpt = 
		{
			{"T�i ��y tri�u t�p cung ti�n th�", %_CallTower},
			{"Tri�u t�p cung ti�n th� v�o ��a �i�m n�y", %_CallBackTower},
			{"H�y b� "}
		}
		CreateNewSayEx(szTitle, tbOpt)
	end

	return 1
end