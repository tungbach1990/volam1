--Create by yfeng 2004-3-15
--Modified by fangjieying 2003-5-17
--��������������滨��
--ѧ�ᱩ���滨����
--���ţ�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(302)
	if(party ~= "tangmen") then							-- ��������
		Msg2Player("B�n c�m quy�n T� Ti�n Thu�t, B�o V� L� Hoa nghi�n c�u �� n�a ng�y, k�t qu� ch�ng l�nh ng� ���c g�. ")
		return 1
	elseif(GetLevel() < 80) then							-- �����ŵ�δ��80��
		Msg2Player("B�n c�m quy�n T� Ti�n Thu�t, B�o V� L� Hoa nghi�n c�u �� n�a ng�y, k�t qu� l�nh ng� ch�t �t. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� quy�n T� Ti�n Thu�t, B�o V� L� Hoa, nhung kh�ng r�t ra ���c g�. ")
		return 1
	else
		AddMagic(302,1)										-- ѧ�Ἴ��
		Msg2Player("H�c ���c k� n�ng 'B�o V� L� Hoa'. ")
		return 0
	end
end