-- Created by fangjieying 2003-5-17
-- �����̵�����
-- ѧ�Ἴ�ܱ�����Ӱ
-- ���̣�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(336)
	if(party ~= "cuiyan") then							-- ���Ǵ���
		Msg2Player("B�n c�m quy�n Th�y Y�n �ao ph�p  nghi�n c�u �� n�a ng�y, k�t qu� ch�ng l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- �Ǵ��̵�δ��80��
		Msg2Player("B�n c�m quy�n Th�y Y�n �ao ph�p  nghi�n c�u �� n�a ng�y, k�t qu� l�nh ng� ch�t �t. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n nghi�n c�u k� quy�n Th�y Y�n �ao ph�p, kh�ng r�t ra ���c g�. ")
		return 1
	else
		AddMagic(336,1)										-- ѧ�Ἴ��
		Msg2Player("H�c ���c k� n�ng B�ng T�ng V� �nh ")
		return 0
	end
end