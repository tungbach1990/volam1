Include("\\script\\lib\\baseclass.lua");
Include("\\script\\lib\\compose_jinnang.lua");
Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua");

if not tbJiefang0904_jiu then
	tbJiefang0904_jiu = tbBaseClass:new()
end

tbFormulaList = 
{
	[1] =
	{
		nFreeItemCellLimit = 1,
		szFailMsg = "S� l��ng kh�ng ��, t�p h�p cho �� r�i quay l�i nh�!",
		tbMaterial = 
		{
			{szName="Bao g�o", 	tbProp={6, 1, 2010, 1, 0, 0}, nCount = 2},
			{szName="N��c tinh khi�t", 	tbProp={6, 1, 2011, 1, 0, 0}, nCount = 3},
			{szName="Men r��u", 	tbProp={6, 1, 2012, 1, 0, 0}, nCOunt = 1},
			{nJxb=30000},
		},
		tbProduct = 
		{
			szName="B�u r��u",	tbProp={6, 1, 2013, 1, 0, 0},	nExpiredTime = 20090608,
		},
	},
	[2] =
	{
		nFreeItemCellLimit = 1,
		szFailMsg = "S� l��ng kh�ng ��, t�p h�p cho �� r�i quay l�i nh�!",
		tbMaterial = 
		{
			{szName="Bao g�o", 	tbProp={6, 1, 2010, 1, 0, 0}, nCount = 2},
			{szName="N��c tinh khi�t", 	tbProp={6, 1, 2011, 1, 0, 0}, nCount = 3},
			{szName="Men r��u", 	tbProp={6, 1, 2012, 1, 0, 0}, nCOunt = 1},
			{szName="Nho t��i", 	tbProp={6, 1, 2007, 1, 0, 0}, nCOunt = 1},
		},
		tbProduct = 
		{
			szName="R��u nho",	tbProp={6, 1, 2014, 1, 0, 0},	nExpiredTime = 20090608,
		},
	},
}

function tbJiefang0904_jiu:OnDailogMain(nItemIndex, szDescLink)
	if self:IsActDate() ~= 1 then
		return Talk(1, "", "Ho�t ��ng �� k�t th�c.")
	end
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	self:MakeComposeClas(%tbFormulaList)
	local tbSay = self.tbComposeList:MakeOptByProductName("��i", nItemIndex, szDescLink)
	local szTitle	= "<dec>"..szDescLink.."L� quan: Ho�t ��ng �R��u m�ng th�ng l�i� di�n ra t� ng�y 28-04-2009 ��n 24:00 31-05-2009. Trong th�i gian ho�t ��ng, ��i hi�p c� th� thu th�p �T�i m�ng chi�n th�ng� �� nh�n ���c �Bao g�o�,�N��c tinh khi�t�,�Men r��u�,v� mua �Nho t��i� trong K� Tr�n C�c n�u c�n . ��i hi�p c� th� d�ng c�c nguy�n li�u n�y �� ��i l�y B�u r��u v� R��u nho �� nh�n ���c ph�n th��ng �i�m kinh nghi�m v� c�c v�t ph�m c� gi� tr�. Nh�ng h�y nh� k�:��ng u�ng r��u qu� nhi�u s� c� h�i cho s�c kh�e.";
	
	
	tinsert(tbSay , 1, szTitle);
	tinsert(tbSay , getn(tbSay)+1, "K�t th�c ��i tho�i/OnCancel");
	CreateTaskSay(tbSay)
--	if tbItemJingnianshijian then
--		 tbItemJingnianshijian:ReduceUseCount(nItemIndex)
--	end
	
end

function tbJiefang0904_jiu:MakeComposeClas(tbFormulaList)
	if  type(self.tbComposeList) ~= "table" then
		self.tbComposeList = tbComposeListForJinNang:new("tbJiefang0904_jiu_Compose", tbFormulaList)
	end
end


function tbJiefang0904_jiu:IsActDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"));
	return (jf0904_act_dateS <= nCurDate and nCurDate < jf0904_act_dateE);
end

function OnCancel()
end