--�������� ��ɽ ս��״̬�л���2
--2004.1.5
--by Suyu
-- 2004-05-01(Dan_Deng)

function main(sel)
	if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬�����ڳ���
		SetPos(2551, 3471)		-- �����߳�Trap�㣬Ŀ�ĵ��ڳ���	
		SetFightState(1)		-- ת��Ϊս��״̬
	else			       		-- ��Ҵ���ս��״̬�����ڳ���
		SetPos(2557, 3483)		-- �����߳�Trap�㣬Ŀ�ĵ��ڳ���	
		SetFightState(0)		-- ת��Ϊ��ս��״̬
	end;
end;
