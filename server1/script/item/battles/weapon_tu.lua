IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add483()
		level = random(10,20);
		AddSkillState(483, level, 0, 1080 )	--������������˺�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> L�i s�t n�i c�ng trong 1 ph�t t�ng:"..(level*10).."<#> �i�m")	
end

function add499()
		level = random(10,30);
		AddSkillState(499, level, 0, 1080 )	--������������˺�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> L�i s�t ngo�i c�ng trong 1 ph�t t�ng:"..(level*10).."<#> �i�m")	
end

Tab={add483,add499}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		BT_SetData(PL_GETITEM, BT_GetData(PL_GETITEM) + 1);
		bt_addtotalpoint(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		checkbattlerule(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		BT_SortLadder();
		BT_BroadSelf();
		return 0;	-- ɾ����Ʒ
	end
end

