IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add505()
		CastSkill(505, 1 )	--ȫ��ѣ��
		Msg2Player("<#> B�n s� d�ng 1<color=0xB5FDD7> Tam Thanh Kh�, khi�n k� ��ch quanh b�n b� cho�ng.")	
end

function add506()
		CastSkill(506, 1 )	--ȫ�����
		Msg2Player("<#> B�n s� d�ng 1<color=0xB5FDD7> Tam Thanh Kh�, khi�n k� ��ch quanh b�n b� ��ng b�ng.")	
end

function add507()
		CastSkill(507, 1 )	--ȫ���ж�
		Msg2Player("<#> B�n s� d�ng 1<color=0xB5FDD7> Tam Thanh Kh�, khi�n k� ��ch quanh b�n b� tr�ng ��c.")	
end

function add508()
		CastSkill(508, 1 )	--ȫ�����
		Msg2Player("<#> B�n s� d�ng 1<color=0xB5FDD7> Tam Thanh Kh�, khi�n k� ��ch quanh b�n b� gi�m t�c.")	
end

Tab={add505,add506,add507,add508}

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

