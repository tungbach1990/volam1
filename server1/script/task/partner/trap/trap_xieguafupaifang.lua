-- ���е� л�Ѹ��Ʒ� ս���л���

function main(sel)
	if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬
		SetPos(1641,3604);		-- �����߳�Trap�㣬Ŀ�ĵ���ս������
		SetFightState(1);		-- ת��Ϊս��״̬
	else
		SetPos(1636,3609);		-- �����߳�Trap�㣬Ŀ�ĵ��ڷ�ս������
		SetFightState(0);		-- ת��Ϊ��ս��״̬
	end;
end;