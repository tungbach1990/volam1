Include("\\script\\event\\other\\caipiao\\head_gs.lua")


function main()
	
	
	
	if tbCaiPiao:UseCailuLimit() ~= 1 then
		return 1
	end
	
	local nWidth, nHeight, nCount = 1,1,2
	--�жϱ����ռ�
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Talk(1, "", format("�� b�o ��m t�i s�n c�a ��i hi�p, xin h�y �� tr�ng %d %dx%d h�nh trang", nCount, nWidth, nHeight))
		return 1
	end
	
	tbAwardTemplet:GiveAwardByList(tbCaiPiao.tbTicket, "use cailuhongbao", 2)
	TaskManager:AddTask(tbCaiPiao.TSKG_ID, tbCaiPiao.TSK_USE_CAILU, 1)
	return 0
end