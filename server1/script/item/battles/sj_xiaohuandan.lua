IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add463()
		level = random(2,10);
		AddSkillState(463, level, 0, 12 )	--�����������
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> h�i ph�c n�i l�c trong n�a gi�y"..(level*500).."<#> �i�m")	
end

function add465()
		level = random(1,10);
		AddSkillState(465, level, 0, 540 )	--����������������ظ�
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> 30 gi�y h�i ph�c n�i l�c, h�i ph�c m�i n�a gi�y"..(level*100).."<#> �i�m")	
end

function add489()
		level = random(10,20);
		AddSkillState(489, level, 0, 540 )	--���������������
		Msg2Player("<#> B�n nh�n ���c <color=0xB5FDD7> 30 gi�y m�c n�i l�c t�ng::"..(level*100).."<#> �i�m")	
end

Tab={add463,add465,add489}

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

