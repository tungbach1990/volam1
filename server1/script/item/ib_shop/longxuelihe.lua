-- �ļ�������longxuelihe.lua
-- �����ߡ���wangjingjun
-- ���ݡ�������Ѫ��� ʹ�ÿɻ��
-- ����ʱ�䣺2011-07-11 11:54:21

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "Long Huy�t Ho�n", tbProp = {6,1,2117,1,0,0}, nCount = 3},	
	{szName = "T�ng Kim Phi T�c ho�n", tbProp = {6,1,190,1,0,0}, nCount = 5},
	{szName = "T�ng Kim Ngo�i Ph� ho�n", tbProp = {6,1,178,1,0,0}, nCount = 5},	-- ��ƷID��ȷ��
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nCount, nWidth, nHeight))
		return 1
	end
	-- �жϱ����ռ�
	tbAwardTemplet:GiveAwardByList(%tbAward, "S� D�ng Long Huy�t L� H�p", 1)
	return 0
end