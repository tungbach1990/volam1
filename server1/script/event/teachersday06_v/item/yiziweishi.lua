--by ��־ɽ [2006-09-12]
--2006��ʦ�ڻ������һ��Ϊʦ

Include([[\script\event\teachersday06_v\head.lua]]);

function IsPickable( nItemIndex, nPlayerIndex )
--	if (GetLevel() >= 80) then
--		Msg2Player("<color=yellow>80��<color>���µ���Ҳ���ʰȡ��");
--		return 0;
--	end;
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	vt06_addzi();
    return 0;
end
