
TSK_PLAYER_BOSSKILLED = 2598 -- ��һ�ɱBOSS����ͳ��

function OnDeath( nNpcIndex )
    -- BOSS��ɱͳ��
	local nCount = GetTask(TSK_PLAYER_BOSSKILLED);
	nCount = nCount + 1;
	SetTask(TSK_PLAYER_BOSSKILLED, nCount);
end;