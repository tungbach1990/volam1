--Created by fangjieying 2003-5-17
--���ɵ����������Ӱ��
--ѧ�������Ӱ����
--���ţ�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(339)
	if(party ~= "tangmen") then							-- ��������
		Msg2Player("B�n nghi�n c�u Phi �ao Thu�t - Nhi�p H�n Nguy�t �nh ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- �����ŵ�δ��80��
		Msg2Player("B�n nghi�n c�u Phi �ao Thu�t - Nhi�p H�n Nguy�t �nh ���c n�a ng�y, l�nh ng� ���c r�t �t. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� Nhi�p H�n - T� Ch�, nh�ng v�n ch�a h�c ���c g�. ")
		return 1
	else
		AddMagic(339,1)
		Msg2Player("H�c ���c k� n�ng Nhi�p H�n Nguy�t �nh. ")
		return 0
	end
end