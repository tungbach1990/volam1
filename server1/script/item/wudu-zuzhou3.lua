-- Created by fangjieying 2003-5-17
-- ���嶾���䡤������
-- ѧ�Ἴ�ܶϽ��
-- �嶾��80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(390) 
	if(party ~= "wudu") then							-- �����嶾
		Msg2Player("B�n nghi�n c�u Ng� ��c Nhi�p T�m Thu�t - Quy�n 3 ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- ���嶾��δ��80��
		Msg2Player("B�n nghi�n c�u Ng� ��c Nhi�p T�m Thu�t - Quy�n 3 ���c n�a ng�y, l�nh ng� ���c r�t �t. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� Ng� ��c Nhi�p T�m Thu�t - Quy�n 3, nh�ng v�n ch�a h�c ���c g�. ")
		return 1
	else
		AddMagic(390,0)										-- ѧ�Ἴ��
		Msg2Player("H�c ���c k� n�ng �o�n C�n h� C�t. ")
		return 0
	end
end