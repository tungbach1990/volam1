-- Į����ԭ ���� ս���л���

function main(sel)
	if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬����������
		SetPos(1303, 2552);		-- �����߳�Trap�㣬Ŀ�ĵ�������
		SetFightState(1);		-- ת��Ϊս��״̬
	else
		SetPos(1301, 2548);		-- �����߳�Trap�㣬Ŀ�ĵ�������	
		SetFightState(0);		-- ת��Ϊ��ս��״̬
	end;
end;
	