--description: ��ԭ���� ���̽�����3to���̽�ʥ��1 ���̳̽�ʦ����
--author: yuanlan	
--date: 2003/5/20
--Trap ID����ԭ���� 5
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
--	if (GetFaction() ~= "tianren") then
	if (UTask_tr >= 60*256+50) and (GetFaction() == "tianren") then
		NewWorld(51, 1666, 3291)
		SetFightState(1)						--���ת����ս��״̬
	elseif (UTask_tr > 60*256) and (UTask_tr < 60*256+50) then
		Talk(1,"","B�n ch�a ��a 5 thanh �o�n ki�m cho Ho�n Nhan H�ng Li�t, ch�a th� v�o Th�nh ��ng.")
		SetPos(1749, 3081)						--�����߳�Trap��
	else
		Talk(1,"","��y l� Th�nh ��ng Thi�n Nh�n gi�o, nh�ng ng��i �� v�o kh�ng th� tr� ra.")
		SetPos(1749, 3081)						--�����߳�Trap��
	end
end;
