-- �ļ�������dabaijuwanlibao.lua
-- �����ߡ���wangjingjun
-- ���ݡ�������׾������ ����������׾���
-- ����ʱ�䣺2011-07-12 10:38:31

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "��i B�ch C�u ho�n", tbProp = {6,1,130,1,0,0}, nCount = 3},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 3
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nCount, nWidth, nHeight))
		return 1
	end
	-- �жϱ����ռ�
	tbAwardTemplet:GiveAwardByList(%tbAward, "S� d�ng ��i B�ch C�u Ho�n L� Bao", 1)
	return 0
end