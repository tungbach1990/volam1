--Created by fangjieying 2003-5-17
--�����ֹ����������
--ѧ���ɨǧ������
--���֣�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(319)
	if(party ~= "shaolin") then							-- ��������
		Msg2Player("B�n nghi�n c�u Thi�u L�m C�n Ph�p - Quy�n 2 ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- �����ֵ�δ��80��
		Msg2Player("B�n nghi�n c�u Thi�u L�m C�n Ph�p - Quy�n 2 ���c n�a ng�y, l�nh ng� ���c r�t �t. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� Thi�u L�m C�n Ph�p - Quy�n 2, nh�ng v�n ch�a h�c ���c g�. ")
		return 1
	else
		AddMagic(319,1)										-- ѧ�Ἴ��
		Msg2Player("H�c ���c k� n�ng Ho�nh T�o Thi�n Qu�n. ")
		return 0
	end
end