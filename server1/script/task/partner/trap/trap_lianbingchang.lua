-- ���е� ������ ս���л���

function main(sel)
	if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬
		SetPos(1744,3236);		-- �����߳�Trap�㣬Ŀ�ĵ���ս������
		SetFightState(1);		-- ת��Ϊս��״̬
	else
		SetPos(1741,3240);		-- �����߳�Trap�㣬Ŀ�ĵ��ڷ�ս������
		SetFightState(0);		-- ת��Ϊ��ս��״̬
	end;
end;