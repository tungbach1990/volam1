--�������� ��ɽ ս��״̬�л���1
--2004.1.5
--by Suyu
-- 2004-05-01(Dan_Deng)

function main(sel)
	if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬�����ڳ���
		SetPos(2600, 3610)		-- �����߳�Trap�㣬Ŀ�ĵ��ڳ���	
		SetFightState(1)		-- ת��Ϊս��״̬
	else			       		-- ��Ҵ���ս��״̬�����ڳ���
		SetPos(2604, 3599)		-- �����߳�Trap�㣬Ŀ�ĵ��ڳ���	
		SetFightState(0)		-- ת��Ϊ��ս��״̬
	end;
end;
