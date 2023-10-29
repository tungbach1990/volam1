--�������������ļ�
Include([[\script\tong\workshop\tongcolltask.lua]]);

function main(nItem)
	_, nTongID = GetTongName();
	if (nTongID <= 0) then
		Say("Ch�a gia nh�p <color=yellow>bang ph�i<color>, kh�ng th� s� d�ng l�nh b�i nhi�m v� ��c bi�t.", 0);
		Msg2Player("Ch�a gia nh�p <color=yellow>bang ph�i<color>, kh�ng th� s� d�ng l�nh b�i nhi�m v� ��c bi�t.");
		return 1;
	end;
	local nCount = GetTask(TASK_LP_COUNT);
	SetTask(TASK_LP_ITEMID, nItem); --��ȡ���Ƶȼ�
	
	if (nCount > 0) then
		Say("<color=green>L�nh b�i nhi�m v�<color>: Hi�n t�i c� nhi�m v� ng�u nhi�n ch�a ho�n th�nh, v�n mu�n ti�p nh�n nhi�m v� m�i sao?", 2,
			"��ng v�y, ta mu�n h�y b� nhi�m v� tr��c ��y/cancelformertask",
			"Kh�ng ph�i, ��i m�t l�t ��!/OnCancel");
		return 1;
	else
		wanttask()
		return 1;
	end;
end;

--ȡ��һ��������������
function cancelformertask()
	if (GetTask(TASK_LP_COUNT) ~= 0) then
		rwlp_cleartask();
		Say("�� h�y b� nhi�m v� <color=yellow>L�nh b�i nhi�m v� ��c bi�t<color>.", 0);
		Msg2Player("�� h�y b� nhi�m v� <color=yellow>L�nh b�i nhi�m v� ��c bi�t<color>.");
	end;
end;

-- ������������
function wanttask()
	if (GetTask(TASK_LP_COUNT) ~= 0) then
		Say("Hi�n c� nhi�m v� L�nh b�i nhi�m v� ��c bi�t, kh�ng th� ti�p nh�n nhi�m v� m�i.", 0);
		return
	end;
	
	local nLevel, nWorkshopIdx, nCount, nItem, nResult;
	
	nItem = GetTask(TASK_LP_ITEMID);
	nLevel = GetItemParam(nItem, 3);
	nWorkshopIdx = GetItemParam(nItem, 4);
	nCount = GetItemParam(nItem, 5);
	if (not nCount or nCount == 0) then
		nResult = init_task()
		nLevel = GetItemParam(nItem, 3);
		nWorkshopIdx = GetItemParam(nItem, 4);
		nCount = GetItemParam(nItem, 5);
	end;
	
	local szContent = "<color=yellow>"..nLevel.."<color> tr� l�n � c�c bang h�i kh�c nhau<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph��ng t�ng qu�n<color>, ";
	if (nResult == 0) then
		Say("v�n mu�n ng��i �i t�m v�i v� "..szContent..", nh�ng ti�c l� ��ng c�p <color=yellow>"..tab_Workshop[nWorkshopIdx].." ph��ng<color> c�a c�c bang h�i ��u kh�ng ��, l�n sau ��n th� xem.", 0);
		Msg2Player("T�m th�i kh�ng c� �� "..szContent..", l�n sau ��n th� xem.");
		return
	end;
	
	szContent = "<color=yellow>"..nCount.."<color> v�"..szContent;
	Say("b�n bang<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph��ng t�ng qu�n<color> d�o n�y tinh th�n kh�ng ���c t�t, mu�n l�n kinh �ng th� nh�ng c�n ph�i thu th�p �� Th� ti�n c� c�a c�c danh s� n�i ��y. Phi�n ng��i �i t�m gi�p "..szContent.."Th� ti�n c� c�a h�.", 2,
	"���c, ta s� c� g�ng./#lp_confirm("..nLevel..","..nWorkshopIdx..","..nCount..", 1)",
	"Nhi�m v� n�y kh� qu�, ta kh�ng d�m nh�n./#lp_confirm("..nLevel..","..nWorkshopIdx..","..nCount..", 0)");
end;

--��ʼ��һ������
function init_task()
	local nLPLvl = GetItemParam(GetTask(TASK_LP_ITEMID), 1); -- ���Ƶĵȼ�
	
	local nLevel, nWorkshopIdx, nCount;
	nLevel = 1;
	nWorkshopIdx = random(1, 7); -- ���һ������
	
	if (nLPLvl == 1) then
		nLevel = random(1, 3);
	elseif (nLPLvl == 2) then
		nLevel = random(4, 6);
	elseif (nLPLvl == 3) then
		nLevel = random(7, 8);
	end;
	
	nCount = random(1, 9);
	local nMax = get_workshop_count(nWorkshopIdx, nLevel);
	if (not nMax) then
		nMax = 0;
	end;
	if (nCount > nMax) then
		nCount = nMax;
	end;
	
	local nItem = GetTask(TASK_LP_ITEMID);
	SetSpecItemParam(nItem, 3, nLevel);
	SetSpecItemParam(nItem, 4, nWorkshopIdx);
	SetSpecItemParam(nItem, 5, nCount);
	SyncItem(nItem);
	if (nCount > 0) then
		return 1;
	end;
	return 0;
end;

function lp_confirm(nLevel, nWorkshopIdx, nCount, bOK)
	local szContent = "<color=yellow>"..nCount.."<color>v� <color=yellow>"..nLevel.."<color> tr� l�n � c�c bang h�i kh�c nhau<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph��ng t�ng qu�n<color>";
	
	nt_SetTask(TASK_LP_ZONGGUANIDX, nWorkshopIdx);
	nt_SetTask(TASK_LP_ZONGGUANLEVEL, nLevel);
	
	if (bOK == 1) then
		Say("b�n bang<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph��ng t�ng qu�n<color> d�o n�y tinh th�n kh�ng ���c t�t, mu�n l�n kinh �ng th� nh�ng c�n ph�i thu th�p �� Th� ti�n c� c�a c�c danh s� n�i ��y. Phi�n ng��i �i t�m gi�p "..szContent.."Th� ti�n c� c�a h�.", 1, "Ta bi�t r�i!/lp_confirmtwo");
	else
		Say("b�n bang<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph��ng t�ng qu�n<color> mu�n ng��i t�m gi�p "..szContent.."Th� ti�n c�, ng��i kh�ng c� th�i gian sao?",2 ,"Ta v�n ch�a nh�n nhi�m v� n�y./lp_confirmtwo", "Ta th�t s� kh�ng mu�n nh�n nhi�m v� n�y./OnCancel");
	end;
end;

function lp_confirmtwo()
	local nItem = GetTask(TASK_LP_ITEMID);

	local nCount = GetItemParam(nItem, 5);
	local nWorkshopIdx = GetTask(TASK_LP_ZONGGUANIDX);
	local nLevel = GetTask(TASK_LP_ZONGGUANLEVEL);
	
	if (nItem > 0) then
		if (RemoveItemByIndex(nItem) ~= 1) then
			return
		end;
	end;

	nt_SetTask(TASK_LP_COUNT, nCount);
	Msg2Player("B�n ��ng � �i g�p <color=yellow>"..nCount.."<color> <color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph��ng t�ng qu�n<color> �� nh�n nhi�m v� Th� ti�n c�, ��ng c�p <color=yellow>"..tab_Workshop[nWorkshopIdx].." ph��ng<color> c�n ��t c�p <color=yellow>"..nLevel.."<color>.");
end;
