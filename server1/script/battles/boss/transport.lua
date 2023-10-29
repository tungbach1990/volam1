IncludeLib("BATTLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\boss\\head.lua")
Include("\\script\\battles\\modified_transport.lua")

--����Ա
function main()
	Say("Trinh s�t ti�n tuy�n: Ta l� trinh s�t ti�n tuy�n, ng��i c�n g� c� n�i?",2, "��a ta ra ti�n tuy�n!/transport", "Kh�ng c� g�./cancel");
end

--����
function transport()
	
	if GetMissionV(MS_TIMER1) < RUNGAME_TIME then 
		Say("Trinh s�t ti�n tuy�n: Chi�n s� v�n ch�a m�, xin c�c h� ��ng n�n n�ng!",1, "Ta �ang s�i s�c nhi�t huy�t �� ra s�c nh� m�n n�y ��n ��p ��i qu�c!/cancel");
		return
	end
	
	local RestTime =  GetGameTime() - BT_GetData(PL_LASTDEATHTIME) 
	if ( RestTime < TIME_PLAYER_REV) then
		Say((TIME_PLAYER_REV - RestTime) .. " gi�y sau b�n m�i c� th� r�i kh�i h�u doanh! Xin ��i ch�t n�a!", 0)
		return
	end
	
	local nArea = nil;
	local nCamp = BT_GetData(PL_BATTLECAMP);	 
	if nCamp == 1 then
		nArea = BT_GetGameData(GAME_CAMP1AREA);
	else
		nArea = BT_GetGameData(GAME_CAMP2AREA);	
	end	
	tbVNG_Transport:Dialog(nArea)
	 
end

--ȡ��
function cancel()
	return
end