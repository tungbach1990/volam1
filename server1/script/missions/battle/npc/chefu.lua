Include("\\script\\dailogsys\\dailogsay.lua")

function main()
	local nMode = GetTripMode()
	if nMode ~= 2 then
		NewWorld(20,3546,6226)
		return
	end
	local szTitle = "<npc>".."Ng��i mu�n tr� v� kh�ng?"
	local tbOpt = 
	{
		{"Mu�n", TripS_Return, {}},
		{"H�y b� "}
	}
	CreateNewSayEx(szTitle, tbOpt)
end