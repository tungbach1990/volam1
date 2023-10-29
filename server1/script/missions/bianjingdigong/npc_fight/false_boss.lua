--======================================================================
--Author:   Tan Qingyu
--Date:     �꾩�ع� ��Ӣ���Լ���BOSS�ű�
--Describe: 2012-05-15
--======================================================================
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")

local nDistance = 20 * 20

tbVngDropItem = 
{
	{szName="C�ng Hi�n L� bao",tbProp={6,1,30214,1,0,0},nCount=20},
}
function OnDeath(nNpcIndex)
--	--Ph�n th��ng d�nh cho team gi�t boss
--	local nTeamSize = GetTeamSize();
--	local szName;
--	if (nTeamSize > 1) then
--		for i=1,nTeamSize do
--			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
--				szName = doFunByPlayer(GetTeamMember(i), GetName);
--			end
--			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, 50e6, 0, "[BosGia]PhanThuongExpDanhchoTeam");
--		end
--	else -- һ����
--		szName = GetName();
--		PlayerFunLib:AddExp(50e6, 0,"[BosGia]PhanThuongExpDanhchoTeam");
--	end
	--Ph�n th��ng Boss r�t Item ra ngo�i
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbVngDropItem,"[BossGia]PhanThuongItemBossRotRa", 1);
	--Ph�n th��ng d�nh cho nh�ng ng��i xung quanh
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, 10e6, 0,"[BosGia]PhanThuongExpDanhchoMenberDungGan");
	end
	--Nh�n ph�n th��ng kinh nghi�m cho ng��i ch�i v� team gi�t boss
	local nOldPlayer = PlayerIndex
	local tbExpAward = {szName = "�i�m Kinh Nghi�m", nExp = 50e6}
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