-- Created by fangjieying 2003-5-17
-- ������������������
-- ѧ�Ἴ��׷���
-- ������80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(322)	
	if(party ~= "tianwang") then							-- ��������
		Msg2Player("B�n nghi�n c�u Thi�n V��ng �ao ph�p - Quy�n 3 ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- ��������δ��80��
		Msg2Player("B�n nghi�n c�u Thi�n V��ng �ao ph�p - Quy�n 3 ���c n�a ng�y, l�nh ng� ���c r�t �t. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� Thi�n V��ng �ao ph�p - Quy�n 3, nh�ng v�n ch�a h�c ���c g�. ")
		return 1
	else
		AddMagic(322,1)										-- ѧ�Ἴ�� 
		Msg2Player("H�c ���c k� n�ng Ph� Thi�n Tr�m. ")
		return 0
	end
end