Include("\\script\\dailogsys\\dailogsay.lua")

Include("\\script\\changefeature\\equip_tryon.lua")
tbFeatureNpc = {}


function tbFeatureNpc:SelectType()
	local szTitle = "Xin h�y ch�n v� tr�"
	
	
	local tbOpt = {}
	
	for key , value in tbEquipTryOn.tbTemplate do
		tinsert(tbOpt, {key, value.DailogMenu, {value, 1}})
	end
	
	tinsert(tbOpt, {"Tr� l�i", self.Dialog, {self}})
	tinsert(tbOpt, {"K�t th�c ��i tho�i"})
	
	CreateNewSayEx(szTitle, tbOpt)
end
	
function tbFeatureNpc:Dialog()
	
	local szTitle = "Xin ch�o ��i hi�p, l�o phu c� th� gi�p g� ���c?"
	local tbOpt = 
	{
		{"Xem tr��c ngo�i h�nh trang b�", self.SelectType, {self}},
		{"Thay ��i ngo�i h�nh trang b� �ng � nh�t cho trang b�", self.InjectToItem, {self}},
		{"X�a hi�u �ng hi�n t�i", RestoreOwnFeature},
		{"L�m th� n�o �� thay ��i ngo�i h�nh trang b�",  self.Explain, {self}},
		{"Nh�n ti�n gh� qua th�i"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbFeatureNpc:Explain()
	local szTitle = "B�n ti�m c� th� t�o ra 'ngo�i h�nh trang b�' theo nh� � mu�n, thu th�p �� nguy�n li�u c�n thi�t nh� tinh luy�n th�ch v� trang b� c�n thay ��i �em ��n cho l�o phu th� ta s� gi�p ng��i thay ��i ngo�i h�nh trang b� nh� � mu�n. N�n nh� ta ch� gi�p ng��i thay ��i ngo�i h�nh trang b� m� kh�ng thay ��i �� m�nh y�u c�a trang b� ��u nh�."
	local tbOpt = 
	{
		{"Tr� l�i", self.Dialog, {self}},
		{"K�t th�c ��i tho�i"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbFeatureNpc:InjectToItem()
	local szTitle = "Xin h�y ch�n v� tr�"
	
	
	local tbOpt = {}
	
	for key , value in tbEquipTryOn.tbTemplate do
		tinsert(tbOpt, {key, value.AskFeatureNo, {value}})
	end
	
	tinsert(tbOpt, {"Tr� l�i", self.Dialog, {self}})
	tinsert(tbOpt, {"K�t th�c ��i tho�i"})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function main()
	return tbFeatureNpc:Dialog()
end