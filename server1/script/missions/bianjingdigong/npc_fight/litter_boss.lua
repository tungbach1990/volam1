--======================================================================
--Author:   Tan Qingyu
--Date:     汴京地宫 精英怪以及假BOSS脚本
--Describe: 2012-05-15
--======================================================================
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")

local nDistance = 20 * 20
function OnDeath(nNpcIndex)
	--Nh薾 ph莕 thng kinh nghi謒 cho ngi ch琲 v� team gi誸 boss
	local tbExpAward = {szName = "觤 Kinh Nghi謒", nExp = 10000}
	local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex) 
	if GetTeamSize() <= 1 then
		tbAwardTemplet:Give(tbExpAward, 1, {"DiaCungBienKinh", "KillBossLitterExp"})
	else
		local nTeamSize = GetTeamSize()
		for i = 1, nTeamSize do
			local nPlayerIndex = GetTeamMember(i)
			local nLife = CallPlayerFunction(nPlayerIndex, GetLife, 0)
			local nX, nY, nMapIndex = CallPlayerFunction(nPlayerIndex, GetPos)
			local nDistance = CheckDistance(nNpcX, nNpcY, nX, nY)
			if nPlayerIndex > 0 and nLife > 0 and  nDistance == 1 then
				 CallPlayerFunction(nPlayerIndex, tbAwardTemplet.Give, tbAwardTemplet, tbExpAward, 1, {"DiaCungBienKinh", "KillBossLitterExp"})
			end
		end
	end
end

function CheckDistance(nX1, nY1, nX2, nY2)
	local nTempDis = ((nX1 - nX2)/32)^2 + ((nY1 - nY2)/32)^2
	if nTempDis <= %nDistance then
		return 1
	end
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end
