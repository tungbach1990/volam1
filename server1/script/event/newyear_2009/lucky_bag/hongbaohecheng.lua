Include("\\script\\lib\\compose_jinnang.lua")

Include("\\script\\lib\\string.lua")

local hongbao_tbFormulaList = 
{
	[1] =
	{
		szFailMsg = "<color=red>Ch� d�ng m�y nguy�n li�u n�y th� kh�ng th� ��i ���c Th�nh V��ng H�ng Bao ���c, ng��i h�y �i t�m nguy�n li�u �� �i ��.<color>",
		nFreeItemCellLimit = 0.01,
		tbMaterial = 
		{
			{szName="Ph�c", tbProp={6, 1, 1912, 1, 0, 0}, nCount = 3},
			{szName="L�c", tbProp={6, 1, 1913, 1, 0, 0}, nCount = 3},
			{szName="Th�", tbProp={6, 1, 1914, 1, 0, 0}, nCount = 3},
			{nJxb = 8e4}
		},
		tbProduct = 
		{
			szName="Th�nh V��ng H�ng Bao", tbProp={6, 1, 1892, 1, 0, 0}, nExpiredTime = 20090223,
		},
	},
	[2] =
	{
		szFailMsg = "<color=red>Ch� d�ng m�y nguy�n li�u n�y th� kh�ng th� ��i ���c Ph�t T�i H�ng Bao, Ng��i h�y �i t�m �� nguy�n li�u tr��c �i ��!<color>",
		nFreeItemCellLimit = 0.01,
		tbMaterial = 
		{
			{szName="Ph�c", tbProp={6, 1, 1912, 1, 0, 0}, nCount = 2},
			{szName="L�c", tbProp={6, 1, 1913, 1, 0, 0}, nCount = 2},
			{szName="Th�", tbProp={6, 1, 1914, 1, 0, 0}, nCount = 2},
			{szName="L�c B�o Ch�u", tbProp={6, 1, 1891, 1, 0, 0}, nCount = 1},
		},
		tbProduct = 
		{
			szName="Ph�t T�i H�ng Bao", tbProp={6, 1, 1893, 1, 0, 0}, nExpiredTime = 20090223,
		}
	},
}

function newyear0901_hongbao_dialogmain(tbFormulaList, nItemIndex, szDescLink)
	
	if (newyear0901_hongbao_IsActDate() ~= 1) then
		return Talk(1, "", "Ho�t ��ng �� k�t th�c.")
	end
	
	tbFormulaList = tbFormulaList or %hongbao_tbFormulaList
	newyear0901_hongbao_MakeComposeClas(tbFormulaList)
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	
	local tbSay = newyear0901_hongbao_Compose:MakeOptByProductName("Ta mu�n ��i", nItemIndex, szDescLink);
	tinsert(tbSay , 1, "<dec>"..szDescLink.."Ho�t ��ng bao l� x� may m�n di�n ra t� ng�y 16-01-2009 ��n 15-02-2009. Trong th�i gian ho�t ��ng, ��i hi�p thu th�p Lam B�o R��ng �� nh�n ���c ch� Ph�c v� Th�; thu th�p H�ng B�o R��ng �� nh�n ch� L�c. ��i hi�p c� th� d�ng c�c ch� �� �� ��i l�y Th�nh V��ng H�ng Bao v� Ph�t T�i H�ng Bao �� nh�n ���c ph�n th��ng �i�m kinh nghi�m v� c�c v�t ph�m c� gi� tr�. ��c bi�t khi s� d�ng Ph�t T�i H�ng Bao s� thu ���c b� Ng� Qu� v� c� th� ��i nhi�u ph�n th��ng gi� tr� kh�c.");
	tinsert(tbSay , getn(tbSay)+1, "K�t th�c ��i tho�i/OnCancel");
	CreateTaskSay(tbSay);
end

function newyear0901_hongbao_IsActDate()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20090116 or nDate > 20090215) then
		return 0;
	else
		return 1;
	end
end


--ֻ�ڶԻ�ʱ����һ��
function newyear0901_hongbao_MakeComposeClas(tbFormulaList)
	if  type(newyear0901_hongbao_Compose) ~= "table" then
		local tbComposeList = tbComposeListForJinNang:new("newyear0901_hongbao_Compose", tbFormulaList)
	end
end
