-- ���е� ����̨ ս���л���

function main(sel)
	if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬
		SetPos(1666,3524);		-- �����߳�Trap�㣬Ŀ�ĵ���ս������
		SetFightState(1);		-- ת��Ϊս��״̬
	else
		SetPos(1662,3520);		-- �����߳�Trap�㣬Ŀ�ĵ��ڷ�ս������
		SetFightState(0);		-- ת��Ϊ��ս��״̬
	end;
end;