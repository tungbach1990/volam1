
-- ��Ȫ�帵����ű�
-- Edited by peres
-- 2005/01/17

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");
Include("\\script\\task\\random\\treasure_head.lua");  -- �ر�ͼ���͹���

function main()

local myTaskValue = GetTask(1003)

	if (myTaskValue==140) then
		task_level30_09();
		return
	elseif (myTaskValue==150) then
		Say("M�c Th� H��ng ch� Tang Chu c�a Ng� ��c gi�o � ph�a ��ng Nam Long Tuy�n Th�n, ta n�i v�y �� �� ch�a?",0);
		return
	elseif (myTaskValue==151) then
		task_level30_10();
		return
	elseif (myTaskValue==160) then -- ����ɣ���ص���Ȫ���븵����ĶԻ�
		task_level30_16();
		return
	elseif (myTaskValue==230) then
		task_level50_01(); -- �õ�����ڤ֮����ص���Ȫ���븵����ĶԻ�
		return
	end
	
	local tbOpp = {
		--"��������������һ�²ر�ͼ��/CheckTreasureMap_Say",
		"Ta kh�ng c� chuy�n g� /OnExit"
		};
	
	
	Say("Kh�! Kh�!....L�i ��n t�m l�o c� vi�c g�?",
				getn(tbOpp),
				tbOpp	);

end;


function CheckTreasureMap_Say()
	Say("A......��y l� T�ng B�o ��, g�m t�t c� c�c ��a �i�m ch�a b�o v�t tuy�t th�,  ng��i th��ng xem kh�ng hi�u ���c, n�u ng��i c� 30 v�n <color=yellow>30 v�n<color>...Kh�! Kh�!...",2,
		"���c! 30  th� 30/CheckMoney",
		"B�n kh�ng c� �� ti�n/OnExit");
	return 1;
end;


function CheckMoney()

	-- �������һ���жϽ�Ǯ��׼������ʱ���ж�һ��
	if GetCash()>=300000 then
		-- �����������
		GiveItemUI("Gi�m ��nh T�ng B�o ��","Xin ��t T�ng B�o �� c�a b�n v�o","CheckTreasureMap","OnExit");
		return
	else
		Say("Haha�B�n tr�, kh�ng �� ti�n th� n�i l�m g�, ��ng t��ng l�o gi� n�y ngu mu�i. Ng��i v� v�t k� tr�n d� b�o tuy�t th� n�y c� th� l� v� duy�n r�i.",0);
		return
	end;

end;

