if (not __TSRWLP_H__) then
	__TSRWLP_H__ = 1;

TASK_LP_ITEMID = 1744;			--ÁÙÊ±¼ÇÂ¼ÁîÅÆµÄÎïÆ·ID¡£
TASK_LP_COUNT = 1745;			--¼ÇÂ¼ĞèÒª¼öÊéµÄÊıÁ¿¡£
TASK_LP_ZONGGUANIDX = 1746;		--¼ÇÂ¼ÊÇÄÇ¸ö×Ü¹Ü¡£
TASK_LP_ZONGGUANLEVEL = 1756;	--¼ÇÂ¼Ğ´¼öÊé×Ü¹ÜĞèÒªµÄ¼¶±ğ¡£
TASK_LP_IDX = {1747, 1748, 1749, 1750, 1751, 1752, 1753, 1754, 1755};--¼ÇÂ¼Ğ´¼öÊé×Ü¹ÜµÄ°ï»á¡£
tab_LPAward = {[1] = {300000, 2}, [2] = {400000, 5}, [3] = {600000, 10}}


function show_tong_lingpaidesc(nTaskIdx, nTaskGenre)
	local tab_Workshop = {[1] = "Binh gi¸p", [2] = "Thiªn c«ng", [3] = "MÆt n¹ ", [4] = "Thİ luyÖn", [5] = "Thiªn ı", [6] = "LÔ phÈm", [7] = "Ho¹t ®éng"};
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
		NewTask_TaskTextOut(nTaskGenre, "<color=red>HiÖn t¹i kh«ng cã nhiÖm vô LÖnh bµi nhiÖm vô ®Æc biÖt nµo<color>.");
		return
	end;
	
	local szZGName = "<color=yellow>"..nCount.."c¸i"..nLevel.."<color> trë lªn ë c¸c bang héi kh¸c nhau<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph­êng tæng qu¶n<color>, ";

	local tab_Content = {
		"<color=yellow>NhiÖm vô lÖnh bµi nhiÖm vô ®Æc biÖt: <color>",
		"<enter>",
		"Thu thËp"..szZGName.."Th­ tiÕn cö - nhiÖm vô <color=yellow>Tæng qu¶n Thiªn ı ph­êng<color>",
		"<enter>",
		"<color=yellow>Néi dung nhiÖm vô: <color>",
		"bæn bang<color=yellow>"..tab_Workshop[nWorkshopIdx].."Ph­êng tæng qu¶n<color> d¹o nµy tinh thÇn kh«ng ®­îc tèt, muèn lªn kinh øng thİ nh­ng cÇn ph¶i thu thËp ®ñ Th­ tiÕn cö cña c¸c danh sü n¬i ®©y. PhiÒn ng­¬i ®i t×m gióp "..szZGName.."Th­ tiÕn cö cña hä.",
		"<enter>",
		"Møc ®é hoµn thµnh nhiÖm vô:",
		"Ta ®· thu thËp ®­îc <color=yellow>"..rwlp_getjuanshucount().." th­ tiÕn cö<color>.",
		"<enter>",
		"PhÇn th­ëng sau khi hoµn thµnh nhiÖm vô:",
		"  <color=green> gi¶m bít"..tab_LPAward[nLPLvl][2].." ®iÓm PK.<color>",
		"  t¨ng lªn <color=yellow>"..tab_LPAward[nLPLvl][1].."<color> ®iÓm kinh nghiÖm."
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