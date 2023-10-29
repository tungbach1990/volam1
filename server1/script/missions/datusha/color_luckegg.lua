
IncludeLib("BATTLE");
Include("\\script\\item\\battles\\songjinskill.lua");

egg_tbAward	=
{
	{szName = "Kim Chi Chi�n H�n ", 	nRate = 0.05, tbSkill = {add466}},
	{szName = "M�c Chi Chi�n H�n ", 	nRate = 0.05, tbSkill = {add466}},
	{szName = "Th�y Chi Chi�n H�n ", 	nRate = 0.05, tbSkill = {add466, add469}},
	{szName = "H�a Chi Chi�n H�n ", 	nRate = 0.05, tbSkill = {add466, add468}},
	{szName = "Th� Chi Chi�n H�n ", 	nRate = 0.05, tbSkill = {add466, add467}},
	{szName = "Kim Chi H� gi�p  ", 	nRate = 0.05, tbSkill = {add474}},
	{szName = "M�c Chi H� gi�p  ", 	nRate = 0.05, tbSkill = {add477}},
	{szName = "Th�y Chi H� gi�p  ", 	nRate = 0.05, tbSkill = {add476}},
	{szName = "H�a Chi H� gi�p  ", 	nRate = 0.05, tbSkill = {add473}},
	{szName = "Th� Chi H� gi�p  ", 	nRate = 0.05, tbSkill = {add475}},
	{szName = "Kim Chi L�i Nh�n", 	nRate = 0.05, tbSkill = {add479, add487, add487_1}},	-- ???
	{szName = "M�c Chi L�i Nh�n", 	nRate = 0.05, tbSkill = {add480, add485}},
	{szName = "Th�y Chi L�i Nh�n", 	nRate = 0.05, tbSkill = {add481, add486}},
	{szName = "H�a Chi L�i Nh�n", 	nRate = 0.05, tbSkill = {add482}},
	{szName = "Th� Chi L�i Nh�n", 	nRate = 0.05, tbSkill = {add483}},
	{szName = "Ng� Hoa L� ", 	nRate = 0.05, tbSkill = {add472_1, add472_2, add490_1}},
	{szName = "H�u Ngh� Chi Nh�n ", 	nRate = 0.05, tbSkill = {add495}},
	{szName = "B�ch C�u H� uy�n", 	nRate = 0.05, tbSkill = {add496}},
	{szName = "T�t phong ngoa ", 	nRate = 0.05, tbSkill = {add493}},
	{szName = "Th�n b� v�t ph�m ", 	nRate = 0.05, tbSkill = {add466, add469, add468, add467, add474, add476, add477, add473, add475, add479, 
			add487, add487_1, add480, add485, add481, add486, add472_1, add472_2, add482, add483, add490_1, add493, add495, add496}},
}
egg_nTotalRate	= 100;

function main(nItemIndex)	
	local nRate		= random(egg_nTotalRate);
	local nNowRate	= 0;
	for i = 1, getn(egg_tbAward) do
		nNowRate = nNowRate + floor(egg_tbAward[i].nRate * egg_nTotalRate);
		if (nRate <= nNowRate) then
			egg_addskill(i);
			break;
		end
	end
end

function egg_addskill(nIndex)
	local nRate	= random(getn(egg_tbAward[nIndex].tbSkill));
	Msg2Player(format("Ch�c m�ng ng��i g�p ���c<color=yellow>%s<color>", egg_tbAward[nIndex].szName));
	egg_tbAward[nIndex].tbSkill[nRate]();
	
	WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\tAward:%s \tProbability:%d",
				"Tr�ng nhi�u m�u may m�n",
				GetLocalDate("%y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName(),
				egg_tbAward[nIndex].szName,
				egg_tbAward[nIndex].nRate));
end