
function add462()
		level = random(2,10);
		AddSkillState(462, level, 0, 12 )	--�������Ѫ��
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> h�i ph�c sinh l�c trong n�a gi�y"..(level*500).."<#> �i�m")	
end

function add464()
		level = random(1,10);
		AddSkillState(464, level, 0, 540 )	--�������Ѫ�������ָ�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> 30 gi�y h�i ph�c sinh l�c, h�i ph�c m�i n�a gi�y"..(level*100).."<#> �i�m")	
end

function add488()
		level = random(10,20);
		AddSkillState(488, level, 0, 540 )	--�������Ѫ������
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> m�c sinh l�c 30 gi�y t�ng:"..(level*100).."<#> �i�m")	
end

Tab={add462,add464,add488}

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

