-- �ļ�������luckybox.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-04-15 10:47:37
--��Ʒ�ϵ�˵�����֣��� ����������������ټ�������Ƭ��
--ʹ�÷������Ҽ����ʹ��
--ʹ�ý�ֹʱ�䣺2008��05��18��24��00��
Include("\\script\\lib\\awardtemplet.lua")
jiefang_0804_luckybox_Award = 
{
	{szName="M�nh c� 1", tbProp={6, 1, 1735, 1, 0, 0}, nRate = 50},
	{szName="M�nh c� 2", tbProp={6, 1, 1736, 1, 0, 0}, nRate = 30},
	{szName="M�nh c� 3", tbProp={6, 1, 1737, 1, 0, 0}, nRate = 15},
	{szName="M�nh c� 4", tbProp={6, 1, 1738, 1, 0, 0}, nRate = 5},
}
function main()
	if CalcFreeItemCellCount() < 1 then
		Say("T�i h�nh trang �� ��y, h�y d�n d�p h�nh trang �� b�o ��m an to�n cho v�t ph�m.",0)
		return 1;
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate > 20080518 then
		Say("V�t ph�m qu� h�n s� d�ng, t� ��ng m�t �i.", 0);
		return 0;
	end 
	tbAwardTemplet:GiveAwardByList(jiefang_0804_luckybox_Award, "use luckybox")
	return 0;
end