Include("\\script\\task\\newtask\\newtask_head.lua")

function main(nItemIdx)
	local _,_,detail = GetItemProp(nItemIdx)
	local nWorldMaps = nt_getTask(1027) -- ������������ж��ٸ�ɽ�����ͼ
	if (detail == 440) then
		-- ���������100��ɽ�����ͼ��Ƭ
		nWorldMaps = nWorldMaps + 100;
		nt_setTask(1027,nWorldMaps);
		Msg2Player("B�n nh�n ���c 100 m�nh b�n �� S�n H� X� T�c! Hi�n t�i b�n c� t�ng c�ng"..nWorldMaps.." m�nh b�n �� S�n H� X� T�c.");
	elseif (detail == 2514) then
		-- ���������1000��ɽ�����ͼ��Ƭ
		nWorldMaps = nWorldMaps + 1000;
		nt_setTask(1027,nWorldMaps);
		Msg2Player("��i hi�p nh�n ���c 1000 m�nh b�n �� s�n h� x� t�c! T�ng c�ng c� "..nWorldMaps.." m�nh b�n �� S�n H� X� T�c.");
	end
end
