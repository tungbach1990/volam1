-- H�p M�t n� Chi�n tr��ng V��ng Gi�
-- By: ThanhLD (20130607)
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	if (CalcFreeItemCellCount () <1) then
		Talk(1,"","H�nh trang kh�ng �� ch� tr�ng, h�y ch�a �t nh�t 1 � tr�ng trong h�nh trang")
		return 1
	end
	local tbMaskKing = {
									{szName="M�t n� chi�n tr��ng V��ng Gi� - Thi�u L�m", tbProp={0,11,648,1,0,0}, nRate=10,nExpiredTime= 10080, nCount = 1},	
									{szName="M�t n� chi�n tr��ng V��ng Gi� - Thi�n V��ng", tbProp={0,11,649,1,0,0}, nRate=10, nExpiredTime= 10080, nCount = 1},	
									{szName="M�t n� chi�n tr��ng V��ng Gi� - Ng� ��c", tbProp={0,11,650,1,0,0}, nRate=10, nExpiredTime= 10080, nCount = 1},	
									{szName="M�t n� chi�n tr��ng V��ng Gi� - ���ng M�n", tbProp={0,11,651,1,0,0}, nRate=10, nExpiredTime= 10080, nCount = 1},	
									{szName="M�t n� chi�n tr��ng V��ng Gi� - Nga Mi", tbProp={0,11,652,1,0,0}, nRate=10, nExpiredTime= 10080, nCount = 1},
									{szName="M�t n� chi�n tr��ng V��ng Gi� - Th�y Y�n", tbProp={0,11,653,1,0,0}, nRate=10, nExpiredTime= 10080, nCount = 1},	
									{szName="M�t n� chi�n tr��ng V��ng Gi� - Thi�n Nh�n", tbProp={0,11,654,1,0,0}, nRate=10, nExpiredTime= 10080, nCount = 1},	
									{szName="M�t n� chi�n tr��ng V��ng Gi� - C�i Bang", tbProp={0,11,655,1,0,0}, nRate=10, nExpiredTime= 10080, nCount = 1},	
									{szName="M�t n� chi�n tr��ng V��ng Gi� - V� �ang", tbProp={0,11,656,1,0,0}, nRate=10, nExpiredTime= 10080, nCount = 1},	
									{szName="M�t n� chi�n tr��ng V��ng Gi� - C�n Lu�n", tbProp={0,11,657,1,0,0}, nRate=10, nExpiredTime= 10080, nCount = 1},	
								}
	tbAwardTemplet:Give(tbMaskKing, 1, {"EVENT_T6_2013", "SuDungHopMatNaChienTruongVuongGia"})	
	return 0	
end
