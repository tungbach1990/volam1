
local tbAward = 
{
	{nExp = 5e6},
	{
		{szName="Nh�t K� C�n Kh�n Ph�", tbProp={6, 1, 2126, 1, 0, 0}, nExpiredTime = 60*24*30, nRate = 0.5},
		{nExp = 5e7, nRate = 2},
		{szName="Th�n b� kho�ng th�ch", tbProp={6, 1, 398, 1, 0, 0}, nRate = 1.5},
	
		{szName="Thi�n tinh b�ch c�u ho�n", tbProp={6, 1, 2183, 1, 0, 0}, nRate = 4},
		{szName="B�ch C�u Ho�n ��c bi�t", tbProp={6, 1, 1157, 1, 0, 0}, nRate = 5, nExpiredTime = 60*24*7},
		
		{szName="Qu� Ho�ng Kim", tbProp={6, 1, 907, 1, 0, 0}, nRate = 6, nExpiredTime = 60*24*7},
		
		{nExp = 2e7, nRate = 10},
		{szName="T�y T�y Kinh", tbProp={6, 1, 22, 1, 0, 0}, nRate = 8},
	
		{szName="V� L�m M�t T�ch", tbProp={6, 1, 26, 1, 0, 0}, nRate = 8},
		{nExp = 1e7, nRate = 15},
		
		{szName="Huy�n tinh kho�ng th�ch c�p 8", tbProp={6, 1, 147, 8, 0, 0}, nRate = 20},
		{szName="Huy�n tinh kho�ng th�ch c�p 7", tbProp={6, 1, 147, 7, 0, 0}, nRate = 20},
	}
}
Include("\\script\\lib\\awardtemplet.lua")
function main()
	local nNpcIndex = GetLastDiagNpc()
	
	if GetNpcParam(nNpcIndex, 4) ~= 1 then
		SetNpcParam(nNpcIndex, 4, 1)
		tbAwardTemplet:GiveAwardByList(%tbAward, "�i�m b�o r��ng")
		DelNpc(nNpcIndex)
	else
		return
	end
end

