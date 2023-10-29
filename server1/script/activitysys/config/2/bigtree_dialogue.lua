Include("\\script\\activitysys\\config\\2\\extend.lua")
Include("\\script\\activitysys\\config\\2\\fairy_pos.lua")

tbWay = 
{
	[1] = "��ng",
	[2] = "Nam",
	[3] = "T�y",
	[4] = "b�c ",
}
	
function main()
	local nTime = tonumber(GetLocalDate("%H%M"))
	local nStartTime = 1900
	local nEndTime = 2400
	nTime = mod(nTime,2400)
	if nTime < nStartTime and nTime > nEndTime then
		Talk(1, "", format("Tinh Linh Th�nh ��n v�n ch�a xu�t hi�n, ��i hi�p h�y ki�n nh�n ch� ��i!"))
		return
	end
	if tbFairyInfo.nCityMapID == nil and tbFairyInfo.nCityPos == nil then
		Talk(1, "", format("Tinh Linh Th�nh ��n v�n ch�a xu�t hi�n, ��i hi�p h�y ki�n nh�n ch� ��i!"))
		return
	end
	local szCityName = %FAIRY_MAP[tbFairyInfo.nCityMapID].szCity

	local nWay = ceil(tbFairyInfo.nCityPos/3)
	local szWay = tbWay[nWay]
	Say( format("T��ng truy�n Tinh Linh Th�nh ��n xu�t hi�n <color=red>%s t�i %s h��ng <color>, ��i hi�p h�y nhanh ch�ng ��n �� nh�n ph�n th��ng nh�. M�i l�n xu�t hi�n ch� cho <color=yellow>%d<color> l�n ph�n th��ng, m�i ng�y m�i ng��i ch� c� th� nh�n <color=yellow>%d<color> l�n ph�n th��ng phong ph�", szCityName, szWay , %nFariySurvivalCount, %MAX_CLICK_FAIRY), 1, "��ng/OnCancel")

end