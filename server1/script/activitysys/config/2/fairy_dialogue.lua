Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\config\\2\\extend.lua")

function main()
	local nNpcIndex = GetLastDiagNpc() 
	local dwNpcIndex = GetNpcId(nNpcIndex)
	local szTitle = "Xin ch�o! Gi�ng Sinh vui v� nh�!"
	local tbOpt = 
	{
		{"Nh�n l�nh ph�n th��ng", pActivity.GetFairyAward, {pActivity,nNpcIndex}},
		{"K�t th�c ��i tho�i"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function OnTimer(nNpcIndex, nTimeOut)
	local szNpcName = GetNpcName(nNpcIndex)
	if szNpcName == "Tinh Linh" then
		DelNpc(nNpcIndex)
		%tbFairyInfo.nNpcIndex = nil
	end
end