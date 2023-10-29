-- �ļ�������goldboss.lua
-- �����ߡ���wangjingjun
-- ���ݡ������ƽ�boss����������boss24Сʱ���Զ�ɾ��
-- PS	   : �����ڸ��ļ����ص�ʱ����Ҫ����boss����ע�ᣬ�ظ����أ�boss������������
-- ����ʱ�䣺2011-10-02 08:15:46

Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\misc\\eventsys\\type\\npcdeath.lua")
--Change boss award 2012 - Modified By DinhHQ - 20120315
Include("\\script\\lib\\awardtemplet.lua")
--local tbEquiptAward =
--{
--	[1873] = 
--	{
--		
--	},
--	[1874] = 
--	{
--		
--	},
--	[1875] = 
--	{
--		
--	},
--}
 -- Thay ��i ph�n th��ng Boss Tr��ng Tuy�n, Kim Th� L��ng, M� Dung To�n  -Modifiled by ThanhLD - 20130417	
local tbDropItem = {

	-- [1] = {{szName="X�ch L�n L�nh",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.4},},
	-- [2] = {{szName="M�nh X�ch L�n",tbProp={6,1,3391,1,0,0},nCount=1,nRate=3},},
	-- [3] = {{szName="X�ch L�n Kim B�i",tbProp={6,1,3392,1,0,0},nCount=1,nRate=4},},
	-- [4] = {{szName="X�ch L�n Tr�o",tbProp={6,1,3394,1,0,0},nCount=1,nRate=7},},
	-- [5] = {{szName="X�ch L�n Gi�c",tbProp={6,1,3395,1,0,0},nCount=1,nRate=4},},
	-- [6] = {{szName="X�ch L�n T�nh",tbProp={6,1,3396,1,0,0},nCount=1,nRate=2.5},},
	-- [7] = {{szName="B�ch H� Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={2,0,0,0,0,0}},},
	-- [8] = {{szName="B�ch H� Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.3,tbParam={6,0,0,0,0,0}},},
	-- [9] = {{szName="B�ch H� Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={5,0,0,0,0,0}},},
	-- [10] = {{szName="B�ch H� H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={1,0,0,0,0,0}},},
	-- [11] = {{szName="B�ch H� Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={9,0,0,0,0,0}},},
	-- [12] = {{szName="B�ch H� H�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={8,0,0,0,0,0}},},
	-- [13] = {{szName="B�ch H� H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={4,0,0,0,0,0}},},
	-- [14] = {{szName="B�ch H� Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={3,0,0,0,0,0}},},
	-- [15] = {{szName="B�ch H� H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={10,0,0,0,0,0}},},
	-- [16] = {{szName="B�ch H� Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.2,tbParam={7,0,0,0,0,0}},},
	-- [17] = {{szName="X�ch L�n Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={2,0,0,0,0,0}},},
	-- [18] = {{szName="X�ch L�n Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={6,0,0,0,0,0}},},
	-- [19] = {{szName="X�ch L�n Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={5,0,0,0,0,0}},},
	-- [20] = {{szName="X�ch L�n H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={1,0,0,0,0,0}},},
	-- [21] = {{szName="X�ch L�n Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={9,0,0,0,0,0}},},
	-- [22] = {{szName="X�ch L�n H�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={8,0,0,0,0,0}},},
	-- [23] = {{szName="X�ch L�n H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={4,0,0,0,0,0}},},
	-- [24] = {{szName="X�ch L�n Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={3,0,0,0,0,0}},},
	-- [25] = {{szName="X�ch L�n H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={10,0,0,0,0,0}},},
	-- [26] = {{szName="X�ch L�n Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.03,tbParam={7,0,0,0,0,0}},},
	-- [27] = {{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.6,nExpiredTime=43200},},
	-- [28] = {{szName="C�ng Hi�n L� bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [29] = {{szName="Ki�n Thi�t L� Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [30] = {{szName="Chi�n B� L� Bao",tbProp={6,1,30218,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [31] = {{szName="Bao D��c ho�n ",tbProp={6,1,910,1,0,0},nCount=1,nRate=15,nExpiredTime=20160},},
	-- [32] = {{szName="B�ch H� Tr�ng Luy�n Ng�c",tbProp={6,1,3187,1,0,0},nCount=1,nRate=3},},
	-- [33] = {{szName="M�c B�c Truy�n T�ng L�nh",tbProp={6,1,1448,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},},
	-- [34] = {{szName="V� L�m M�t T�ch",tbProp={6,1,26,1,0,0},nCount=1,nRate=5},},
	-- [35] = {{szName="T�y T�y Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=5},},
	-- [36] = {{szName="Thi�n Linh ��n",tbProp={6,1,3022,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
	-- [37] = {{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
	-- [38] = {{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
	-- [39] = {{szName="Qu� Ho�ng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
}

local tbNpcInfo = 
{
	[1] = {1873,"Tr��ng Tuy�n",},		
	[2] = {1874,"Kim Th� L��ng",},		
	[3] = {1875,"M� Dung To�n",},		
}

function checkNpc(nNpcIndex)
	local nNpcId = GetNpcSettingIdx(nNpcIndex)
	local szName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szName = NpcName2Replace(szName)
	end
	
	for i=1,getn(%tbNpcInfo) do	
		local szNpcName = %tbNpcInfo[i][2]
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end 
		if (szNpcName == szName) and (nNpcId == %tbNpcInfo[i][1]) then
			return 1
		end
	end
	return 0
end

function addNews(nNpcIndex, nPlayerIndex)
	local szName = GetName(nPlayerIndex)
	if NpcName2Replace then
		szName = NpcName2Replace(szName)
	end
	
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local szNews = format("��i hi�p <color=yellow>%s<color> t�i <color=yellow>%s<color> �� ti�u di�t th�nh c�ng <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),szNpcName)
	AddGlobalNews(szNews)
end

function goldbossdeath(nNpcIndex, nPlayerIndex)
--	print("boss ���� " .. GetNpcName(nNpcIndex))
	if checkNpc(nNpcIndex) ~= 1 then
		return 
	end
	
	addNews(nNpcIndex, nPlayerIndex)
	--Thay ��i ph�n th��ng - Modified by DinhHQ - 20111009
	local tbItemAward = 
	{
		[1873] = {szName="Thi�n Linh ��n",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1874] = {szName="Thi�n Linh ��n",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1875] = {szName="Thi�n Linh ��n",tbProp={6,1,3022,1,0,0},nCount = 30, nExpiredTime = 7 * 24 * 60},
	}
	--B�  ph�n th��ng Thi�n Chi R��ng - Modified by DinhHQ - 20111009
--	local tbOtherAward = 
--	{
--		[1873] = {90, 30},
--		[1874] = {94.825, 30},
--		[1875] = {94.825, 40},
--	}
	
	local nKind = GetNpcParam(nNpcIndex, 1)
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,tbItemAward[nKind],format("killed_%s",szNpcName))
	--B�  ph�n th��ng Thi�n Chi R��ng - Modified by DinhHQ - 20111009
--	local nRate = random(1,10000) / 100
--	if nRate <= tbOtherAward[nKind][1] then
--		local tbTeam = getPlayerTeam()
--		addTianzhibaoxiang(tbOtherAward[nKind][2], nNpcIndex, tbTeam)
--	else
--		tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbEquiptAward[nKind],format("killed_%s",szNpcName))
--	end
	--Change boss award 2013- Modified by ThanhLD - 20130417
	--admin off	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbDropItem,format("killed_%s",szNpcName))	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbEquiptAward[nKind],format("killed_%s",szNpcName))
	--Ph�n th��ng exp
	local tbAwardExp = {
		["Killer"] = {nExp = 20e6, szName = "�i�m kinh nghi�m"},
		["Around"] = {nExp = 10e6, szName = "�i�m kinh nghi�m"},
	}
	nOldPlayer = PlayerIndex	
	--Ph�n th��ng nguy�n li�u kinh m�ch cho ng��i gi�t boss
	if CalcFreeItemCellCount() >= 1 then
		local tbMeridanMaterial = {szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=6,nBindState=-2}
		tbAwardTemplet:Give(tbMeridanMaterial, 1, {"KinhMach", "TieuDietBossHKMoiNhanNguyenLieu"})
	end
	local nTeamSize = GetTeamSize();	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "Ph�n th��ng exp cho t� ��i ti�u di�t "..szNpcName})
		end
	else		
		tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "Ph�n th��ng exp cho ng��i ti�u di�t "..szNpcName})
	end
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);	
	for i=1,nCount do	
		PlayerIndex = tbRoundPlayer[i]
		tbAwardTemplet:Give(tbAwardExp["Around"], 1, {"DCPhanThuongBoss", "Ph�n th��ng exp cho ng��i ��ng g�n "..szNpcName})
	end
	PlayerIndex = nOldPlayer
end

function getPlayerTeam()
	local tbTeam = {}
	local nTeamSize = GetTeamSize()
	if nTeamSize == 0 then
		tinsert(tbTeam, PlayerIndex)
	else
		for i = 1, nTeamSize do
			local nPlayerIndex = GetTeamMember(i)
			tinsert(tbTeam, nPlayerIndex)
		end
	end
	return tbTeam
end

function addTianzhibaoxiang(nCount, nNpcIndex, tbTeam)
	local tbTianzhibaoxiang = 
	{
		szName = "R��ng Thi�n Chi", 
		nLevel = 95,
		nNpcId = 1876,
		nIsboss = 0,
		nTime = 5 * 60,		-- ����ʱ�� 5 ����
		szScriptPath = "\\script\\missions\\boss\\goldboss_adjust_2011\\tianzhibaoxiang.lua",
	}
	local nNpcX,nNpcY,nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	tbTianzhibaoxiang.tbNpcParam = tbTianzhibaoxiang.tbNpcParam or {}
	tbTianzhibaoxiang.tbNpcParam[1] = GetLocalTime()		-- �õ�������ʱ��
	tbTianzhibaoxiang.tbNpcParam[2] = getn(tbTeam)
	for i=1, getn(tbTeam) do
		tbTianzhibaoxiang.tbNpcParam[i+2] = tbTeam[i]
	end
	
	local nRow = 6
	local nOffset = 3 * 32
	-- �м�Ԥ��һ��λ�÷������鵤�������ڼ������ʾ����ʱ������������Ҫ+1
	local nClow = floor(nCount / nRow) + 1
	local nMidRow = floor(nRow / 2)
	local nMidClow = floor(nClow / 2)
	local nStartX = nNpcX - nMidRow * nOffset
	local nStartY = nNpcY - nMidClow * nOffset
	
	-- ÿ��6�����䣬��boss������λ��Ϊ���ĳɾ�������
	for j=1, nClow do
		for i=1, nRow do
			if nCount > 0 then
				-- ����λ����ʾ���鵤�������ñ���
				if j ~= nMidClow or i ~= nMidRow then
					local x = nStartX + i * nOffset
					local y = nStartY + j * nOffset
					basemission_CallNpc(tbTianzhibaoxiang, nMapId, x, y)
					nCount = nCount - 1
				end
			else
				break
			end
		end
	end	
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end

function register()
	for i=1,getn(%tbNpcInfo) do	
		local szNpcName = %tbNpcInfo[i][2]
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end 
		EventSys:GetType("NpcDeath"):Reg(szNpcName, goldbossdeath)
	end
end

register()