--Created by fangjieying 2003-5-17
--��ؤ���Ʒ���
--ѧ��������켼��
--ؤ�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(357)
	if(party ~= "gaibang") then							-- ����ؤ��
		Msg2Player("B�n nghi�n c�u quy�n C�i Bang C�n Ph�p ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- ��ؤ�ﵫδ��80��
		Msg2Player("B�n nghi�n c�u quy�n C�i Bang C�n Ph�p ���c n�a ng�y, l�nh ng� ���c r�t �t, kh�ng hi�u qu�. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� quy�n C�i Bang C�n Ph�p, nh�ng v�n ch�a h�c ���c g�. ")
		return 1
	else
		AddMagic(357,1)
		Msg2Player("H�c ���c k� n�ng Phi Long T�i Thi�n ")
		return 0
	end
end