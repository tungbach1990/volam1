-- H�p ch�a kh�a v�ng
-- By: ThanhLD (20130417)
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	if (CalcFreeItemCellCount () <1) then
		Talk(1,"","H�nh trang kh�ng �� ch� tr�ng, h�y ch�a �t nh�t 1 � tr�ng trong h�nh trang")
		return 1
	end
	local tbKeys = {szName = "Ch�a kh�a v�ng", tbProp = {6,1,30191,0,0,0}, nCount = 3}	
	tbAwardTemplet:Give(tbKeys, 1, {"TinhNangKey", "SuDungHopChiaKhoaVang"})	
	return 0	
end
