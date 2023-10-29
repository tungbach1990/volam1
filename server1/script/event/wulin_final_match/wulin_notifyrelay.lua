Include("\\script\\event\\wulin_final_match\\ticketinfo.lua")
IncludeLib("LEAGUE")
function wl_OnCreateLeague(nLeagueType,szLeagueName, szMemberName, bSucceed)
	print("Call wl_OnCreateLeague("..tostring(nLeagueType)..","..tostring(szLeagueName)..","..tostring(szMemberName)..","..tostring(bSucceed)..").")
	
	if(nLeagueType > 25) then
		print("League type error on build wulin final league.")
		return 0
	end
	
	if(bSucceed > 0) then
		local pappid = SearchPlayer(szMemberName)
		if (pappid > 0) then
				PlayerIndex = pappid
				Say("Ch�c m�ng! Th�nh l�p "..TAB_TICKETINFO[nLeagueType - 10][1].." �� th�nh c�ng",0)
				--SetTask(TK_WL_TICKET_FACTION1 + nLeagueType - 10 - 1, 1)
		end
		AddLocalNews("Ch�c m�ng �� ho�n t�t ��t t�n chi�n ��i "..TAB_TICKETINFO[nLeagueType-10][1].." c� th� gia "..szLeagueName.." ")
		return 0
	end
	print("wl_oncreateleague")
end

function wl_OnAddMember(nLeagueType,szLeagueName, szMemberName, bSucceed)
	print("wl_onaddmember")
	print("nleague"..nLeagueType)
	if(bSucceed > 0) then
		local pappid = SearchPlayer(szMemberName)
		if (pappid > 0) then
				PlayerIndex = pappid
				local lid = LG_GetLeagueObj(nLeagueType, szLeagueName)
				if (not FALSE(lid)) then
					leaguename, time, count = LG_GetLeagueInfo(lid)
					if (count == 1) then
						Say("Ch�c m�ng ng��i �� ki�n l�p th�nh c�ng"..tostring(TAB_TICKETINFO[nLeagueType - 10][1]).." tr� th�nh <color=red>"..szLeagueName.."<color>!" , 0)
						wl_delleaguecard( nLeagueType-10 )
					else
						Say("Ch�c m�ng �� ��t t�n chi�n ��i thn�h c�ng"..tostring(TAB_TICKETINFO[nLeagueType - 10][1]).." tr� th�nh <color=red>"..szLeagueName.."<color>!" , 0)
					end
				end
				--SetTask(TK_WL_TICKET_FACTION1 + nLeagueType - 10 - 1, 1)
			AddLocalNews("Ch�c m�ng ng��i ch�i"..GetName().."�� gia nh�p chi�n ��i, tr� th�nh"..szLeagueName.." ")
		end
	end
end

function wl_delleaguecard( matchtype )
	local cardid = 406 + matchtype
	local count = CalcEquiproomItemCount( 6, 1, cardid, 1 )
	if ( count > 0 ) then
		DelCommonItem(6, 1, cardid)
	end
end