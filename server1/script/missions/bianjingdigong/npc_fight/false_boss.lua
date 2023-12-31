--======================================================================
--Author:   Tan Qingyu
--Date:     汴京地宫 精英怪以及假BOSS脚本
--Describe: 2012-05-15
--======================================================================
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")

local nDistance = 20 * 20

tbVngDropItem = 
{
	{szName="C鑞g Hi課 L� bao",tbProp={6,1,30214,1,0,0},nCount=20},
}
function OnDeath(nNpcIndex)
--	--Ph莕 thng d祅h cho team gi誸 boss
--	local nTeamSize = GetTeamSize();
--	local szName;
--	if (nTeamSize > 1) then
--		for i=1,nTeamSize do
--			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
--				szName = doFunByPlayer(GetTeamMember(i), GetName);
--			end
--			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, 50e6, 0, "[BosGia]PhanThuongExpDanhchoTeam");
--		end
--	else -- 一个人
--		szName = GetName();
--		PlayerFunLib:AddExp(50e6, 0,"[BosGia]PhanThuongExpDanhchoTeam");
--	end
	--Ph莕 thng Boss r瑃 Item ra ngo礽
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbVngDropItem,"[BossGia]PhanThuongItemBossRotRa", 1);
	--Ph莕 thng d祅h cho nh鱪g ngi xung quanh
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, 10e6, 0,"[BosGia]PhanThuongExpDanhchoMenberDungGan");
	end
	--Nh薾 ph莕 thng kinh nghi謒 cho ngi ch琲 v� team gi誸 boss
	local nOldPlayer = PlayerIndex
	local tbExpAward = {szName = "觤 Kinh Nghi謒", nExp = 50e6}
	local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex) 
	if GetTeamSize() <= 1 then
		tbAwardTemplet:Give(tbExpAward, 1, {"DiaCungBienKinh", "[BossGia]PhanThuongExpDanhchoTeam"})
	else
		local nTeamSize = GetTeamSize()
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			local nX, nY, nMapIndex = GetPos()
			if PlayerIndex > 0 and GetLife(0) > 0 and CheckDistance(nNpcX, nNpcY, nX, nY) == 1 then
				tbAwardTemplet:Give(tbExpAward, 1, {"DiaCungBienKinh", "[BossGia]PhanThuongExpDanhchoTeam"})
			end
		end
	end
	PlayerIndex = nOldPlayer
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