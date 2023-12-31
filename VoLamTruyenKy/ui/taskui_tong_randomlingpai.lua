if (not __TSRWLP_H__) then
	__TSRWLP_H__ = 1;

TASK_LP_ITEMID = 1744;			--临时记录令牌的物品ID。
TASK_LP_COUNT = 1745;			--记录需要荐书的数量。
TASK_LP_ZONGGUANIDX = 1746;		--记录是那个总管。
TASK_LP_ZONGGUANLEVEL = 1756;	--记录写荐书总管需要的级别。
TASK_LP_IDX = {1747, 1748, 1749, 1750, 1751, 1752, 1753, 1754, 1755};--记录写荐书总管的帮会。
tab_LPAward = {[1] = {300000, 2}, [2] = {400000, 5}, [3] = {600000, 10}}


function show_tong_lingpaidesc(nTaskIdx, nTaskGenre)
	local tab_Workshop = {[1] = "Binh gi竝", [2] = "Thi猲 c玭g", [3] = "M苩 n� ", [4] = "Th� luy謓", [5] = "Thi猲 �", [6] = "L� ph萴", [7] = "Ho箃 ng"};
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
		NewTask_TaskTextOut(nTaskGenre, "<color=red>Hi謓 t筰 kh玭g c� nhi謒 v� L謓h b礽 nhi謒 v� c bi謙 n祇<color>.");
		return
	end;
	
	local szZGName = "<color=yellow>"..nCount.."c竔"..nLevel.."<color> tr� l猲 � c竎 bang h閕 kh竎 nhau<color=yellow>"..tab_Workshop[nWorkshopIdx].."Phng t鎛g qu秐<color>, ";

	local tab_Content = {
		"<color=yellow>Nhi謒 v� l謓h b礽 nhi謒 v� c bi謙: <color>",
		"<enter>",
		"Thu th藀"..szZGName.."Th� ti課 c� - nhi謒 v� <color=yellow>T鎛g qu秐 Thi猲 � phng<color>",
		"<enter>",
		"<color=yellow>N閕 dung nhi謒 v�: <color>",
		"b鎛 bang<color=yellow>"..tab_Workshop[nWorkshopIdx].."Phng t鎛g qu秐<color> d筼 n祔 tinh th莕 kh玭g 頲 t鑤, mu鑞 l猲 kinh 鴑g th� nh璶g c莕 ph秈 thu th藀  Th� ti課 c� c馻 c竎 danh s� n琲 y. Phi襫 ngi 甶 t譵 gi髉 "..szZGName.."Th� ti課 c� c馻 h�.",
		"<enter>",
		"M鴆  ho祅 th祅h nhi謒 v�:",
		"Ta  thu th藀 頲 <color=yellow>"..rwlp_getjuanshucount().." th� ti課 c�<color>.",
		"<enter>",
		"Ph莕 thng sau khi ho祅 th祅h nhi謒 v�:",
		"  <color=green> gi秏 b韙"..tab_LPAward[nLPLvl][2].." 甶觤 PK.<color>",
		"  t╪g l猲 <color=yellow>"..tab_LPAward[nLPLvl][1].."<color> 甶觤 kinh nghi謒."
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