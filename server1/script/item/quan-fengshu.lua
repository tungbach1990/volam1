--Created by fangjieying 2003-5-17
--��Ԧ������
--ѧ���ѩХ�缼��
--���أ�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(372)
	if(party ~= "kunlun") then							-- ��������
		Msg2Player("B�n nghi�n c�u Ng� Phong Thu�t ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- �����ص�δ��80��
		Msg2Player("B�n nghi�n c�u Ng� Phong Thu�t ���c n�a ng�y, l�nh ng� ���c r�t �t. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� Ng� Phong Thu�t, nh�ng v�n ch�a h�c ���c g�. ")
		return 1
	else
		AddMagic(372,1)
		Msg2Player("H�c ���c k� n�ng Ng�o Tuy�t Ti�u Phong. ")
		return 0
	end
end