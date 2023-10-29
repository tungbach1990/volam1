if (not __TSRWLP_H__) then
	__TSRWLP_H__ = 1;

TASK_LP_ITEMID = 1744;			--��ʱ��¼���Ƶ���ƷID��
TASK_LP_COUNT = 1745;			--��¼��Ҫ�����������
TASK_LP_ZONGGUANIDX = 1746;		--��¼���Ǹ��ܹܡ�
TASK_LP_ZONGGUANLEVEL = 1756;	--��¼д�����ܹ���Ҫ�ļ���
TASK_LP_IDX = {1747, 1748, 1749, 1750, 1751, 1752, 1753, 1754, 1755};--��¼д�����ܹܵİ�ᡣ
tab_LPAward = {[1] = {300000, 2}, [2] = {400000, 5}, [3] = {600000, 10}}


function show_tong_lingpaidesc(nTaskIdx, nTaskGenre)
	local tab_Workshop = {[1] = "Binh gi�p", [2] = "Thi�n c�ng", [3] = "M�t n� ", [4] = "Th� luy�n", [5] = "Thi�n �", [6] = "L� ph�m", [7] = "Ho�t ��ng"};
	local nWorkshopIdx = GetTask(1746);
	local nLevel = GetTask(1756);
	
	local nLPLvl = ceil(nLevel / 3);
	if (nLPLvl > 3) then
		nLPLvl = 3;
	elseif (nLPLvl < 1) then
		nLPLvl = 1;
	end;
	
	local nCount = GetTask(1745);
	if (nCount == 0 or nWorkshopIdx == 0) then
		NewTask_TaskTextOut(nTaskGenre, "<color=red>Hi�n t�i kh�ng c� nhi�m v� L�nh b�i nhi�m v� ��c bi�t n�o<color>.");
		return
	end;
	
	local szZGName = "<color=yellow>"..nCount.."c�i"..nLevel.."<color> tr� l�n � c�c bang h�i kh�c nhau<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph��ng t�ng qu�n<color>, ";

	local tab_Content = {
		"<color=yellow>Nhi�m v� l�nh b�i nhi�m v� ��c bi�t: <color>",
		"<enter>",
		"Thu th�p"..szZGName.."Th� ti�n c� - nhi�m v� <color=yellow>T�ng qu�n Thi�n � ph��ng<color>",
		"<enter>",
		"<color=yellow>N�i dung nhi�m v�: <color>",
		"b�n bang<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph��ng t�ng qu�n<color> d�o n�y tinh th�n kh�ng ���c t�t, mu�n l�n kinh �ng th� nh�ng c�n ph�i thu th�p �� Th� ti�n c� c�a c�c danh s� n�i ��y. Phi�n ng��i �i t�m gi�p "..szZGName.."Th� ti�n c� c�a h�.",
		"<enter>",
		"M�c �� ho�n th�nh nhi�m v�:",
		"Ta �� thu th�p ���c <color=yellow>"..rwlp_getjuanshucount().." th� ti�n c�<color>.",
		"<enter>",
		"Ph�n th��ng sau khi ho�n th�nh nhi�m v�:",
		"  <color=green> gi�m b�t"..tab_LPAward[nLPLvl][2].." �i�m PK.<color>",
		"  t�ng l�n <color=yellow>"..tab_LPAward[nLPLvl][1].."<color> �i�m kinh nghi�m."
	};
	for i = 1, getn(tab_Content) do
		NewTask_TaskTextOut(nTaskGenre, tab_Content[i]);
	end;
end;

function rwlp_getjuanshucount()
	for i = 1, getn(TASK_LP_IDX) do
		if (0 == GetTask(TASK_LP_IDX[i]) ) then
			return i - 1;
		end;
	end;
	return 9;
end;

end; --// end of __TSRWLP_H__