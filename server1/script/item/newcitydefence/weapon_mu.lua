
function add480()
		level = random(1,5);
		AddSkillState(480, level, 0, 1080 )	--��������ڶ��˺�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> ��c s�t n�i c�ng trong 1 ph�t t�ng:"..(level*10).."<#> �i�m")	
end

function add485()
		level = random(1,5);
		AddSkillState(485, level, 0, 1080 )	--��������ⶾ�˺�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> ��c s�t ngo�i c�ng trong 1 ph�t t�ng:"..(level*10).."<#> �i�m")	
end

Tab={add480,add485}

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

