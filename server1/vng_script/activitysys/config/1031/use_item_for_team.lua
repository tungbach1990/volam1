Include("\\vng_script\\activitysys\\config\\1031\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1031\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1031\\awardlist.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

if not tbUseLDKQ then
	tbUseLDKQ = {}
end
function tbUseLDKQ:CheckUseLongDenKeoQuan()
	local nTeamSize = GetTeamSize()	
	if IsCaptain() == 0 or nTeamSize <= 1  then
		 Talk(1,"","Ch� c� ��i tr��ng m�i c� th� s� d�ng.")		
		return 0
	end
	local flag = 0
	local OldPlayer = PlayerIndex
	for i = 1, nTeamSize do
		local nplayer = GetTeamMember(i)
		PlayerIndex = nplayer
		if tbUseLDKQ[GetName()] then
			--print("---------------tbUseLDKQ:CheckUseLongDenKeoQua:n "..tbUseLDKQ[GetName()][1])
			flag = 1
		end				
	end	
	PlayerIndex = OldPlayer
	if flag == 1 then
		Talk(1,"","Trong t� ��i hi�n c� ng��i �ang s� d�ng L�ng ��n k�o qu�n r�i.")
		return 0
	end
	return 1
end

function main(nItemIndex)
	local MapId, _, _ = GetWorldPos()
	if MapId ~= %MAP_HOASON then
		Talk(1,"","Ch� s� d�ng ���c � Hoa S�n C�nh K� Tr��ng.")
			--print("---------------Su dung long den keo quan MapId "..MapId)
			--print("---------------Su dung long den keo quan MAP_HOASON "..MAP_HOASON)
		return 1
	end
	
	if tbUseLDKQ:CheckUseLongDenKeoQuan() ~= 1 then
		return 1
	end
	
	if IsMyItem(nItemIndex) ~=1 then
		return 0
	end
	
	local szNameUseItem = GetName()	
	local OldPlayer = PlayerIndex	
	nplayer = SearchPlayer(szNameUseItem)
	local nTimerId = AddTimer(18*10, "OnTime", nplayer)	
	tbUseLDKQ[nTimerId] = {szNameUseItem, 0}
	tbUseLDKQ[szNameUseItem] = {1} --danh dau dang su dung item roi	
	Msg2Team (format("<color=yellow>��i tr��ng "..szNameUseItem.."<color> �� s� d�ng L�ng ��n K�o Qu�n, th�nh vi�n trong ��i ��ng r�i t� ��i.")	)
	return 0	
end

function OnTime(nplayer, nTimerId)
	if not tbUseLDKQ[nTimerId]  then
		--print("OnTime not tbUseLDKQ[nTimerId] ")
		tbUseLDKQ[tbUseLDKQ[nTimerId][1]] = nil	
		tbUseLDKQ[nTimerId] = nil		
		return 0,0
	end
	local OldPlayer = PlayerIndex
		local szNameUseItem = tbUseLDKQ[nTimerId][1]
		nplayer1 = SearchPlayer(szNameUseItem)
		PlayerIndex = nplayer1
		if GetName() ~= szNameUseItem and IsCaptain() == 0  then
			--print("OnTime Ten doi truong: "..GetName().." - "..szNameUseItem)
			tbUseLDKQ[tbUseLDKQ[nTimerId][1]] = nil	
			tbUseLDKQ[nTimerId] = nil			
			return 0,0
		end		
		local nTeamSize = GetTeamSize()
		local nCount = tbUseLDKQ[nTimerId][2]
		if nCount < 0 or nCount > 5 or nTeamSize <= 1 or IsCaptain() == 0 then
			--print("OnTime nCount - nTeamSize: "..nCount.." - "..nTeamSize)
			tbUseLDKQ[tbUseLDKQ[nTimerId][1]] = nil		
			tbUseLDKQ[nTimerId] = nil								
			return 0,0
		end
			
		--add exp cho member trong nhom
		Msg2Team("Nh�n th��ng 50.000 kinh nghi�m t� l�ng ��n k�o qu�n.")
		for i = 1, nTeamSize do									
			local nplayer2 = GetTeamMember(i)
			PlayerIndex = nplayer2
			--print("OnTime nplayer2 - nTeamSize: "..nplayer2.." - "..nTeamSize)
			local MapId, _, _ = GetWorldPos()				
			if PlayerFunLib:CheckTaskDaily(%TSK_EXP_DAILY_LongDenKeoQuan,%MAX_EXP_DAILY_LDKQ,"H�m nay �� nh�n �� kinh nghi�m t� L�ng ��n k�o qu�n r�i.","<") and (MapId == MAP_HOASON) then
				PlayerFunLib:AddTaskDaily(%TSK_EXP_DAILY_LongDenKeoQuan, 1)							
				lib:DoFunByPlayer(PlayerIndex, AddOwnExp,50000)				
			end
		end		
		tbUseLDKQ[nTimerId][2] = nCount + 1			
		PlayerIndex = OldPlayer
		return 18*10
end
