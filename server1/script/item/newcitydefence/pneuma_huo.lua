
function add466()
		level = random(1,4);
		AddSkillState(466, level, 0, 1080 )
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> 1 ph�t gi�m th� th��ng"..(level*10).."<#> %")	
end

function add468()
		level = random(1,4);
		AddSkillState(468, level, 0, 1080 )
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> 1 ph�t gi�m th�i gian l�m ch�m:"..(level*10).."<#> %")	
end
Tab={add466,add468}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		return 0;	-- ɾ����Ʒ
	end
end

