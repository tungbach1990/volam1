-- Į����ԭ ���� ս���л���

function main(sel)
	if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬����������
		SetPos(1261, 2508);		-- �����߳�Trap�㣬Ŀ�ĵ�������
		SetFightState(1);		-- ת��Ϊս��״̬
	else
		SetPos(1263, 2504);		-- �����߳�Trap�㣬Ŀ�ĵ�������	
		SetFightState(0);		-- ת��Ϊ��ս��״̬
	end;
end;
	