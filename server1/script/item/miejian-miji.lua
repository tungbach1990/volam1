-- Created by fangjieying 2003-5-17
-- �����ؼ���
-- ѧ�Ἴ��������ѩ
-- ���ң�80�����Ͽ���
function main(sel)
	party = GetLastAddFaction()
	skill = HaveMagic(328)	
	if(party ~= "emei") then							-- ���Ƕ���
		Msg2Player("B�n nghi�n c�u Di�t Ki�m M�t T�ch ���c n�a ng�y, nh�ng v�n ch�a l�nh ng� ���c g�. ")
		return 1
	elseif(GetLever < 80) then							-- �Ƕ��ҵ�δ��80��
		Msg2Player("B�n nghi�n c�u Di�t Ki�m M�t T�ch ���c n�a ng�y, l�nh ng� ���c r�t �t. ")
		return 1
	elseif(skill ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� nghi�n c�u k� Di�t Ki�m M�t T�ch, nh�ng v�n ch�a h�c ���c g�. ")
		return 1
	else
		AddMagic(328,1)										-- ѧ�Ἴ��
		Msg2Player("H�c ���c k� n�ng Tam Nga T� Tuy�t. ")
		return 0
	end
end