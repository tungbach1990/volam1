Include("\\script\\changefeature\\equip_tryon.lua")

local tb = tbEquipTryOn:NewTemplate("Kh�i gi�p")



tb.szFile_Male = "\\settings\\changefeature\\armor_male.txt"
tb.szFile_Female = "\\settings\\changefeature\\armor_female.txt"


function tb:TryOn(nNo)
	self:ChangeFeature(-1, nNo,-1,-1)
end

function tb:CheckEquip(nItemIndex)
	
	local nG, nD,nP = GetItemProp(nItemIndex)
	local nQuality = GetItemQuality(nItemIndex)
	if nQuality ~= 1 and nQuality ~= 4 then
		Talk(1, "", "��y kh�ng ph�i l� trang b� ho�ng kim.")
		return
	end
	if nG ~= 0 then
		Talk(1, "", "��y kh�ng ph�i l� trang b�")
		return 
	end
	if nD ~= 2 then
		Talk(1, "", "Trang b� n�y kh�ng ph�i l� kh�i gi�p.")
		return 
	end
	return 1
end
tb:LoadFile()