-- Created by fangjieying 2003-5-17
-- ���嶾�Ʒ�����һ��
-- ѧ�Ἴ������ʴ��
-- �嶾��80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(353)
	if(party ~= "wudu") then							-- �����嶾
		Msg2Player("B�n nghi�n c�u Ng� ��c Ch��ng Ph�p - Quy�n 1 ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- ���嶾��δ��80��
		Msg2Player("B�n nghi�n c�u Ng� ��c Ch��ng Ph�p - Quy�n 1 ���c n�a ng�y, l�nh ng� ���c r�t �t. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� Ng� ��c Ch��ng Ph�p - Quy�n 1, nh�ng v�n ch�a h�c ���c g�. ")
		return 1
	else
		AddMagic(353,1)										-- ѧ�Ἴ��
		Msg2Player("H�c ���c k� n�ng �m Phong Th�c C�t. ")
		return 0
	end
end