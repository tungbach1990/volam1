--Edit by Youtube  PGaming--

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\progressbar.lua")

IncludeLib("ITEM")

MAXCOUNT = 1

GccPos = {{39360,103904},}; --{{1230*32,3247*32},};

local ItemAward = {
	{szName="Thanh Li�t Tuy�n Th�y",tbProp={6,1,3943,0,0,0},nCount=1, nBindState=-2},
	
}
local _GetFruit = function(nItemIndex)
	tbAwardTemplet:Give(%ItemAward, 1)
	ConsumeEquiproomItem(1,6,1,3942,-1)
	SetTask(169,12)	
end
local _OnBreak = function()
	Msg2Player("Qu� tr�nh m�c n��c b� ��t �o�n")
end
function main(nItemIdx)
	local G,D,P,nLevel = GetItemProp(nItemIdx);
	if (G ~= 6) then
		return 1;
	end

	w,x,y=GetWorldPos()
	
	--PosId = GetNearstPos(x*32,y*32, GccPos);
	PosId = IsNear(x*32,y*32, GccPos);
	if (PosId == 0) then 
		Msg2Player("H�y ��n g�n con su�i � ph�i Hoa S�n <color=red>153/202<color> �� m�c n��c.") 
		return 1
	end;	

	if CalcFreeItemCellCount() < 6 then
		CreateTaskSay({"Xin h�y s�p x�p l�i h�nh trang! Nh� �� tr�ng 6 � tr� l�n nh�!",  "���c r�i./Cancel",});
		return 1;
	end
	if P == 3942 then 
		tbProgressBar:OpenByConfig(6, %_GetFruit,{nItemIdx}, %_OnBreak)
	end
	return 1
end

function IsNear(X,Y,PosTab)
	for i = 1, getn(PosTab) do
		Dist = sqrt( (X-PosTab[i][1]) * (X-PosTab[i][1]) + (Y - PosTab[i][2]) * (Y - PosTab[i][2]))
		--Msg2Player("Kho�ng c�ch ��n th�c n��c l� "..Dist)
		if Dist <= 400 then
			return 1
		end
	end
	return 0
end

function GetNearstPos(X,Y, PosTab)
	PosCount = getn(PosTab);
	PosId = 0;
	MaxDist = 999999999;

	BeyondCount = 0;---gi do

	for i = 1, PosCount do 
		Dist = sqrt( (X-PosTab[i][1]) * (X-PosTab[i][1]) + (Y - PosTab[i][2]) * (Y - PosTab[i][2]))
		if (Dist >= 250) then 
			BeyondCount = BeyondCount + 1;
		end;
		if (i == 1) then 
			PosId = 1
			MaxDist = Dist
		elseif (MaxDist > Dist) then 
			PosId = i
			MaxDist = Dist
		end
	end;

	if (BeyondCount >= PosCount) then
		return 0
	else
		return PosId;
	end;
end
