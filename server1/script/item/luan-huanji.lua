--Create by yfeng 2004-3-15
--Modified by fangjieying 2003-5-17
--�����������һ�����
--ѧ���һ�������
--���ţ�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(351)
	if(party ~= "tangmen") then							-- ��������
		Msg2Player("B�n nghi�n c�u H�m T�nh thu�t - Lo�n Ho�n K�ch ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- �����ŵ�δ��80��
		Msg2Player("B�n nghi�n c�u H�m T�nh thu�t - Lo�n Ho�n K�ch ���c n�a ng�y, l�nh ng� ���c r�t �t, kh�ng hi�u qu�. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� H�m T�nh thu�t - Lo�n Ho�n K�ch, nh�ng v�n ch�a h�c ���c g�. ")
		return 1
	else
		AddMagic(351,0)
		Msg2Player("H�c ���c k� n�ng Lo�n Ho�n K�ch. ")
		return 0
	end
end