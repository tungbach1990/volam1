if (not __TASKUI_BESTTONG_H__) then
	__TASKUI_BESTTONG_H__ = 1;

function _gettongwarinfo(strDate, strCity1, strCity2, strCity3, strCity4)
	local strInfo = strDate.."    "..strCity1.." VS "..strCity2.."    "..strCity3.." VS "..strCity4;
	return strInfo;
end

function _gettongwarinfo2(strDate, strCity1, strCity2, strCity3)
	local strInfo = strDate.."    "..strCity1.." VS "..strCity2.."    "..strCity3.."Kh�ng thi ��u";
	return strInfo;
end

_TONGWARINFO = 
{
	--dd/mm[/yy]	-- Խ��ϰ��
	{"16/04", 	"L�m An", "T��ng D��ng",		"Bi�n Kinh", "D��ng Ch�u",		"Th�nh ��", "��i L�",		"Ph��ng T��ng"},
	{"18/04", 	"Ph��ng T��ng", "Bi�n Kinh",		"T��ng D��ng", "D��ng Ch�u",		"L�m An", "��i L�",		"Th�nh ��"},
	{"20/04", 	"Th�nh ��", "L�m An",		"Ph��ng T��ng", "T��ng D��ng",		"D��ng Ch�u", "��i L�",		"Bi�n Kinh"},
	{"22/04", 	"Bi�n Kinh", "T��ng D��ng", 	"Th�nh ��", "D��ng Ch�u",		"Ph��ng T��ng", "��i L�",		"L�m An"},
	{"24/04",	"Ph��ng T��ng", "Th�nh ��", 	"L�m An", "D��ng Ch�u",		"Bi�n Kinh", "��i L�",		"T��ng D��ng"},
	{"26/04", 	"Th�nh ��", "Bi�n Kinh",		"Ph��ng T��ng", "L�m An",		"T��ng D��ng", "��i L�",		"D��ng Ch�u"},
	{"28/04",	"Bi�n Kinh", "L�m An",		"Th�nh ��", "T��ng D��ng",		"Ph��ng T��ng", "D��ng Ch�u",		"��i L�"},
}

function showbwtaskbesttong(nTaskIdx, nTaskGenre)

	NewTask_TaskTextOut(nTaskGenre, "<color=red>L�ch thi ��u v� l�m �� nh�t bang: <color>");
	NewTask_TaskTextOut(nTaskGenre, "--------------------------------");

	local strInfo;
	for i = 1, getn(_TONGWARINFO) do
		strInfo = _gettongwarinfo(_TONGWARINFO[i][1], _TONGWARINFO[i][2], _TONGWARINFO[i][3], _TONGWARINFO[i][4], _TONGWARINFO[i][5]);
		NewTask_DetailTextOut(nTaskGenre, strInfo);
		
		strInfo = _gettongwarinfo2("    ", _TONGWARINFO[i][6], _TONGWARINFO[i][7], _TONGWARINFO[i][8]);
		NewTask_TaskTextOut(nTaskGenre, strInfo);
	end

	NewTask_TaskTextOut(nTaskGenre, "--------------------------------");

	NewTask_TaskTextOut(nTaskGenre, format("T� <color=green>%s ��n %s<color>, c�ch m�i ng�y s� c� m�t ng�y thi ��u (m�i t�i c�a ng�y thi ��u c� th�i gian chu�n b� t� <color=green>08:00 ��n 08:29<color>, th�i gian thi ��u t� <color=green>08:30~10:30<color>), trong ng�y thi ��u s� c� 3 tr�n ��u ti�n h�nh c�ng l�c, v� s� c� bang h�i m�t th�nh t�m ng�ng thi ��u. M�i bang h�i chi�m l�nh th�nh v� li�n minh s� l�n l��t ��u c�ng v�i <color=green>6<color>  li�n minh th�nh th� kh�c. Trong th�i gian n�y, t�t c� nh�ng th�nh th� di�n ra c�ng th�nh chi�n, l�i ��i c�ng th�nh ��u b� t�m d�ng.","16/04/2010", "28/04/2010"));
end;

end;	--	//end of __TASKUI_BESTTONG_H__
