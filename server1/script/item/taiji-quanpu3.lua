-- Created by fangjieying 2003-5-17
-- ��̫��ȭ�ס�������
-- ѧ�Ἴ�� ����޼�
-- �䵱��80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(365)
	if(party ~= "wudang") then							-- �����䵱
		Msg2Player("B�n nghi�n c�u Th�i C�c Ki�m Ph� - Quy�n 3 ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- ���䵱��δ��80��
		Msg2Player("B�n nghi�n c�u Th�i C�c Ki�m Ph� - Quy�n 3 ���c n�a ng�y, l�nh ng� ���c r�t �t. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� Th�i C�c Ki�m Ph� - Quy�n 3, nh�ng v�n ch�a h�c ���c g�. ")
		return 1
	else
		AddMagic(365,1)	
		Msg2Player("H�c ���c k� n�ng Thi�n ��a V� C�c. ")
		return 0
	end
end