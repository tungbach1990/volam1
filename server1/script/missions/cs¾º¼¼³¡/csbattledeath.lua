Include("\\script\\missions\\csbattlelib\\csbattledeath.lua");
Include("\\script\\missions\\cs������\\���䳡head.lua");

function GetBonus()
	--�����Ѫƿ����ƿ
	if (random(0,1) == 1) then
		AddItem(1,0,0,2,0,0)
	else
		AddItem(1,1,0,2,0,0)
	end;
	Earn(MS_WIN_MONEY);
end;