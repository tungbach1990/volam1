Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
DATE_START	= 20111124
DATE_END	= 20111201
tbVnShop = {}
tbVnShop.tbFormula = 
{
	szComposeTitle = "Mua h�t gi�ng hoa h�ng",
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 1,
	tbMaterial = 
		{
			{szName="Ng�n l��ng",nJxb=300000, nCount = 1},
		},
	tbProduct = {szName = "H�t gi�ng hoa h�ng", tbProp = {6,1,30156,1,0,0}, nExpiredTime = 20111201},
}

function tbVnShop:Main()
	if self.IsAcitve() == 1 then
		self:ComposeItem()
	else
		Talk(1, "", "Hi�n t�i ta kh�ng c�n h�t gi�ng hoa h�ng n�o c�, xin ��i hi�p th� l�i!")
	end	
end

function tbVnShop:ComposeItem()
	pCompos = tbActivityCompose:new(self.tbFormula, "MuaHatGiongHoaHong");
	pCompos:ComposeDailog(1);
end

function tbVnShop:IsAcitve()
	local now = tonumber(date("%Y%m%d"));
	if (now >= DATE_END or now < DATE_START) then
		return 0;
	end
	return 1;	
end

local pEventType = EventSys:GetType("AddNpcOption")
if tbVnShop:IsAcitve() == 1 then
	nId = pEventType:Reg("H�ng rong", "Mua h�t gi�ng hoa h�ng", tbVnShop.Main,{tbVnShop})
end	