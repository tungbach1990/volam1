--Create by mengfan ,2004-9-14
--�𻨾�
--���ã�ʹ�ú�ʹ���߼�����Ӷ�Ա����ֵ30����������20�㡣
--���������ϵͳ���ţ������ô���Ʒ����Ҫ�����е��֡�



function main()	
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	
	if (nMemCount == 0 ) then
		AddSkillState(450, 20, 1,32400)
		return 0
	end

	
	for i = 1, nMemCount do
		PlayerIndex = GetTeamMember( i );
		
		AddSkillState(450, 20, 1, 32400)
	end;
	
	PlayerIndex = nPreservedPlayerIndex;
	return 0
end;
		