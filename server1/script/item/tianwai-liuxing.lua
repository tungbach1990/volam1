-- Created by fangjieying 2003-5-17
-- �����ǡ�������
-- ѧ�Ἴ����������
-- ���̣�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(362)
	if(party ~= "tianren") then							-- ��������
		Msg2Player("B�n nghi�n c�u L�u Tinh - �ao ph�p  ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- �����̵�δ��80��
		Msg2Player("B�n nghi�n c�u L�u Tinh - �ao ph�p  ���c n�a ng�y, l�nh ng� ���c r�t �t. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� L�u Tinh - �ao ph�p, nh�ng v�n ch�a h�c ���c g�. ")
		return 1
	else
		AddMagic(362,1)										-- ѧ�Ἴ��
		Msg2Player("H�c ���c k� n�ng Thi�n Ngo�i L�u Tinh. ")
		return 0
	end
end