-------------------------------------------------------------------------
-- FileName		:	lib_setmembertask.lua
-- Author		:	longxiangquan
-- CreateTime	:	2004-12-27 21:51:39
-- Desc			:	��ӵ����������������Ըı����
-------------------------------------------------------------------------

-- myTaskNumber ����Ҫ�ı������������
-- myOrgValue   �������������ж�ֵ
-- myTaskValue  ���ı��ı���ֵ
-- SetMemberTask �ķ���ֵ����� 0 ��ֻ�ı䲻�����ҵı��������ڻ��ߵ��� 1 ��Ϊ�ı��������ұ���������
-- �����ǵ��˻������ʱ��û�иı���ҵı���ʱ�򷵻� 80
-- ���κ���������������쳣�����򷵻� 110

Include("\\script\\task\\newtask\\newtask_head.lua")

function SetMemberTask(myTaskNumber,myOrgValue,myTaskValue,fnCallback)

	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local myMemberTask
	local myChangeMember = 0
	
	if (nMemCount == 0 ) then
		myMemberTask = GetTask(myTaskNumber)
		
		if (myMemberTask == myOrgValue) then
			nt_setTask(myTaskNumber,myTaskValue)
			fnCallback()
		end
		
	else
		for i = 1, nMemCount do
		
			PlayerIndex = GetTeamMember(i)
			myMemberTask = GetTask(myTaskNumber)
		
			if (myMemberTask == myOrgValue) then	-- �����������Ķ��ѲŸı��������	
			
				nt_setTask(myTaskNumber,myTaskValue)
				myChangeMember = myChangeMember + 1
				
				fnCallback();
			end
			
		end
		
		PlayerIndex = nPreservedPlayerIndex;
		
	end
	
end;

