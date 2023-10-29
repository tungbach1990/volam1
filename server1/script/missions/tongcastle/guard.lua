Include("\\script\\missions\\tongcastle\\tongcastle.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local tbUseMapInfo = {
	[978] = {1, 1},
	[979] = {2, 11},
	[980] = {3, 162},
	[981] = {4, 37},
	[982] = {5, 78},
	[983] = {6, 80},
	[984] = {7, 176},
}

local tbGuardType = {
	[1] = {nNpcId = 1908, szName = "B�ng ��ng Th� V�", nNpcParam = 4,},
	[2] = {nNpcId = 1909, szName = "Huy�n V�ng Th� V�", nNpcParam = 5,},
	[3] = {nNpcId = 1910, szName = "T� H�ng Th� V�", nNpcParam = 6,},
	[4] = {nNpcId = 1911, szName = "H�a T��ng Th� V�", nNpcParam = 7,},
}

function CheckNearTreeNpc()
	local tbNpc, nCount = GetAroundNpcList(15)
	for i = 1, nCount do 
		local nNpcParam = GetNpcParam(tbNpc[i], 1)
		local nTmpCamp = GetTmpCamp(tbNpc[i])
		if  nNpcParam >= 1 and nNpcParam <= 3 and nTmpCamp == 1 then
			return 1
		end
	end
end

function CallGuard(nType, nItemIndex)
	local nNpcSettingId = %tbGuardType[nType].nNpcId
	local szName = %tbGuardType[nType].szName
	local nNpcParam = %tbGuardType[nType].nNpcParam
	local nX32, nY32, nMapIndex =  GetPos()
	local nMapId = SubWorldIdx2ID(nMapIndex)
	
	if %tbUseMapInfo[nMapId] == nil then
		Talk(1, "", "��a �� hi�n t�i kh�ng th� tri�u h�i Th� V�")
		return
	end
	local nCity = %tbUseMapInfo[nMapId][1]
	local szCityTongName = GetCityOwner(nCity)
	local szTongName = GetTongName()
	if szCityTongName ~= szTongName then
		Talk(1, "", "Ng��i ch� c� th� tri�u h�i Th� V� t�i bang chi�m th�nh c�a m�nh")
		return
	end
	if TongCastle:GuardIsLimit(nMapId) ~= 1 then
		Talk(1, "", "Th� V� �� v��t gi�i h�n, kh�ng th� tri�u h�i")
		return
	end
	
	if CheckNearTreeNpc() ~= 1 then
		Talk(1, "", "Ch� c� th� tri�u h�i Th� V� g�n ch� Th�n M�c")
		return 
	end
	
	local tbNpc = {
		nNpcId = nNpcSettingId,
		szName = szName,
		nLevel = 90,
		nIsboss = 1,
		bNoRevive = 1,
		tbNpcParam = {nNpcParam,},
	}
	local nNewNpcIndex = TongCastle:basemission_CallNpc(tbNpc, nMapId, nX32, nY32)
	local nStackCount = GetItemStackCount(nItemIndex)
	if nStackCount > 1 then
		SetItemStackCount(nItemIndex, nStackCount - 1)
	else
		RemoveItemByIndex(nItemIndex)
	end
	if nNewNpcIndex > 0 then
		SetTmpCamp(1, nNewNpcIndex)
		TongCastle:RegANpc(nMapId, nNpcParam, 0, nNewNpcIndex, GetNpcId(nNewNpcIndex))
	end
end

function main(nItemIndex)
	local szTitle = "Ch�nTh� V� m� ng��i mu�n tri�u h�i"
	local tbOpt = 
	{
		{"Tri�u h�i B�ng ��ng Th� V�", CallGuard, {1, nItemIndex}},
		{"Tri�u h�i Huy�n V�ng Th� V�", CallGuard, {2, nItemIndex}},
		--{"�ٻ��Ⱥ�����", CallGuard, {3, nItemIndex}},
		{"Tri�u h�i H�a T��ng Th� V�", CallGuard, {4, nItemIndex}},
		{"K�t th�c ��i tho�i"}
	}
	CreateNewSayEx(szTitle, tbOpt)
	return 1
end