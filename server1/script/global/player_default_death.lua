function OnDeath(Launcher)

-- �����Ұ���ͼ ����ɱ�߼�������ɱֵ
    if IsTongWarMap(SubWorld) == 1 then
    	local nLauncherIdx = NpcIdx2PIdx(Launcher);
    	local nOrgPlayer  = PlayerIndex;
    	if (nLauncherIdx > 0) then
    	    -- ����ǰ��������Ϊ ��ɱ��
    	    PlayerIndex = nLauncherIdx;
    	    -- ������ɱ��1
    	    AddPvPKilledNum(1);
    	    -- ���������ûر���ɱ��
    	    PlayerIndex = nOrgPlayer;
    	end
    end
    
end