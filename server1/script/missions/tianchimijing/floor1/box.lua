Include("\\script\\lib\\awardtemplet.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if (GetNpcParam(nNpcIndex, 4) == 0 ) then
		GiveItem(nNpcIndex)
	end;
end

function GiveItem(nNpcIndex)
	
	local tbItemList = 
	{
		{szName="M�t c�y �ao g�",tbProp={6, 1, 2592, 1, 0, 0}, nExpiredTime = 30},
		{szName="M�t C�y Th��ng C�",tbProp={6, 1, 2593, 1, 0, 0}, nExpiredTime = 30},
		{szName="M�t C�y Ki�m C�.",tbProp={6, 1, 2594, 1, 0, 0}, nExpiredTime = 30},
	}
	
	local nId = random(1, getn(tbItemList))
	tbAwardTemplet:GiveAwardByList(tbItemList[nId] , "Nh�n ���c t� trong r��ng ��o c�");
	HideNpc(nNpcIndex, 180)
end