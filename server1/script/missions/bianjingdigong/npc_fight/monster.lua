--======================================================================
--Author:   Tan Qingyu
--Date:     �꾩�ع� С�ֽű�
--Describe: 2012-05-15
--======================================================================
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")
local nDistance = 20 * 20
function OnDeath(nNpcIndex)
	--Nh�n ph�n th��ng kinh nghi�m cho ng��i ch�i v� team gi�t boss
	local tbExpAward = {szName = "�i�m Kinh Nghi�m", nExp = 10000}
	local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex) 
	if GetTeamSize() <= 1 then
		tbAwardTemplet:Give(tbExpAward, 1, {"DiaCungBienKinh", "KillMonsterExp"})
	else
		local nTeamSize = GetTeamSize()
		for i = 1, nTeamSize do
			local nPlayerIndex = GetTeamMember(i)
			local nLife = CallPlayerFunction(nPlayerIndex, GetLife, 0)
			local nX, nY, nMapIndex = CallPlayerFunction(nPlayerIndex, GetPos)
			local nDistance = CheckDistance(nNpcX, nNpcY, nX, nY)
			if nPlayerIndex > 0 and nLife > 0 and  nDistance == 1 then
				 CallPlayerFunction(nPlayerIndex, tbAwardTemplet.Give, tbAwardTemplet, tbExpAward, 1, {"DiaCungBienKinh", "KillMonsterExp"})
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
