Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\battles\\battlehead.lua")
IncludeLib("SETTING")
function branchTask_BW1()		--���䳡�ı����㣬�����ɹ�ʱ����
	if (nt_getTask(1011) == 10 and nt_getTask(1052) == 20) then		--����������ȥ���䳡��һ������
		nt_setTask(1011, 20)		
		return
	end
	
	if (nt_getTask(1012) == 10 and nt_getTask(1056) == 20) then		--����������ȥ���䳡��һ������
		nt_setTask(1012, 20)
		return
	end
	
	if (nt_getTask(1013) == 10 and nt_getTask(1060) == 40) then		--�����̹ŶԻ������������ȥ���䳡�μ�һ��pk������
		nt_setTask(1013, 20)
		return
	end
end


function branchTask_GainBW1()		--���䳡�������Ӯ�ı���ʱ����
	if (nt_getTask(1011) == 10 and nt_getTask(1052) == 60) then	--������������䳡��Ӯһ������
		nt_setTask(1011, 20)
		Msg2Player("B�n th�ng tr�n t� v�, c� th� quay v� t�m H�n H�n ph�c m�nh.")
		return
	end
	
	if (nt_getTask(1012) == 10 and nt_getTask(1056) == 40) then			--����������ȥ���䳡��ʤһ������
		nt_setTask(1012, 20)
		Msg2Player("B�n th�ng tr�n t� v�, c� th� quay v� t�m Li�u Nam V�n ph�c m�nh.")
		return
	end
	
	if (nt_getTask(1013) == 10 and nt_getTask(1060) == 80) then	--�ذϻ�������ȥ���䳡սʤһ����Ϊ������������
		nt_setTask(1013, 20)
		Msg2Player("B�n th�ng tr�n t� v�, c� th� quay v� t�m Th�c B�t Ho�i Xuy�n ph�c m�nh.")
		return
	end
end

function branchTask_JoinSJend1()
	if (nt_getTask(1053) == 20 and nt_getTask(1011) == 10 and BT_GetData(PL_TOTALPOINT) >= 200 ) then--�������ȥ�ν�ս���μ�������Ĵ�ս������ö��ٸ�����
		nt_setTask(1011, 20)
		Msg2Player("B�n �� ��t ���c 200 �i�m th��ng, quay v� g�p H�n H�n ho�n th�nh nhi�m v�.")
		return
	end
	
	if (nt_getTask(1057) == 20 and nt_getTask(1012) == 10 and BT_GetData(PL_TOTALPOINT) >= 200) then--����������ȥ�μ��ν��ս����200�����ֻ���
		nt_setTask(1012, 20)
		Msg2Player("B�n �� ��t ���c 200 �i�m th��ng, quay v� g�p Li�u Nam V�n ho�n th�nh nhi�m v� ")
		return
	end
	
	if (nt_getTask(1061) == 20 and nt_getTask(1013) == 10 and BT_GetData(PL_TOTALPOINT) >= 200) then--�ذϻ�������ȥ�����ν��ս����ȡ���ٸ����֡�	
		nt_setTask(1013, 20)
		Msg2Player("B�n �� ��t ���c 200 �i�m t�ch ph�n, c� th� quay v� t�m Th�c B�t Ho�i Xuy�n ph�c m�nh!")
		return
	end

end