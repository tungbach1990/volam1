if (not __TASKUI_BESTTONG_H__) then
	__TASKUI_BESTTONG_H__ = 1;

function _gettongwarinfo(strDate, strCity1, strCity2, strCity3, strCity4)
	local strInfo = strDate.."    "..strCity1.." VS "..strCity2.."    "..strCity3.." VS "..strCity4;
	return strInfo;
end

function _gettongwarinfo2(strDate, strCity1, strCity2, strCity3)
	local strInfo = strDate.."    "..strCity1.." VS "..strCity2.."    "..strCity3.."Kh«ng thi ®Êu";
	return strInfo;
end

_TONGWARINFO = 
{
	--dd/mm[/yy]	-- Ô½ÄÏÏ°¹ß
	{"16/04", 	"L©m An", "T­¬ng D­¬ng",		"BiÖn Kinh", "D­¬ng Ch©u",		"Thµnh §«", "§¹i Lý",		"Ph­îng T­êng"},
	{"18/04", 	"Ph­îng T­êng", "BiÖn Kinh",		"T­¬ng D­¬ng", "D­¬ng Ch©u",		"L©m An", "§¹i Lý",		"Thµnh §«"},
	{"20/04", 	"Thµnh §«", "L©m An",		"Ph­îng T­êng", "T­¬ng D­¬ng",		"D­¬ng Ch©u", "§¹i Lý",		"BiÖn Kinh"},
	{"22/04", 	"BiÖn Kinh", "T­¬ng D­¬ng", 	"Thµnh §«", "D­¬ng Ch©u",		"Ph­îng T­êng", "§¹i Lý",		"L©m An"},
	{"24/04",	"Ph­îng T­êng", "Thµnh §«", 	"L©m An", "D­¬ng Ch©u",		"BiÖn Kinh", "§¹i Lý",		"T­¬ng D­¬ng"},
	{"26/04", 	"Thµnh §«", "BiÖn Kinh",		"Ph­îng T­êng", "L©m An",		"T­¬ng D­¬ng", "§¹i Lý",		"D­¬ng Ch©u"},
	{"28/04",	"BiÖn Kinh", "L©m An",		"Thµnh §«", "T­¬ng D­¬ng",		"Ph­îng T­êng", "D­¬ng Ch©u",		"§¹i Lý"},
}

function showbwtaskbesttong(nTaskIdx, nTaskGenre)

	NewTask_TaskTextOut(nTaskGenre, "<color=red>LÞch thi ®Êu vâ l©m ®Ö nhÊt bang: <color>");
	NewTask_TaskTextOut(nTaskGenre, "--------------------------------");

	local strInfo;
	for i = 1, getn(_TONGWARINFO) do
		strInfo = _gettongwarinfo(_TONGWARINFO[i][1], _TONGWARINFO[i][2], _TONGWARINFO[i][3], _TONGWARINFO[i][4], _TONGWARINFO[i][5]);
		NewTask_DetailTextOut(nTaskGenre, strInfo);
		
		strInfo = _gettongwarinfo2("    ", _TONGWARINFO[i][6], _TONGWARINFO[i][7], _TONGWARINFO[i][8]);
		NewTask_TaskTextOut(nTaskGenre, strInfo);
	end

	NewTask_TaskTextOut(nTaskGenre, "--------------------------------");

	NewTask_TaskTextOut(nTaskGenre, format("Tõ <color=green>%s ®Õn %s<color>, c¸ch mçi ngµy sÏ cã mét ngµy thi ®Êu (mçi tèi cña ngµy thi ®Êu cã thêi gian chuÈn bÞ tõ <color=green>08:00 ®Õn 08:29<color>, thêi gian thi ®Êu tõ <color=green>08:30~10:30<color>), trong ngµy thi ®Êu sÏ cã 3 trËn ®Êu tiÕn hµnh cïng lóc, vµ sÏ cã bang héi mét thµnh t¹m ng­ng thi ®Êu. Mçi bang héi chiÕm lÜnh thµnh vµ liªn minh sÏ lÇn l­ît ®Êu cïng víi <color=green>6<color>  liªn minh thµnh thÞ kh¸c. Trong thêi gian nµy, tÊt c¶ nh÷ng thµnh thÞ diÔn ra c«ng thµnh chiÕn, l«i ®µi c«ng thµnh ®Òu bÞ t¹m dõng.","16/04/2010", "28/04/2010"));
end;

end;	--	//end of __TASKUI_BESTTONG_H__
