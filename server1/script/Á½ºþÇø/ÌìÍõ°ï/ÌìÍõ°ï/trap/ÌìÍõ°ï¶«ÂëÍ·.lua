--������ �����ﶫ��ͷ ս��״̬�л�Trap

function main(sel)

if ( GetFightState() == 0 ) then	-- ��Ҵ��ڷ�ս��״̬�����ڳ���
	SetPos(1725, 3347)		-- �����߳�Trap�㣬Ŀ�ĵ���Ұ��	
	SetFightState(1)		-- ת��Ϊս��״̬
else			       		-- ��Ҵ���ս��״̬�����ڳ���
	SetPos(1729, 3350)		-- �����߳�Trap�㣬Ŀ�ĵ�����ͷ	
	SetFightState(0)		-- ת��Ϊ��ս��״̬
end;

end;