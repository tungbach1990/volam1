--Create by mengfan ,2004-9-14
--��Բ��
--���ã�ʹ�ú�ʹ���߼�����Ӷ�Ա30�����ڻ��˫������ʱ�䡣
--���������ϵͳ���ţ������ô���Ʒ����Ҫ�����е��֡�


IncludeLib("SETTING"); --����SETTING�ű�ָ���
function main()	
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	
	if (GetNpcExpRate() > 100) then
		Say("Xin l�i! T�m th�i kh�ng th� �n ���c b�nh Trung Thu ", 0)
		return 1
	end

	
	if (nMemCount == 0 ) then
		AddSkillState(451, 20, 1,32400)
		return 0
	end

	for i = 1, nMemCount do
		PlayerIndex = GetTeamMember( i );
		
		AddSkillState(451, 20, 1, 32400)
	end;
	
	PlayerIndex = nPreservedPlayerIndex;
	return 0
end;