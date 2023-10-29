function PickUp( nItemIndex, nPlayerIndex )
	local oldPlyIdx = PlayerIndex;
	local size = GetTeamSize();
	local mySex = GetSex();
	if(size < 2) then
		Msg2Player("Ng��i c� ��n nh�t hoa h�ng t�nh y�u kh�ng �em l�i hi�u qu�. ");
		return 0;
	elseif(size > 2) then
		Msg2Player("Ch� c� m�t nam m�t n� l�p ��i nh�t hoa h�ng t�nh y�u m�i nh�n ���c ph�n th��ng.");
		return 0;
	else
		for i = 1, size do
			PlayerIndex = GetTeamMember(i);
			if( mySex ~= GetSex() ) then
				GiveExp(oldPlyIdx,size);
				return 0;
			end
		end
		PlayerIndex = oldPlyIdx;
		Msg2Player("Ch� c� m�t nam m�t n� l�p ��i nh�t hoa h�ng t�nh y�u m�i nh�n ���c ph�n th��ng.");
		return 0;
	end
end

function GiveExp(oldPlyIdx,size)
	local levelexp = {70,160,280,400,520,590,770,850,1000,1200,1500};
	for j = 1, size do
		PlayerIndex = GetTeamMember(j);
		SetTask(1562, GetTask(1562)+1);
		if(GetTask(1562) >= 99 ) then
			AddItem(6,1,833,1,0,0);
			SetTask(1562, 0);
			Msg2Player("B�n �� nh�t ���c 99 ��a hoa h�ng t�nh y�u, nh�n ���c m�t S�c�la, s� l��ng nh�t ���c tr� v� 0.");
		end		
		Msg2Player("B�n �� nh�t ���c"..GetTask(1562).."��a hoa h�ng t�nh y�u");
		local level = GetLevel();
		local exp_level = floor(level / 10) + 1;
		if(exp_level > 11) then
			exp_level = 11;
		end
		AddOwnExp(levelexp[exp_level]);
	end
	PlayerIndex = oldPlyIdx;
end