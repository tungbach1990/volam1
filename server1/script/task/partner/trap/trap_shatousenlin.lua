-- ���е� ɱͷɭ�� ս���л���

function main(sel)
	if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬
		SetPos(1700,3615);		-- �����߳�Trap�㣬Ŀ�ĵ���ս������
		SetFightState(1);		-- ת��Ϊս��״̬
	else
		SetPos(1704,3619);		-- �����߳�Trap�㣬Ŀ�ĵ��ڷ�ս������
		SetFightState(0);		-- ת��Ϊ��ս��״̬
	end;
end;