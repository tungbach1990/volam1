--Created by fangjieying 2003-5-17
--��Ԧ������
--ѧ�����ɴ�Ǽ���
--���أ�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(394)   
	if(party ~= "kunlun") then							-- ��������
		Msg2Player("B�n nghi�n c�u Ng� T�m Thu�t ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- �����ص�δ��80��
		Msg2Player("B�n nghi�n c�u Ng� T�m Thu�t ���c n�a ng�y, l�nh ng� ���c r�t �t. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� Ng� T�m Thu�t, nh�ng v�n ch�a h�c ���c g�. ")
		return 1
	else
		AddMagic(394,0)  
		Msg2Player("H�c ���c k� n�ng T�y Ti�n T� C�t. ")
		return 0
	end
end