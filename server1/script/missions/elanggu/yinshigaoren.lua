Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>�c Lang Bang l� m�t ��m c��ng ��o trong �c Lang C�c, do �� m�i c� t�n l� �c Lang C�c. B�n ng��i n�y chuy�n �i l�m h�i d�n l�nh, l�m � u� thanh danh c�a nh�ng ng��i trong giang h�, r�t nhi�u anh h�ng h�o h�n ��u mu�n tr� h�i n�. Nh�ng m� nghe ��n r�ng ��m ng��i c�a �c Lang Bang n�y �ang n�m gi� chi�u th�c th�t truy�n �� l�u c�a ch�n v� l�m �� l� H� Th� Th�n C�ng, nh�ng lo�i binh kh� �ao ki�m b�nh th��ng ��u kh�ng th� �� th��ng ���c n�. 30 n�m tr��c c� m�t ��i hi�p giang h� k� t�i �� ph�t minh ra ���c � C�n Kh�n T�ch L�ch ��n�, nghe n�i C�n Kh�n T�ch L�ch ��n c� uy l�c v� song, n�u ��i hi�p c� th� t�m ���c �C�n Kh�n T�ch L�ch ��n�. th� ta ngh� r�ng s� d� d�ng m� ��i ph� v�i H� Th� Th�n C�ng c�a ��m ng��i �c Lang Bang n�y, �� tr� l�i cho b� t�nh ��i T�ng cu�c s�ng y�n b�nh."
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tinsert(tbDailog, {"Ta mu�n r�i kh�i ��y!", GoToWaiMian})
	tinsert(tbDailog, {"��i m�t l�t"})
	CreateNewSayEx(tbDailog.szTitleMsg, tbDailog)
end

function GoToWaiMian()
	local tbMapList = {{11,3183,5180}, {1,1651,3279}, {37,1704,3222}, {176,1695,3294}, 
											{162,1697,3277}, {78,1596,3379}, {80,1718,3201},}
	local nOutPosId = random(1, getn(tbMapList))
	local tbPos = tbMapList[nOutPosId]
 	NewWorld(tbPos[1], tbPos[2], tbPos[3]) 	
end
