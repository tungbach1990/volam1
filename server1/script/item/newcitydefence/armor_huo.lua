
function add473()
		level = random(1,7);
		AddSkillState(473, level, 0, 1080 )	--��������շ�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> t�ng ph�ng ph� trong 1 ph�t"..(level*10).."<#> %")	
end

Tab={add473}

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

