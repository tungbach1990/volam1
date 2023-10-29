
Include("\\script\\lib\\common.lua")
Include("\\script\\global\\login_head.lua")

AnnounceNews = {}
AnnounceNews.tbNews = {
--	{
--	nStartDate = 201208130000,
--	nEndDate =  201210312400,	
--	strMsg = "<color=green>T� 27/09/2012 ��n 24h ng�y 31/10/2012 s� di�n ra ho�t ��ng Vui H�i Tr�ng R�m. Th�ng tin chi ti�t vui l�ng xem t�i trang ch� <color=blue>www.volam.zing.vn<color>", 
--	},
--	{
--	nStartDate = 201007070000,
--	nEndDate =  201010312400,	
--	strMsg = "<color=yellow>Tham gia c�c ho�t ��ng trong game, nh�n ngay iPhone 5 v� iPhone 4S<color>", 
--	},
--	{
--	nStartDate = 201007070000,
--	nEndDate =  201009302400,	
--	strMsg = "<color=yellow>B�t Ni�n H�i Ng� L�nh B�i\nTr�i nghi�m Tr�ng Sinh 4 ngay t� h�m nay. Chi ti�t t�i trang ch� http://volam.zing.vn<color>", 
--	},
	{
	nStartDate = 201303110000,
	nEndDate =  201303172400,	
	strMsg = "<color=yellow>Tu�n l� v�ng - Nh�n ��i �i�m t�ch l�y v� �i�m kinh nghi�m khi tham gia m�t s�<enter>t�nh n�ng trong game. <enter>Chi ti�t t�i trang ch� <color=green>http://volam.zing.vn<color>",
	},
}

function AnnounceNews:CheckTime(nIdx)
	local nCurDate = tonumber(date("%Y%m%d%H%M"))
	local tbTempNews = self.tbNews[nIdx]
	if nCurDate < tbTempNews.nStartDate or nCurDate > tbTempNews.nEndDate then
		return nil
	end
	return 1
end

function AnnounceNews:AnnounceUpdate()
	local tbNews = %AnnounceNews.tbNews
	for i = 1, getn(tbNews) do
		if %AnnounceNews:CheckTime(i) then
			Msg2Player(tbNews[i].strMsg)
		end
	end	
end

if login_add  then login_add(AnnounceNews.AnnounceUpdate, 2)  end
