-- �ļ�������teshubaijuwanlibao.lua
-- �����ߡ���wangjingjun
-- ���ݡ���������׾��� ������������׾���
-- ����ʱ�䣺2011-07-12 11:17:19

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "��i B�ch C�u Ho�n ��c Bi�t", tbProp = {6,1,1157,1,0,0}, nCount = 3},	
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
	tbAwardTemplet:GiveAwardByList(%tbAward, "S� d�ng L� Bao ��i B�ch C�u Ho�n ��c Bi�t", 1)
	return 0
end