-- ���е� ����ʿ�� ս���л���

function main(sel)
	if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬
		SetPos(1668,3639);		-- �����߳�Trap�㣬Ŀ�ĵ���ս������
		SetFightState(1);		-- ת��Ϊս��״̬
	else
		SetPos(1672,3644);		-- �����߳�Trap�㣬Ŀ�ĵ��ڷ�ս������
		SetFightState(0);		-- ת��Ϊ��ս��״̬
	end;
end;