-- �ļ�������yinyanghuoxuewan.lua
-- �����ߡ���wangjingjun
-- ���ݡ�����������Ѫ��
-- ����	   ��ȫ��+ 25% ����+ 500 �� ����+ 500 �� ����+ 20% ��Чʱ��15����
-- ����ʱ�䣺2011-07-15 14:34:59

function main(nItemIndex)
	local nTime = 15 * 60 *18
	local tbSkill = { 1121,256,259,257,}

	for i=1,getn(tbSkill) do
		AddSkillState(tbSkill[i], 1, 1, nTime)
	end	
	Msg2Player("Ng��i �� s� d�ng" .. "�m D��ng Ho�t Huy�t ��n") 
	return 
end