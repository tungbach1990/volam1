-- Created by fangjieying 2003-5-17
-- ����������ì����
-- ѧ�Ἴ�� ������
-- ���̣�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(361)
	if(party ~= "tianren") then							-- ��������
		Msg2Player("B�n nghi�n c�u V�n Long K�ch - M�u Ph�p ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- �����̵�δ��80��
		Msg2Player("B�n nghi�n c�u V�n Long K�ch - M�u Ph�p ���c n�a ng�y, l�nh ng� ���c r�t �t. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� V�n Long K�ch - M�u Ph�p, nh�ng v�n ch�a h�c ���c g�. ")
		return 1
	else
		AddMagic(361,1)										-- ѧ�Ἴ��
		Msg2Player("H�c ���c k� n�ng V�n Long K�ch. ")
		return 0
	end
end